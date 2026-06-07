#!/usr/bin/env node
/**
 * Convert Markdown → Structured Typst → Professional SPPU-style PDF.
 *
 * Pipeline: Markdown → Node.js converter → Typst (.typ) → typst compile → A4 PDF
 *
 * Features:
 *   - Times New Roman + Cambria Math (native Typst math rendering)
 *   - SPPU layout: seat-number box, QP header, right-aligned marks, OR separators
 *   - Dynamic page breaks, proper spacing, justified paragraphs
 *   - Complete integration with existing sample papers
 *
 * Usage:  node scripts/convert-to-pdf.js <input.md> [output.pdf]
 * Deps:   typst (installed via: curl -fsSL ... or package manager)
 */
const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

/**
 * Convert Markdown content to Typst content for SPPU QP template.
 * Handles headings, bold, math delimiters, marks, lists, and SPPU structure.
 */
function mdToTypst(md) {
  let t = md;

  // 1. Extract and replace math delimiters
  // Display math: $$...$$ → $ ... $
  t = t.replace(/\$\$([\s\S]*?)\$\$/g, (_, expr) => {
    let e = expr.trim();
    // Convert LaTeX to Typst equivalents
    e = e.replace(/\\frac\{([^}]+)\}\{([^}]+)\}/g, ' frac($1, $2)');
    e = e.replace(/\\int/g, ' integral');
    e = e.replace(/\\sum/g, ' sum');
    e = e.replace(/\\prod/g, ' product');
    e = e.replace(/\\partial/g, ' partial');
    e = e.replace(/\\infty/g, ' oo');
    e = e.replace(/\\alpha/g, ' alpha');
    e = e.replace(/\\beta/g, ' beta');
    e = e.replace(/\\gamma/g, ' gamma');
    e = e.replace(/\\theta/g, ' theta');
    e = e.replace(/\\lambda/g, ' lambda');
    e = e.replace(/\\mu/g, ' mu');
    e = e.replace(/\\pi/g, ' pi');
    e = e.replace(/\\sigma/g, ' sigma');
    e = e.replace(/\\Delta/g, ' Delta');
    e = e.replace(/\\Sigma/g, ' Sigma');
    e = e.replace(/\\Omega/g, ' Omega');
    e = e.replace(/\\Phi/g, ' Phi');
    e = e.replace(/\\nabla/g, ' nabla');
    e = e.replace(/\\sqrt\{([^}]+)\}/g, ' sqrt($1)');
    e = e.replace(/\\sqrt\\[(\\d+)\\]\{([^}]+)\}/g, ' root($1, $2)');
    e = e.replace(/\\rightarrow/g, '->');
    e = e.replace(/\\leftarrow/g, '<-');
    e = e.replace(/\\Rightarrow/g, '=>');
    e = e.replace(/\\Leftarrow/g, '<=');
    e = e.replace(/\\to/g, '->');
    e = e.replace(/\\neq/g, '<>');
    e = e.replace(/\\leq/g, '<=');
    e = e.replace(/\\geq/g, '>=');
    e = e.replace(/\\approx/g, '~~');
    e = e.replace(/\\equiv/g, '==');
    e = e.replace(/\\in/g, ' in');
    e = e.replace(/\\notin/g, ' in.not');
    e = e.replace(/\\subset/g, ' subset');
    e = e.replace(/\\supset/g, ' supset');
    e = e.replace(/\\subseteq/g, ' subset.eq');
    e = e.replace(/\\supseteq/g, ' supset.eq');
    e = e.replace(/\\cap/g, ' sect');
    e = e.replace(/\\cup/g, ' union');
    e = e.replace(/\\forall/g, ' forall');
    e = e.replace(/\\exists/g, ' exists');
    e = e.replace(/\\angle/g, ' angle');
    e = e.replace(/\\emptyset/g, ' empty');
    e = e.replace(/\\vdash/g, ' vdash');
    e = e.replace(/\\mathbb\{N\}/g, ' NN');
    e = e.replace(/\\mathbb\{Z\}/g, ' ZZ');
    e = e.replace(/\\mathbb\{Q\}/g, ' QQ');
    e = e.replace(/\\mathbb\{R\}/g, ' RR');
    e = e.replace(/\\mathbb\{C\}/g, ' CC');
    e = e.replace(/\\begin\{bmatrix\}([\s\S]*?)\\end\{bmatrix\}/g, (_, m) => {
      const rows = m.split(/\\/).map(r => r.trim()).filter(r => r);
      const typstRows = rows.map(r => r.split('&').map(c => c.trim()).join(', '));
      return 'mat(' + typstRows.join('; ') + ')';
    });
    e = e.replace(/\\sin/g, ' sin');
    e = e.replace(/\\cos/g, ' cos');
    e = e.replace(/\\tan/g, ' tan');
    e = e.replace(/\\log/g, ' log');
    e = e.replace(/\\ln/g, ' ln');
    e = e.replace(/\\lim/g, ' lim');
    e = e.replace(/\\det/g, ' det');
    e = e.replace(/\\to/g, '->');
    e = e.replace(/\\cdot/g, ' dot');
    e = e.replace(/\\times/g, ' times');
    e = e.replace(/\\ldots/g, ' ...');
    e = e.replace(/\\cdots/g, ' ...');
    e = e.replace(/\\left/g, '');
    e = e.replace(/\\right/g, '');
    // Handle bare subscripts without base (e.g., _i → {}_i)
    e = e.replace(/(^|[^A-Za-z0-9}])_([A-Za-z])/g, '$1{}_$2');
    // Add space between consecutive single-letter variables (e.g., xy -> x y)
    // Preserve known math identifiers
    e = e.replace(/([a-zA-Z])([a-zA-Z]+)/g, (m, a, b) => {
      if (['sin','cos','tan','log','ln','lim','det','integral','sum','product','partial','nabla','alpha','beta','gamma','theta','lambda','mu','pi','sigma','Delta','Sigma','Omega','Phi','forall','exists','angle','empty','vdash','NN','ZZ','QQ','RR','CC','frac','sqrt','root','mat','oo','dot','times','in','not','sect','union','subset','supset'].includes(m)) return m;
      return a + ' ' + b;
    });
    // Strip any remaining backslash-prefixed LaTeX commands
    e = e.replace(/\\[A-Za-z]+/g, '');
    return '$ ' + e + ' $';
  });

  // Inline math: \(...\) → $...$
  t = t.replace(/\\\(([\s\S]*?)\\\)/g, (_, expr) => {
    let e = expr.trim();
    e = e.replace(/\\frac\{([^}]+)\}\{([^}]+)\}/g, ' frac($1, $2)');
    e = e.replace(/\\int/g, ' integral');
    e = e.replace(/\\sum/g, ' sum');
    e = e.replace(/\\partial/g, ' partial');
    e = e.replace(/\\infty/g, ' oo');
    e = e.replace(/\\alpha/g, ' alpha');
    e = e.replace(/\\beta/g, ' beta');
    e = e.replace(/\\gamma/g, ' gamma');
    e = e.replace(/\\theta/g, ' theta');
    e = e.replace(/\\lambda/g, ' lambda');
    e = e.replace(/\\mu/g, ' mu');
    e = e.replace(/\\pi/g, ' pi');
    e = e.replace(/\\to/g, '->');
    e = e.replace(/\\neq/g, '<>');
    e = e.replace(/\\leq/g, '<=');
    e = e.replace(/\\geq/g, '>=');
    e = e.replace(/\\cdot/g, ' dot');
    e = e.replace(/\\times/g, ' times');
    e = e.replace(/\\sin/g, ' sin');
    e = e.replace(/\\cos/g, ' cos');
    e = e.replace(/\\tan/g, ' tan');
    e = e.replace(/\\log/g, ' log');
    e = e.replace(/\\ln/g, ' ln');
    e = e.replace(/\\lim/g, ' lim');
    e = e.replace(/\\det/g, ' det');
    e = e.replace(/\\prod/g, ' product');
    e = e.replace(/\\ldots/g, ' ...');
    e = e.replace(/\\cdots/g, ' ...');
    e = e.replace(/\\left/g, '');
    e = e.replace(/\\right/g, '');
    // Matrices: \begin{bmatrix}...\end{bmatrix} → mat(...)
    e = e.replace(/\\begin\{bmatrix\}([\s\S]*?)\\end\{bmatrix\}/g, (_, m) => {
      const rows = m.split(/\\/).map(r => r.trim()).filter(r => r);
      const typstRows = rows.map(r => r.split('&').map(c => c.trim()).join(', '));
      return 'mat(' + typstRows.join('; ') + ')';
    });
    // Handle bare subscripts without base (e.g., _i → {}_i)
    e = e.replace(/(^|[^A-Za-z0-9}])_([A-Za-z])/g, '$1{}_$2');
    // Add space between consecutive single-letter variables (e.g., xy -> x y)
    // Preserve known math identifiers
    e = e.replace(/([a-zA-Z])([a-zA-Z]+)/g, (m, a, b) => {
      if (['sin','cos','tan','log','ln','lim','det','integral','sum','product','partial','nabla','alpha','beta','gamma','theta','lambda','mu','pi','sigma','Delta','Sigma','Omega','Phi','forall','exists','angle','empty','vdash','NN','ZZ','QQ','RR','CC','frac','sqrt','root','mat','oo','dot','times','in','not','sect','union','subset','supset'].includes(m)) return m;
      return a + ' ' + b;
    });
    // Strip any remaining backslash-prefixed LaTeX commands (not needed in Typst)
    e = e.replace(/\\[A-Za-z]+/g, '');
    return '$' + e + '$';
  });

  // 2. Handle Unicode math chars (convert to Typst)
  const unicodeMap = {
    'α': 'alpha', 'β': 'beta', 'γ': 'gamma', 'δ': 'delta',
    'θ': 'theta', 'λ': 'lambda', 'μ': 'mu', 'π': 'pi',
    'σ': 'sigma', 'τ': 'tau', 'φ': 'phi', 'ω': 'omega',
    'Δ': 'Delta', 'Θ': 'Theta', 'Λ': 'Lambda', 'Σ': 'Sigma',
    'Φ': 'Phi', 'Ω': 'Omega',
    '∞': 'oo', '∂': 'partial', '∇': 'nabla',
    '∫': 'integral', '∑': 'sum', '∏': 'product',
    '≠': '<>', '≤': '<=', '≥': '>=',
    '∈': 'in', '∩': 'sect', '∪': 'union',
    '→': '->', '⇒': '=>', '≈': '~~', '≡': '==',
    '∠': 'angle', '∅': 'empty', '⊢': 'vdash',
    '√': 'sqrt',
  };
  t = t.replace(/[αβγδεθλμπρστφωΔΘΛΣΦΩ∞∂∇∫∑∏≠≤≥∈∩∪→⇒≈≡∠∅⊢√]/g, (ch) => {
    if (unicodeMap[ch]) return '$' + unicodeMap[ch] + '$';
    return ch;
  });

  // 3. Extract title and metadata from first heading
  let title = 'QUESTION PAPER';
  let subjectCode = '';
  let qpTime = '2½ Hours';
  let qpMarks = '70';
  t = t.replace(/^#\s+(.+)$/m, (_, m) => {
    title = m.trim().toUpperCase();
    return '';
  });

  // 4. Extract subject code from text like "207003" or "BSC-101-BES"
  const codeMatch = t.match(/^([A-Z0-9]+[-][A-Z0-9-]+)\b/m) || t.match(/^(\d{4,8})\b/m);
  if (codeMatch) subjectCode = codeMatch[1];

  // 5. Extract time and marks
  const timeMatch = t.match(/Time[:\s]+([\d½¼¾]+)\s*(Hours?|Hrs?)/i);
  if (timeMatch) {
    qpTime = timeMatch[1].replace('½', '.5').replace('¼', '.25').replace('¾', '.75') + ' ' + timeMatch[2];
  }
  const marksMatch = t.match(/Total[:\s]*[Marks]+[:\s]*(\d+)/i) || t.match(/(\d+)\s*[Mm]arks\b/);
  if (marksMatch) qpMarks = marksMatch[1];

  // 6. Convert Markdown headings to Typst
  t = t.replace(/^###\s+(.+)$/gm, '==== $1\n');
  t = t.replace(/^##\s+(.+)$/gm, '=== $1\n');
  t = t.replace(/^#\s+(.+)$/gm, '== $1\n');

  // 7. Convert bold/italic
  t = t.replace(/\*\*\*(.+?)\*\*\*/g, '*_$1_*');
  t = t.replace(/\*\*(.+?)\*\*/g, '*$1*');
  t = t.replace(/_(.+?)_/g, '_$1_');

  // 8. Handle marks [N] → right-aligned
  t = t.replace(/\[(\d+)\s*(?:[Mm]arks?)?\]/g, '#marks_badge($1)');

  // 9. Handle OR separators
  t = t.replace(/^\s*\*{0,2}O\.?R\.?\*{0,2}\s*$/gim, '#or_block');

  // 10. Convert horizontal rules
  t = t.replace(/^---+\s*$/gm, '#line(length: 100%, stroke: 0.5pt + black)');

  // 11. Convert lists
  t = t.replace(/^[\*\-]\s+(.+)$/gm, '- $1');
  t = t.replace(/^\d+\.\s+(.+)$/gm, '+ $1');

  // 12. Handle code blocks
  t = t.replace(/```(\w*)\s*\n([\s\S]*?)```/g, (_, lang, code) => {
    if (lang === 'mermaid') return ''; // Skip mermaid for now
    return '```typst\n' + code.trim() + '\n```';
  });

  // 13. Handle tables
  t = t.replace(/^\|(.+)\|$/gm, (_, row) => {
    const cells = row.split('|').map(c => c.trim()).filter(c => c);
    return cells.join('\t') + ' \\';
  });

  // 14. Join broken lines (lines ending mid-expression, continuing on next line)
  // A line continues if the next line starts with lowercase, number, or symbol
  // and current line doesn't end with a period or colon
  let lines = t.split('\n');
  let joined = [];
  for (let i = 0; i < lines.length; i++) {
    if (i > 0 && !/^\s*$/.test(lines[i]) && !/^[A-Z#\-*\d]/.test(lines[i]) && !/[.:]\s*$/.test(lines[i-1]) && !/^(Q\d|===|====)/.test(lines[i])) {
      joined[joined.length - 1] += ' ' + lines[i].trimStart();
    } else {
      joined.push(lines[i]);
    }
  }
  t = joined.join('\n');

  // 15. Escape literal brackets in remaining text to avoid breaking Typst content blocks
  // Marks [N] already converted to #marks-badge(N), so remaining [] are literal brackets
  // Skip math blocks ($...$) — brackets inside math don't need escaping
  t = t.replace(/(\$[^$]*\$)|\[(?!#)|(?<!\\)\]/g, (match, mathBlock) => {
    if (mathBlock) return mathBlock;
    if (match === '[') return '\\[';
    return '\\]';
  });

  // Strip leading bold and list markers from Q-lines before question detection
  // *Q2)* → Q2) (template adds bold via text(weight: "bold"))
  t = t.replace(/^\*(Q\d+)\)/gm, '$1)');
  // Strip leading * (list marker) from content after Qn) — safe to remove
  t = t.replace(/^(Q\d+)\)\s*\*\s*/gm, '$1) ');

  // Helper: sanitize content for Typst content blocks [...]
  // Step 15 already escapes [ ] brackets, so we only strip * bold markers
  function sanitizeContent(text) {
    return text.replace(/\*/g, '');
  }

  // 16. Convert main questions (Q1), Q2) → #main_question
  t = t.replace(/^(Q\d+)\)\s*(.+)$/gm, (_, num, content) => {
    return `#main_question("${num}", [${sanitizeContent(content)}])`;
  });

  // 17. Convert sub-questions (a), b), c) → #sub_question
  t = t.replace(/^([a-z])\)\s+(.+)$/gm, (_, label, content) => {
    return `#sub_question("${label}", [${sanitizeContent(content)}])`;
  });

  // Build the Typst content (template is embedded by main() via concatenation)
  // No #import needed — sppu-qp.typ code is prepended by the converter
  return `
#show: doc => {
  sppu_qp(
    title: "${title.replace(/"/g, '\\"')}",
    time: "${qpTime.replace(/"/g, '\\"')}",
    marks: "${qpMarks.replace(/"/g, '\\"')}",
    body: doc
  )
}

#set text(size: 12pt)

// ── Instructions ──
${t.replace(/^Instructions?:?\s*$/m, '#text(size: 11pt, weight: "bold")[Instructions:]')}

// ── Questions ──
`;
}

