#!/usr/bin/env node
const { chromium } = require('playwright');
const path = require('path');
const fs = require('fs');

const FONTS_DIR = path.join(__dirname, '..', 'fonts');
const OUT_DIR = path.join(__dirname, '..', 'tmp');

const FONT_TESTS = [
  { dir: 'termes',               file: 'texgyretermes-regular.otf',         family: 'TNR',                   label: 'TeX Gyre Termes',                 sample: 'The quick brown fox jumps over the lazy dog 1234567890' },
  { dir: 'dejavu',               file: 'DejaVuSans.ttf',                    family: 'DejaVu Sans',           label: 'DejaVu Sans',                     sample: 'The quick brown fox jumps over the lazy dog' },
  { dir: 'dejavu',               file: 'DejaVuSerif.ttf',                   family: 'DejaVu Serif',          label: 'DejaVu Serif',                    sample: 'The quick brown fox jumps over the lazy dog' },
  { dir: 'dejavu',               file: 'DejaVuSansMono.ttf',                family: 'DejaVu Sans Mono',      label: 'DejaVu Mono',                     sample: 'The quick brown fox jumps over the lazy dog' },
  { dir: 'caskaydia',            file: 'CaskaydiaCoveNerdFontMono-Regular.ttf', family: 'Cask NFM',          label: 'CaskaydiaCove Mono',              sample: 'monospace: int main() { return 0; }' },
  { dir: 'termes-math',          file: 'texgyretermes-math.otf',             family: 'TeX Gyre Termes Math',  label: 'TeX Gyre Termes Math',            sample: '∫ x² dx = ⅓x³ + C  ∑ᵢ₌₁ⁿ i = n(n+1)/2' },
  { dir: 'noto-sans-devanagari', file: 'NotoSansDevanagari-Regular.ttf',    family: 'Noto Sans Devanagari',  label: 'Noto Sans Devanagari',            sample: 'अ आ इ ई उ ऊ ए ऐ ओ औ क ख ग घ १ २ ३ १२३४५' },
  { dir: 'noto-serif-devanagari',file: 'NotoSerifDevanagari-Regular.ttf',   family: 'Noto Serif Devanagari', label: 'Noto Serif Devanagari',           sample: 'सर्वे जनााः सुखिनः भवन्तु। संस्कृतम् देवभाषा' },
  { dir: 'shobhika',             file: 'Shobhika-Regular.otf',              family: 'Shobhika',              label: 'Shobhika (IIT Bombay)',           sample: 'अ आ इ ई उ ऊ ए ऐ ओ औ क ख ग घ ङ च छ ज झ ञ' },
  { dir: 'mukta',                file: 'Mukta-Regular.ttf',                 family: 'Mukta',                 label: 'Mukta (Ek Type)',                 sample: 'अ आ इ ई ગુજરાતી தமிழ் ૐ શ્રી ੴ ਸਤਿ ਨਾਮੁ' },
  { dir: 'noto-sans-bengali',    file: 'NotoSansBengali-Regular.ttf',       family: 'Noto Sans Bengali',     label: 'Noto Sans Bengali',               sample: 'অ আ ই ঈ উ ঊ এ ঐ ও ঔ ক খ গ ঘ ১২৩৪৫৬৭৮৯০' },
  { dir: 'noto-sans-gujarati',   file: 'NotoSansGujarati-Regular.ttf',      family: 'Noto Sans Gujarati',    label: 'Noto Sans Gujarati',              sample: 'અ આ ઇ ઈ ઉ ઊ એ ઐ ઓ ઔ ક ખ ગ ઘ ૧ ૨ ૩ ૪ ૫' },
  { dir: 'noto-sans-gurmukhi',   file: 'NotoSansGurmukhi-Regular.ttf',      family: 'Noto Sans Gurmukhi',    label: 'Noto Sans Gurmukhi',              sample: 'ਅ ਆ ਇ ਈ ਉ ਊ ਏ ਐ ਓ ਔ ਕ ਖ ਗ ਘ ੧ ੨ ੩ ੪ ੫' },
  { dir: 'noto-sans-tamil',      file: 'NotoSansTamil-Regular.ttf',         family: 'Noto Sans Tamil',       label: 'Noto Sans Tamil',                 sample: 'அ ஆ இ ஈ உ ஊ எ ஏ ஐ ஒ ஓ ஔ க ங ச ஜ ஞ ௧ ௨ ௩' },
  { dir: 'noto-sans-telugu',     file: 'NotoSansTelugu-Regular.ttf',        family: 'Noto Sans Telugu',      label: 'Noto Sans Telugu',                sample: 'అ ఆ ఇ ఈ ఉ ఊ ఋ ౠ ఎ ఏ ఐ ఒ ఓ ఔ క ఖ గ ఘ ౧ ౨ ౩' },
  { dir: 'noto-sans-kannada',    file: 'NotoSansKannada-Regular.ttf',       family: 'Noto Sans Kannada',     label: 'Noto Sans Kannada',               sample: 'ಅ ಆ ಇ ಈ ಉ ಊ ಋ ೠ ಎ ಏ ಐ ಒ ಓ ಔ ಕ ಖ ಗ ಘ ೧ ೨ ೩' },
  { dir: 'noto-sans-malayalam',  file: 'NotoSansMalayalam-Regular.ttf',     family: 'Noto Sans Malayalam',   label: 'Noto Sans Malayalam',             sample: 'അ ആ ഇ ഈ ഉ ഊ ഋ ൠ എ ഏ ഐ ഒ ഓ ഔ ക ഖ ഗ ഘ ൧ ൨ ൩' },
  { dir: 'noto-sans-oriya',      file: 'NotoSansOriya-Regular.ttf',         family: 'Noto Sans Oriya',       label: 'Noto Sans Oriya',                 sample: 'ଅ ଆ ଇ ଈ ଉ ଊ ଋ ୠ ଏ ଐ ଓ ଔ କ ଖ ଗ ଘ ୧ ୨ ୩ ୪' },
  { dir: 'noto-sans-sinhala',    file: 'NotoSansSinhala-Regular.ttf',       family: 'Noto Sans Sinhala',     label: 'Noto Sans Sinhala',               sample: 'අ ආ ඇ ඈ ඉ ඊ උ ඌ ඍ ඎ ඏ ඐ එ ඒ ඓ ඔ ඕ ඖ ක ඛ' },
  { dir: 'noto-sans-arabic',     file: 'NotoNaskhArabic-Regular.ttf',       family: 'Noto Naskh Arabic',     label: 'Noto Naskh Arabic',               sample: 'الحمد لله رب العالمين ١٢٣٤٥٦٧٨٩٠ سلام' },
  { dir: 'noto-sans-hebrew',     file: 'NotoSansHebrew-Regular.ttf',        family: 'Noto Sans Hebrew',      label: 'Noto Sans Hebrew',                sample: 'שָׁלוֹם עֲלֵיכֶם א ב ג ד ה ו ז ח ט י ﬠ ﬤ שׁ' },
  { dir: 'noto-sans-thai',       file: 'NotoSansThai-Regular.ttf',          family: 'Noto Sans Thai',        label: 'Noto Sans Thai',                  sample: 'สวัสดีครับ ภาษาไทย ๑๒๓๔๕๖๗๘๙๐' },
  { dir: 'noto-sans-lao',        file: 'NotoSansLao-Regular.ttf',           family: 'Noto Sans Lao',         label: 'Noto Sans Lao',                   sample: 'ສະບາຍດີ ພາສາລາວ ໑໒໓໔໕໖໗໘໙໐' },
  { dir: 'noto-sans-khmer',      file: 'NotoSansKhmer-Regular.ttf',         family: 'Noto Sans Khmer',       label: 'Noto Sans Khmer',                 sample: 'សួស្តី ភាសាខ្មែរ ១២៣៤៥៦៧៨៩០' },
  { dir: 'noto-sans-myanmar',    file: 'NotoSansMyanmar-Regular.ttf',       family: 'Noto Sans Myanmar',     label: 'Noto Sans Myanmar',               sample: 'မင်္ဂလာပါ မြန်မာဘာသာ ၁၂၃၄၅၆၇၈၉၀' },
  { dir: 'noto-sans-cjk-sc',     file: 'NotoSansCJKsc-Regular.otf',          family: 'Noto Sans CJK SC',      label: 'Noto Sans CJK SC (Chinese)',      sample: '你好世界 中文测试 一二三四五六七八九十' },
  { dir: 'noto-sans-cjk-tc',     file: 'NotoSansCJKtc-Regular.otf',          family: 'Noto Sans CJK TC',      label: 'Noto Sans CJK TC (Taiwan)',       sample: '你好世界 繁體中文 一二三四五六七八九十' },
  { dir: 'noto-sans-cjk-jp',     file: 'NotoSansCJKjp-Regular.otf',          family: 'Noto Sans CJK JP',      label: 'Noto Sans CJK JP (Japanese)',     sample: 'こんにちは世界 日本語テスト 一二三四五六七八九十' },
  { dir: 'noto-sans-cjk-kr',     file: 'NotoSansCJKkr-Regular.otf',          family: 'Noto Sans CJK KR',      label: 'Noto Sans CJK KR (Korean)',       sample: '안녕하세요 세계 한글 테스트 일이삼사오육칠팔구십' },
  { dir: 'noto-sans-cjk-hk',     file: 'NotoSansCJKhk-Regular.otf',          family: 'Noto Sans CJK HK',      label: 'Noto Sans CJK HK (Hong Kong)',    sample: '你好世界 香港繁體 一二三四五六七八九十' },
  { dir: 'noto-sans-armenian',   file: 'NotoSansArmenian-Regular.ttf',      family: 'Noto Sans Armenian',    label: 'Noto Sans Armenian',              sample: 'Բարեւ աշխարհ հայերէն Ա Բ Գ Դ Ե Զ Է Ը Թ Ժ' },
  { dir: 'noto-sans-georgian',   file: 'NotoSansGeorgian-Regular.ttf',      family: 'Noto Sans Georgian',    label: 'Noto Sans Georgian',              sample: 'გამარჯობა მსოფლიო ა ბ გ დ ე ვ ზ თ ი კ' },
  { dir: 'noto-sans-ethiopic',   file: 'NotoSansEthiopic-Regular.ttf',      family: 'Noto Sans Ethiopic',    label: 'Noto Sans Ethiopic',              sample: 'ሰላም ዓለም አማርኛ ሀ ለ ሐ መ ሠ ረ ሰ ሸ ቀ በ ተ ኀ ነ' },
  { dir: 'opendyslexic',         file: 'OpenDyslexic3-Regular.ttf',         family: 'OpenDyslexic3',         label: 'OpenDyslexic',                    sample: 'The quick brown fox jumps over the lazy dog 1234567890' },
  { dir: 'klee',                 file: 'Klee-Regular.ttf',                  family: 'Klee',                  label: 'Klee (handwriting)',              sample: 'The quick brown fox jumps over the lazy dog' },
  { dir: 'patrick-hand',         file: 'PatrickHand-Regular.ttf',           family: 'Patrick Hand',          label: 'Patrick Hand',                    sample: 'The quick brown fox jumps over the lazy dog' },
  { dir: 'chilanka',             file: 'Chilanka-Regular.ttf',              family: 'Chilanka',              label: 'Chilanka (Malayalam)',            sample: 'അ ആ ഇ ഈ ഉ ഊ എ ഏ ഐ ഒ ഓ ക ഖ ഗ ഘ ന പ ഫ ബ ഭ' },
];

