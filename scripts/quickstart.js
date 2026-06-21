#!/usr/bin/env node
const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');

function run(cmd) {
  console.log(`  $ ${cmd}`);
  execSync(cmd, { stdio: 'inherit', cwd: ROOT });
}

function log(label) {
  console.log(`\n${label}`);
}

console.log('=== Exam-Prompt Quickstart ===');

log('[1/3] Installing Node.js dependencies...');
if (fs.existsSync(path.join(ROOT, 'node_modules'))) {
  console.log('  (already installed, skipping)');
} else {
  run('npm install');
}

log('[2/3] Installing Playwright Chromium...');
run('npx playwright install chromium');

log('[3/3] Generating sample PDF...');
const sample = path.join(ROOT, 'examples', 'te', 'sem-5', 'database-management-systems', 'sample-paper-1.md');
const output = path.join(process.cwd(), 'quickstart-sample.pdf');

if (!fs.existsSync(sample)) {
  console.error(`  ERROR: Sample paper not found at ${sample}`);
  process.exit(1);
}

console.log(`  Input:  ${path.relative(process.cwd(), sample)}`);
console.log(`  Output: ${path.relative(process.cwd(), output)}`);
run(`node "${path.join(ROOT, 'scripts', 'convert-to-pdf.js')}" "${sample}" "${output}"`);

console.log('\n=== Done! ===');
console.log(`Open ${path.relative(process.cwd(), output)} to see the result.\n`);
console.log('Next steps:');
console.log('  npm run setup         — Configure for your university');
console.log('  npm run check         — Validate all skills');
console.log('  npm run convert:pdf   — Convert your own .md files to PDF');
