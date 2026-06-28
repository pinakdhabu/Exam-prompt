#!/usr/bin/env node
/**
 * Batch Convert — Convert all sample-paper MD files to PDF
 *
 * Usage:
 *   node scripts/batch-convert-to-pdf.js                          # Convert all sample papers
 *   node scripts/batch-convert-to-pdf.js --dry-run                # Show what would be converted
 *   node scripts/batch-convert-to-pdf.js --year be               # Only BE papers
 *   node scripts/batch-convert-to-pdf.js --subject dbms          # Only DBMS papers
 *   node scripts/batch-convert-to-pdf.js --parallel 4            # Parallel conversion
 *
 * Dependencies:
 *   npm install marked playwright    (or: npm install)
 *   npx playwright install chromium
 *
 * Output: Creates PDFs alongside MD files or in a pdf_output/ directory.
 */
const fs = require('fs');
const path = require('path');
const { spawn } = require('child_process');
const os = require('os');

// ---- Configuration ----
const REPO_ROOT = path.resolve(__dirname, '..');
const EXAMPLES_DIR = path.join(REPO_ROOT, 'examples');
const CONVERT_SCRIPT = path.join(REPO_ROOT, 'scripts', 'convert-to-pdf.js');
const PARALLEL_DEFAULT = Math.max(1, os.cpus().length - 1);

// ---- Parse CLI args ----
const args = process.argv.slice(2);
const DRY_RUN = args.includes('--dry-run');
let yearFilter = null;
let subjectFilter = null;
let parallelJobs = PARALLEL_DEFAULT;

for (let i = 0; i < args.length; i++) {
  if (args[i] === '--year' && args[i + 1]) yearFilter = args[++i].toLowerCase();
  if (args[i] === '--subject' && args[i + 1]) subjectFilter = args[++i].toLowerCase();
  if (args[i] === '--parallel' && args[i + 1]) parallelJobs = parseInt(args[++i]) || PARALLEL_DEFAULT;
}

// ---- Discover all sample paper MD files ----
function discoverMdFiles(dir) {
  const results = [];
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  for (const entry of entries) {
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      results.push(...discoverMdFiles(fullPath));
    } else if (entry.name.endsWith('.md') && !entry.name.endsWith('README.md')) {
      results.push(fullPath);
    }
  }
  return results;
}

function matchesFilter(filePath) {
  const rel = path.relative(EXAMPLES_DIR, filePath).toLowerCase();
  if (yearFilter && !rel.startsWith(yearFilter)) return false;
  if (subjectFilter && !rel.includes(subjectFilter)) return false;
  return true;
}

console.log('');
console.log('============================================================');
console.log('  EXAM-PROMPT — Batch PDF Converter');
console.log('============================================================');
console.log('');

// Check dependencies
let hasPlaywright = false;
try {
  require('playwright');
  hasPlaywright = true;
} catch { /* not installed */ }

if (!hasPlaywright) {
  console.log('⚠ Playwright is required for PDF conversion.');
  console.log('');
  console.log('  Install: npm install && npx playwright install chromium');
  console.log('');
  if (!DRY_RUN) {
    console.log('Aborting. Run with --dry-run to see what would convert.');
    process.exit(1);
  }
}

const allFiles = discoverMdFiles(EXAMPLES_DIR).filter(matchesFilter);

if (allFiles.length === 0) {
  console.log('No sample paper MD files found to convert.');
  console.log(`Looking in: ${EXAMPLES_DIR}`);
  process.exit(0);
}

console.log(`Found ${allFiles.length} sample paper(s) to convert.`);
console.log('');

if (DRY_RUN) {
  console.log('DRY RUN — Files that would be converted:');
  console.log('');
  allFiles.forEach(f => {
    const rel = path.relative(REPO_ROOT, f);
    const outPdf = f.replace(/\.md$/, '.pdf');
    console.log(`  ${rel}  →  ${path.relative(REPO_ROOT, outPdf)}`);
  });
  console.log('');
  console.log(`Total: ${allFiles.length} file(s)`);
  process.exit(0);
}

// ---- Convert files ----
let completed = 0;
let failed = 0;
const results = [];

function convertFile(filePath) {
  return new Promise((resolve) => {
    const rel = path.relative(REPO_ROOT, filePath);
    const child = spawn('node', [CONVERT_SCRIPT, filePath], {
      cwd: REPO_ROOT,
      stdio: ['ignore', 'pipe', 'pipe'],
    });

    let stdout = '';
    let stderr = '';

    child.stdout.on('data', (data) => { stdout += data.toString(); });
    child.stderr.on('data', (data) => { stderr += data.toString(); });

    child.on('close', (code) => {
      if (code === 0) {
        results.push({ file: rel, status: 'ok', output: stdout.trim() });
        resolve(true);
      } else {
        results.push({ file: rel, status: 'fail', error: stderr.trim() || 'Unknown error' });
        resolve(false);
      }
    });
  });
}

async function runBatch() {
  console.log(`Converting ${allFiles.length} file(s) with ${parallelJobs} parallel worker(s)...`);
  console.log('');

  // Process in parallel batches
  const batches = [];
  for (let i = 0; i < allFiles.length; i += parallelJobs) {
    batches.push(allFiles.slice(i, i + parallelJobs));
  }

  for (const batch of batches) {
    const batchResults = await Promise.all(batch.map(convertFile));
    for (const ok of batchResults) {
      if (ok) completed++;
      else failed++;
    }
  }

  // Print results
  console.log('');
  console.log('============================================================');
  console.log('  CONVERSION RESULTS');
  console.log('============================================================');
  console.log('');

  for (const r of results) {
    const icon = r.status === 'ok' ? '✓' : '✗';
    console.log(`  ${icon} ${r.file}`);
    if (r.output) {
      const lines = r.output.split('\n').filter(l => l.trim());
      lines.forEach(l => console.log(`        ${l}`));
    }
    if (r.error) console.log(`        ERROR: ${r.error}`);
  }

  console.log('');
  console.log('------------------------------------------------------------');
  if (failed === 0) {
    console.log(`✓ All ${completed} file(s) converted successfully.`);
  } else {
    console.log(`✓ ${completed} succeeded | ✗ ${failed} failed`);
  }
  console.log('------------------------------------------------------------');
  console.log('');
}

runBatch().catch(err => {
  console.error('Batch conversion failed:', err.message);
  process.exit(1);
});
