const fs = require('fs');
const path = require('path');
const { FONTS, PAGE } = require('../config');

function generateHeaderHtml(meta) {
  const code = meta.paperCode || '';
  const identifier = meta.paperIdentifier || '';
  const dept = meta.department || '';
  const subj = meta.subject || '';
  const patternInfo = [
    meta.pattern ? '(' + meta.pattern + ')' : '',
    meta.semester ? '(Semester - ' + meta.semester + ')' : '',
    meta.subjectCode ? '(' + meta.subjectCode + ')' : '',
  ].filter(Boolean).join(' ');
  const time = meta.time || '';
  const marks = meta.maxMarks ? 'Max. Marks: ' + meta.maxMarks : '';
  const inst = meta.instructions || [];

  let instHtml = '';
  if (inst.length > 0) {
    const items = inst.map((item, idx) => {
      const num = idx + 1;
      return `<li>${item.trim()}</li>`;
    });
    instHtml = `
      <div style="margin-top: 15px;">
        <strong style="font-size: 11pt;">Instructions to the candidates:</strong>
        <ol style="margin-top: 5px; font-size: 10.5pt; line-height: 1.5; padding-left: 20px;">
          ${items.join('\n')}
        </ol>
      </div>
    `;
  }

  return `
    <div style="font-family: 'TNR', 'Times New Roman', serif; width: 100%; margin: 0 auto; padding-bottom: 10px;">
      ${identifier ? `<div style="float: left; font-size: 11pt; font-weight: bold;">${identifier}</div>` : ''}
      ${code ? `<div style="float: right; font-size: 11pt; font-weight: bold;">${code}</div>` : ''}
      <div style="clear: both;"></div>

      <div style="text-align: center; margin-top: 10px;">
        ${dept ? `<h1 style="font-size: 14pt; margin: 5px 0; font-weight: bold; text-transform: uppercase;">${dept}</h1>` : ''}
        ${subj ? `<h2 style="font-size: 13pt; margin: 5px 0; font-weight: bold; text-transform: uppercase;">${subj}</h2>` : ''}
        ${patternInfo ? `<div style="font-size: 11pt; margin: 3px 0; color: #555;">${patternInfo}</div>` : ''}
      </div>

      <table style="width: 100%; border-collapse: collapse; margin-top: 15px; font-size: 11pt; border: none;">
        <tr style="border-top: 1px solid #000; border-bottom: 1px solid #000;">
          <td style="border: none; padding: 4px 0; text-align: left; font-weight: bold;">Time: ${time}</td>
          <td style="border: none; padding: 4px 0; text-align: right; font-weight: bold;">${marks}</td>
        </tr>
      </table>

      ${instHtml}
      <hr style="border: none; border-top: 1.5px solid #000; margin-top: 12px; margin-bottom: 15px;">
    </div>
  `;
}

function getCss(useMath, fontFaces, extraFallbacks) {
  const mathCSS = useMath
    ? '.katex{font-size:1.05em}.katex-display{margin:6px 0;text-align:center}'
    : '';

  const bodyFamilies = ['TNR', ...(extraFallbacks || []), 'Times New Roman', 'serif'].join(',');

  return `
    @page {
      size: A4;
      margin: 2cm 2.2cm 2.2cm 2.2cm;
    }
    ${fontFaces}
    body {
      font-family: ${bodyFamilies};
      font-size: 11pt;
      line-height: 1.4;
      color: #000;
      margin: 0;
      padding: 0;
      font-kerning: normal;
      font-feature-settings: 'kern' 1, 'liga' 1, 'calt' 1;
      font-variant-ligatures: common-ligatures contextual;
      text-rendering: optimizeLegibility;
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
    code{font-family:'Cask NFM','CaskaydiaCove Nerd Font Mono',monospace;font-size:8.5pt;font-kerning:normal;font-variant-ligatures:common-ligatures contextual}
    p>code,li>code{background:#f0f0f0;padding:1px 4px}
    .mermaid{margin:8px 0;text-align:center}.mermaid svg{max-width:100%;height:auto}
    hr{border:none;border-top:1px solid #888;margin:10px 0}
    ${mathCSS}
  `;
}

module.exports = {
  generateHeaderHtml,
  getCss
};