async function main() {
  console.log('=== Exam Prompt — Font Render Test ===\n');
  let missing = 0;
  const fontFaces = [];

  for (const t of FONT_TESTS) {
    const fontPath = path.join(FONTS_DIR, t.dir, t.file);
    if (!fs.existsSync(fontPath)) {
      console.log(`  ⚠️  MISSING: ${t.label} (${fontPath})`);
      missing++;
      continue;
    }
    const base64 = fs.readFileSync(fontPath).toString('base64');
    const ext = path.extname(t.file).slice(1);
    const mime = ext === 'otf' ? 'opentype' : 'truetype';
    const fontFace = `@font-face { font-family: '${t.family}'; src: url(data:font/${mime};base64,${base64}); }`;
    fontFaces.push({ ...t, fontFace, fontPath });
  }

  if (missing > 0) console.log(`\n  ⚠️  ${missing} font(s) missing — skipped\n`);

  const styleBlock = fontFaces.map(f => f.fontFace).join('\n');
  const testLines = fontFaces.map(t =>
    `<div class="test-row">
      <div class="label">${t.label}</div>
      <div class="sample" style="font-family: '${t.family}', serif;">${t.sample}</div>
      <div class="file">${t.file}</div>
    </div>`
  ).join('\n');

  const html = `<!DOCTYPE html><html><head><meta charset="utf-8">
<style>
  ${styleBlock}
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: sans-serif; padding: 20px; background: #fff; color: #333; }
  h1 { font-size: 22px; margin-bottom: 16px; color: #111; }
  .test-row { padding: 8px 12px; border-bottom: 1px solid #eee; }
  .label { font-size: 11px; color: #666; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 2px; }
  .sample { font-size: 15px; line-height: 1.5; white-space: pre-wrap; }
  .file { font-size: 10px; color: #999; margin-top: 1px; }
</style></head><body>
<h1>Exam Prompt — Font Render Test (${fontFaces.length} fonts)</h1>
${testLines}
</body></html>`;

  const htmlPath = path.join(OUT_DIR, 'font-test.html');
  const pdfPath = path.join(OUT_DIR, 'font-test.pdf');
  fs.mkdirSync(OUT_DIR, { recursive: true });
  fs.writeFileSync(htmlPath, html);

  const browser = await chromium.launch();
  const page = await browser.newPage({ viewport: { width: 900, height: 400 } });
  await page.goto('file://' + htmlPath);
  await page.waitForTimeout(800);
  await page.pdf({ path: pdfPath, width: '210mm', height: (fontFaces.length * 8 + 15) + 'mm' });
  await browser.close();

  console.log(`  ${fontFaces.length}/${FONT_TESTS.length} fonts rendered → ${pdfPath}`);
  console.log(`  HTML preview  → ${htmlPath}\n`);
  console.log('=== Font Render Test Complete ===');
}

main().catch(e => { console.error('FAILED:', e.message); process.exit(1); });
