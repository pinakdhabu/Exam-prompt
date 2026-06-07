#!/usr/bin/env node
/**
 * Generate PNG preview thumbnails for generated PDFs.
 * Creates a simple HTML page showing the PDF as a card and screenshots it.
 *
 * Usage: node scripts/gen-pdf-previews.js [pdf-dir] [out-dir]
 */
const { chromium } = require('playwright');
const path = require('path');
const fs = require('fs');

const REPO_ROOT = path.resolve(__dirname, '..');
const PDF_DIR = path.resolve(process.argv[2] || path.join(REPO_ROOT, 'generated-examples', 'pdfs'));
const OUT_DIR = path.resolve(process.argv[3] || path.join(REPO_ROOT, 'docs', 'images', 'pdf-previews'));

async function genPreview(pdfFile, outPng) {
  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage({ viewport: { width: 800, height: 600 } });

  const name = path.basename(pdfFile).replace('.pdf', '');
  const sizeKB = (fs.statSync(pdfFile).size / 1024).toFixed(0);
  const relPath = path.relative(REPO_ROOT, pdfFile);

  await page.setContent(`<!DOCTYPE html>
<html><head><style>
body { margin:0; display:flex; align-items:center; justify-content:center;
  height:100vh; font-family:'Times New Roman',serif; background:#f0f0f0; }
.card { background:#fff; border-radius:8px; box-shadow:0 4px 20px rgba(0,0,0,0.15);
  padding:32px; text-align:center; max-width:320px; }
.icon { font-size:64px; margin-bottom:16px; }
.title { font-size:16px; font-weight:bold; color:#1a1a2e; margin-bottom:8px; word-break:break-all; }
.meta { font-size:13px; color:#666; margin-bottom:16px; }
.badge { display:inline-block; background:#2563eb; color:#fff; padding:8px 20px;
  border-radius:6px; font-size:14px; font-weight:bold; text-decoration:none; }
.badge:hover { background:#1d4ed8; }
</style></head><body>
<div class="card">
  <div class="icon">📄</div>
  <div class="title">${name}</div>
  <div class="meta">${sizeKB} KB</div>
  <div class="badge">View PDF →</div>
</div></body></html>`, { waitUntil: 'networkidle' });

  await page.screenshot({ path: outPng, fullPage: false });
  await browser.close();
  console.log(`  Preview: ${path.basename(outPng)}`);
}

async function main() {
  fs.mkdirSync(OUT_DIR, { recursive: true });
  const pdfs = fs.readdirSync(PDF_DIR).filter(f => f.endsWith('.pdf'));
  console.log(`Generating ${pdfs.length} preview thumbnails...`);

  for (const f of pdfs) {
    const pdfPath = path.join(PDF_DIR, f);
    const pngPath = path.join(OUT_DIR, f.replace('.pdf', '.png'));
    await genPreview(pdfPath, pngPath);
  }
  console.log(`Done! ${pdfs.length} previews saved to ${path.relative(REPO_ROOT, OUT_DIR)}`);
}

main().catch(err => { console.error(err.message); process.exit(1); });
