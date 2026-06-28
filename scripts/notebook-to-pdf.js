#!/usr/bin/env node
/* eslint-env browser */
/* global mermaid */
const fs = require('fs');
const path = require('path');
const { chromium } = require('playwright');
const { marked } = require('marked');
const { NotebookProcessor } = require('./notebook/processor');
const { NotebookHtmlRenderer } = require('./notebook/renderer');

async function main() {
  const args = process.argv.slice(2);

  if (args.includes('--help') || args.includes('-h') || args.length === 0) {
    console.log('Convert Markdown to notebook-styled PDF.');
    console.log('');
    console.log('Usage:');
    console.log('  node scripts/notebook-to-pdf.js <input.md> [output.pdf] [options]');
    console.log('');
    console.log('Options:');
    console.log('  --title "My Notes"    Notebook title (default: Handwritten Notes)');
    console.log('  --link URL            Header link URL');
    console.log('  -o, --output FILE     Output PDF path');
    console.log('  -h, --help            Show this help');
    process.exit(args.includes('-h') ? 0 : 1);
  }

  const mdPath = path.resolve(args[0]);
  if (!fs.existsSync(mdPath)) {
    console.error('ERROR: File not found: ' + mdPath);
    process.exit(1);
  }

  let pdfPath;
  let title = 'Handwritten Notes';
  let headerLink = '';

  for (let i = 1; i < args.length; i++) {
    if (args[i] === '--title' && args[i + 1]) { title = args[++i]; continue; }
    if (args[i] === '--link' && args[i + 1]) { headerLink = args[++i]; continue; }
    if ((args[i] === '-o' || args[i] === '--output') && args[i + 1]) { pdfPath = path.resolve(args[++i]); continue; }
    if (!args[i].startsWith('-') && !pdfPath) { pdfPath = path.resolve(args[i]); }
  }

  if (!pdfPath) {
    const d = path.join(path.dirname(mdPath), 'pdf_output');
    fs.mkdirSync(d, { recursive: true });
    pdfPath = path.join(d, path.basename(mdPath).replace(/\.md$/, '-notebook.pdf'));
  }
  fs.mkdirSync(path.dirname(pdfPath), { recursive: true });

  console.log('  Input: ' + path.basename(mdPath));
  console.log('  Output: ' + path.basename(pdfPath));

  const raw = fs.readFileSync(mdPath, 'utf-8');
  const processor = new NotebookProcessor();
  const processedMd = processor.process(raw);

  const htmlBody = marked.parse(processedMd, { breaks: false, gfm: true });

  const renderer = new NotebookHtmlRenderer({ title, headerLink });
  const html = renderer.render(htmlBody);

  const browser = await chromium.launch({
    args: ['--no-sandbox', '--disable-setuid-sandbox', '--disable-dev-shm-usage', '--disable-gpu'],
  });

  try {
    const page = await browser.newPage();
    await page.setContent(html, { waitUntil: 'load', timeout: 30000 });

    await page.evaluate(async () => {
      await document.fonts.ready;
    });

    if (html.includes('class="mermaid"')) {
      const mermaidJs = fs.readFileSync(require.resolve('mermaid/dist/mermaid.min.js'), 'utf-8');
      await page.addScriptTag({ content: mermaidJs });
      await page.waitForFunction(() => typeof mermaid !== 'undefined');
      await page.evaluate(async () => {
        mermaid.initialize({ startOnLoad: false });
        for (const div of document.querySelectorAll('.mermaid')) {
          const code = div.textContent.trim();
          try {
            const { svg } = await mermaid.render('m-' + Math.random().toString(36).slice(2, 10), code);
            div.innerHTML = svg;
          } catch (e) {
            div.innerHTML = '<pre style="background:#f4f4f4;border:1px solid #ddd;padding:8px;font-size:15px;line-height:1.4;white-space:pre-wrap;font-family:&#39;Caveat&#39;,cursive">' +
              code.replace(/</g, '&lt;') + '</pre>';
          }
        }
      });
    }

    await page.pdf({
      path: pdfPath,
      format: 'A4',
      printBackground: true,
      displayHeaderFooter: false,
      preferCSSPageSize: true,
    });

    const size = fs.statSync(pdfPath).size;
    console.log('  Saved: ' + path.basename(pdfPath) + ' (' + (size / 1024).toFixed(0) + 'K)');
  } finally {
    await browser.close();
  }
}

main().catch(err => {
  console.error(err.message);
  process.exit(1);
});
