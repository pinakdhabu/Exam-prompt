/**
 * Auto-detect SPPU exam header metadata from markdown and generate
 * a proper HTML table-based SPPU-style header.
 *
 * Handles multiple input formats:
 *   - **bold markdown** wrapped lines (DBMS style)
 *   - plain text lines (old COA style)
 *   - raw HTML already present (skip)
 * Works for ANY subject, ANY department, ANY year, ANY pattern.
 */
const theme = require('../../themes/index');

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

  for (const rawLine of lines) {
    const text = stripBold(rawLine);
    if (!text || text === '---') continue;

    // Support both YAML style ("key: value") and plain text lines
    let key = '';
    let val = text;
    const yamlMatch = text.match(/^([a-zA-Z0-9_-]+)\s*:\s*(.*)$/);
    if (yamlMatch) {
      key = yamlMatch[1].toLowerCase();
      val = yamlMatch[2].trim();
      // Remove surrounding quotes if present
      if (val.startsWith("'") && val.endsWith("'")) val = val.slice(1, -1);
      if (val.startsWith('"') && val.endsWith('"')) val = val.slice(1, -1);
    }

    // 1. Total Questions
    if (key === 'totalquestions') {
      meta.totalQuestions = val;
      continue;
    }
    const tq = val.match(/Total\s*No\.?\s*of\s*Questions?\s*:?\s*(\d+)/i);
    if (tq) { meta.totalQuestions = tq[1]; continue; }

    // SEAT No. line — skip
    if (/SEAT\s*No/i.test(val)) continue;

    // 2. Paper code
    if (key === 'papercode') {
      meta.paperCode = val;
      continue;
    }
    if (/^[A-Za-z]+-\d+$/.test(val) && !val.startsWith('[')) {
      meta.paperCode = val; continue;
    }

    // 3. Paper identifier [XXXX]-YY or [XXXX]-ABC
    if (key === 'paperidentifier') {
      meta.paperIdentifier = val;
      continue;
    }
    const pid = val.match(/^\[([^\]]+)\]-(\S+)$/);
    if (pid) { meta.paperIdentifier = `[${pid[1]}]-${pid[2]}`; continue; }

    // 4. Department / Year
    if (key === 'department') {
      meta.department = val;
      continue;
    }
    const deptMatch = val.match(/^(S\.?E\.?|T\.?E\.?|B\.?E\.?|F\.?E\.?|M\.?E\.?|M\.?Tech)\b/i);
    if (deptMatch) {
      meta.department = val.includes(')')
        ? val.slice(0, val.indexOf(')') + 1)
        : deptMatch[0];
      const semMatch = val.match(/SEM[- \s]*(\w+)/i);
      if (semMatch && !meta.semester) meta.semester = semMatch[1];
      continue;
    }

    // 5. Subject
    if (key === 'subject') {
      meta.subject = val;
      continue;
    }
    if (/^[A-Z &()\/]+$/.test(val) && val.length > 5) {
      meta.subject = val; continue;
    }

    // 6. Pattern info (YYYY Pattern) (Semester - X) (XXXXXX)
    if (key === 'pattern') {
      meta.pattern = val.includes('Pattern') ? val : val + ' Pattern';
      continue;
    }
    if (key === 'semester') {
      meta.semester = val;
      continue;
    }
    if (key === 'subjectcode') {
      meta.subjectCode = val;
      continue;
    }
    const pt = val.match(/\((\d{4})\s*Pattern\)\s*\(Semester\s*-\s*(\w+)\)\s*\((\d{6})\)/);
    if (pt) {
      meta.pattern = pt[1] + ' Pattern';
      meta.semester = pt[2];
      meta.subjectCode = pt[3];
      continue;
    }

    const pyp = val.match(/(\d{4})\s*Pattern/i);
    if (pyp && !meta.pattern) meta.pattern = pyp[1] + ' Pattern';

    const pysm = val.match(/Semester\s*-\s*(\w+)/i);
    if (pysm && !meta.semester) meta.semester = pysm[1];

    const pysc = val.match(/\((\d{6})\)/);
    if (pysc && !meta.subjectCode) meta.subjectCode = pysc[1];

    // 7. Time
    if (key === 'time') {
      meta.time = val;
      continue;
    }
    const tm = val.match(/Time\s*:?\s*([^|]+)/i);
    if (tm) {
      meta.time = tm[1].replace(/\]/g, '').replace(/\s*\|.*$/, '').trim();
    }

    // 8. Max Marks
    if (key === 'maxmarks') {
      meta.maxMarks = val;
      continue;
    }
    const mm = val.match(/Max\.?\s*Marks\s*:?\s*(\d+)/i);
    if (mm) meta.maxMarks = mm[1];

    // 9. Total Pages
    if (key === 'totalpages') {
      meta.totalPages = val;
      continue;
    }
    const tp = val.match(/Total\s*No\.?\s*of\s*Pages?\s*:?\s*(\d+)/i);
    if (tp) meta.totalPages = tp[1];
  }

  return meta;
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
  const htmlHeader = theme.generateHeaderHtml(meta);

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
