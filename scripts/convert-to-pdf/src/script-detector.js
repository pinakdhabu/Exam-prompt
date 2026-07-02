const SCRIPT_REGISTRY = [
  { id: 'devanagari',  start: 0x0900, end: 0x097F, dir: 'noto-sans-devanagari',  family: 'Noto Sans Devanagari',  files: ['NotoSansDevanagari-Regular.ttf', 'NotoSansDevanagari-Bold.ttf'] },
  { id: 'bengali',     start: 0x0980, end: 0x09FF, dir: 'noto-sans-bengali',     family: 'Noto Sans Bengali',     files: ['NotoSansBengali-Regular.ttf', 'NotoSansBengali-Bold.ttf'] },
  { id: 'gurmukhi',    start: 0x0A00, end: 0x0A7F, dir: 'noto-sans-gurmukhi',   family: 'Noto Sans Gurmukhi',     files: ['NotoSansGurmukhi-Regular.ttf', 'NotoSansGurmukhi-Bold.ttf'] },
  { id: 'gujarati',    start: 0x0A80, end: 0x0AFF, dir: 'noto-sans-gujarati',   family: 'Noto Sans Gujarati',     files: ['NotoSansGujarati-Regular.ttf', 'NotoSansGujarati-Bold.ttf'] },
  { id: 'oriya',       start: 0x0B00, end: 0x0B7F, dir: 'noto-sans-oriya',      family: 'Noto Sans Oriya',        files: ['NotoSansOriya-Regular.ttf', 'NotoSansOriya-Bold.ttf'] },
  { id: 'tamil',       start: 0x0B80, end: 0x0BFF, dir: 'noto-sans-tamil',      family: 'Noto Sans Tamil',        files: ['NotoSansTamil-Regular.ttf', 'NotoSansTamil-Bold.ttf'] },
  { id: 'telugu',      start: 0x0C00, end: 0x0C7F, dir: 'noto-sans-telugu',     family: 'Noto Sans Telugu',       files: ['NotoSansTelugu-Regular.ttf', 'NotoSansTelugu-Bold.ttf'] },
  { id: 'kannada',     start: 0x0C80, end: 0x0CFF, dir: 'noto-sans-kannada',    family: 'Noto Sans Kannada',      files: ['NotoSansKannada-Regular.ttf', 'NotoSansKannada-Bold.ttf'] },
  { id: 'malayalam',   start: 0x0D00, end: 0x0D7F, dir: 'noto-sans-malayalam',  family: 'Noto Sans Malayalam',    files: ['NotoSansMalayalam-Regular.ttf', 'NotoSansMalayalam-Bold.ttf'] },
  { id: 'sinhala',     start: 0x0D80, end: 0x0DFF, dir: 'noto-sans-sinhala',    family: 'Noto Sans Sinhala',      files: ['NotoSansSinhala-Regular.ttf', 'NotoSansSinhala-Bold.ttf'] },
  { id: 'arabic',      start: 0x0600, end: 0x06FF, dir: 'noto-sans-arabic',     family: 'Noto Naskh Arabic',      files: ['NotoNaskhArabic-Regular.ttf', 'NotoNaskhArabic-Bold.ttf'] },
  { id: 'hebrew',      start: 0x0590, end: 0x05FF, dir: 'noto-sans-hebrew',     family: 'Noto Sans Hebrew',       files: ['NotoSansHebrew-Regular.ttf', 'NotoSansHebrew-Bold.ttf'] },
  { id: 'thai',        start: 0x0E00, end: 0x0E7F, dir: 'noto-sans-thai',       family: 'Noto Sans Thai',         files: ['NotoSansThai-Regular.ttf', 'NotoSansThai-Bold.ttf'] },
  { id: 'lao',         start: 0x0E80, end: 0x0EFF, dir: 'noto-sans-lao',        family: 'Noto Sans Lao',          files: ['NotoSansLao-Regular.ttf', 'NotoSansLao-Bold.ttf'] },
  { id: 'khmer',       start: 0x1780, end: 0x17FF, dir: 'noto-sans-khmer',      family: 'Noto Sans Khmer',        files: ['NotoSansKhmer-Regular.ttf', 'NotoSansKhmer-Bold.ttf'] },
  { id: 'myanmar',     start: 0x1000, end: 0x109F, dir: 'noto-sans-myanmar',    family: 'Noto Sans Myanmar',      files: ['NotoSansMyanmar-Regular.ttf', 'NotoSansMyanmar-Bold.ttf'] },
  { id: 'armenian',    start: 0x0530, end: 0x058F, dir: 'noto-sans-armenian',   family: 'Noto Sans Armenian',     files: ['NotoSansArmenian-Regular.ttf', 'NotoSansArmenian-Bold.ttf'] },
  { id: 'georgian',    start: 0x10A0, end: 0x10FF, dir: 'noto-sans-georgian',   family: 'Noto Sans Georgian',     files: ['NotoSansGeorgian-Regular.ttf', 'NotoSansGeorgian-Bold.ttf'] },
  { id: 'ethiopic',    start: 0x1200, end: 0x137F, dir: 'noto-sans-ethiopic',   family: 'Noto Sans Ethiopic',     files: ['NotoSansEthiopic-Regular.ttf', 'NotoSansEthiopic-Bold.ttf'] },
  { id: 'cjk',         start: 0x4E00, end: 0x9FFF, dir: 'noto-sans-cjk-sc',     family: 'Noto Sans CJK SC',       files: ['NotoSansCJKsc-Regular.otf'] },
  { id: 'hiragana',    start: 0x3040, end: 0x309F, dir: 'noto-sans-cjk-jp',     family: 'Noto Sans CJK JP',       files: ['NotoSansCJKjp-Regular.otf'] },
  { id: 'katakana',    start: 0x30A0, end: 0x30FF, dir: 'noto-sans-cjk-jp',     family: 'Noto Sans CJK JP',       files: ['NotoSansCJKjp-Regular.otf'] },
  { id: 'hangul',      start: 0xAC00, end: 0xD7AF, dir: 'noto-sans-cjk-kr',     family: 'Noto Sans CJK KR',       files: ['NotoSansCJKkr-Regular.otf'] },
];

const FONTS_DIR = require('path').join(__dirname, '../../../fonts');

function detectScripts(text) {
  const found = new Set();
  for (let i = 0; i < text.length; i++) {
    const cp = text.charCodeAt(i);
    for (const script of SCRIPT_REGISTRY) {
      if (cp >= script.start && cp <= script.end) {
        found.add(script.id);
        break;
      }
    }
  }
  return [...found];
}

function getFontConfigForScripts(scriptIds) {
  const configs = [];
  const seen = new Set();
  for (const id of scriptIds) {
    const script = SCRIPT_REGISTRY.find(s => s.id === id);
    if (!script || seen.has(script.family)) continue;
    seen.add(script.family);
    const dir = require('path').join(FONTS_DIR, script.dir);
    const variants = [];
    for (const file of script.files) {
      const fp = require('path').join(dir, file);
      if (require('fs').existsSync(fp)) {
        variants.push({ file: fp, fileOnly: file });
      }
    }
    if (variants.length === 0) continue;
    configs.push({ family: script.family, variants });
  }
  return configs;
}

module.exports = { detectScripts, getFontConfigForScripts, SCRIPT_REGISTRY };
