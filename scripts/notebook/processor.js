const { stripYaml } = require('../convert-to-pdf/src/transforms/yaml');
const { normalizeFences, normalizeQuotes, normalizeDashes, removeUnicodeChars } = require('../convert-to-pdf/src/transforms/cleanup');
const { convertNewpage } = require('../convert-to-pdf/src/transforms/newpage');
const { normalizeOr } = require('../convert-to-pdf/src/transforms/or');
const { convertMermaidBlocks, hasMermaid } = require('../convert-to-pdf/src/transforms/mermaid');

class NotebookProcessor {
  constructor() {
    this._hasMermaid = false;
  }

  get hasMermaid() {
    return this._hasMermaid;
  }

  process(raw) {
    this._hasMermaid = hasMermaid(raw);

    let md = raw;
    md = stripYaml(md);
    md = removeUnicodeChars(md);
    md = normalizeQuotes(md);
    md = normalizeDashes(md);
    md = convertNewpage(md);
    md = normalizeFences(md);
    md = convertMermaidBlocks(md);
    md = normalizeOr(md);
    return md;
  }
}

module.exports = { NotebookProcessor };
