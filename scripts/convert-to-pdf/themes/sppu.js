const fs = require('fs');
const path = require('path');
const { FONTS, PAGE } = require('../config');

const HEADER_DEFAULTS = {
  totalQuestions: '8',
  paperCode: '',
  paperIdentifier: '',
  department: '',
  subject: '',
  pattern: '',
  semester: '',
  subjectCode: '',
  time: '',
  maxMarks: '',
  totalPages: '2',
  instructions: [
    'Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8.',
    'Neat diagrams must be drawn wherever necessary.',
    'Figures to the right side indicate full marks.',
    'Assume suitable data necessary.',
  ],
};

function generateHeaderHtml(meta) {
  const tq = meta.totalQuestions || HEADER_DEFAULTS.totalQuestions;
  const code = meta.paperCode || '';
  const identifier = meta.paperIdentifier || '';
  const dept = meta.department || '';
  const subj = meta.subject || '';
  const isInsem = /insem/i.test(dept) || (meta.time && parseInt(meta.time, 10) === 1);
  
  const patternInfoCombined = [
    meta.pattern ? '(' + meta.pattern + ')' : '',
    meta.semester ? '(Semester - ' + meta.semester + ')' : '',
    meta.subjectCode ? '(' + meta.subjectCode + ')' : '',
  ].filter(Boolean).join(' ');
  const patternHtml = patternInfoCombined ? '<div style="font-size:14pt;">' + patternInfoCombined + '</div>\n' : '';

  // Convert decimals (e.g. 2.5 or .5) to vulgar fraction ½ to match SPPU print layout
  const rawTime = meta.time || '';
  const time = rawTime.replace(/(?:0)?\.5/g, '½').trim();
  const marks = meta.maxMarks ? '[Max. Marks : ' + meta.maxMarks : '';
  const inst = meta.instructions || HEADER_DEFAULTS.instructions;
  const tpDisplay = meta.totalPages ? '[Total No. of Pages : ' + meta.totalPages : '';

  // Escape brackets in identifier with HTML entities to avoid .marks CSS interference
  const escapedId = identifier.replace(/\[/g, '&#91;').replace(/\]/g, '&#93;');
  const idDisplay = escapedId || '';

  // Build paper identifier comment for footer extraction
  const escPid = identifier.replace(/\[/g, '&#91;').replace(/\]/g, '&#93;');
  const paperComment = identifier ? '<!-- PAPER_ID:' + escPid + ' -->\n' : '';

  // Build instructions HTML — italicized items, bold-italic header
  let instHtml = '';
  if (inst.length > 0) {
    const items = inst.map((item, idx) => {
      const num = idx + 1;
      const text = item.replace(/\n\s*/g, ' ').trim();
      // Format questions inside instructions to match bold-italic: e.g. Q.1 -> Q.1
      const formattedText = text.replace(/(Q\s*\.?\s*\d+)/g, '<strong><em>$1</em></strong>');
      return '<div style="padding-left:24pt;font-size:12pt;line-height:1.4;font-style:italic;">' + num + ')&nbsp;&nbsp;' + formattedText + '</div>';
    });
    instHtml =
      '<div style="font-size:12pt;font-weight:bold;font-style:italic;margin:4pt 0 2pt 0;">' +
      'Instructions to the candidates:' +
      '</div>\n' +
      items.join('\n');
  }

  // ===================================================================
  // HEADER LAYOUT — matches real SPPU PDF coordinates exactly
  // Reference: Nov_Dec_2025.pdf (B.E. Computer Engineering DAA)
  //
  // Real layout (y from bottom, page height 842pt):
  //   y=774  Total No. of Questions : 8]    (left)  |  SEAT No. : [box]  (right)
  //   y=749  PE2192                         (left)  |  [Total No. of Pages : 3  (right)
  //   y=741  [6584]-91                      (centered)
  //   y=722  B.E. (Computer Engineering)    (centered)
  //   y=703  DESIGN AND ANALYSIS OF...      (centered, ALL CAPS)
  //   y=683  (2019 Pattern) (Semester...)   (centered)
  //   y=657  Time :2½ Hours]                (left)  |  [Max. Marks : 70  (right)
  //   y=642  Instructions to the candidates:
  //   y=628  1) Attempt Q.1 or Q.2...
  // ===================================================================

  return (
    '<div style="font-family:\'TNR\',\'Times New Roman\',serif;width:100%;margin:0 auto;">\n' +
    paperComment +
    '\n' +
    // --- Row 1: Total Questions (left) + SEAT No. with box (right) ---
    '<table style="width:100%;border-collapse:collapse;margin:0;font-size:12pt;font-weight:bold;">\n' +
    '<tr>\n' +
    '<td style="border:none;padding:0;text-align:left;vertical-align:top;">\n' +
    'Total No. of Questions : ' + tq + ']\n' +
    '</td>\n' +
    '<td style="border:none;padding:0;text-align:right;vertical-align:top;white-space:nowrap;">\n' +
    'SEAT No. :\n' +
    '<table style="display:inline-table;border-collapse:collapse;margin-left:6px;vertical-align:middle;width:auto;">\n' +
    '<tr>\n' +
    Array.from({ length: 9 }).map(() => '<td style="border:1.5pt solid #000;width:15px;height:18px;padding:0;text-align:center;"></td>').join('\n') + '\n' +
    '</tr>\n' +
    '</table>\n' +
    '</td>\n' +
    '</tr>\n' +
    // --- Row 2: Paper code (left) + Total Pages (right) ---
    '<tr>\n' +
    '<td style="border:none;padding:2pt 0 0 0;text-align:left;vertical-align:top;font-size:12pt;">\n' +
    (code || '') + (tpDisplay ? '' : '') + '\n' +
    '</td>\n' +
    '<td style="border:none;padding:2pt 0 0 0;text-align:right;vertical-align:top;font-size:12pt;">\n' +
    (tpDisplay || '') + '\n' +
    '</td>\n' +
    '</tr>\n' +
    '</table>\n' +
    '\n' +
    // --- Paper identifier centered ---
    (idDisplay ?
      '<div style="text-align:center;font-size:16pt;font-weight:bold;margin:4pt 0 2pt 0;">\n' +
      idDisplay + '\n' +
      '</div>\n' : '') +
    '\n' +
    // --- Title Block centered ---
    '<div style="text-align:center;font-weight:bold;margin:0;line-height:1.5;">\n' +
    (dept ? '<div style="font-size:14pt;">' + dept + '</div>\n' : '') +
    (subj ? '<div style="font-size:14pt;text-transform:uppercase;">' + subj.replace(/&/g, '&amp;') + '</div>\n' : '') +
    (patternHtml ? patternHtml : '') +
    '</div>\n' +
    '\n' +
    // --- Time / Marks row ---
    '<table style="width:100%;border-collapse:collapse;margin:6pt 0 4pt 0;font-size:12pt;font-weight:bold;">\n' +
    '<tr>\n' +
    '<td style="border:none;padding:0;text-align:left;">\n' +
    'Time :' + time + ']\n' +
    '</td>\n' +
    '<td style="border:none;padding:0;text-align:right;">\n' +
    marks + '\n' +
    '</td>\n' +
    '</tr>\n' +
    '</table>\n' +
    '\n' +
    // --- Instructions ---
    instHtml + '\n' +
    '\n' +
    // --- Horizontal rule separator + P.T.O. ---
    '<hr style="border:none;border-top:1pt solid #000;margin:8pt 0 2pt 0;">\n' +
    '<div style="text-align:right;font-size:12pt;font-style:italic;margin:0 0 4pt 0;">P .T.O.</div>\n' +
    '</div>'
  );
}

