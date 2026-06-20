const SUBSCRIPT_PATTERN = /(?<=[a-zA-Z0-9\u03B1-\u03C9\u0391-\u03A9)])(_)+(?=[a-zA-Z0-9\u03B1-\u03C9\u0391-\u03A9])/g;

function escapeSubscripts(md) {
  return md.replace(SUBSCRIPT_PATTERN, (match) => '\\' + match);
}

module.exports = { escapeSubscripts };
