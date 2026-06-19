#!/usr/bin/env node
const { marked } = require('marked');
const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');

// ── Unicode math → KaTeX map ──
const UNICODE_MATH = {
  '\u0391': '\\Alpha ', '\u0392': '\\Beta ', '\u0393': '\\Gamma ', '\u0394': '\\Delta ',
  '\u0395': '\\Epsilon ', '\u0398': '\\Theta ', '\u039B': '\\Lambda ', '\u039E': '\\Xi ',
  '\u03A0': '\\Pi ', '\u03A3': '\\Sigma ', '\u03A6': '\\Phi ', '\u03A8': '\\Psi ',
  '\u03A9': '\\Omega ',
  '\u03B1': '\\alpha ', '\u03B2': '\\beta ', '\u03B3': '\\gamma ', '\u03B4': '\\delta ',
  '\u03B5': '\\varepsilon ', '\u03B6': '\\zeta ', '\u03B7': '\\eta ', '\u03B8': '\\theta ',
  '\u03B9': '\\iota ', '\u03BA': '\\kappa ', '\u03BB': '\\lambda ', '\u03BC': '\\mu ',
  '\u03BD': '\\nu ', '\u03BE': '\\xi ', '\u03BF': 'o ', '\u03C0': '\\pi ',
  '\u03C1': '\\rho ', '\u03C3': '\\sigma ', '\u03C4': '\\tau ', '\u03C5': '\\upsilon ',
  '\u03C6': '\\phi ', '\u03C7': '\\chi ', '\u03C8': '\\psi ', '\u03C9': '\\omega ',
  '\u2202': '\\partial ', '\u2207': '\\nabla ', '\u221E': '\\infty ',
  '\u222B': '\\int ', '\u2211': '\\sum ', '\u220F': '\\prod ',
  '\u2260': '\\neq ', '\u2264': '\\leq ', '\u2265': '\\geq ',
  '\u2208': '\\in ', '\u2229': '\\cap ', '\u222A': '\\cup ',
  '\u2192': '\\to ', '\u21D2': '\\Rightarrow ', '\u2248': '\\approx ',
  '\u2261': '\\equiv ', '\u2220': '\\angle ', '\u2205': '\\emptyset ',
  '\u22A2': '\\vdash ',
};