function getCss(useMath, fontFaces) {
  const mathCSS = useMath
    ? '.katex{font-size:1.05em}.katex-display{margin:6px 0;text-align:center}'
    : '';

  // ===================================================================
  // CSS matches real SPPU question paper measurements:
  //   - Body font: 12pt Times New Roman (real PDFs use 12pt)
  //   - Line height: 1.35 (~16.2pt, real PDFs show ~16.6pt spacing)
  //   - Marks [N]: displayed inline at end of line, NOT floated
  //   - Questions: Q1) bold at left margin, b) indented 28pt, cont. 57pt
  //   - OR: centered, bold, 12pt
  //   - Tables: thin black borders, no backgrounds
  //   - Code: monospace, thin border box
  // ===================================================================

  return `
    @page {
      size: A4;
      margin: 2.4cm 1.7cm 2.4cm 2.5cm;
    }
    ${fontFaces}
    body {
      font-family: 'TNR', 'Times New Roman', serif;
      font-size: 10.5pt;
      line-height: 1.4;
      color: #000;
      margin: 0;
      padding: 0;
    }
    /* Headings — suppressed in QP body (units use h2/h3 but should not show) */
    h1{font-size:14pt;font-weight:bold;text-align:center;margin:4pt 0 2pt 0;border:none;text-transform:uppercase;letter-spacing:0.5px}
    h2{font-size:12pt;font-weight:bold;text-align:center;margin:4pt 0 2pt 0;border:none;display:none}
    h3{font-size:12pt;font-weight:bold;margin:10pt 0 4pt 0}
    h4{font-size:12pt;font-weight:bold;margin:8pt 0 3pt 0}
    p {
      margin: 2pt 0;
      line-height: 1.35;
      position: relative;
    }
    /* Main questions (Q1) a)) - Q1) at 0, a) at 28.4pt, continuation at 56.8pt */
    .question-main {
      padding-left: 56.8pt;
      text-indent: -56.8pt;
    }
    .question-main strong.q-label {
      display: inline-block;
      width: 28.4pt;
      font-style: italic;
    }
    /* Sub-questions (b), c)) - b) at 28.4pt, continuation at 56.8pt */
    .question-sub {
      padding-left: 56.8pt;
      text-indent: -28.4pt;
    }
    /* Indent elements following sub-questions */
    .question-sub + table, .question-sub + pre {
      margin-left: 56.8pt !important;
    }
    strong{font-weight:bold}

    /* Marks [N] — positioned absolutely on the right to align perfectly on same baseline */
    .marks {
      font-weight: bold;
      font-size: 12pt;
      color: #000;
      position: absolute;
      right: 0;
    }

    /* OR separator — centered bold */
    .question-or{text-align:center;font-weight:bold;margin:6pt 0;font-size:12pt}

    /* Tables — clean black borders, no backgrounds */
    table{width:auto;border-collapse:collapse;margin:6pt 0;font-size:12pt}
    th{padding:3pt 10pt;border:1pt solid #000;text-align:left;font-weight:bold}
    td{padding:3pt 10pt;border:1pt solid #000}

    /* Lists */
    ul,ol{margin:3pt 0;padding-left:20pt}
    li{margin:1pt 0}

    /* Code blocks — thin border, no background */
    pre{border:0.5pt solid #000;padding:6pt 10pt;font-size:9pt;line-height:1.3;overflow-x:auto;white-space:pre-wrap;margin:4pt 0 4pt 28pt}
    code{font-family:'Cask NFM','CaskaydiaCove Nerd Font Mono',monospace;font-size:9pt}
    p>code,li>code{padding:1px 3px}

    /* Mermaid */
    .mermaid{margin:6pt 0;text-align:center}.mermaid svg{max-width:100%;height:auto}

    /* Horizontal rules */
    hr{border:none;border-top:0.5pt solid #000;margin:8pt 0}

    /* Answer box */
    .answer-box{border:1pt solid #000;padding:8pt;margin:6pt 0}

    ${mathCSS}
  `;
}

module.exports = {
  generateHeaderHtml,
  getCss
};
