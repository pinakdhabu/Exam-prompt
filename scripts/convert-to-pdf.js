#!/usr/bin/env node
/**
 * Convert Markdown -> professional SPPU-style PDF.
 *
 * Pipeline: Markdown -> marked -> HTML -> KaTeX (server-side) -> Playwright Chromium -> A4 PDF
 *
 * Features:
 *   - Times New Roman (matches official SPPU QPs)
 *   - LaTeX math via server-side KaTeX (integrals, matrices, fractions, derivatives)
 *   - SPPU layout: seat-number box, QP header, right-aligned marks, OR separators
 *   - Mermaid diagram support
 *
 * Usage:  node scripts/convert-to-pdf.js <input.md> [output.pdf]
 * Deps:  npm install marked playwright katex  &&  npx playwright install chromium
 */
const { marked } = require('marked');
const { chromium } = require('playwright');
let katex = null;
try { katex = require('katex'); }
catch (e) {
  console.error('  ERROR: katex is required. Install with:  npm install katex');
  process.exit(1);
}
const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const KATEX_CSS = fs.readFileSync(
  path.join(require.resolve('katex'), '..', '..', 'dist', 'katex.min.css'), 'utf-8'
);

const CSS = KATEX_CSS + `
  @page { size: A4; margin: 0; }
  * { box-sizing: border-box; }
  body {
    font-family: 'Times New Roman', Times, serif;
    font-size: 12pt; line-height: 1.15; color: #000;
    padding: 0; margin: 0; orphans: 3; widows: 3;
  }
  .seat-box {
    float: right; width: 140px;
    border: 2px solid #000; padding: 6px 8px;
    text-align: center; font-size: 10pt; font-weight: bold;
    margin: 0 0 12px 12px;
  }
  .seat-box .seat-label {
    font-size: 8pt; font-weight: normal;
    border-bottom: 1px solid #000; padding-bottom: 2px; margin-bottom: 4px;
  }
  .qp-header { text-align: center; margin-bottom: 8px; clear: both; }
  .qp-header .qp-title { font-size: 14pt; font-weight: bold; margin: 0 0 2px 0; text-transform: uppercase; }
  .qp-header .qp-subtitle, .qp-header .qp-code { font-size: 11pt; margin: 0 0 2px 0; }
  .qp-header .qp-meta { font-size: 10pt; margin: 0; color: #333; }
  .qp-divider { border: none; border-top: 1.5px solid #000; margin: 10px 0; clear: both; }
  .instructions { font-size: 11pt; margin: 10px 0; }
  .instructions p { margin: 2px 0; line-height: 1.3; }
  .marks { float: right; font-weight: normal; white-space: nowrap; margin-left: 8px; }
  h1 { font-size: 14pt; font-weight: bold; margin: 16px 0 6px 0; page-break-after: avoid; }
  h2 { font-size: 13pt; font-weight: bold; margin: 14px 0 4px 0; page-break-after: avoid; }
  h3 { font-size: 12pt; font-weight: bold; margin: 12px 0 4px 0; page-break-after: avoid; }
  p { margin: 4px 0; } strong { font-weight: bold; } em { font-style: italic; }
  p > strong:first-child { display: inline; }
  p:has(> strong:first-child) { font-weight: bold; margin: 8px 0 2px 0; }
  p:has(> strong:only-child) { text-align: center; margin: 6px 0; color: #333; }
  .qp-header + p, .qp-header + p + p, .qp-header + p + p + p { font-size: 11pt; margin: 2px 0; }
  table { width: 100%; border-collapse: collapse; margin: 8px 0; font-size: 11pt; page-break-inside: avoid; }
  th { background: #e0e0e0; font-weight: bold; padding: 5px 8px; border: 1px solid #000; text-align: center; }
  td { padding: 4px 8px; border: 1px solid #000; }
  pre { background: #f5f5f5; border: 0.5px solid #ccc; padding: 8px 10px; font-family: 'Courier New', Courier, monospace; font-size: 9.5pt; line-height: 1.35; white-space: pre-wrap; page-break-inside: avoid; margin: 6px 0; }
  code { font-family: 'Courier New', Courier, monospace; font-size: 10pt; }
  p > code, li > code { background: #f0f0f0; padding: 1px 3px; }
  ul, ol { margin: 4px 0; padding-left: 28px; } li { margin: 2px 0; }
  blockquote { margin: 6px 0; padding: 4px 10px; border-left: 3px solid #333; background: #fafafa; font-style: italic; page-break-inside: avoid; }
  hr { border: none; border-top: 1px dashed #999; margin: 14px 0; }
  .katex { font-size: 1.1em; } .katex-display { margin: 6px 0; text-align: center; }
  img { max-width: 100%; height: auto; }
  .page-break { page-break-before: always; }
  .keep-together { page-break-inside: avoid; }
`;

