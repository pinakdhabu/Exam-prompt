function normalizeOr(md) {
  return md.replace(/^\*{0,2}O\.?\s*R\.?\*{0,2}\s*$/gim, '**OR**');
}

module.exports = { normalizeOr };
