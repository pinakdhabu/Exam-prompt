const UNICODE_MATH_MAP = {
  '\u0391': '\\Alpha ',    '\u0392': '\\Beta ',    '\u0393': '\\Gamma ',    '\u0394': '\\Delta ',
  '\u0395': '\\Epsilon ',  '\u0398': '\\Theta ',   '\u039B': '\\Lambda ',   '\u039E': '\\Xi ',
  '\u03A0': '\\Pi ',       '\u03A3': '\\Sigma ',   '\u03A6': '\\Phi ',      '\u03A8': '\\Psi ',
  '\u03A9': '\\Omega ',
  '\u03B1': '\\alpha ',    '\u03B2': '\\beta ',    '\u03B3': '\\gamma ',    '\u03B4': '\\delta ',
  '\u03B5': '\\varepsilon ','\u03B6': '\\zeta ',    '\u03B7': '\\eta ',     '\u03B8': '\\theta ',
  '\u03B9': '\\iota ',     '\u03BA': '\\kappa ',   '\u03BB': '\\lambda ',   '\u03BC': '\\mu ',
  '\u03BD': '\\nu ',       '\u03BE': '\\xi ',      '\u03BF': 'o ',         '\u03C0': '\\pi ',
  '\u03C1': '\\rho ',      '\u03C3': '\\sigma ',   '\u03C4': '\\tau ',     '\u03C5': '\\upsilon ',
  '\u03C6': '\\phi ',      '\u03C7': '\\chi ',     '\u03C8': '\\psi ',     '\u03C9': '\\omega ',
  '\u2202': '\\partial ',  '\u2207': '\\nabla ',   '\u221E': '\\infty ',
  '\u222B': '\\int ',      '\u2211': '\\sum ',     '\u220F': '\\prod ',
  '\u2260': '\\neq ',      '\u2264': '\\leq ',     '\u2265': '\\geq ',
  '\u2208': '\\in ',       '\u220B': '\\ni ',      '\u2229': '\\cap ',     '\u222A': '\\cup ',
  '\u21D2': '\\Rightarrow ','\u2248': '\\approx ',
  '\u2261': '\\equiv ',    '\u2220': '\\angle ',   '\u2205': '\\emptyset ', '\u22A2': '\\vdash ',
  '\u2282': '\\subset ',   '\u2283': '\\supset ',  '\u2286': '\\subseteq ',
  '\u2287': '\\supseteq ', '\u2288': '\\nsubseteq ',
  '\u2209': '\\notin ',    '\u2284': '\\not\\subset ',
  '\u2070': '^{0}',  '\u00B9': '^{1}',  '\u00B2': '^{2}',  '\u00B3': '^{3}',
  '\u2074': '^{4}',  '\u2075': '^{5}',  '\u2076': '^{6}',  '\u2077': '^{7}',
  '\u2078': '^{8}',  '\u2079': '^{9}',  '\u2071': '^{i}',  '\u207F': '^{n}',
  '\u207A': '^{+}',  '\u207B': '^{-}',  '\u207C': '^{=}',
  '\u207D': '^{(}',  '\u207E': '^{)}',
  '\u2080': '_{0}',  '\u2081': '_{1}',  '\u2082': '_{2}',  '\u2083': '_{3}',
  '\u2084': '_{4}',  '\u2085': '_{5}',  '\u2086': '_{6}',  '\u2087': '_{7}',
  '\u2088': '_{8}',  '\u2089': '_{9}',
  '\u208A': '_{+}',  '\u208B': '_{-}',  '\u208C': '_{=}',
  '\u208D': '_{(}',  '\u208E': '_{)}',
  '\u2090': '_{a}',  '\u2091': '_{e}',  '\u2092': '_{o}',  '\u2093': '_{x}',
  '\u2095': '_{h}',  '\u2096': '_{k}',  '\u2097': '_{l}',  '\u2098': '_{m}',
  '\u2099': '_{n}',  '\u209A': '_{p}',  '\u209B': '_{s}',  '\u209C': '_{t}',
};

const MATH_CHARS_REGEX = new RegExp(
  '[' + Object.keys(UNICODE_MATH_MAP).join('').replace(/[\[\]]/g, '\\$&') + ']', 'g'
);

const MATH_DELIM_DETECT = /(?:\\\(|\\\[|\$\$|\$[^$])/;

const UNICODE_RUN = /[\u0391-\u03C9\u2070-\u209F\u00B2\u00B3\u00B9\u2080-\u2089\u00D7\u00F7\u2200-\u22FF\u2190-\u21FF\u2260-\u2265\u2229-\u222B\u03B1-\u03C9\u2202\u221E\u222B\u2211\u220F\u2260\u2264\u2265\u2208\u2229\u222A\u2192\u21D2\u2248\u2261\u2220\u2205\u22A2\u221A\u00B2\u00B3\u00B9\u2080\u2081\u2082\u2083\u2084\u2085\u2086\u2087\u2088\u2089\u00D7\u00F7]{2,}/g;

function detectMath(raw) {
  return MATH_DELIM_DETECT.test(raw) || MATH_CHARS_REGEX.test(raw);
}

function convertMathChars(text) {
  return text.replace(MATH_CHARS_REGEX, (ch) => UNICODE_MATH_MAP[ch] || ch);
}

function convertUnicodeRuns(md) {
  return md.replace(UNICODE_RUN, (m) => {
    return '$' + convertMathChars(m) + '$';
  });
}

function convertStandaloneMathChars(md) {
  return md.replace(MATH_CHARS_REGEX, (ch) => {
    return '$' + (UNICODE_MATH_MAP[ch] || ch) + '$';
  });
}

module.exports = { detectMath, convertUnicodeRuns, convertStandaloneMathChars };
