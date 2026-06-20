function normalizeFences(md) {
  return md
    .replace(/^`{4,}/gm, '```')
    .replace(/^```\s*\[(\d+)\]\s*$/gm, '```\n[$1]');
}

function normalizeQuotes(md) {
  return md.replace(/[\u201c\u201d]/g, '"');
}

function normalizeDashes(md) {
  return md
    .replace(/\u2013/g, '--')
    .replace(/\u2014/g, '---');
}

function normalizeArrows(md) {
  return md.replace(/\u2192/g, '->');
}

function removeUnicodeChars(md) {
  return md
    .replace(/\u{1f31f}/ug, '')
    .replace(/\u2747\s*/g, '');
}

module.exports = { normalizeFences, normalizeQuotes, normalizeDashes, normalizeArrows, removeUnicodeChars };
