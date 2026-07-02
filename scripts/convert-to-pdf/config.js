const path = require('path');
const fs = require('fs');

function resolveFontFile(filenames) {
  const possibleDirs = [
    '/usr/share/fonts/TTF',
    '/usr/share/fonts/truetype',
    '/Library/Fonts',
    '/System/Library/Fonts',
    path.join(process.env.HOME || '', 'Library/Fonts'),
    'C:\\Windows\\Fonts',
    path.join(__dirname, '../../fonts'),
    path.join(__dirname, '../../fonts/times'),
    path.join(__dirname, '../../fonts/dejavu'),
    path.join(__dirname, '../../fonts/caskaydia'),
    path.join(__dirname, '../../fonts/termes-math'),
    path.join(__dirname, '../../fonts/noto-sans-devanagari'),
    path.join(__dirname, '../../fonts/noto-serif-devanagari'),
    path.join(__dirname, '../../fonts/shobhika'),
    path.join(__dirname, '../../fonts/mukta'),
    path.join(__dirname, '../../fonts/opendyslexic'),
    path.join(__dirname, '../../fonts/klee'),
    path.join(__dirname, '../../fonts/patrick-hand'),
    path.join(__dirname, '../../fonts/chilanka'),
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

const FONTS = {
  tnr: {
    family: 'TNR',
    variants: {
      normal:  { file: resolveFontFile(['Times.TTF', 'times.ttf']), weight: 'normal', style: 'normal' },
      bold:    { file: resolveFontFile(['Timesbd.TTF', 'timesbd.ttf']), weight: 'bold', style: 'normal' },
      italic:  { file: resolveFontFile(['Timesi.TTF', 'timesi.ttf']), weight: 'normal', style: 'italic' },
      bi:      { file: resolveFontFile(['Timesbi.TTF', 'timesbi.ttf']), weight: 'bold', style: 'italic' },
    },
  },
  caskaydia: {
    family: 'Cask NFM',
    variants: {
      normal:  { file: resolveFontFile(['CaskaydiaCoveNerdFontMono-Regular.ttf', 'CaskaydiaMonoNerdFontMono-Regular.ttf']), weight: 'normal', style: 'normal' },
      bold:    { file: resolveFontFile(['CaskaydiaCoveNerdFontMono-Bold.ttf', 'CaskaydiaMonoNerdFontMono-Bold.ttf']), weight: 'bold', style: 'normal' },
      italic:  { file: resolveFontFile(['CaskaydiaCoveNerdFontMono-Italic.ttf', 'CaskaydiaMonoNerdFontMono-Italic.ttf']), weight: 'normal', style: 'italic' },
      bi:      { file: resolveFontFile(['CaskaydiaCoveNerdFontMono-BoldItalic.ttf', 'CaskaydiaMonoNerdFontMono-BoldItalic.ttf']), weight: 'bold', style: 'italic' },
    },
  },
  cambria: {
    family: 'Cambria',
    variants: {
      normal:  { file: resolveFontFile(['cambria.ttf', 'Cambria.ttf']), weight: 'normal', style: 'normal' },
      bold:    { file: resolveFontFile(['cambriab.ttf', 'Cambriab.ttf']), weight: 'bold', style: 'normal' },
      italic:  { file: resolveFontFile(['cambriai.ttf', 'Cambriai.ttf']), weight: 'normal', style: 'italic' },
      bi:      { file: resolveFontFile(['cambriaz.ttf', 'Cambriaz.ttf']), weight: 'bold', style: 'italic' },
    },
  },
  cambriaMath: {
    family: 'Cambria Math',
    variants: {
      normal:  { file:   resolveFontFile(['cambria-math.ttf', 'Cambria-Math.ttf']), weight: 'normal', style: 'normal' },
    },
  },
  stixMath: {
    family: 'STIX Two Math',
    variants: {
      normal:  { file: resolveFontFile(['STIXTwoMath-Regular.ttf']), weight: 'normal', style: 'normal' },
    },
  },
  termesMath: {
    family: 'TeX Gyre Termes Math',
    variants: {
      normal:  { file: resolveFontFile(['texgyretermes-math.otf']), weight: 'normal', style: 'normal' },
    },
  },
};

const PAGE = {
  format: 'A4',
  marginTop: '2.4cm',
  marginBottom: '2.4cm',
  marginLeft: '2.5cm',
  marginRight: '1.7cm',
};

const MATH_DISPLAY_PATTERNS = /\\begin|\\sum|\\int|\\prod|\\iint|\\iiint|\\oint|\\lim|\\frac/;

const MERMAID = {
  localPath: require.resolve('mermaid/dist/mermaid.min.js'),
};

module.exports = { FONTS, PAGE, MATH_DISPLAY_PATTERNS, MERMAID };
