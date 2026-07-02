const LATEX_TO_UNICODE = {
  '\\\\neq': '\u2260',
  '\\\\ne': '\u2260',
  '\\\\le': '\u2264',
  '\\\\leq': '\u2264',
  '\\\\ge': '\u2265',
  '\\\\geq': '\u2265',
  '\\\\approx': '\u2248',
  '\\\\equiv': '\u2261',
  '\\\\times': '\u00D7',
  '\\\\infty': '\u221E',
  '\\\\to': '\u2192',
  '\\\\rightarrow': '\u2192',
  '\\\\gets': '\u2190',
  '\\\\leftarrow': '\u2190',
  '\\\\Rightarrow': '\u21D2',
  '\\\\Leftarrow': '\u21D0',
  '\\\\subset': '\u2282',
  '\\\\supset': '\u2283',
  '\\\\subseteq': '\u2286',
  '\\\\supseteq': '\u2287',
  '\\\\cup': '\u222A',
  '\\\\cap': '\u2229',
  '\\\\in': '\u2208',
  '\\\\notin': '\u2209',
  '\\\\nabla': '\u2207',
  '\\\\partial': '\u2202',
  '\\\\sum': '\u2211',
  '\\\\prod': '\u220F',
  '\\\\int': '\u222B',
  '\\\\alpha': '\u03B1',
  '\\\\beta': '\u03B2',
  '\\\\gamma': '\u03B3',
  '\\\\delta': '\u03B4',
  '\\\\theta': '\u03B8',
  '\\\\lambda': '\u03BB',
  '\\\\mu': '\u03BC',
  '\\\\pi': '\u03C0',
  '\\\\sigma': '\u03C3',
  '\\\\phi': '\u03C6',
  '\\\\omega': '\u03C9',
};

const LATEX_PATTERN = new RegExp(
  '\\$?' + Object.keys(LATEX_TO_UNICODE).join('|') + '\\$?',
  'g'
);

const FENCED_BLOCK = /```[\s\S]*?```/g;

function convertInlineLatex(text) {
  return text.replace(LATEX_PATTERN, (match) => {
    const clean = match.replace(/\$/g, '');
    return LATEX_TO_UNICODE[clean] || match;
  });
}

function convertCodeblockMath(md) {
  const blocks = [];
  const placeholder = '%CODEPLACEHOLDER%';
  let idx = 0;

  const stripped = md.replace(FENCED_BLOCK, (match) => {
    const converted = convertInlineLatex(match);
    const ph = placeholder + (idx++) + '%';
    blocks.push(ph);
    return converted;
  });

  return stripped;
}

module.exports = { convertCodeblockMath };
