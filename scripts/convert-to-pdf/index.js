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

  const processor = new MarkdownProcessor();
  const processedMd = processor.process(raw);
  logger.debug({ hasMath: processor.hasMath }, 'Markdown processed');

  const htmlBody = marked.parse(processedMd, { breaks: false, gfm: true });
  logger.debug({ htmlSize: htmlBody.length }, 'HTML body rendered');

  const renderer = new HtmlRenderer(processor.hasMath);
  const html = renderer.render(htmlBody);
  logger.debug({ documentSize: html.length }, 'Document assembled');

  // Extract paper identifier from HTML for footer
  const idMatch = html.match(/<!-- PAPER_ID:&#91;(\d+)&#93;-(\S+) -->/);
  const paperIdentifier = idMatch ? '[' + idMatch[1] + ']-' + idMatch[2] : '';

  const generator = new PdfGenerator({ logger, paperIdentifier });
  const start = Date.now();
  await generator.generate(html, pdfPath);

  // Two-pass: if HTML has __TOTAL_PAGES__ placeholder, count pages and regenerate
  if (html.includes('__TOTAL_PAGES__')) {
    let pageCount = 0;
    try {
      const script = 'from pypdf import PdfReader; print(len(PdfReader(' + JSON.stringify(pdfPath) + ').pages))';
      const result = execSync('python3 -c ' + JSON.stringify(script), { timeout: 10000 }).toString().trim();
      pageCount = parseInt(result, 10) || 0;
    } catch {
      pageCount = 0;
    }

    if (pageCount > 0) {
      logger.info({ pageCount }, 'Page count detected, regenerating with correct total');
      const correctedHtml = html.replace(/__TOTAL_PAGES__/g, String(pageCount));
      await generator.generate(correctedHtml, pdfPath);
    }
  }

  const duration = Date.now() - start;

  const size = fs.statSync(pdfPath).size;
  logger.info({ duration, size }, 'Conversion complete');

  return { jobId, path: pdfPath, size, duration };
}

module.exports = { convertMdToPdf };
