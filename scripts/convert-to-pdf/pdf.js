const fs = require('fs');
const { chromium } = require('playwright');
const { FONTS, PAGE, MERMAID } = require('./config');
const { tryCatchAsync } = require('./src/result');

const RETRY_CONFIG = {
  maxRetries: 3,
  baseDelay: 1000,
  maxDelay: 8000,
};

function sleep(ms) {
  return new Promise(r => setTimeout(r, ms));
}

function _b64(p) {
  if (!p || !fs.existsSync(p)) return '';
  try {
    return fs.readFileSync(p).toString('base64');
  } catch {
    return '';
  }
}

function _footerFontCss() {
  const tnr = FONTS.tnr;
  if (!tnr) return '';
  const faces = [];
  for (const v of Object.values(tnr.variants)) {
    const b64 = _b64(v.file);
    if (b64) {
      faces.push(
        `@font-face{font-family:'${tnr.family}';src:url(data:font/truetype;base64,${b64})format('truetype');font-weight:${v.weight};font-style:${v.style}}`
      );
    }
  }
  return faces.join('');
}

let sharedBrowser = null;
let sharedBrowserPromise = null;

async function getSharedBrowser() {
  if (sharedBrowser && sharedBrowser.isConnected()) {
    return sharedBrowser;
  }
  if (sharedBrowserPromise) {
    return sharedBrowserPromise;
  }
  sharedBrowserPromise = chromium.launch({
    args: [
      '--no-sandbox',
      '--disable-setuid-sandbox',
      '--disable-dev-shm-usage',
      '--disable-gpu',
      '--disable-extensions',
    ],
  }).then(b => {
    sharedBrowser = b;
    sharedBrowserPromise = null;
    return b;
  }).catch(err => {
    sharedBrowser = null;
    sharedBrowserPromise = null;
    throw err;
  });
  return sharedBrowserPromise;
}

class PdfGenerator {
  constructor({ logger, paperIdentifier } = {}) {
    this.logger = logger;
    this.paperIdentifier = paperIdentifier || '';
  }

  _log(level, msg, meta) {
    if (this.logger) {
      this.logger[level](meta || {}, msg);
    }
  }

  async generate(html, outputPath) {
    const lastError = await this._attempt(html, outputPath, 1);
    if (lastError) throw lastError;
  }

  async _attempt(html, outputPath, attempt) {
    let browser;
    try {
      browser = await getSharedBrowser();
    } catch (launchError) {
      this._log('error', 'Failed to launch browser', { error: launchError.message });
      throw launchError;
    }

    try {
      const context = await browser.newContext();
      const page = await context.newPage();
      page.on('pageerror', err => {
        this._log('warn', 'Browser error: ' + err.message);
      });
      try {
        this._log('info', 'Setting page content', { attempt });

        const setResult = await tryCatchAsync(
          () => page.setContent(html, { waitUntil: 'load', timeout: 30000 })
        );
        if (!setResult.ok) {
          throw setResult.error;
        }

        this._log('info', 'Waiting for fonts');
        await page.evaluateHandle('document.fonts.ready');

        const hasMermaid = html.includes('class="mermaid"');
        if (hasMermaid) {
          this._log('info', 'Rendering Mermaid diagrams');
          const mermaidJs = require('fs').readFileSync(MERMAID.localPath, 'utf-8');
          await page.addScriptTag({ content: mermaidJs });
          await page.waitForFunction(() => typeof mermaid !== 'undefined');
          const mermaidResult = await page.evaluate(async () => {
            mermaid.initialize({ startOnLoad: false });
            const divs = document.querySelectorAll('.mermaid');
            let ok = 0, fail = 0;
            for (const div of divs) {
              const code = div.textContent.trim();
              const id = 'mermaid-' + Math.random().toString(36).slice(2, 10);
              try {
                const { svg } = await mermaid.render(id, code);
                div.innerHTML = svg;
                ok++;
              } catch (e) {
                div.innerHTML = '<pre style="background:#f4f4f4;border:1px solid #ddd;padding:8px;font-size:8.5pt;line-height:1.3;white-space:pre-wrap">' +
                  code.replace(/</g, '&lt;') + '</pre>';
                fail++;
              }
            }
            return { ok: ok, fail: fail };
          });
          this._log('info', 'Mermaid diagrams rendered', mermaidResult);
        }

        this._log('info', 'Generating PDF', { path: outputPath });
        const pdfResult = await tryCatchAsync(() => page.pdf({
          path: outputPath,
          format: PAGE.format,
          margin: {
            top: PAGE.marginTop,
            bottom: PAGE.marginBottom,
            left: PAGE.marginLeft,
            right: PAGE.marginRight,
          },
          printBackground: true,
          displayHeaderFooter: true,
          headerTemplate: '<span></span>',
          footerTemplate:
            '<style>' + _footerFontCss() + '</style>' +
            '<div style="font-family:\'TNR\',\'Times New Roman\',Times,serif;width:100%;display:flex;align-items:baseline;padding:0 0.7cm;">' +
            '<span style="font-size:17pt;font-weight:bold;">' + this.paperIdentifier + '</span>' +
            '<span style="flex:1;text-align:center;font-size:12pt;" class="pageNumber"></span></div>',
        }));

        if (!pdfResult.ok) {
          throw pdfResult.error;
        }

        this._log('info', 'PDF generated successfully', { path: outputPath });
        return null; // no error
      } finally {
        await context.close();
      }
    } catch (error) {
      this._log('warn', `Attempt ${attempt} failed`, { error: error.message });

      if (browser && !browser.isConnected()) {
        sharedBrowser = null;
        sharedBrowserPromise = null;
      }

      if (attempt < RETRY_CONFIG.maxRetries) {
        const delay = Math.min(RETRY_CONFIG.baseDelay * Math.pow(2, attempt - 1), RETRY_CONFIG.maxDelay);
        this._log('info', `Retrying in ${delay}ms`, { attempt, nextAttempt: attempt + 1 });
        await sleep(delay);
        return this._attempt(html, outputPath, attempt + 1);
      }

      this._log('error', 'All attempts failed', { error: error.message, attempts: attempt });
      return error;
    }
  }
}

module.exports = { PdfGenerator };
