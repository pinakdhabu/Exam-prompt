const fs = require('fs');
const path = require('path');
const { FONTS } = require('./config');
const theme = require('./themes/index');

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
      // Q1) a) -> Q1) is bold, a) is regular, add class question-main
      .replace(/<p><strong>Q(\d+)\)\s+([a-z])\)<\/strong>/g, '<p class="question-main"><strong>Q$1)</strong> $2)')
      // b) -> wrapped in class question-sub
      .replace(/<p><strong>([b-z])\)<\/strong>/g, '<p class="question-sub"><strong>$1)</strong>')
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
    if (!p || !fs.existsSync(p)) return '';
    try {
      return fs.readFileSync(p).toString('base64');
    } catch {
      return '';
    }
  }

  _fontFaces() {
    const faces = [];
    for (const key of ['tnr', 'caskaydia', 'cambria', 'cambriaMath']) {
      const cfg = FONTS[key];
      if (!cfg) continue;
      for (const v of Object.values(cfg.variants)) {
        const b64 = this._b64(v.file);
        if (b64) {
          faces.push(`@font-face{font-family:'${cfg.family}';src:url(data:font/truetype;base64,${b64})format('truetype');font-weight:${v.weight};font-style:${v.style}}`);
        }
      }
    }
    return faces.join('\n');
  }

  _buildCSS() {
    return theme.getCss(this.useMath, this._fontFaces());
  }
}

module.exports = { HtmlRenderer };
