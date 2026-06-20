const SUPER_SUB_MAP = {
  '\u2070': '^{0}', '\u00B9': '^{1}', '\u00B2': '^{2}', '\u00B3': '^{3}',
  '\u2074': '^{4}', '\u2075': '^{5}', '\u2076': '^{6}', '\u2077': '^{7}',
  '\u2078': '^{8}', '\u2079': '^{9}',
  '\u207B': '^{-}', '\u207A': '^{+}',
  '\u2080': '_{0}', '\u2081': '_{1}', '\u2082': '_{2}', '\u2083': '_{3}',
  '\u2084': '_{4}', '\u2085': '_{5}', '\u2086': '_{6}', '\u2087': '_{7}',
  '\u2088': '_{8}', '\u2089': '_{9}',
};

const SUPER_PATTERN = /[\u2070\u00B9\u00B2\u00B3\u2074-\u2079\u207B\u207A]/;
const SUB_PATTERN = /[\u2080-\u2089]/;

function hasSuperOrSub(text) {
  return SUPER_PATTERN.test(text) || SUB_PATTERN.test(text);
}

function convertNotations(md) {
  let result = md;
  let changed = false;

  result = result.replace(/(\d)([\u207B\u207A])/g, (_, digit, sign) => {
    changed = true;
    return digit + '$' + (SUPER_SUB_MAP[sign] || sign);
  });

  result = result.replace(/([a-zA-Z])([\u2080-\u2089])/g, (_, letter, sub) => {
    changed = true;
    return letter + '$' + (SUPER_SUB_MAP[sub] || sub);
  });

  result = result.replace(/(\d|\))([\u2080-\u2089])/g, (_, base, sub) => {
    changed = true;
    return base + '$' + (SUPER_SUB_MAP[sub] || sub);
  });

  result = result.replace(/\$([^{])(\^{[-+]\d*})/g, (_, base, exp) => {
    changed = true;
    return '$' + base + '{' + exp.slice(1);
  });

  if (changed) {
    result = result.replace(/\b(\d+(?:\.\d+)?)\s*\$\^\{(-?\+?\d+)\}\s*(\d*)\b/g, (_, num, exp, trailing) => {
      return num + '$^{' + exp + '}' + (trailing || '');
    });
  }

  return result;
}

module.exports = { convertNotations, hasSuperOrSub };