/** Server-side KaTeX rendering: $$...$$ (display) and \\(...\\) (inline) */
function renderMathServerSide(html) {
  html = html.replace(/\$\$([\s\S]*?)\$\$/g, (_, expr) => {
    try { return katex.renderToString(expr.trim(), { displayMode: true, throwOnError: false }); }
    catch (e) { return '<div class="katex-error">[Math: ' + expr.trim() + ']</div>'; }
  });
  html = html.replace(/\\\(([\s\S]*?)\\\)/g, (_, expr) => {
    try { return katex.renderToString(expr.trim(), { displayMode: false, throwOnError: false }); }
    catch (e) { return '<span class="katex-error">[' + expr.trim() + ']</span>'; }
  });
  return html;
}

/**
 * Convert Unicode math characters to LaTeX commands.
 * This maps common Unicode math symbols to their LaTeX equivalents
 * so existing papers with plain text math render via KaTeX.
 */
const UNICODE_TO_LATEX = {
  'α': '\\alpha', 'β': '\\beta', 'γ': '\\gamma', 'δ': '\\delta',
  'ε': '\\varepsilon', 'ζ': '\\zeta', 'η': '\\eta', 'θ': '\\theta',
  'ι': '\\iota', 'κ': '\\kappa', 'λ': '\\lambda', 'μ': '\\mu',
  'ν': '\\nu', 'ξ': '\\xi', 'π': '\\pi', 'ρ': '\\rho',
  'σ': '\\sigma', 'τ': '\\tau', 'υ': '\\upsilon', 'φ': '\\phi',
  'χ': '\\chi', 'ψ': '\\psi', 'ω': '\\omega',
  'Α': '\\Alpha', 'Β': '\\Beta', 'Γ': '\\Gamma', 'Δ': '\\Delta',
  'Ε': '\\Epsilon', 'Ζ': '\\Zeta', 'Η': '\\Eta', 'Θ': '\\Theta',
  'Ι': '\\Iota', 'Κ': '\\Kappa', 'Λ': '\\Lambda', 'Μ': '\\Mu',
  'Ν': '\\Nu', 'Ξ': '\\Xi', 'Ο': '\\Omicron', 'Π': '\\Pi',
  'Ρ': '\\Rho', 'Σ': '\\Sigma', 'Τ': '\\Tau', 'Υ': '\\Upsilon',
  'Φ': '\\Phi', 'Χ': '\\Chi', 'Ψ': '\\Psi', 'Ω': '\\Omega',
  '∞': '\\infty', '∂': '\\partial', '∇': '\\nabla',
  '∫': '\\int', '∑': '\\sum', '∏': '\\prod',
  '√': '\\sqrt', '∛': '\\sqrt[3]',
  '≠': '\\neq', '≤': '\\leq', '≥': '\\geq',
  '∈': '\\in', '∉': '\\notin', '∋': '\\ni',
  '∩': '\\cap', '∪': '\\cup', '⊂': '\\subset', '⊃': '\\supset',
  '⊆': '\\subseteq', '⊇': '\\supseteq',
  '∧': '\\land', '∨': '\\lor', '¬': '\\lnot',
  '∀': '\\forall', '∃': '\\exists', '∄': '\\nexists',
  '→': '\\to', '←': '\\leftarrow', '↔': '\\leftrightarrow',
  '⇒': '\\Rightarrow', '⇐': '\\Leftarrow', '⇔': '\\Leftrightarrow',
  '≈': '\\approx', '≡': '\\equiv', '∝': '\\propto',
  '⊗': '\\otimes', '⊕': '\\oplus', '⊙': '\\odot',
  '∠': '\\angle', '∅': '\\emptyset', '⊢': '\\vdash',
  'ℕ': '\\mathbb{N}', 'ℤ': '\\mathbb{Z}', 'ℚ': '\\mathbb{Q}',
  'ℝ': '\\mathbb{R}', 'ℂ': '\\mathbb{C}',
};

/**
 * Check if a segment of text looks like plain-text math.
 * Returns true if it contains exponents, subscripts, matrices, or math Unicode.
 */
function looksLikeMath(text) {
  if (/[A-Za-z]\^[A-Za-z0-9{}]/.test(text)) return true;
  if (/[A-Za-z]_[A-Za-z0-9{}]/.test(text)) return true;
  if (/\[\[.*?\]\]/.test(text)) return true;
  const mathUnicode = 'αβγδεζηθικλμνξπρστυφχψωΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ∞∂∇∫∑∏√≠≤≥∈∩∪⊂⊃⊆⊇∀∃∠∅⊢∂';
  for (const ch of text) { if (mathUnicode.includes(ch)) return true; }
  return false;
}

