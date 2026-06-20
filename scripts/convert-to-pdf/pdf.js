const { chromium } = require('playwright');
const { PAGE, MERMAID } = require('./config');
const { tryCatchAsync } = require('./src/result');

const RETRY_CONFIG = {
  maxRetries: 3,
  baseDelay: 1000,
  maxDelay: 8000,
};

function sleep(ms) {
  return new Promise(r => setTimeout(r, ms));
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
    const browser = await chromium.launch({
      args: [
        '--no-sandbox',
        '--disable-setuid-sandbox',
        '--disable-dev-shm-usage',
        '--disable-gpu',
        '--disable-extensions',
      ],
    });

    try {
      const page = await browser.newPage();
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
            '<div style="font-family:Times New Roman,Times,serif;width:100%;display:flex;align-items:baseline;padding:0 0.7cm;">' +
            '<span style="font-size:17pt;font-weight:bold;">' + this.paperIdentifier + '</span>' +
            '<span style="flex:1;text-align:center;font-size:12pt;" class="pageNumber"></span>' +
            '<span style="font-size:0;">&#160;</span></div>',
        }));

        if (!pdfResult.ok) {
          throw pdfResult.error;
        }

        this._log('info', 'PDF generated successfully', { path: outputPath });
        return null; // no error
      } finally {
        await page.close();
      }
    } catch (error) {
      this._log('warn', `Attempt ${attempt} failed`, { error: error.message });

      if (attempt < RETRY_CONFIG.maxRetries) {
        const delay = Math.min(RETRY_CONFIG.baseDelay * Math.pow(2, attempt - 1), RETRY_CONFIG.maxDelay);
        this._log('info', `Retrying in ${delay}ms`, { attempt, nextAttempt: attempt + 1 });
        await sleep(delay);
        return this._attempt(html, outputPath, attempt + 1);
      }

      this._log('error', 'All attempts failed', { error: error.message, attempts: attempt });
      return error;
    } finally {
      await browser.close();
    }
  }
}

module.exports = { PdfGenerator };