function usage() {
  console.log('SPPU Question Paper Generator (Typst pipeline)');
  console.log('');
  console.log('Usage:  node scripts/convert-to-pdf.js <input.md> [output.pdf]');
  console.log('');
  console.log('Pipeline: Markdown → Typst → typst compile → A4 PDF');
  console.log('Features: Times New Roman, native math rendering, SPPU layout');
  console.log('Deps:    typst (v0.14+) — install from https://typst.app');
  process.exit(1);
}

async function main() {
  const args = process.argv.slice(2);
  if (args.length < 1) usage();

  const mdPath = path.resolve(args[0]);
  if (!fs.existsSync(mdPath)) {
    console.error('  ERROR: File not found: ' + mdPath);
    process.exit(1);
  }

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

  // Read the Markdown
  let md = fs.readFileSync(mdPath, 'utf-8')
    // Strip YAML frontmatter FIRST (before em-dash replacement which creates false ---)
    .replace(/^---[\s\S]*?---\n*/m, '')
    .replace(/\u{1f31f}/ug, '')
    .replace(/[\u201c\u201d]/g, '"')
    .replace(/\u2013/g, '--')
    .replace(/\u2014/g, '---');

  // Convert to Typst
  const typstContent = mdToTypst(md);

  // Write temporary .typ file
  const scriptDir = __dirname;
  const typPath = '/tmp/sppu-output-' + Date.now() + '.typ';
  const typstSrc = fs.readFileSync(path.join(scriptDir, 'sppu-qp.typ'), 'utf-8');
  fs.writeFileSync(typPath, typstSrc + '\n' + typstContent, 'utf-8');

  // Compile with typst
  try {
    execSync('typst compile "' + typPath + '" "' + pdfPath + '"', {
      stdio: 'pipe',
      timeout: 120000,
      cwd: path.dirname(typPath),
    });
  } catch (e) {
    const stderr = (e.stderr || e.stdout || Buffer.from(e.message || '')).toString();
    console.error('    Typst compile error:');
    console.error('    ' + stderr.split('\n').slice(0, 15).join('\n    '));
    // Write the debug .typ file for inspection
    const debugPath = typPath.replace('.typ', '-debug.typ');
    try { fs.copyFileSync(typPath, debugPath); } catch (_) {}
    console.error('    Debug file saved to: ' + debugPath);
    process.exit(1);
  }

  // Clean up temp file
  try { fs.unlinkSync(typPath); } catch (_) {}

  const size = (fs.statSync(pdfPath).size / 1024).toFixed(0);
  console.log('  Saved: ' + path.basename(pdfPath) + ' (' + size + 'K)');
}

main().catch(err => {
  console.error(err.message);
  process.exit(1);
});
