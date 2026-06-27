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
  const patternInfo = [
    meta.pattern ? '(' + meta.pattern + ')' : '',
    meta.semester ? '(Semester - ' + meta.semester + ')' : '',
    meta.subjectCode ? '(' + meta.subjectCode + ')' : '',
  ].filter(Boolean).join(' ');
  // Convert decimals (e.g. 2.5 or .5) to vulgar fraction ½ to match SPPU print layout
  const rawTime = meta.time || '';
  const time = rawTime.replace(/(?:0)?\.5/g, '½').trim();
  const marks = meta.maxMarks ? '[Max. Marks : ' + meta.maxMarks : '';
  const inst = meta.instructions || HEADER_DEFAULTS.instructions;
  const bi = 'font-weight:bold;font-style:italic';
  const tpDisplay = meta.totalPages ? '[Total No. of Pages : ' + meta.totalPages : '';

  // Build instructions HTML
  let instHtml = '';
  if (inst.length > 0) {
    const items = inst.map((item, idx) => {
      const num = idx + 1;
      const text = item.replace(/\n\s*/g, ' ').trim();
      return num + ') ' + text;
    });
    instHtml = '<div style="font-size:13pt;margin:10px 0 4px 0;' + bi + ';">\n' +
      'Instructions to the candidates :\n' +
      '</div>\n' +
      '<div style="font-size:13pt;margin:0;line-height:1.8;font-style:italic;">\n' +
      items.join('<br>\n') + '\n' +
      '</div>';
  }

  // Escape brackets in identifier with HTML entities to avoid .marks CSS interference
  const escapedId = identifier.replace(/\[/g, '&#91;').replace(/\]/g, '&#93;');
  const idDisplay = escapedId || '';

  // Build paper identifier comment for footer extraction
  const escPid = identifier.replace(/\[/g, '&#91;').replace(/\]/g, '&#93;');
  const paperComment = identifier ? '<!-- PAPER_ID:' + escPid + ' -->\n' : '';

  return (
    '<div style="font-family:\'TNR\',\'Times New Roman\',serif;width:100%;margin:0 auto;">\n' +
    paperComment +
    '\n' +
    '<!-- Row 1 & 2: Total Questions, Seat No, Paper Code, Total Pages -->\n' +
    '<table style="width:100%;border-collapse:collapse;margin:0 0 3px 0;font-size:12pt;font-weight:bold;">\n' +
    '<tr>\n' +
    '<td style="width:40%;border:none;padding:0;text-align:left;vertical-align:middle;">\n' +
    'Total No. of Questions : ' + tq + ']\n' +
    '</td>\n' +
    '<td style="width:60%;border:none;padding:0;text-align:right;vertical-align:middle;white-space:nowrap;">\n' +
    'SEAT No. :' +
    '<table style="display:inline-table;border-collapse:collapse;border:1.5px solid black;vertical-align:middle;margin:0 0 0 8px;">\n' +
    '<tr>\n' +
    '<td style="border:1.5px solid black;width:18px;height:20px;padding:0;text-align:center;"></td>\n' +
    '<td style="border:1.5px solid black;width:18px;height:20px;padding:0;text-align:center;"></td>\n' +
    '<td style="border:1.5px solid black;width:18px;height:20px;padding:0;text-align:center;"></td>\n' +
    '<td style="border:1.5px solid black;width:18px;height:20px;padding:0;text-align:center;"></td>\n' +
    '<td style="border:1.5px solid black;width:18px;height:20px;padding:0;text-align:center;"></td>\n' +
    '<td style="border:1.5px solid black;width:18px;height:20px;padding:0;text-align:center;"></td>\n' +
    '<td style="border:1.5px solid black;width:18px;height:20px;padding:0;text-align:center;"></td>\n' +
    '<td style="border:1.5px solid black;width:18px;height:20px;padding:0;text-align:center;"></td>\n' +
    '<td style="border:1.5px solid black;width:18px;height:20px;padding:0;text-align:center;"></td>\n' +
    '</tr>\n' +
    '</table>\n' +
    '</td>\n' +
    '</tr>\n' +
    '<tr>\n' +
    '<td style="width:50%;border:none;padding:4px 0 0 0;text-align:left;font-size:16pt;font-weight:bold;vertical-align:middle;">\n' +
    (code || '&nbsp;') + '\n' +
    '</td>\n' +
    '<td style="width:50%;border:none;padding:4px 0 0 0;text-align:right;font-size:12pt;font-weight:bold;vertical-align:middle;">\n' +
    (tpDisplay || '&nbsp;') + '\n' +
    '</td>\n' +
    '</tr>\n' +
    '</table>\n' +
    '\n' +
    '<!-- Row 3: Paper identifier centered -->\n' +
    (idDisplay ? '<div style="text-align:center;font-size:17pt;font-weight:bold;margin:5px 0;">\n' +
    idDisplay + '\n' +
    '</div>\n' : '') +
    '\n' +
    '<!-- Title Block centered -->\n' +
    '<div style="text-align:center;font-weight:bold;margin:3px 0;">\n' +
    (dept ? '<div style="font-size:17pt;">' + dept + '</div>\n' : '') +
    (subj ? '<div style="font-size:16pt;">' + subj.replace(/&/g, '&amp;') + '</div>\n' : '') +
    (patternInfo ? '<div style="font-size:16pt;">' + patternInfo + '</div>\n' : '') +
    '</div>\n' +
    '\n' +
    '<!-- Time / Marks row -->\n' +
    '<table style="width:100%;border-collapse:collapse;margin:4px 0;font-size:13pt;">\n' +
    '<tr>\n' +
    '<td style="width:50%;border:none;padding:0;text-align:left;font-weight:bold;">\n' +
    'Time : ' + time + ']\n' +
    '</td>\n' +
    '<td style="width:50%;border:none;padding:0;text-align:right;font-weight:bold;">\n' +
    marks + '\n' +
    '</td>\n' +
    '</tr>\n' +
    '</table>\n' +
    '\n' +
    '<!-- Instructions -->\n' +
    instHtml + '\n' +
    '\n' +
    '<hr style="border-top:1px solid #000;margin:12px 0 4px 0;">\n' +
    '<div style="text-align:right;font-size:12pt;font-style:italic;margin:0;">P.T.O.</div>\n' +
    '</div>'
  );
}

