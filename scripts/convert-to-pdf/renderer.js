const fs = require('fs');
const path = require('path');
const { FONTS } = require('./config');

const KATEX_VERSION = '0.16.11';

const KATEX_CSS = (() => {
  try {
    const raw = fs.readFileSync(
      path.join(require.resolve('katex'), '../../dist/katex.min.css'),
      'utf-8'
    );
    return raw.replace(
      /url\(fonts\//g,
      'url(https://cdn.jsdelivr.net/npm/katex@' + KATEX_VERSION + '/dist/fonts/'
    );
  } catch {
    return '';
  }
})();

class HtmlRenderer {
  constructor(useMath) {
    this.useMath = useMath;
  }

  render(markdownHtml) {
    let html = markdownHtml
      .replace(/\[(\d+)\]/g, '<span class="marks">[$1]</span>')
      .replace(/<p>\*\*OR\*\*<\/p>/g, '<div class="question-or">OR</div>')
      .replace(/<pre><code>(\[ANSWER BOX\][\s\S]*?)<\/code><\/pre>/g, '<div class="answer-box"><pre><code>$1</code></pre></div>');

    let page = '<!DOCTYPE html><html lang="en"><head><meta charset="utf-8">';

    if (this.useMath && KATEX_CSS) {
      page += '<style>' + KATEX_CSS + '</style>';
    }

    page += '<style>' + this._buildCSS() + '</style></head><body>'
      + html
      + '</body></html>';
    return page;
  }

  _b64(p) {
    return fs.readFileSync(p).toString('base64');
  }

  _fontFaces() {
    const faces = [];
    for (const key of ['tnr', 'caskaydia', 'cambria', 'cambriaMath']) {
      const cfg = FONTS[key];
      if (!cfg) continue;
      for (const v of Object.values(cfg.variants)) {
        faces.push(`@font-face{font-family:'${cfg.family}';src:url(data:font/truetype;base64,${this._b64(v.file)})format('truetype');font-weight:${v.weight};font-style:${v.style}}`);
      }
    }
    return faces.join('\n');
  }

  _buildCSS() {
    const mathCSS = this.useMath
      ? '.katex{font-size:1.05em}.katex-display{margin:6px 0;text-align:center}'
      : '';

    return `
      @page {
        size: A4;
        margin: 2cm 2.2cm 2.2cm 2.2cm;
      }
      ${this._fontFaces()}
      body {
        font-family: 'TNR', 'Times New Roman', serif;
        font-size: 11pt;
        line-height: 1.4;
        color: #000;
        margin: 0;
        padding: 0;
      }
      h1{font-size:15pt;font-weight:bold;text-align:center;margin:8px 0 3px 0;border:none;text-transform:uppercase;letter-spacing:1pt}
      h2{font-size:13pt;font-weight:bold;text-align:center;margin:5px 0 2px 0;border:none}
      h3{font-size:12pt;font-weight:bold;margin:16px 0 6px 0;border-bottom:1px solid #ccc;padding-bottom:2px}
      h4{font-size:11pt;font-weight:bold;margin:10px 0 4px 0}
      p{margin:3px 0}
      strong{font-weight:bold}
      .marks{float:right;font-size:10pt;color:#000}
      .question-or{text-align:center;font-weight:bold;margin:8px 0;font-size:11pt}
      table{width:100%;border-collapse:collapse;margin:8px 0;font-size:10pt}
      th{background:#eee;padding:4px 8px;border:1px solid #999;text-align:left;font-weight:bold}
      td{padding:3px 8px;border:1px solid #bbb}
      tr:nth-child(even){background:#fafafa}
      ul,ol{margin:4px 0;padding-left:22px}
      li{margin:2px 0}
      pre{background:#f4f4f4;border:1px solid #ddd;padding:8px 10px;font-size:8.5pt;line-height:1.3;overflow-x:auto;white-space:pre-wrap;margin:6px 0}
      code{font-family:'Cask NFM','CaskaydiaCove Nerd Font Mono',monospace;font-size:8.5pt}
      p>code,li>code{background:#f0f0f0;padding:1px 4px}
      .mermaid{margin:8px 0;text-align:center}.mermaid svg{max-width:100%;height:auto}
      hr{border:none;border-top:1px solid #888;margin:10px 0}
      ${mathCSS}
    `;
  }
}

module.exports = { HtmlRenderer };
