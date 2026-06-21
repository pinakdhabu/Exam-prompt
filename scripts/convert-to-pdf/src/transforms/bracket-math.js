const BRACKET_MATH_RE = /^\[\s*$(?:\n(?!\s*\]\s*$)[\s\S]*?)*\n\s*\]\s*$/gm;
const BRACKET_DETECT = /^\[\s*$/m;

function hasBracketMath(text) {
  return BRACKET_DETECT.test(text);
}

function convertBracketMath(md) {
  return md.replace(BRACKET_MATH_RE, (match) => {
    const inner = match.replace(/^\[\s*/, '').replace(/\s*\]\s*$/, '');
    const fixed = inner.replace(/\\\s*$/gm, '\\\\');
    return '$$\n' + fixed.trim() + '\n$$';
  });
}

module.exports = { convertBracketMath, hasBracketMath };