function getCss(useMath, fontFaces) {
  const mathCSS = useMath
    ? '.katex{font-size:1.05em}.katex-display{margin:6px 0;text-align:center}'
    : '';

  return `
    @page {
      size: A4;
      margin: 2cm 2.2cm 2.2cm 2.2cm;
    }
    ${fontFaces}
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
    h3{font-size:12pt;font-weight:bold;margin:16px 0 6px 0}
    h4{font-size:11pt;font-weight:bold;margin:10px 0 4px 0}
    p{margin:3px 0}
    strong{font-weight:bold}
    .marks{float:right;font-size:10pt;color:#000}
    .question-or{text-align:center;font-weight:bold;margin:8px 0;font-size:11pt}
    table{width:100%;border-collapse:collapse;margin:8px 0;font-size:10pt}
    th{padding:4px 8px;border:1px solid #000;text-align:left;font-weight:bold}
    td{padding:3px 8px;border:1px solid #000}
    ul,ol{margin:4px 0;padding-left:22px}
    li{margin:2px 0}
    pre{border:0.5pt solid #000;padding:8px 10px;font-size:8.5pt;line-height:1.3;overflow-x:auto;white-space:pre-wrap;margin:6px 0}
    code{font-family:'Cask NFM','CaskaydiaCove Nerd Font Mono',monospace;font-size:8.5pt}
    p>code,li>code{padding:1px 4px}
    .mermaid{margin:8px 0;text-align:center}.mermaid svg{max-width:100%;height:auto}
    hr{border:none;border-top:1px solid #888;margin:10px 0}
    ${mathCSS}
  `;
}

module.exports = {
  generateHeaderHtml,
  getCss
};
