#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const { convertMdToPdf } = require('./convert-to-pdf/index');

function emitJson(event, data) {
  process.stdout.write(JSON.stringify({ event, ...data }) + '\n');
}

async function main() {
  const args = process.argv.slice(2);

  const help = args.includes('--help') || args.includes('-h');
  const jsonMode = args.includes('--json') || args.includes('-j');
  const verbose = args.includes('--verbose') || args.includes('-v');

  if (help || args.length === 0 || args[0].startsWith('-')) {
    console.log('Convert Markdown to QP-styled PDF with rendered math.');
    console.log('');
    console.log('Usage:');
    console.log('  node scripts/convert-to-pdf.js <input.md> [output.pdf] [options]');
    console.log('');
    console.log('Options:');
    console.log('  -j, --json       JSON output (machine-readable)');
    console.log('  -v, --verbose    Debug logging');
    console.log('  -h, --help       Show this help');
    console.log('');
    console.log('Examples:');
    console.log('  node scripts/convert-to-pdf.js input.md');
    console.log('  node scripts/convert-to-pdf.js input.md output.pdf');
    console.log('  node scripts/convert-to-pdf.js input.md --json');
    process.exit(help ? 0 : 1);
  }

  const mdPath = path.resolve(args[0]);
  if (!fs.existsSync(mdPath)) {
    console.error('ERROR: File not found: ' + mdPath);
    process.exit(1);
  }

  let pdfPath;
  if (args.length >= 2 && !args[1].startsWith('-')) {
    pdfPath = path.resolve(args[1]);
  } else {
    const d = path.join(path.dirname(mdPath), 'pdf_output');
    fs.mkdirSync(d, { recursive: true });
    pdfPath = path.join(d, path.basename(mdPath).replace(/\.md$/, '.pdf'));
  }
  fs.mkdirSync(path.dirname(pdfPath), { recursive: true });

  const options = { json: jsonMode, verbose };

  if (jsonMode) {
    emitJson('start', { file: path.basename(mdPath), output: path.basename(pdfPath) });
  } else {
    console.log('  Input: ' + path.basename(mdPath));
    console.log('  Output: ' + path.basename(pdfPath));
  }

  const result = await convertMdToPdf(mdPath, pdfPath, options);

  if (jsonMode) {
    emitJson('complete', {
      file: path.basename(mdPath),
      output: path.basename(pdfPath),
      jobId: result.jobId,
      size: result.size,
      duration: result.duration,
    });
  } else {
    const size = (result.size / 1024).toFixed(0);
    console.log('  Saved: ' + path.basename(pdfPath) + ' (' + size + 'K)');
  }
}

main().catch(err => {
  if (process.argv.includes('--json') || process.argv.includes('-j')) {
    emitJson('error', { message: err.message });
  } else {
    console.error(err.message);
  }
  process.exit(1);
});
