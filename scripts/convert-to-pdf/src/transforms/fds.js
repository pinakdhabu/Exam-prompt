const FD_LEFT = /\{([A-Z](?:\s*,\s*[A-Z])*)\}\s*(\$[^$]*\\to[^$]*\$)\s*([A-Z]+|\{[A-Z](?:\s*,\s*[A-Z])*\})?/g;

const RS_BRACES = /\{([A-Z](?:\s*,\s*[A-Z])*)\}/g;

function _escapeBraces(s) {
  return s.replace(/\{/g, '\\{').replace(/\}/g, '\\}');
}

function wrapFdBraces(md) {
  md = md.replace(FD_LEFT, (match, vars, math, rhs) => {
    const inner = vars.replace(/\s*,\s*/g, ', ');
    let rhsPart = '';
    if (rhs) {
      if (/^\{/.test(rhs)) {
        const rv = rhs.slice(1, -1).replace(/\s*,\s*/g, ', ');
        rhsPart = ' \\to \\{' + rv + '\\}';
      } else {
        rhsPart = ' \\to ' + rhs;
      }
      return '$\\{' + inner + '\\}' + rhsPart + '$';
    } else {
      return match;
    }
  });
  return md;
}

module.exports = { wrapFdBraces };
