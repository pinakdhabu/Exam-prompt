/**
 * Auto-detect SPPU exam header metadata from markdown and generate
 * a proper HTML table-based SPPU-style header.
 *
 * Handles multiple input formats:
 *   - **bold markdown** wrapped lines (DBMS style)
 *   - plain text lines (old COA style)
 *   - raw HTML already present (skip)
 *
 * Works for ANY subject, ANY department, ANY year, ANY pattern.
 */

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
    'Attempt Q. No. 1 or Q. No. 2, Q. No. 3 or Q. No. 4,\n   Q. No. 5 or Q. No. 6 and Q. No. 7 or Q. No. 8.',
    'Neat diagrams must be drawn wherever necessary.',
    'Figures to the right indicate full marks.',
    'Assume suitable data, if necessary.',
  ],
};

function stripBold(s) {
  return s.replace(/\*\*/g, '').trim();
}

function hasRawHtml(lines, limit) {
  for (let i = 0; i < Math.min(limit || 20, lines.length); i++) {
    const t = lines[i].trim();
    if (t.includes('<div') || t.includes('<table') || t.includes('<tr')) {
      return true;
    }
  }
  return false;
}

function extractInstructions(lines, startIdx) {
  const inst = [];
  let i = startIdx;

  // skip --- and empty lines to find "Instructions" header
  while (i < lines.length) {
    const t = lines[i].trim();
    if (t === '---' || !t) { i++; continue; }
    break;
  }
  if (i >= lines.length || !/Instructions/i.test(lines[i])) return null;
  i++; // past the header line
  // skip empty lines after header
  while (i < lines.length && !lines[i].trim()) i++;

  // collect numbered instruction lines
  while (i < lines.length) {
    const t = lines[i].trim();
    if (!t) { i++; continue; }
    const m = t.match(/^\d+\s*[\.\)]\s*(.+)/);
    if (m) {
      inst.push(m[1].trim());
      i++;
      continue;
    }
    // continuation — indented line following a numbered item
    if (inst.length > 0 && /^\s/.test(lines[i])) {
      inst[inst.length - 1] += ' ' + t;
      i++;
      continue;
    }
    // anything else — stop
    break;
  }

  return { items: inst, endIndex: i };
}

function findHeaderBlock(lines) {
  let start = -1;
  let end = -1;

  // Skip leading empty lines
  let idx = 0;
  while (idx < lines.length && lines[idx].trim() === '') idx++;

  // Look for opening ---
  if (idx < lines.length && lines[idx].trim() === '---') {
    start = idx;
    idx++;
    // Find closing ---
    while (idx < lines.length) {
      if (lines[idx].trim() === '---') {
        end = idx;
        break;
      }
      idx++;
    }
  }

  return { start, end };
}

function extractHeaderMetadata(lines) {
  const meta = { ...HEADER_DEFAULTS };

  for (const raw of lines) {
    const text = stripBold(raw);
    if (!text || text === '---') continue;

    // Total No. of Questions
    const tq = text.match(/Total\s*No\.?\s*of\s*Questions?\s*:?\s*(\d+)/i);
    if (tq) { meta.totalQuestions = tq[1]; continue; }

    // SEAT No. line — skip
    if (/SEAT\s*No/i.test(text)) continue;

    // Paper code (standalone like PE-2519, P-7539)
    if (/^[A-Za-z]+-\d+$/.test(text) && !text.startsWith('[')) {
      meta.paperCode = text; continue;
    }

    // Paper identifier [XXXX]-YY or [XXXX]-ABC
    const pid = text.match(/^\[([^\]]+)\]-(\S+)$/);
    if (pid) { meta.paperIdentifier = `[${pid[1]}]-${pid[2]}`; continue; }

    // Department / year: SE, TE, BE, FE, ME, MTech
    const deptMatch = text.match(/^(S\.?E\.?|T\.?E\.?|B\.?E\.?|F\.?E\.?|M\.?E\.?|M\.?Tech)\b/i);
    if (deptMatch) {
      meta.department = text.includes(')')
        ? text.slice(0, text.indexOf(')') + 1)
        : deptMatch[0];
      // Extract SEM if present
      const semMatch = text.match(/SEM[-\s]*(\w+)/i);
      if (semMatch && !meta.semester) meta.semester = semMatch[1];
      continue;
    }

    // Subject: all-caps line (letters, spaces, &, (), /)
    if (/^[A-Z &()\/]+$/.test(text) && text.length > 5) {
      meta.subject = text; continue;
    }

    // Pattern info: (YYYY Pattern) (Semester - X) (XXXXXX)
    const pt = text.match(/\((\d{4})\s*Pattern\)\s*\(Semester\s*-\s*(\w+)\)\s*\((\d{6})\)/);
    if (pt) {
      meta.pattern = pt[1] + ' Pattern';
      meta.semester = pt[2];
      meta.subjectCode = pt[3];
      continue;
    }

    // Pattern info — partial
    const pyp = text.match(/(\d{4})\s*Pattern/i);
    if (pyp && !meta.pattern) meta.pattern = pyp[1] + ' Pattern';

    const pysm = text.match(/Semester\s*-\s*(\w+)/i);
    if (pysm && !meta.semester) meta.semester = pysm[1];

    const pysc = text.match(/\((\d{6})\)/);
    if (pysc && !meta.subjectCode) meta.subjectCode = pysc[1];

    // Time
    const tm = text.match(/Time\s*:?\s*([^|]+)/i);
    if (tm) {
      meta.time = tm[1].replace(/\]/g, '').replace(/\s*\|.*$/, '').trim();
    }

    // Max Marks
    const mm = text.match(/Max\.?\s*Marks\s*:?\s*(\d+)/i);
    if (mm) meta.maxMarks = mm[1];

    // Total Pages
    const tp = text.match(/Total\s*No\.?\s*of\s*Pages?\s*:?\s*(\d+)/i);
    if (tp) meta.totalPages = tp[1];
  }

  return meta;
}

