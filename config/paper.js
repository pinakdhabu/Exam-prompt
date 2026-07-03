/**
 * SPPU Answer Sheet Configuration
 * Savitribai Phule Pune University — A4 Examination Answer Sheet
 *
 * ALL measurements in mm except font-size and border-width (px).
 * Never hardcode these values in CSS or JS — always reference this file.
 */
module.exports = {
  /** Page geometry */
  page: {
    format: 'A4',
    width: 210,         // mm
    height: 297,        // mm
    top: 12,            // mm  — page margin top
    bottom: 12,         // mm  — page margin bottom
    left: 10,           // mm  — page margin left
    right: 10,          // mm  — page margin right
  },

  /** Writing area */
  writing: {
    top: 28,            // mm  — Y where first ruled line starts (ink start)
    left: 12,           // mm  — X where content starts (inside margin line)
    width: 188,         // mm  — usable content width
    height: 257,        // mm  — total writing height
    headerHeight: 20,   // mm  — reserved for Q.No / marks / student info
  },

  /** Ruled lines */
  lines: {
    gap: 7.5,           // mm  — distance between baselines
    thickness: 0.45,    // px  — ink weight of each ruled line
    count: 34,          // number of lines per page (derived: writing.height / lines.gap)
    inkColor: '#707070', // ruled line color
  },

  /** Left margin line (red vertical) */
  marginLine: {
    x: 22,              // mm  — X position of vertical margin line
    thickness: 0.5,     // px
    color: '#606060',
    opacity: 0.7,
  },

  /** Q.No box */
  qno: {
    x: 2,               // mm  — offset from writing.left
    y: 22,              // mm  — Y position (top of page)
    width: 11,          // mm
    height: 7,          // mm
    borderWidth: 0.5,   // px
    borderColor: '#555',
    fontSize: 10,       // pt
    labelFontSize: 9,   // pt
    labelColor: '#555',
  },

  /** Marks table */
  marks: {
    y: 4,               // mm  — top of page
    width: 72,          // mm
    borderWidth: 0.5,   // px
    borderColor: '#555',
    cellHeight: 5.5,    // mm
  },

  /** Student info line */
  studentInfo: {
    fontSize: 10,       // pt
    labelColor: '#1f4fb5',
    underlineColor: '#bbb',
    underlineFontSize: 9, // pt
  },

  /** Typography */
  font: {
    family: "'Kalam', 'Patrick Hand', 'Handlee', sans-serif",
    size: 18,           // px  — base body font size
    lineHeight: 28.3,   // px  — matches line gap
    wordSpacing: 0.25,  // px
  },

  /** Content element spacing */
  spacing: {
    h1MarginTop: 15,    // mm
    h2MarginTop: 7.5,   // mm
    h3MarginTop: 3.75,  // mm
    listMarginLeft: 7.5,// mm
    codePaddingX: 3,    // px
    codeBorderRadius: 2,// px
    tableMarginY: 7.5,  // mm
    blockquoteMarginLeft: 7.5, // mm
    blockquotePaddingX: 3,     // mm
    hrMarginY: 7.5,     // mm
    preMarginY: 7.5,    // mm
    diagramMarginY: 7.5,// mm
  },

  /** Colors */
  colors: {
    paper: '#fcfdff',
    ink: '#1f4fb5',
    ruled: '#707070',
    margin: '#606060',
    blue: '#67bfe5',
    codeBg: '#eef8fe',
    preBg: '#f4f8fe',
    borderLight: '#d0d0d0',
    muted: '#bbb',
    subtle: '#888',
    headerBg: '#eef8ff',
  },

  /** Header fonts (display only — not embedded in PDF) */
  headerFonts: [
    'Kalam:wght@300;400;700',
    'Patrick+Hand',
    'Handlee',
  ],

  /** Fallback system fonts for PDF embedding */
  systemFonts: [
    'Segoe Print',
    'Comic Sans MS',
    'Bradley Hand',
    'sans-serif',
  ],
};