/**
 * Preprocess Markdown to add SPPU QP structure.
 * - Skips content inside fenced code blocks (```).
 * - Adds seat-number box + QP header.
 * - Wraps [N] marks in <span class="marks">.
 * - Wraps OR variants in <div class="question-or">.
 * - Converts plain-text math to LaTeX for KaTeX rendering.
 */
function preprocessQP(md) {
  if (!(/Q\s*\.?\s*1\s*\)/i.test(md) || /Q\.\s*1\b/i.test(md))) return md;

  // Split into fenced blocks and non-fenced content
  const parts = md.split(/(```[\s\S]*?```)/g);

  for (let i = 0; i < parts.length; i++) {
    // Skip fenced code blocks (``` ```)
    if (parts[i].startsWith('```')) continue;

    let part = parts[i];

    // 1. Seat-number box + QP header (first heading)
    part = part.replace(/^#\s+(.+)$/m, (_, title) => {
      return '<div class="seat-box"><div class="seat-label">Seat No.</div></div>\n\n'
           + '<div class="qp-header"><p class="qp-title">' + title.trim() + '</p></div>';
    });

    // 2. Wrap marks [N] or [N Marks] in <span class="marks">
    part = part.replace(/\[(\d+)\s*(?:[Mm]arks?)?\]/g, '<span class="marks">[$1]</span>');

    // 3. Wrap OR variants: **OR**, *OR*, O.R., or plain OR on its own line
    part = part.replace(/^(\s*\*{0,2}O\.?R\.?\*{0,2}\s*)$/gim, '<div class="question-or">OR</div>');

    parts[i] = part;
  }

  return parts.join('');
}

/**
 * Convert plain-text math expressions to LaTeX-wrapped ones.
 * - Runs on Markdown BEFORE marked parses it.
 * - Detects lines/paragraphs with math patterns (exponents, unicode math chars)
 * - Converts Unicode math symbols to LaTeX
 * - Wraps converted content in \(...\) or $$...$$
 * - Skips fenced code blocks
 */
function convertPlainTextMath(md) {
  const parts = md.split(/(```[\s\S]*?```)/g);
  for (let i = 0; i < parts.length; i++) {
    if (parts[i].startsWith('```') || parts[i].startsWith('<')) continue;
    let part = parts[i];

    // Process paragraph by paragraph
    const paragraphs = part.split(/\n\n+/);
    for (let j = 0; j < paragraphs.length; j++) {
      const para = paragraphs[j];

      // Skip empty paragraphs, headings, lists, tables, HTML
      if (!para.trim() || /^#/.test(para.trim()) || /^[*\-]/.test(para.trim()) || /^\d+\./.test(para.trim()) || /^\|/.test(para.trim())) continue;
      // Skip if already has LaTeX delimiters or HTML
      if (/\$\$/.test(para) || /\\\(/.test(para)) continue;
      if (para.trim().startsWith('<')) continue;

      // Skip paragraphs containing HTML (e.g., already-processed marks spans)
      if (/<[a-z][^>]*>/.test(para)) continue;
      // Check looksLikeMath on ORIGINAL text, not after conversion
      if (!looksLikeMath(para)) continue;

      let converted = para;

      // Replace Unicode math characters with LaTeX (add space after to avoid command merging)
      for (const [uni, latex] of Object.entries(UNICODE_TO_LATEX)) {
        const re = new RegExp(uni.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'), 'g');
        converted = converted.replace(re, latex + ' ');
      }
      // Clean up extra spaces from replacements
      converted = converted.replace(/  +/g, ' ');

      // Wrap matrix patterns
      converted = converted.replace(/\[\[([^\]]+(?:\][^\]]+)*)\]\]/g, (_, content) => {
        const rows = content.split(/\],\[/).map(r => r.split(',').map(t => t.trim()).join(' & '));
        return '\\begin{bmatrix}' + rows.join('\\\\') + '\\end{bmatrix}';
      });

      // Wrap in LaTeX delimiters based on length and content
      if (converted.length > 100 || /\\sum|\\int|\\prod|\\begin/.test(converted)) {
        paragraphs[j] = '$$ ' + converted + ' $$';
      } else {
        paragraphs[j] = '\\(' + converted + '\\)';
      }
    }
    parts[i] = paragraphs.join('\n\n');
  }
  return parts.join('');
}

