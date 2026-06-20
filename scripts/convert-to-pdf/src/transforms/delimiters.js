const { MATH_DISPLAY_PATTERNS } = require('../../config');

function _isDisplayMath(content) {
  return MATH_DISPLAY_PATTERNS.test(content);
}

function convertLaTeXDelimiters(md) {
  md = md.replace(/\\\[([\s\S]*?)\\\]/g, (_, c) => {
    return '\n\n$$\n' + c.trim().replace(/\s*\n\s*/g, ' ') + '\n$$\n\n';
  });
  md = md.replace(/\\\(([\s\S]*?)\\\)/g, (_, c) => {
    const content = c.trim().replace(/\s*\n\s*/g, ' ');
    if (_isDisplayMath(content)) {
      return '\n\n$$\n' + content + '\n$$\n\n';
    }
    return '$' + content + '$';
  });
  return md;
}

module.exports = { convertLaTeXDelimiters };