const MATH_CHARS = new RegExp('[' + Object.keys(UNICODE_MATH).join('').replace(/[\[\]]/g, '\\$&') + ']', 'g');
const MATH_DETECT = /(?:\\\(|\\\[|\$\$|\$[^$])/;

function convertUnicodeMath(text) {
  return text.replace(MATH_CHARS, ch => UNICODE_MATH[ch] || ch);
}

function hasMathContent(md) {
  return MATH_DETECT.test(md) || MATH_CHARS.test(md);
}

function preprocessMd(md) {
  md = md.replace(/^---[\s\S]*?---\n*/m, '');
  md = md.replace(/\u{1f31f}/ug, '');
  md = md.replace(/[\u201c\u201d]/g, '"');
  md = md.replace(/\u2013/g, '--');
  md = md.replace(/\u2014/g, '---');
  md = md.replace(/\u2747\s*/g, '');
  md = md.replace(/\\newpage/g, '<div style="page-break-before: always;"></div>');
  md = md.replace(/^`{4,}/gm, '```');
  md = md.replace(/^```\s*\[(\d+)\]\s*$/gm, '```\n[$1]');
  md = md.replace(/\\\[([\s\S]*?)\\\]/g, (_, c) => '$$ ' + c.trim().replace(/\s*\n\s*/g, ' ') + ' $$');
  md = md.replace(/\\\(([\s\S]*?)\\\)/g, (_, c) => '$' + c.trim().replace(/\s*\n\s*/g, ' ') + '$');
  md = md.replace(/^\$\$\n([\s\S]*?)\n\$\$$/gm, (_, c) => '$$ ' + c.replace(/\n+/g, ' ').trim() + ' $$');
  md = md.replace(/[αβγδεθλμπρστφωΔΘΛΣΦΩ∞∂∇∫∑∏≠≤≥∈∩∪→⇒≈≡∠∅⊢√²³¹₀₁₂₃₄₅₆₇₈₉×÷\u0391-\u03C9\u2070-\u209F\u00B2\u00B3\u00B9\u2080-\u2089\u00D7\u00F7\u2200-\u22FF\u2190-\u21FF\u2260-\u2265\u2229-\u222B]{2,}/g,
    (m) => '$' + convertUnicodeMath(m) + '$');
  md = md.replace(MATH_CHARS, (ch) => '$' + UNICODE_MATH[ch] + '$');
  md = md.replace(/^\*{0,2}O\.?\s*R\.?\*{0,2}\s*$/gim, '**OR**');
  return md;
}

function b64font(p) {
  return fs.readFileSync(p).toString('base64');
}

function buildCSS(hasMath) {
  const f = b64font;
  return `
    @page {
      size: A4;
      margin: 2cm 2.2cm 2.2cm 2.2cm;
      @bottom-center {
        content: counter(page);
        font-family: 'TNR', serif;
        font-size: 9pt;
        color: #555;
      }
    }

    @font-face { font-family: 'TNR'; src: url(data:font/truetype;base64,${f('/usr/share/fonts/TTF/Times.TTF')}) format('truetype'); font-weight: normal; font-style: normal; }
    @font-face { font-family: 'TNR'; src: url(data:font/truetype;base64,${f('/usr/share/fonts/TTF/Timesbd.TTF')}) format('truetype'); font-weight: bold; font-style: normal; }
    @font-face { font-family: 'TNR'; src: url(data:font/truetype;base64,${f('/usr/share/fonts/TTF/Timesi.TTF')}) format('truetype'); font-weight: normal; font-style: italic; }
    @font-face { font-family: 'TNR'; src: url(data:font/truetype;base64,${f('/usr/share/fonts/TTF/Timesbi.TTF')}) format('truetype'); font-weight: bold; font-style: italic; }

    @font-face { font-family: 'Cask NFM'; src: url(data:font/truetype;base64,${f('/usr/share/fonts/TTF/CaskaydiaCoveNerdFontMono-Regular.ttf')}) format('truetype'); font-weight: normal; font-style: normal; }
    @font-face { font-family: 'Cask NFM'; src: url(data:font/truetype;base64,${f('/usr/share/fonts/TTF/CaskaydiaCoveNerdFontMono-Bold.ttf')}) format('truetype'); font-weight: bold; font-style: normal; }
    @font-face { font-family: 'Cask NFM'; src: url(data:font/truetype;base64,${f('/usr/share/fonts/TTF/CaskaydiaCoveNerdFontMono-Italic.ttf')}) format('truetype'); font-weight: normal; font-style: italic; }
    @font-face { font-family: 'Cask NFM'; src: url(data:font/truetype;base64,${f('/usr/share/fonts/TTF/CaskaydiaCoveNerdFontMono-BoldItalic.ttf')}) format('truetype'); font-weight: bold; font-style: italic; }

    @font-face { font-family: 'Cambria Math'; src: url(data:font/truetype;base64,${f('/usr/share/fonts/TTF/cambria-math.ttf')}) format('truetype'); font-weight: normal; font-style: normal; }
    @font-face { font-family: 'Cambria'; src: url(data:font/truetype;base64,${f('/usr/share/fonts/TTF/cambria.ttf')}) format('truetype'); font-weight: normal; font-style: normal; }
    @font-face { font-family: 'Cambria'; src: url(data:font/truetype;base64,${f('/usr/share/fonts/TTF/cambriab.ttf')}) format('truetype'); font-weight: bold; font-style: normal; }
    @font-face { font-family: 'Cambria'; src: url(data:font/truetype;base64,${f('/usr/share/fonts/TTF/cambriai.ttf')}) format('truetype'); font-weight: normal; font-style: italic; }
    @font-face { font-family: 'Cambria'; src: url(data:font/truetype;base64,${f('/usr/share/fonts/TTF/cambriaz.ttf')}) format('truetype'); font-weight: bold; font-style: italic; }

    body {
      font-family: 'TNR', 'Cambria', serif;
      font-size: 11pt;
      line-height: 1.4;
      color: #000;
      margin: 0;
      padding: 0;
    }

    h1 { font-size: 15pt; font-weight: bold; text-align: center; margin: 8px 0 3px 0; border: none; text-transform: uppercase; letter-spacing: 1pt; }
    h2 { font-size: 13pt; font-weight: bold; text-align: center; margin: 5px 0 2px 0; border: none; }
    h3 { font-size: 12pt; font-weight: bold; margin: 16px 0 6px 0; border-bottom: 1px solid #ccc; padding-bottom: 2px; }
    h4 { font-size: 11pt; font-weight: bold; margin: 10px 0 4px 0; }
    p { margin: 3px 0; }
    strong { font-weight: bold; }

    .marks { float: right; font-size: 10pt; color: #000; }
    .question-or { text-align: center; font-weight: bold; margin: 8px 0; font-size: 11pt; }

    table { width: 100%; border-collapse: collapse; margin: 8px 0; font-size: 10pt; }
    th { background: #eee; padding: 4px 8px; border: 1px solid #999; text-align: left; font-weight: bold; }
    td { padding: 3px 8px; border: 1px solid #bbb; }
    tr:nth-child(even) { background: #fafafa; }

    ul, ol { margin: 4px 0; padding-left: 22px; }
    li { margin: 2px 0; }

    pre {
      background: #f4f4f4; border: 1px solid #ddd; padding: 8px 10px; font-size: 8.5pt;
      line-height: 1.3; overflow-x: auto; white-space: pre-wrap; margin: 6px 0;
    }
    code {
      font-family: 'Cask NFM', 'CaskaydiaCove Nerd Font Mono', monospace;
      font-size: 8.5pt;
    }
    p > code, li > code { background: #f0f0f0; padding: 1px 4px; }

    hr { border: none; border-top: 1px solid #888; margin: 10px 0; }

    ${hasMath ? '.katex { font-size: 1.05em; } .katex-display { margin: 4px 0; text-align: center; }' : ''}
  `;
}

async function main() {
  const args = process.argv.slice(2);
  if (args.length < 1) {
    console.log('Convert Markdown to QP-styled PDF with rendered math.');
    console.log('');
    console.log('Usage:  node scripts/convert-to-pdf.js <input.md> [output.pdf]');
    console.log('Deps:   npm install marked playwright && npx playwright install chromium');
    process.exit(1);
  }

  const mdPath = path.resolve(args[0]);
  if (!fs.existsSync(mdPath)) { console.error('ERROR:', mdPath, 'not found'); process.exit(1); }

  let pdfPath;
  if (args.length >= 2) {
    pdfPath = path.resolve(args[1]);
  } else {
    const d = path.join(path.dirname(mdPath), 'pdf_output');
    fs.mkdirSync(d, { recursive: true });
    pdfPath = path.join(d, path.basename(mdPath).replace(/\.md$/, '.pdf'));
  }
  fs.mkdirSync(path.dirname(pdfPath), { recursive: true });

  console.log('  Input: ' + path.basename(mdPath));
  console.log('  Output: ' + path.basename(pdfPath));

  let md = fs.readFileSync(mdPath, 'utf-8');
  const useMath = hasMathContent(md);
  md = preprocessMd(md);

  const htmlBody = marked.parse(md, { breaks: true, gfm: true });

  let html = htmlBody
    .replace(/\[(\d+)\]/g, '<span class="marks">[$1]</span>')
    .replace(/<p>\*\*OR\*\*<\/p>/g, '<div class="question-or">OR</div>');

  let page = '<!DOCTYPE html><html lang="en"><head><meta charset="utf-8">';

  if (useMath) {
    page += '<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.css">'
      + '<script src="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.js"></script>'
      + '<script src="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/contrib/auto-render.min.js"></script>';
  }

  page += '<style>' + buildCSS(useMath) + '</style></head><body>'
    + html;

  if (useMath) {
    page += '<script>document.addEventListener("DOMContentLoaded",function(){renderMathInElement(document.body,{delimiters:[{left:\'$$\',right:\'$$\',display:true},{left:\'$\',right:\'$\',display:false}],throwOnError:false})});</script>';
  }

  page += '</body></html>';

  const browser = await chromium.launch();
  const pageContext = await browser.newPage();
  await pageContext.setContent(page, { waitUntil: 'networkidle', timeout: 30000 });

  if (useMath) {
    await pageContext.waitForFunction(() => typeof renderMathInElement !== 'undefined', { timeout: 15000 }).catch(() => {});
    await pageContext.waitForTimeout(2000);
  }

  await pageContext.pdf({
    path: pdfPath,
    format: 'A4',
    margin: { top: '2cm', bottom: '2.2cm', left: '2.2cm', right: '2.2cm' },
    printBackground: true,
    displayHeaderFooter: true,
    headerTemplate: '<span></span>',
    footerTemplate: '<div style="font-size:9pt;color:#555;text-align:center;width:100%"><span class="pageNumber"></span></div>',
  });

  await pageContext.close();
  await browser.close();

  const size = (fs.statSync(pdfPath).size / 1024).toFixed(0);
  console.log('  Saved: ' + path.basename(pdfPath) + ' (' + size + 'K)');
}

main().catch(err => { console.error(err.message); process.exit(1); });
