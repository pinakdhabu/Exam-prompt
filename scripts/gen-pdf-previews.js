#!/usr/bin/env node
/**
 * Generate PNG preview thumbnails for generated PDFs.
 * Renders the actual Markdown content as HTML and screenshots the first page.
 *
 * Usage: node scripts/gen-pdf-previews.js [pdf-dir] [out-dir]
 */
const { marked } = require('marked');
const { chromium } = require('playwright');
const path = require('path');
const fs = require('fs');

const REPO_ROOT = path.resolve(__dirname, '..');
const PDF_DIR = path.resolve(process.argv[2] || path.join(REPO_ROOT, 'generated-examples', 'pdfs'));
const OUT_DIR = path.resolve(process.argv[3] || path.join(REPO_ROOT, 'docs', 'images', 'pdf-previews'));

// Known mapping: PDF filename -> Markdown source path (relative to REPO_ROOT)
const PDF_TO_MD = {
  'fe-2024-maths1-qp': 'examples/fe/2024-pattern/engineering-mathematics-1/sample-paper-1',
  'fe-2019-programming-qp': 'examples/fe/2019-pattern/programming-and-problem-solving/sample-paper-1',
  'se-sem3-data-structures-qp': 'examples/se/sem-3/fundamentals-of-data-structures/sample-paper-1',
  'se-sem3-data-structures-solution': 'examples/se/sem-3/fundamentals-of-data-structures/sample-paper-1-solution',
  'se-sem4-dsa-qp': 'examples/se/sem-4/data-structures-and-algorithms/sample-paper-1',
  'te-sem5-computer-networks-qp': 'examples/te/sem-5/computer-networks-and-security/sample-paper-1',
  'te-sem5-computer-networks-solution': 'examples/te/sem-5/computer-networks-and-security/sample-paper-1-solution',
  'te-sem5-dbms-qp': 'examples/te/sem-5/database-management-systems/sample-paper-1',
  'te-sem5-dbms-solution': 'examples/te/sem-5/database-management-systems/sample-paper-1-solution',
  'te-sem6-ai-qp': 'examples/te/sem-6/artificial-intelligence/sample-paper-1',
  'te-sem6-ds-qp': 'examples/te/sem-6/data-science-and-big-data-analytics/sample-paper-1',
  'be-sem7-machine-learning-qp': 'examples/be/sem-7/machine-learning/sample-paper-1',
  'be-sem7-machine-learning-solution': 'examples/be/sem-7/machine-learning/sample-paper-1-solution',
  'be-sem7-daa-qp': 'examples/be/sem-7/design-and-analysis-of-algorithms/sample-paper-1',
  'be-sem8-deep-learning-qp': 'examples/be/sem-8/deep-learning/sample-paper-1',
  'be-sem8-deep-learning-solution': 'examples/be/sem-8/deep-learning/sample-paper-1-solution',
};

function findSourceMd(pdfName) {
  const key = pdfName.replace('.pdf', '');
  const rel = PDF_TO_MD[key];
  if (!rel) return null;
  const mdPath = path.join(REPO_ROOT, rel + '.md');
  return fs.existsSync(mdPath) ? mdPath : null;
}

async function genPreview(mdPath, outPng) {
  if (!mdPath || !fs.existsSync(mdPath)) {
    // Fallback: create a simple info card
    const browser = await chromium.launch({ headless: true });
    const page = await browser.newPage({ viewport: { width: 800, height: 600 } });
    await page.setContent(`<html><body style="display:flex;align-items:center;justify-content:center;height:100vh;background:#f0f0f0;font-family:serif;">
      <div style="text-align:center;padding:40px"><div style="font-size:64px">📄</div>
      <div style="font-size:16px;font-weight:bold;color:#333;margin-top:12px">${path.basename(mdPath || outPng).replace('.png','')}</div></div></body></html>`,
      { waitUntil: 'networkidle' });
    await page.screenshot({ path: outPng, fullPage: false });
    await browser.close();
    return;
  }

  // Read and render the Markdown as HTML (first N chars to keep it short)
  let md = fs.readFileSync(mdPath, 'utf-8').slice(0, 3000);
  // Strip fenced code blocks and diagrams for cleaner preview
  md = md.replace(/```[\s\S]*?```/g, '[code block]');
  const html = marked.parse(md, { breaks: true, gfm: true });

  const pageCSS = `
    @page { size: A4; margin: 0; }
    body {
      font-family: 'Times New Roman', Times, serif;
      font-size: 12pt; line-height: 1.15; color: #000;
      padding: 40px; margin: 0;
    }
    h1 { font-size: 14pt; font-weight: bold; margin: 16px 0 6px 0; }
    h2 { font-size: 13pt; font-weight: bold; margin: 14px 0 4px 0; }
    h3 { font-size: 12pt; font-weight: bold; margin: 12px 0 4px 0; }
    p { margin: 4px 0; }
    table { width: 100%; border-collapse: collapse; margin: 8px 0; font-size: 11pt; }
    th { background: #e0e0e0; font-weight: bold; padding: 5px 8px; border: 1px solid #000; }
    td { padding: 4px 8px; border: 1px solid #000; }
    strong { font-weight: bold; }
  `;

  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage({ viewport: { width: 1200, height: 1600 } });
  await page.setContent(`<!DOCTYPE html><html><head><meta charset="utf-8"><style>${pageCSS}</style></head><body>${html}</body></html>`,
    { waitUntil: 'networkidle' });
  await page.screenshot({ path: outPng, fullPage: false });
  await browser.close();
}

async function main() {
  fs.mkdirSync(OUT_DIR, { recursive: true });
  const pdfs = fs.readdirSync(PDF_DIR).filter(f => f.endsWith('.pdf'));
  console.log(`Generating ${pdfs.length} content-based preview thumbnails...\n`);

  for (const f of pdfs) {
    const pngPath = path.join(OUT_DIR, f.replace('.pdf', '.png'));
    const mdPath = findSourceMd(f);
    console.log(`  ${path.basename(f)} → ${path.basename(pngPath)} ${mdPath ? '(from source)' : '(fallback)'}`);
    await genPreview(mdPath, pngPath);
  }
  console.log(`\nDone! ${pdfs.length} previews saved to ${path.relative(REPO_ROOT, OUT_DIR)}`);
}

main().catch(err => { console.error(err.message); process.exit(1); });
