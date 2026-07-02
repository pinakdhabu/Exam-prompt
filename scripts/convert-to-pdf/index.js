const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const { execSync } = require('child_process');
const { marked } = require('marked');
const markedKatex = require('marked-katex-extension');
const pino = require('pino');
const { MarkdownProcessor } = require('./markdown');
const { HtmlRenderer } = require('./renderer');
const { PdfGenerator } = require('./pdf');

marked.use(markedKatex({ throwOnError: false, nonStandard: true }));

function createLogger(options = {}) {
  const level = options.json ? 'silent' : (options.verbose ? 'debug' : 'warn');
  return pino({
    level,
    transport: options.json
      ? undefined
      : { target: 'pino-pretty', options: { colorize: true, translateTime: 'HH:MM:ss' } },
  });
}

async function convertMdToPdf(mdPath, pdfPath, options = {}) {
  const jobId = crypto.randomUUID().slice(0, 8);
  const logger = createLogger(options).child({ jobId, file: path.basename(mdPath) });

  logger.info('Starting conversion');

  const raw = fs.readFileSync(mdPath, 'utf-8');
  logger.debug({ size: raw.length }, 'Input read');

  // Compute file hash for caching (using version prefix to invalidate on compiler/style updates)
  const useCache = !options.noCache;
  const CACHE_VERSION = 'v1.1.0_sppu_styling';
  const hash = crypto.createHash('sha256')
    .update(CACHE_VERSION)
    .update(raw)
    .digest('hex');
  const cacheDir = path.join(path.resolve(__dirname, '../..'), '.cache', 'pdf-compilation');
  const cacheFilePath = path.join(cacheDir, `${hash}.pdf`);

  if (useCache) {
    if (fs.existsSync(cacheFilePath)) {
      logger.info({ hash }, 'Cache hit: copying compiled PDF from cache');
      fs.mkdirSync(path.dirname(pdfPath), { recursive: true });
      fs.copyFileSync(cacheFilePath, pdfPath);
      const size = fs.statSync(pdfPath).size;
      return { jobId, path: pdfPath, size, duration: 0 };
    }
  }

  const processor = new MarkdownProcessor();
  const processedMd = processor.process(raw);
  logger.debug({ hasMath: processor.hasMath }, 'Markdown processed');

  const htmlBody = marked.parse(processedMd, { breaks: false, gfm: true });
  logger.debug({ htmlSize: htmlBody.length }, 'HTML body rendered');

  const renderer = new HtmlRenderer(processor.hasMath);
  let html = renderer.render(htmlBody);

  // Extract target totalPages from YAML or header HTML
  const totalPagesMatch = html.match(/\[Total No\. of Pages : (\d+)/) || html.match(/totalpages:\s*(\d+)/i);
  const targetPages = totalPagesMatch ? parseInt(totalPagesMatch[1], 10) : 0;

  logger.debug({ documentSize: html.length, targetPages }, 'Document assembled');

  // Extract paper identifier from HTML for footer
  const idMatch = html.match(/<!-- PAPER_ID:&#91;(\d+)&#93;-(\S+) -->/);
  const paperIdentifier = idMatch ? '[' + idMatch[1] + ']-' + idMatch[2] : '';

  const generator = new PdfGenerator({ logger, paperIdentifier });
  const start = Date.now();

  // Spacing Auto-Adjust Loop
  let scale = 1.0;
  let attempts = 0;
  let pageCount = 0;
  const maxAttempts = 5;

  while (attempts < maxAttempts) {
    logger.info({ scale, attempt: attempts + 1 }, 'Compiling PDF page');

    // Inject dynamic CSS spacing adjustments using custom property style tag
    let styledHtml = html;
    if (scale !== 1.0) {
      const spacingCss = `
        <style>
          body {
            line-height: ${1.4 * scale} !important;
          }
          p {
            margin-top: ${2 * scale}pt !important;
            margin-bottom: ${2 * scale}pt !important;
          }
          pre {
            margin-top: ${4 * scale}pt !important;
            margin-bottom: ${4 * scale}pt !important;
            padding: ${6 * scale}pt ${10 * scale}pt !important;
          }
          .question-main {
            padding-left: calc(56.8pt * var(--scale-factor)) !important;
            padding-right: calc(30pt * var(--scale-factor)) !important;
            text-indent: calc(-56.8pt * var(--scale-factor)) !important;
          }
          .question-sub {
            padding-left: calc(56.8pt * var(--scale-factor)) !important;
            padding-right: calc(30pt * var(--scale-factor)) !important;
            text-indent: calc(-28.4pt * var(--scale-factor)) !important;
          }
          .q-label, .sub-label {
            width: calc(28.4pt * var(--scale-factor)) !important;
          }
          ul, ol {
            padding-left: calc(28.4pt * var(--scale-factor)) !important;
          }
          .question-sub + table, .question-sub + pre, .question-sub + ul, .question-sub + ol {
            margin-left: calc(56.8pt * var(--scale-factor)) !important;
          }
          table {
            margin-top: ${6 * scale}pt !important;
            margin-bottom: ${6 * scale}pt !important;
          }
          th, td {
            padding: ${3 * scale}pt ${10 * scale}pt !important;
          }
          hr {
            margin-top: ${8 * scale}pt !important;
            margin-bottom: ${8 * scale}pt !important;
          }
        </style>
      `;
      styledHtml = html.replace('</head>', spacingCss + '</head>');
    }

    await generator.generate(styledHtml, pdfPath);

    // Count pages
    try {
      const script = 'from pypdf import PdfReader; print(len(PdfReader(' + JSON.stringify(pdfPath) + ').pages))';
      const result = execSync('python3 -c ' + JSON.stringify(script), { timeout: 10000 }).toString().trim();
      pageCount = parseInt(result, 10) || 0;
    } catch (e) {
      logger.warn('Failed to parse PDF page count:', e.message);
      pageCount = 0;
      break;
    }

    logger.info({ pageCount, targetPages }, 'Page check outcome');

    if (!targetPages || pageCount === targetPages) {
      break; // Matched target perfectly or no target specified
    }

    if (pageCount > targetPages) {
      // Too many pages -> shrink spacing
      scale -= 0.12;
    } else {
      // Too few pages -> expand spacing
      scale += 0.12;
    }

    attempts++;
  }

  // Final replacement of total page numbers inside document
  if (pageCount > 0 && html.includes('__TOTAL_PAGES__')) {
    logger.info({ pageCount }, 'Regenerating final copy with resolved __TOTAL_PAGES__');
    const finalHtml = html.replace(/__TOTAL_PAGES__/g, String(pageCount));
    await generator.generate(finalHtml, pdfPath);
  }

  const duration = Date.now() - start;
  const size = fs.statSync(pdfPath).size;
  logger.info({ duration, size }, 'Conversion complete');

  // Save to cache
  if (useCache) {
    try {
      fs.mkdirSync(cacheDir, { recursive: true });
      fs.copyFileSync(pdfPath, cacheFilePath);
      logger.debug({ hash }, 'Saved compiled PDF to cache');
    } catch (cacheError) {
      logger.warn({ error: cacheError.message }, 'Failed to save to cache');
    }
  }

  return { jobId, path: pdfPath, size, duration };
}

module.exports = { convertMdToPdf };
