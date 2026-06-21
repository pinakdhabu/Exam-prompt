const { stripYaml } = require('./src/transforms/yaml');
const { processHeader } = require('./src/transforms/header');
const { normalizeFences, normalizeQuotes, normalizeDashes, normalizeArrows, removeUnicodeChars } = require('./src/transforms/cleanup');
const { convertNewpage } = require('./src/transforms/newpage');
const { convertLaTeXDelimiters } = require('./src/transforms/delimiters');
const { detectMath, convertUnicodeRuns, convertStandaloneMathChars } = require('./src/transforms/unicode-math');
const { normalizeOr } = require('./src/transforms/or');
const { wrapFdBraces } = require('./src/transforms/fds');
const { convertMermaidBlocks, hasMermaid } = require('./src/transforms/mermaid');
const { convertBracketMath } = require('./src/transforms/bracket-math');

class MarkdownProcessor {
  constructor() {
    this._hasMath = false;
    this._hasMermaid = false;
  }

  get hasMath() {
    return this._hasMath;
  }

  get hasMermaid() {
    return this._hasMermaid;
  }

  process(raw) {
    this._hasMath = detectMath(raw);
    this._hasMermaid = hasMermaid(raw);

    let md = raw;
    md = stripYaml(md);
    md = processHeader(md);
    md = normalizeArrows(md);
    md = removeUnicodeChars(md);
    md = normalizeQuotes(md);
    md = normalizeDashes(md);
    md = convertNewpage(md);
    md = normalizeFences(md);
    md = convertMermaidBlocks(md);

    if (this._hasMath) {
      md = convertBracketMath(md);
      md = convertLaTeXDelimiters(md);
      md = convertUnicodeRuns(md);
      md = convertStandaloneMathChars(md);
      md = wrapFdBraces(md);
    }

    md = normalizeOr(md);
    return md;
  }
}

module.exports = { MarkdownProcessor };
