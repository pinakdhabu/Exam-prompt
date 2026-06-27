#!/usr/bin/env node
const { marked } = require('marked');
const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');

function resolveFont(filenames) {
  const possibleDirs = [
    '/usr/share/fonts/TTF',
    '/usr/share/fonts/truetype',
    '/Library/Fonts',
    '/System/Library/Fonts',
    path.join(process.env.HOME || '', 'Library/Fonts'),
    'C:\\Windows\\Fonts',
  ];
  for (const dir of possibleDirs) {
    for (const name of filenames) {
      const fullPath = path.join(dir, name);
      if (fs.existsSync(fullPath)) {
        return fullPath;
      }
    }
  }
  return null;
}

function getFontFace(family, filenames, weight, style) {
  const p = resolveFont(filenames);
  if (!p) return '';
  try {
    const b64 = fs.readFileSync(p).toString('base64');
    return `@font-face { font-family: '${family}'; src: url(data:font/truetype;base64,${b64}) format('truetype'); font-weight: ${weight}; font-style: ${style}; }\n`;
  } catch {
    return '';
  }
}

const fontFaces = 
  getFontFace('TNR', ['Times.TTF', 'times.ttf'], 'normal', 'normal') +
  getFontFace('TNR', ['Timesbd.TTF', 'timesbd.ttf'], 'bold', 'normal') +
  getFontFace('TNR', ['Timesi.TTF', 'timesi.ttf'], 'normal', 'italic') +
  getFontFace('TNR', ['Timesbi.TTF', 'timesbi.ttf'], 'bold', 'italic');

const CSS = `
  @page {
    size: A4; margin: 2cm 2.2cm 2.2cm 2.2cm;
    @bottom-center {
      content: counter(page);
      font-family: 'TNR', serif; font-size: 9pt; color: #555;
    }
  }
  ${fontFaces}
  body { font-family: 'TNR', serif; font-size: 11pt; line-height: 1.4; color: #000; margin: 0; padding: 0; }
  h1 { font-size: 15pt; font-weight: bold; text-align: center; margin: 8px 0 3px 0; border: none; text-transform: uppercase; letter-spacing: 1pt; }
  h2 { font-size: 12pt; font-weight: bold; text-align: center; margin: 5px 0 3px 0; border: none; }
  h3 { font-size: 11.5pt; font-weight: bold; margin: 14px 0 4px 0; }
  h4 { font-size: 11pt; font-weight: bold; margin: 8px 0 2px 0; }
  p { margin: 2px 0; }
  strong { font-weight: bold; }
  hr { border: none; border-top: 1px solid #888; margin: 12px 0; }
  table { width: 100%; border-collapse: collapse; margin: 6px 0; font-size: 10pt; }
  th { background: #eee; padding: 4px 8px; border: 1px solid #999; text-align: left; font-weight: bold; }
  td { padding: 3px 8px; border: 1px solid #bbb; }
  tr:nth-child(even) { background: #fafafa; }
  ul, ol { margin: 3px 0; padding-left: 22px; }
  li { margin: 1px 0; }
  .katex { font-size: 1.05em; }
  .katex-display { margin: 4px 0; text-align: center; }
`;

async function main() {
  const args = process.argv.slice(2);
  if (args.length < 1) { console.log('Usage: node scripts/convert-qp-to-pdf.js <input.md> [output.pdf]'); process.exit(1); }

  const mdPath = path.resolve(args[0]);
  if (!fs.existsSync(mdPath)) { console.error('ERROR:', mdPath, 'not found'); process.exit(1); }

  let pdfPath;
  if (args.length >= 2) {
    pdfPath = path.resolve(args[1]);
  } else {
    const d = path.join(path.dirname(mdPath), 'pdf_output');
    fs.mkdirSync(d, { recursive: true });
    pdfPath = path.join(d, path.basename(mdPath).replace(/\.md$/, '.pdf'));
  }
  fs.mkdirSync(path.dirname(pdfPath), { recursive: true });

  console.log('Converting:', path.basename(mdPath), '->', path.basename(pdfPath));

  let md = fs.readFileSync(mdPath, 'utf-8');
  md = md.replace(/\\newpage/g, '<div style="page-break-before: always;"></div>');
  md = md.replace(/^\$\$\n([\s\S]*?)\n\$\$$/gm, (_, c) => '$$ ' + c.replace(/\n+/g, ' ').trim() + ' $$');

  const htmlBody = marked.parse(md, { breaks: true });

  const html = '<!DOCTYPE html><html lang="en"><head><meta charset="utf-8">'
    + '<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.css">'
    + '<script src="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.js"></script>'
    + '<script src="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/contrib/auto-render.min.js"></script>'
    + '<style>' + CSS + '</style></head><body>'
    + htmlBody
    + '<script>document.addEventListener("DOMContentLoaded",function(){renderMathInElement(document.body,{delimiters:[{left:\'$$\',right:\'$$\',display:true},{left:\'$\',right:\'$\',display:false}],throwOnError:false})});</script>'
    + '</body></html>';

  const browser = await chromium.launch();
  const page = await browser.newPage();
  await page.setContent(html, { waitUntil: 'networkidle', timeout: 30000 });
  await page.waitForTimeout(2000);

  await page.pdf({
    path: pdfPath, format: 'A4',
    margin: { top: '2cm', bottom: '2.2cm', left: '2.2cm', right: '2.2cm' },
    printBackground: true, displayHeaderFooter: true,
    headerTemplate: '<span></span>',
    footerTemplate: '<div style="font-size:9pt;color:#555;width:100%;text-align:center;"><span class="pageNumber"></span></div>',
  });

  await page.close();
  await browser.close();
  console.log('  Saved to:', pdfPath);
}

main().catch(err => { console.error(err); process.exit(1); });
