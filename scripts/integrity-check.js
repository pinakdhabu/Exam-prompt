#!/usr/bin/env node
/**
 * integrity-check.js — Cross-platform base integrity check
 *
 * Works on Linux, macOS, and Windows (Node.js).
 * Checks that the repo foundation is intact:
 *   1. skills.json vs disk sync
 *   2. AGENTS.md freshness
 *   3. package.json validity
 *   4. Git working tree clean
 *   5. No orphan skill dirs
 *   6. Font files essential check
 *
 * Usage: node scripts/integrity-check.js
 *        npm run integrity
 */
const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const ROOT = __dirname + '/..';
let passed = 0;
let failed = 0;
const errors = [];

function ok(msg) { passed++; console.log(`  ✅ ${msg}`); }
function fail(msg) { failed++; errors.push(msg); console.log(`  ❌ ${msg}`); }

function readJSON(p) {
  try { return JSON.parse(fs.readFileSync(p, 'utf-8')); }
  catch { return null; }
}

function dirCount(p) {
  try {
    return fs.readdirSync(p).filter(f => fs.statSync(path.join(p, f)).isDirectory()).length;
  } catch { return -1; }
}

console.log('=== Exam Prompt — Base Integrity Check ===\n');

// ─── 1. Package.json validity ─────────────────────────
console.log('[1/6] Validating package.json...');
const pkg = readJSON(path.join(ROOT, 'package.json'));
if (pkg && pkg.scripts) {
  const count = Object.keys(pkg.scripts).length;
  ok(`package.json valid (${count} scripts)`);
} else {
  fail('package.json broken or missing scripts');
}

// ─── 2. skills.json vs disk ───────────────────────────
console.log('[2/6] Verifying skills.json vs disk...');
const skillsJson = readJSON(path.join(ROOT, 'skills/skills.json'));
const diskCount = dirCount(path.join(ROOT, 'skills'));
if (skillsJson && skillsJson.skills) {
  const jsonCount = skillsJson.skills.length;
  if (jsonCount === diskCount) {
    ok(`skills.json: ${jsonCount} skills matches disk (${diskCount})`);
  } else {
    fail(`skills.json lists ${jsonCount}, disk has ${diskCount}`);
  }
} else {
  fail('skills/skills.json not found or invalid');
}

// ─── 3. AGENTS.md freshness ───────────────────────────
console.log('[3/6] Checking AGENTS.md freshness...');
try {
  execSync('bash scripts/generate-agents-md.sh --dry-run > /tmp/_agents_check 2>/dev/null', {
    cwd: ROOT, stdio: 'pipe', shell: true,
  });
  const generated = fs.readFileSync('/tmp/_agents_check', 'utf-8');
  const current = fs.readFileSync(path.join(ROOT, 'AGENTS.md'), 'utf-8');
  if (generated === current) {
    ok('AGENTS.md is fresh');
  } else {
    fail('AGENTS.md is stale — run: bash scripts/generate-agents-md.sh');
  }
  try { fs.unlinkSync('/tmp/_agents_check'); } catch {}
} catch {
  fail('Could not verify AGENTS.md freshness (bash/python3 required)');
}

// ─── 4. No orphan skill dirs ──────────────────────────
console.log('[4/6] Checking for orphan skill directories...');
const skillsDir = path.join(ROOT, 'skills');
const orphans = fs.readdirSync(skillsDir).filter(f => {
  const dir = path.join(skillsDir, f);
  return fs.statSync(dir).isDirectory() && !fs.existsSync(path.join(dir, 'SKILL.md'));
});
if (orphans.length === 0) {
  ok('No orphan skill directories');
} else {
  fail(`Orphan directories without SKILL.md: ${orphans.join(', ')}`);
}

// ─── 5. Git working tree check (best-effort) ──────────
console.log('[5/6] Checking git working tree...');
try {
  const status = execSync('git status --porcelain', { cwd: ROOT, encoding: 'utf-8' }).trim();
  if (!status) {
    ok('Git working tree clean');
  } else {
    const untracked = status.split('\n').filter(l => l.startsWith('??')).length;
    const modified = status.split('\n').length - untracked;
    if (modified === 0) {
      ok(`Git working tree clean (${untracked} untracked files)`);
    } else {
      fail(`${modified} modified tracked file(s) — commit or stash`);
    }
  }
} catch {
  fail('Git not available — skipping working tree check');
}

// ─── 6. Font files essential check ────────────────────
console.log('[6/6] Checking essential fonts...');
const fontsDir = path.join(ROOT, 'fonts');
const required = [
  ['times', 'Times.TTF'],
  ['times', 'Timesbd.TTF'],
  ['dejavu', 'DejaVuSans.ttf'],
  ['dejavu', 'DejaVuSerif.ttf'],
  ['dejavu', 'DejaVuSansMono.ttf'],
  ['caskaydia', 'CaskaydiaCoveNerdFontMono-Regular.ttf'],
  ['caskaydia', 'CaskaydiaCoveNerdFontMono-Bold.ttf'],
  ['termes-math', 'texgyretermes-math.otf'],
  ['noto-sans-devanagari', 'NotoSansDevanagari-Regular.ttf'],
  ['noto-sans-devanagari', 'NotoSansDevanagari-Bold.ttf'],
  ['noto-serif-devanagari', 'NotoSerifDevanagari-Regular.ttf'],
  ['noto-serif-devanagari', 'NotoSerifDevanagari-Bold.ttf'],
  ['shobhika', 'Shobhika-Regular.otf'],
  ['shobhika', 'Shobhika-Bold.otf'],
  ['mukta', 'Mukta-Regular.ttf'],
  ['mukta', 'Mukta-Bold.ttf'],
  ['opendyslexic', 'OpenDyslexic3-Regular.ttf'],
  ['opendyslexic', 'OpenDyslexic3-Bold.ttf'],
  ['opendyslexic', 'OpenDyslexic3-Italic.ttf'],
  ['klee', 'Klee-Regular.ttf'],
  ['klee', 'Klee-Bold.ttf'],
  ['patrick-hand', 'PatrickHand-Regular.ttf'],
  ['chilanka', 'Chilanka-Regular.ttf'],
];
let missingFonts = [];
for (const [subdir, file] of required) {
  const fp = path.join(fontsDir, subdir, file);
  if (!fs.existsSync(fp)) {
    missingFonts.push(`${subdir}/${file}`);
  }
}
if (missingFonts.length === 0) {
  ok(`All essential fonts present (${required.length} files)`);
} else {
  fail(`Missing fonts: ${missingFonts.join(', ')}`);
}

// ─── Results ──────────────────────────────────────────
console.log('\n=== Results ===');
if (errors.length) {
  errors.forEach(e => console.log(`  ❌ ${e}`));
}
console.log(`  Passed: ${passed} / ${passed + failed}`);
if (failed > 0) {
  console.log(`  FAILED: ${failed} checks — base integrity compromised`);
  process.exit(1);
} else {
  console.log('  ✅ Base integrity: STRONG');
  process.exit(0);
}
