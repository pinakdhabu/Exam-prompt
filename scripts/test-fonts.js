#!/usr/bin/env node
const { chromium } = require('playwright');
const path = require('path');
const fs = require('fs');

const FONTS_DIR = path.join(__dirname, '..', 'fonts');
const OUT_DIR = path.join(__dirname, '..', 'tmp');

const FONT_TESTS = [
  { dir: 'termes',        files: ['texgyretermes-regular.otf'], family: 'TNR',                    label: 'TeX Gyre Termes (Times-compatible)' },
  { dir: 'dejavu',        files: ['DejaVuSans.ttf'],           family: 'DejaVu Sans',            label: 'DejaVu Sans' },
  { dir: 'dejavu',        files: ['DejaVuSerif.ttf'],          family: 'DejaVu Serif',           label: 'DejaVu Serif' },
  { dir: 'dejavu',        files: ['DejaVuSansMono.ttf'],       family: 'DejaVu Sans Mono',       label: 'DejaVu Mono' },
  { dir: 'caskaydia',     files: ['CaskaydiaCoveNerdFontMono-Regular.ttf'], family: 'Cask NFM',   label: 'CaskaydiaCove Mono' },
  { dir: 'termes-math',   files: ['texgyretermes-math.otf'],   family: 'TeX Gyre Termes Math',   label: 'TeX Gyre Termes Math' },
  { dir: 'noto-sans-devanagari', files: ['NotoSansDevanagari-Regular.ttf'], family: 'Noto Sans Devanagari', label: 'Noto Sans Devanagari' },
  { dir: 'noto-serif-devanagari', files: ['NotoSerifDevanagari-Regular.ttf'], family: 'Noto Serif Devanagari', label: 'Noto Serif Devanagari' },
  { dir: 'shobhika',      files: ['Shobhika-Regular.otf'],     family: 'Shobhika',               label: 'Shobhika (IIT Bombay)' },
  { dir: 'mukta',         files: ['Mukta-Regular.ttf'],        family: 'Mukta',                  label: 'Mukta (Ek Type)' },
  { dir: 'opendyslexic',  files: ['OpenDyslexic3-Regular.ttf'], family: 'OpenDyslexic3',         label: 'OpenDyslexic' },
  { dir: 'klee',          files: ['Klee-Regular.ttf'],         family: 'Klee',                   label: 'Klee (handwriting)' },
  { dir: 'patrick-hand',  files: ['PatrickHand-Regular.ttf'],  family: 'Patrick Hand',           label: 'Patrick Hand' },
  { dir: 'chilanka',      files: ['Chilanka-Regular.ttf'],     family: 'Chilanka',               label: 'Chilanka (Malayalam)' },
];

async function main() {
  console.log('=== Exam Prompt — Font Render Test ===\n');

  let missing = 0;
  const fontFaces = [];

  for (const t of FONT_TESTS) {
    const fontPath = path.join(FONTS_DIR, t.dir, t.files[0]);
    if (!fs.existsSync(fontPath)) {
      console.log(`  ⚠️  MISSING: ${t.label} (${fontPath})`);
      missing++;
      continue;
    }
    const base64 = fs.readFileSync(fontPath).toString('base64');
    const ext = path.extname(fontPath).slice(1);
    const mime = ext === 'otf' ? 'opentype' : 'truetype';
    const fontFace = `@font-face { font-family: '${t.family}'; src: url(data:font/${mime};base64,${base64}); }`;
    fontFaces.push({ ...t, fontFace, fontPath });
  }

  if (missing > 0) console.log(`\n  ⚠️  ${missing} font(s) missing — skipping those tests\n`);

  const styleBlock = fontFaces.map(f => f.fontFace).join('\n');

  const testLines = fontFaces.map(t => {
    const sample = t.label.includes('Devanagari')
      ? 'अ आ इ ई उ ऊ ए ऐ ओ औ क ख ग घ १ २ ३ ४ ५'
      : t.label.includes('Malayalam')
        ? 'അ ആ ഇ ഈ ഉ ഊ എ ഏ ഐ ഒ ഓ ക ഖ ഗ ഘ'
        : t.label.includes('Shobhika')
          ? 'अ आ इ ई उ ऊ ए ऐ ओ औ क ख ग घ ङ च छ ज झ ञ ट ठ ड ढ ण त थ द ध न प फ ब भ म य र ल व श ष स ह'
          : t.label.includes('Mukta')
            ? 'अ आ इ ई उ ऊ ए ऐ ओ औ क ख ग गुजरातੀ தமிழ் ૐ શ્રી'
            : 'The quick brown fox jumps over the lazy dog 1234567890';
    const langAttr = t.label.includes('Devanagari') ? ' lang="hi"' : t.label.includes('Malayalam') ? ' lang="ml"' : '';
    return `<div class="test-row">
      <div class="label">${t.label}</div>
      <div class="sample" style="font-family: '${t.family}', serif;"${langAttr}>${sample}</div>
      <div class="file">${t.files[0]}</div>
    </div>`;
  }).join('\n');

  const html = `<!DOCTYPE html><html><head><meta charset="utf-8">
<style>
  @import url('https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap');
  ${styleBlock}
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: sans-serif; padding: 20px; background: #fff; color: #333; }
  h1 { font-size: 22px; margin-bottom: 16px; color: #111; }
  .test-row { padding: 10px 12px; border-bottom: 1px solid #eee; }
  .label { font-size: 11px; color: #666; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 4px; }
  .sample { font-size: 16px; line-height: 1.6; }
  .file { font-size: 10px; color: #999; margin-top: 2px; }
  .pass { border-left: 3px solid #22c55e; }
  .fail { border-left: 3px solid #ef4444; }
</style></head><body>
<h1>Exam Prompt — Font Render Test</h1>
${testLines}
</body></html>`;

  const htmlPath = path.join(OUT_DIR, 'font-test.html');
  const pdfPath = path.join(OUT_DIR, 'font-test.pdf');
  fs.mkdirSync(OUT_DIR, { recursive: true });
  fs.writeFileSync(htmlPath, html);

  const browser = await chromium.launch();
  const page = await browser.newPage({ viewport: { width: 800, height: fontFaces.length * 70 + 60 } });
  await page.goto('file://' + htmlPath);
  await page.waitForTimeout(500);
  await page.pdf({ path: pdfPath, width: '210mm', height: (fontFaces.length * 12 + 10) + 'mm' });
  await browser.close();

  console.log(`  ${fontFaces.length} fonts rendered → ${pdfPath}`);
  console.log(`  HTML preview  → ${htmlPath}\n`);
  console.log('=== Font Render Test Complete ===');
}

main().catch(e => {
  console.error('FAILED:', e.message);
  process.exit(1);
});