function generateHeaderHtml(meta) {
  const tq = meta.totalQuestions || '8';
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
  const marks = meta.maxMarks ? '[Max. Marks : ' + meta.maxMarks : '';
  const inst = meta.instructions || HEADER_DEFAULTS.instructions;
  const bi = 'font-weight:bold;font-style:italic';

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

  // Paper identifier with HTML entities for safety
  const idDisplay = escapedId || '';

  // Build paper identifier comment for footer extraction
  // Use HTML entities to avoid .marks CSS interference from renderer.js
  const escPid = identifier.replace(/\[/g, '&#91;').replace(/\]/g, '&#93;');
  const paperComment = identifier ? '<!-- PAPER_ID:' + escPid + ' -->\n' : '';

  return (
    '<div style="font-family:\'TNR\',\'Times New Roman\',serif;width:100%;margin:0 auto;">\n' +
    paperComment +
    '\n' +
    '<!-- Row 1: Total Questions (left, 12pt Bold) + SEAT No. with inline box (right) -->\n' +
    '<table style="width:100%;border-collapse:collapse;margin:0 0 3px 0;font-size:12pt;">\n' +
    '<tr>\n' +
    '<td style="width:50%;border:none;padding:0;text-align:left;font-weight:bold;vertical-align:middle;">\n' +
    'Total No. of Questions : ' + tq + ']\n' +
    '</td>\n' +
    '<td style="width:50%;border:none;padding:0;text-align:right;font-weight:bold;vertical-align:middle;white-space:nowrap;">\n' +
    'SEAT No. :' +
    '<span style="display:inline-block;border:2px solid black;width:130px;height:22px;margin:0 0 0 8px;vertical-align:middle;"></span>\n' +
    '</td>\n' +
    '</tr>\n' +
    '</table>\n' +
    '\n' +
    '<!-- Row 2: Paper code (16pt Bold, right) -->\n' +
    (code ? '<table style="width:100%;border-collapse:collapse;margin:0 0 3px 0;font-size:16pt;">\n' +
    '<tr>\n' +
    '<td style="width:100%;border:none;padding:0;text-align:right;font-weight:bold;">\n' +
    code + '\n' +
    '</td>\n' +
    '</tr>\n' +
    '</table>\n' : '') +
    '\n' +
    '<!-- Row 3: Paper identifier centered (17pt Bold) -->\n' +
    (idDisplay ? '<div style="text-align:center;font-size:17pt;font-weight:bold;margin:5px 0;">\n' +
    idDisplay + '\n' +
    '</div>\n' : '') +
    '\n' +
    '<!-- Title Block centered: dept=17pt, subject/pattern=16pt -->\n' +
    '<div style="text-align:center;font-weight:bold;margin:3px 0;">\n' +
    (dept ? '<div style="font-size:17pt;">' + dept + '</div>\n' : '') +
    (subj ? '<div style="font-size:16pt;">' + subj.replace(/&/g, '&amp;') + '</div>\n' : '') +
    (patternInfo ? '<div style="font-size:16pt;">' + patternInfo + '</div>\n' : '') +
    '</div>\n' +
    '\n' +
    '<!-- Time / Marks row (13pt Bold) -->\n' +
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
    '<!-- Instructions (13pt) -->\n' +
    instHtml + '\n' +
    '\n' +
    '<hr style="border-top:1px solid #000;margin:12px 0 4px 0;">\n' +
    '<div style="text-align:right;font-size:12pt;font-style:italic;margin:0;">P.T.O.</div>\n' +
    '</div>'
  );
}

function processHeader(raw) {
  const lines = raw.split('\n');

  // Skip if raw HTML header already present
  if (hasRawHtml(lines, 20)) return raw;

  // Find header block
  const block = findHeaderBlock(lines);
  if (block.start === -1 || block.end === -1) return raw;

  // Extract metadata from lines between --- delimiters
  const headerLines = lines.slice(block.start + 1, block.end);
  const meta = extractHeaderMetadata(headerLines);

  // Extract instructions after the header block
  const instResult = extractInstructions(lines, block.end + 1);
  if (instResult) meta.instructions = instResult.items;

  // Generate HTML header
  const htmlHeader = generateHeaderHtml(meta);

  // Find content start (after instructions)
  let contentStart = instResult ? instResult.endIndex : block.end + 1;
  // Skip any trailing empty / --- lines
  while (contentStart < lines.length) {
    const t = lines[contentStart].trim();
    if (t === '' || t === '---') { contentStart++; continue; }
    break;
  }

  const remaining = lines.slice(contentStart).join('\n').trim();
  return htmlHeader + '\n\n' + remaining;
}

module.exports = { processHeader };