function usage() {
  console.log('Convert Markdown to SPPU-style PDF (Times New Roman + KaTeX math)');
  console.log('');
  console.log('Usage:  node scripts/convert-to-pdf.js <input.md> [output.pdf]');
  console.log('');
  console.log('Features: Times New Roman, KaTeX math (integrals, matrices, fractions)');
  console.log('          SPPU layout (seat-box, marks, OR), Mermaid diagrams');
  console.log('Deps: npm install marked playwright katex  &&  npx playwright install chromium');
  process.exit(1);
}

async function main() {
  const args = process.argv.slice(2);
  if (args.length < 1) usage();

  const mdPath = path.resolve(args[0]);
  if (!fs.existsSync(mdPath)) { console.error('  ERROR: File not found: ' + mdPath); process.exit(1); }

  let pdfPath;
  if (args.length >= 2) { pdfPath = path.resolve(args[1]); }
  else {
    const d = path.join(path.dirname(mdPath), 'pdf_output');
    fs.mkdirSync(d, { recursive: true });
    pdfPath = path.join(d, path.basename(mdPath).replace(/\.md$/, '.pdf'));
  }
  fs.mkdirSync(path.dirname(pdfPath), { recursive: true });

  console.log('  Input: ' + path.basename(mdPath));
  console.log('  Output: ' + path.basename(pdfPath));

  let md = fs.readFileSync(mdPath, 'utf-8')
    .replace(/\u{1f31f}/ug, '')
    .replace(/[\u201c\u201d]/g, '"')
    .replace(/\u2013/g, '--')
    .replace(/\u2014/g, '---');

  // ── Preprocess QP structure (includes plain-text math → LaTeX) ──
  md = preprocessQP(md);
  md = convertPlainTextMath(md);

  // ── Mermaid diagrams ──
  const mermaidBlocks = md.match(/```mermaid\s*\n([\s\S]*?)```/g);
  if (mermaidBlocks && mermaidBlocks.length > 0) {
    const diagDir = path.join(path.dirname(pdfPath), '_diagrams');
    fs.mkdirSync(diagDir, { recursive: true });
    console.log('  Diagrams: ' + mermaidBlocks.length);
    mermaidBlocks.forEach((block, idx) => {
      const code = block.replace(/```mermaid\s*\n/, '').replace(/```$/, '').trim();
      if (!code) return;
      const mmd = '/tmp/_md_' + idx + '_' + Date.now() + '.mmd';
      const svg = path.join(diagDir, 'mermaid-' + idx + '.svg');
      const rel = path.join('_diagrams', 'mermaid-' + idx + '.svg');
      try {
        fs.writeFileSync(mmd, code, 'utf-8');
        execSync('npx @mermaid-js/mermaid-cli -i "' + mmd + '" -o "' + svg + '" --backgroundColor white --width 1200 2>&1', { stdio: 'pipe', timeout: 30000 });
        if (fs.existsSync(svg)) {
          md = md.replace(block, '<p style="text-align:center"><img src="' + rel + '" alt="diagram" style="max-width:100%;height:auto;margin:1em auto;"/></p>');
          console.log('    Diagram ' + (idx + 1) + ' OK');
        }
      } catch (e) { console.error('    Diagram ' + (idx + 1) + ' skipped'); }
      finally { if (fs.existsSync(mmd)) fs.unlinkSync(mmd); }
    });
  }

  // ── Markdown -> HTML ──
  let htmlBody = marked.parse(md, { breaks: true, gfm: true });

  // ── KaTeX server-side ──
  htmlBody = renderMathServerSide(htmlBody);

  // ── Assemble final HTML ──
  const html = '<!DOCTYPE html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<style>' + CSS + '</style>\n</head>\n<body>\n' + htmlBody + '\n</body>\n</html>';

  // ── PDF via Playwright ──
  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage();
  await page.setContent(html, { waitUntil: 'networkidle' });
  await page.pdf({
    path: pdfPath,
    format: 'A4',
    margin: { top: '20mm', bottom: '20mm', left: '18mm', right: '18mm' },
    printBackground: true,
    displayHeaderFooter: true,
    headerTemplate: '<span></span>',
    footerTemplate: '<div style="font-size:10pt;font-family:\'Times New Roman\',Times,serif;color:#333;width:100%;text-align:center;"><span class="pageNumber"></span></div>',
  });
  await page.close();
  await browser.close();

  const size = (fs.statSync(pdfPath).size / 1024).toFixed(0);
  console.log('  Saved: ' + path.basename(pdfPath) + ' (' + size + 'K)');
}

main().catch(err => { console.error(err); process.exit(1); });
