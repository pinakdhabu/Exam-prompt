#!/usr/bin/env node
/**
 * Convert Markdown question papers to QP-styled PDF with KaTeX math rendering.
 */
const { marked } = require('marked');
const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');

const TNR_REGULAR = '/usr/share/fonts/TTF/Times.TTF';
const TNR_BOLD = '/usr/share/fonts/TTF/Timesbd.TTF';
const TNR_ITALIC = '/usr/share/fonts/TTF/Timesi.TTF';
const TNR_BI = '/usr/share/fonts/TTF/Timesbi.TTF';

const CSS = `
  @page {
    size: A4;
    margin: 1.5cm 1.8cm 1.8cm 1.8cm;
    @bottom-center {
      content: counter(page);
      font-family: 'TNR', 'Times New Roman', serif;
      font-size: 9pt;
      color: #555;
    }
  }

  @font-face {
    font-family: 'TNR';
    src: url('file://${TNR_REGULAR}') format('truetype');
    font-weight: normal;
    font-style: normal;
  }
  @font-face {
    font-family: 'TNR';
    src: url('file://${TNR_BOLD}') format('truetype');
    font-weight: bold;
    font-style: normal;
  }
  @font-face {
    font-family: 'TNR';
    src: url('file://${TNR_ITALIC}') format('truetype');
    font-weight: normal;
    font-style: italic;
  }
  @font-face {
    font-family: 'TNR';
    src: url('file://${TNR_BI}') format('truetype');
    font-weight: bold;
    font-style: italic;
  }

  body {
    font-family: 'TNR', 'Times New Roman', 'Georgia', serif;
    font-size: 10.5pt;
    line-height: 1.35;
    color: #000;
    margin: 0;
    padding: 0;
    widows: 2;
    orphans: 2;
  }

  h1 {
    font-size: 14pt;
    font-weight: bold;
    color: #000;
    text-align: center;
    margin: 4px 0;
    padding: 0;
    border: none;
    text-transform: uppercase;
    letter-spacing: 0.8pt;
  }

  h2 {
    font-size: 11.5pt;
    font-weight: bold;
    color: #000;
    text-align: center;
    margin: 3px 0;
    padding: 0;
    text-decoration: underline;
  }

  h3 {
    font-size: 11pt;
    font-weight: bold;
    color: #000;
    margin: 8px 0 2px 0;
    padding: 0;
  }

  h4 {
    font-size: 10.5pt;
    font-weight: bold;
    color: #000;
    margin: 5px 0 1px 0;
    padding: 0;
  }

  p { margin: 1px 0; text-align: justify; }
  strong { font-weight: bold; }

  hr {
    border: none;
    border-top: 1px solid #666;
    margin: 8px 0;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    margin: 4px 0;
    font-size: 9.5pt;
  }

  th {
    background: #e8e8e8;
    color: #000;
    padding: 3px 6px;
    text-align: left;
    font-weight: bold;
    border: 1px solid #999;
  }

  td {
    padding: 2px 6px;
    border: 1px solid #bbb;
  }

  tr:nth-child(even) { background: #f8f8f8; }

  ul, ol { margin: 2px 0; padding-left: 18px; }
  li { margin: 1px 0; }

  blockquote {
    margin: 4px 0;
    padding: 3px 8px;
    border-left: 3px solid #666;
    background: #f9f9f9;
  }

  .katex { font-size: 1.05em; }
  .katex-display { margin: 3px 0; text-align: center; }
`;

function flattenMathBlocks(md) {
  return md.replace(/^\$\$\n([\s\S]*?)\n\$\$$/gm, (match, content) => {
    const cleaned = content.replace(/\n+/g, ' ').trim();
    return `$$ ${cleaned} $$`;
  });
}

function usage() {
  console.log('Usage: node scripts/convert-qp-to-pdf.js <input.md> [output.pdf]');
  process.exit(1);
}

async function main() {
  const args = process.argv.slice(2);
  if (args.length < 1) usage();

  const mdPath = path.resolve(args[0]);
  if (!fs.existsSync(mdPath)) {
    console.error(`ERROR: Input file not found: ${mdPath}`);
    process.exit(1);
  }

  let pdfPath;
  if (args.length >= 2) {
    pdfPath = path.resolve(args[1]);
  } else {
    const pdfDir = path.join(path.dirname(mdPath), 'pdf_output');
    fs.mkdirSync(pdfDir, { recursive: true });
    pdfPath = path.join(pdfDir, path.basename(mdPath).replace(/\.md$/, '.pdf'));
  }

  fs.mkdirSync(path.dirname(pdfPath), { recursive: true });
  console.log(`Converting: ${path.basename(mdPath)} -> ${path.basename(pdfPath)}`);

  let md = fs.readFileSync(mdPath, 'utf-8');

  md = md.replace(/\\newpage/g, '<div style="page-break-before: always;"></div>');

  md = flattenMathBlocks(md);

  const htmlBody = marked.parse(md, { breaks: true });

  const html = `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.css">
<script src="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/contrib/auto-render.min.js"></script>
<style>${CSS}</style>
</head>
<body>
${htmlBody}
<script>
  document.addEventListener("DOMContentLoaded", function() {
    renderMathInElement(document.body, {
      delimiters: [
        {left: '$$', right: '$$', display: true},
        {left: '\\\\[', right: '\\\\]', display: true},
        {left: '$', right: '$', display: false},
        {left: '\\\\(', right: '\\\\)', display: false}
      ],
      throwOnError: false
    });
  });
</script>
</body>
</html>`;

  const browser = await chromium.launch();
  const page = await browser.newPage();
  await page.setContent(html, { waitUntil: 'networkidle', timeout: 30000 });
  await page.waitForFunction(() => typeof renderMathInElement !== 'undefined', { timeout: 15000 }).catch(() => {});
  await page.waitForTimeout(1000);

  await page.pdf({
    path: pdfPath,
    format: 'A4',
    margin: { top: '1.5cm', bottom: '1.8cm', left: '1.8cm', right: '1.8cm' },
    printBackground: true,
    displayHeaderFooter: true,
    headerTemplate: '<span></span>',
    footerTemplate: '<div style="font-size:9pt;color:#555;width:100%;text-align:center;"><span class="pageNumber"></span></div>',
  });

  await page.close();
  await browser.close();

  console.log(`  Saved to: ${pdfPath}`);
}

main().catch(err => { console.error(err); process.exit(1); });
