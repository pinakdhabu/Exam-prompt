const path = require('path');

const FONTS = {
  tnr: {
    family: 'TNR',
    variants: {
      normal:  { file: '/usr/share/fonts/TTF/Times.TTF', weight: 'normal', style: 'normal' },
      bold:    { file: '/usr/share/fonts/TTF/Timesbd.TTF', weight: 'bold', style: 'normal' },
      italic:  { file: '/usr/share/fonts/TTF/Timesi.TTF', weight: 'normal', style: 'italic' },
      bi:      { file: '/usr/share/fonts/TTF/Timesbi.TTF', weight: 'bold', style: 'italic' },
    },
  },
  caskaydia: {
    family: 'Cask NFM',
    variants: {
      normal:  { file: '/usr/share/fonts/TTF/CaskaydiaCoveNerdFontMono-Regular.ttf', weight: 'normal', style: 'normal' },
      bold:    { file: '/usr/share/fonts/TTF/CaskaydiaCoveNerdFontMono-Bold.ttf', weight: 'bold', style: 'normal' },
      italic:  { file: '/usr/share/fonts/TTF/CaskaydiaCoveNerdFontMono-Italic.ttf', weight: 'normal', style: 'italic' },
      bi:      { file: '/usr/share/fonts/TTF/CaskaydiaCoveNerdFontMono-BoldItalic.ttf', weight: 'bold', style: 'italic' },
    },
  },
  cambria: {
    family: 'Cambria',
    variants: {
      normal:  { file: '/usr/share/fonts/TTF/cambria.ttf', weight: 'normal', style: 'normal' },
      bold:    { file: '/usr/share/fonts/TTF/cambriab.ttf', weight: 'bold', style: 'normal' },
      italic:  { file: '/usr/share/fonts/TTF/cambriai.ttf', weight: 'normal', style: 'italic' },
      bi:      { file: '/usr/share/fonts/TTF/cambriaz.ttf', weight: 'bold', style: 'italic' },
    },
  },
  cambriaMath: {
    family: 'Cambria Math',
    variants: {
      normal:  { file: '/usr/share/fonts/TTF/cambria-math.ttf', weight: 'normal', style: 'normal' },
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
