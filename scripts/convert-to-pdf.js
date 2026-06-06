#!/usr/bin/env node
/**
 * Convert Markdown files to PDF using marked + Playwright (headless Chromium).
 * Works on: Linux, macOS, Windows
 *
 * Usage:
 *   node scripts/convert-to-pdf.js <input.md> [output.pdf]
 *
 * Dependencies:
 *   npm install marked playwright
 *
 * Install Playwright browser:
 *   npx playwright install chromium
 */
const { marked } = require('marked');
const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const CSS = `
  @page {
    size: A4;
    margin: 2cm 2.2cm;
    @bottom-center {
      content: counter(page);
      font-family: 'Segoe UI', 'Calibri', sans-serif;
      font-size: 9pt;
      color: #888;
    }
  }

  body {
    font-family: 'Segoe UI', 'Calibri', sans-serif;
    font-size: 10.5pt;
    line-height: 1.6;
    color: #1a1a1a;
    padding: 0;
    margin: 0;
  }

  h1 { font-size: 18pt; color: #0d3b66; border-bottom: 3px solid #0d3b66; padding-bottom: 6px; margin-top: 0; page-break-before: avoid; page-break-after: avoid; }
  h2 { font-size: 14pt; color: #1b5a8c; border-bottom: 1px solid #cde0f0; padding-bottom: 4px; margin-top: 28px; page-break-before: avoid; page-break-after: avoid; }
  h3 { font-size: 12pt; color: #2c5f2d; margin-top: 20px; page-break-before: avoid; page-break-after: avoid; }
  h4 { font-size: 11pt; color: #444; margin-top: 16px; page-break-before: avoid; page-break-after: avoid; }

  p { margin: 6px 0; text-align: justify; }
  strong { color: #0d3b66; }

  table { width: 100%; border-collapse: collapse; margin: 12px 0; font-size: 9.5pt; page-break-inside: avoid; }
  th { background: #0d3b66; color: white; padding: 7px 10px; text-align: left; font-weight: 600; }
  td { padding: 6px 10px; border: 1px solid #d0d7de; }
  tr:nth-child(even) { background: #f6f8fa; }

  pre { background: #0d1117; color: #e6edf3; padding: 12px 14px; border-radius: 6px; font-family: 'Cascadia Code', 'Fira Code', 'Consolas', 'Courier New', monospace; font-size: 8.5pt; line-height: 1.45; white-space: pre-wrap; word-break: break-word; page-break-inside: avoid; }
  pre code { background: none; padding: 0; color: inherit; font-size: inherit; }
  code { font-family: 'Cascadia Code', 'Fira Code', 'Consolas', 'Courier New', monospace; font-size: 9pt; }
  p > code, li > code { background: #eef1f5; padding: 1px 5px; border-radius: 3px; color: #c7254e; }

  ul, ol { margin: 6px 0; padding-left: 22px; }
  li { margin: 3px 0; }

  hr { border: none; border-top: 1px dashed #bbb; margin: 20px 0; }

  blockquote { margin: 10px 0; padding: 8px 14px; border-left: 4px solid #0d3b66; background: #f0f6fb; page-break-inside: avoid; }

  img { max-width: 100%; }
`;

function usage() {
  console.log('Convert Markdown to PDF using Playwright');
  console.log('');
  console.log('Usage:');
  console.log('  node scripts/convert-to-pdf.js <input.md> [output.pdf]');
  console.log('');
  console.log('Examples:');
  console.log('  node scripts/convert-to-pdf.js notes.md');
  console.log('  node scripts/convert-to-pdf.js notes.md output.pdf');
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

  let md = fs.readFileSync(mdPath, 'utf-8').replace(/\u{1f31f}/ug, '');

  // --- Preprocess: Render Mermaid diagrams to SVG ---
  const mermaidBlocks = md.match(/```mermaid\s*\n([\s\S]*?)```/g);
  if (mermaidBlocks && mermaidBlocks.length > 0) {
    const diagDir = path.join(path.dirname(pdfPath), '_diagrams');
    fs.mkdirSync(diagDir, { recursive: true });
    console.log(`  Rendering ${mermaidBlocks.length} Mermaid diagram(s)...`);

    mermaidBlocks.forEach((block, idx) => {
      const code = block.replace(/```mermaid\s*\n/, '').replace(/```$/, '').trim();
      if (!code) return;

      const mmdFile = path.join('/tmp', `_md_${idx}_${Date.now()}.mmd`);
      const svgFile = path.join(diagDir, `mermaid-${idx}.svg`);
      const relPath = path.join('_diagrams', `mermaid-${idx}.svg`);

      try {
        fs.writeFileSync(mmdFile, code, 'utf-8');
        execSync(
          `npx @mermaid-js/mermaid-cli -i "${mmdFile}" -o "${svgFile}" --backgroundColor white --width 1200 2>&1`,
          { stdio: 'pipe', timeout: 30000 }
        );
        if (fs.existsSync(svgFile)) {
          // Replace Mermaid code block with img tag
          const imgTag = `<p><img src="${relPath}" alt="mermaid-diagram-${idx}" style="max-width:100%;height:auto;display:block;margin:1em auto;"/></p>`;
          md = md.replace(block, imgTag);
          console.log(`  ✅ Diagram ${idx + 1}/${mermaidBlocks.length}`);
        }
      } catch (e) {
        console.error(`  ❌ Diagram ${idx + 1} failed: ${e.message.split('\n')[0]}`);
      } finally {
        if (fs.existsSync(mmdFile)) fs.unlinkSync(mmdFile);
        const pdfFile = mmdFile.replace('.mmd', '.pdf');
        if (fs.existsSync(pdfFile)) fs.unlinkSync(pdfFile);
      }
    });
  }

  const htmlBody = marked.parse(md, { breaks: true });
  const html = `<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"><style>${CSS}</style></head><body>${htmlBody}</body></html>`;

  const browser = await chromium.launch();
  const page = await browser.newPage();
  await page.setContent(html, { waitUntil: 'networkidle' });
  await page.pdf({
    path: pdfPath,
    format: 'A4',
    margin: { top: '2cm', bottom: '2cm', left: '2.2cm', right: '2.2cm' },
    printBackground: true,
    displayHeaderFooter: true,
    headerTemplate: '<span></span>',
    footerTemplate: '<div style="font-size:9pt;color:#888;width:100%;text-align:center;"><span class="pageNumber"></span></div>',
  });
  await page.close();
  await browser.close();

  console.log(`  Saved to: ${pdfPath}`);
}

main().catch(err => { console.error(err); process.exit(1); });
