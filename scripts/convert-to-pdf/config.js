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
      normal:  { file: resolveFontFile(['cambria-math.ttf', 'Cambria-Math.ttf']), weight: 'normal', style: 'normal' },
    },
  },
};

const PAGE = {
  format: 'A4',
  marginTop: '2cm',
  marginBottom: '2.2cm',
  marginLeft: '2.2cm',
  marginRight: '2.2cm',
};

const MATH_DISPLAY_PATTERNS = /\\begin|\\sum|\\int|\\prod|\\iint|\\iiint|\\oint|\\lim|\\frac/;

const MERMAID = {
  localPath: require.resolve('mermaid/dist/mermaid.min.js'),
};

module.exports = { FONTS, PAGE, MATH_DISPLAY_PATTERNS, MERMAID };
