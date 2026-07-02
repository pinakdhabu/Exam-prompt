const fs = require('fs');
const path = require('path');
const { FONTS } = require('./config');
const theme = require('./themes/index');
const { detectScripts, getFontConfigForScripts } = require('./src/script-detector');

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
      .replace(/<p><strong>OR<\/strong><\/p>/g, '<div class="question-or">OR</div>')
      .replace(/<p><strong>Q(\d+)\)\s+([a-z])\)<\/strong>/g, '<p class="question-main"><strong class="q-label">Q$1)</strong><span class="sub-label">$2)</span>')
      .replace(/<p><strong>([b-z])\)<\/strong>/g, '<p class="question-sub"><span class="sub-label">$1)</span>')
      .replace(/<p>\*\*\* End of Paper \*\*\*<\/p>/g, '<div style="text-align:center;font-size:16pt;margin:24pt 0 12pt 0;letter-spacing:6px;">ⓘ ⓘ ⓘ ⓘ</div>')
      .replace(/<pre><code>(\[ANSWER BOX\][\s\S]*?)<\/code><\/pre>/g, '<div class="answer-box"><pre><code>$1</code></pre></div>')
      .replace(/<p([^>]*)>(.*?)(<span class="marks">\[\d+\]<\/span>)(.*?)<\/p>/g, '<p$1>$3$2$4</p>');

    const detected = detectScripts(html.replace(/<[^>]*>/g, ''));
    const scriptFonts = getFontConfigForScripts(detected);

    let page = '<!DOCTYPE html><html lang="en"><head><meta charset="utf-8">';

    if (this.useMath && KATEX_CSS) {
      page += '<style>' + KATEX_CSS + '</style>';
    }

    page += '<style>' + this._buildCSS(scriptFonts) + '</style></head><body>'
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

  _fontFaces(scriptFonts) {
    const faces = [];
    for (const key of ['tnr', 'caskaydia', 'cambria', 'cambriaMath', 'stixMath', 'termesMath']) {
      const cfg = FONTS[key];
      if (!cfg) continue;
      for (const v of Object.values(cfg.variants)) {
        const b64 = this._b64(v.file);
        if (b64) {
          faces.push(`@font-face{font-family:'${cfg.family}';src:url(data:font/truetype;base64,${b64})format('truetype');font-weight:${v.weight};font-style:${v.style};font-display:swap}`);
        }
      }
    }
    for (const sf of scriptFonts) {
      for (const v of sf.variants) {
        const b64 = this._b64(v.file);
        if (b64) {
          faces.push(`@font-face{font-family:'${sf.family}';src:url(data:font/truetype;base64,${b64})format('truetype');font-weight:normal;font-style:normal;font-display:swap}`);
        }
      }
    }
    return faces.join('\n');
  }

  _buildCSS(scriptFonts) {
    const families = scriptFonts.map(sf => `'${sf.family}'`);
    return theme.getCss(this.useMath, this._fontFaces(scriptFonts), families);
  }
}

module.exports = { HtmlRenderer };
