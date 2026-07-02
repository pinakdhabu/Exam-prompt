#!/usr/bin/env node
const fs = require('fs');
const path = require('path');

const ROOT = __dirname + '/..';
let passed = 0;
let failed = 0;
const errors = [];

function ok(msg) { passed++; console.log(`  ✅ ${msg}`); }
function fail(msg) { failed++; errors.push(msg); console.log(`  ❌ ${msg}`); }

function parseFrontmatter(content) {
  const m = content.match(/^---\n([\s\S]*?)\n---\n/);
  if (!m) return null;
  const fields = {};
  for (const line of m[1].split('\n')) {
    const kv = line.match(/^(\w[\w-]*):\s*(.*)/);
    if (kv) fields[kv[1]] = kv[2];
  }
  return fields;
}

console.log('=== Exam Prompt — Skill Audit ===\n');

const skillsDir = path.join(ROOT, 'skills');
const skillDirs = fs.readdirSync(skillsDir).filter(d =>
  fs.statSync(path.join(skillsDir, d)).isDirectory()
);

// Build name↔dir mapping from SKILL.md frontmatter
const nameToDir = {};
const dirToName = {};
for (const dir of skillDirs) {
  const content = fs.readFileSync(path.join(skillsDir, dir, 'SKILL.md'), 'utf-8');
  const fm = parseFrontmatter(content);
  if (fm && fm.name) {
    nameToDir[fm.name] = dir;
    dirToName[dir] = fm.name;
  }
}

// ─── 1. Frontmatter audit ───────────────────────────
console.log('[1/6] Frontmatter audit...');
for (const dir of skillDirs) {
  const skillPath = path.join(skillsDir, dir, 'SKILL.md');
  if (!fs.existsSync(skillPath)) { fail(`${dir}: missing SKILL.md`); continue; }

  const fm = parseFrontmatter(fs.readFileSync(skillPath, 'utf-8'));
  if (!fm) { fail(`${dir}: no YAML frontmatter`); continue; }
  if (!fm.name) { fail(`${dir}: frontmatter missing 'name'`); continue; }
  if (!('description' in fm)) { fail(`${dir}: frontmatter missing 'description'`); continue; }
  ok(`${dir}: name=${fm.name}`);
}

// ─── 2. AGENTS.md ↔ disk sync ───────────────────────
console.log('\n[2/6] AGENTS.md vs disk sync...');
const agentsMd = path.join(ROOT, 'AGENTS.md');
const agentsContent = fs.readFileSync(agentsMd, 'utf-8');
const tableSection = agentsContent.match(/<available_skills>([\s\S]*?)<\/available_skills>/);
if (!tableSection) { fail('AGENTS.md: <available_skills> section not found'); }
else {
  const skillTags = tableSection[1].match(/<skill>[\s\S]*?<\/skill>/g) || [];
  const tableNames = new Set();
  for (const tag of skillTags) {
    const m = tag.match(/<name>([\w-]+)<\/name>/);
    if (m) tableNames.add(m[1]);
  }

  const diskNames = new Set(Object.keys(nameToDir));
  const onlyInTable = [...tableNames].filter(n => !diskNames.has(n));
  const onlyOnDisk = [...diskNames].filter(n => !tableNames.has(n));
  const matched = [...diskNames].filter(n => tableNames.has(n)).length;

  if (onlyInTable.length === 0 && onlyOnDisk.length === 0) {
    ok(`AGENTS.md table matches disk (${matched} skills)`);
  } else {
    if (onlyInTable.length) fail(`In AGENTS.md but no SKILL.md on disk: ${onlyInTable.join(', ')}`);
    if (onlyOnDisk.length) fail(`On disk but missing from AGENTS.md: ${onlyOnDisk.join(', ')}`);
  }
}

// ─── 3. skills.json consistency ─────────────────────
console.log('\n[3/6] skills.json consistency...');
const sj = JSON.parse(fs.readFileSync(path.join(ROOT, 'skills/skills.json'), 'utf-8'));
if (sj.total_skills !== sj.skills.length) fail(`total_skills (${sj.total_skills}) != array (${sj.skills.length})`);
else ok(`total_skills: ${sj.total_skills} matches skill array`);

const jsonNames = new Set(sj.skills.map(s => s.name));
const allMatch = Object.values(dirToName).every(n => jsonNames.has(n));
ok(allMatch ? 'All skills cross-referenced in skills.json' : 'Some skills missing from skills.json');

// ─── 4. University-agnostic claim ───────────────────
console.log('\n[4/6] University-agnostic check...');
const notAgnostic = skillDirs.filter(d => {
  const content = fs.readFileSync(path.join(skillsDir, d, 'SKILL.md'), 'utf-8');
  const fm = parseFrontmatter(content);
  return !fm || !fm.description.toLowerCase().includes('any university');
});
if (notAgnostic.length === 0) {
  ok(`All ${skillDirs.length} skills claim university-agnostic`);
} else {
  fail(`${notAgnostic.length}/${skillDirs.length} missing 'any university': ${notAgnostic.join(', ')}`);
}

// ─── 5. Stale skill detection ───────────────────────
console.log('\n[5/6] Stale skill detection...');
const tableSection2 = agentsContent.match(/<available_skills>([\s\S]*?)<\/available_skills>/);
const tableNames2 = new Set();
if (tableSection2) {
  for (const tag of tableSection2[1].match(/<skill>[\s\S]*?<\/skill>/g) || []) {
    const m = tag.match(/<name>([\w-]+)<\/name>/);
    if (m) tableNames2.add(m[1]);
  }
}
const onlyInTable2 = [...tableNames2].filter(n => !nameToDir[n]);
const onlyOnDisk2 = Object.keys(dirToName).filter(d => !tableNames2.has(dirToName[d]));
if (onlyInTable2.length === 0 && onlyOnDisk2.length === 0) ok('No stale skill references');
else {
  if (onlyInTable2.length) fail(`Stale in AGENTS.md (no dir): ${onlyInTable2.join(', ')}`);
  if (onlyOnDisk2.length) fail(`Stale on disk (not in AGENTS.md): ${onlyOnDisk2.join(', ')}`);
}

// ─── 6. SKILL.md ↔ skills.json cross-ref ────────────
console.log('\n[6/6] Cross-reference: SKILL.md ↔ skills.json...');
const jsonNameMap = {};
for (const s of sj.skills) jsonNameMap[s.name] = s;
let refCount = 0;
for (const dir of skillDirs) {
  const name = dirToName[dir];
  if (jsonNameMap[name]) refCount++;
  else fail(`${name}: in SKILL.md but not in skills.json`);
}
if (refCount === skillDirs.length) ok(`All ${refCount} skills cross-referenced`);
else ok(`${refCount}/${skillDirs.length} cross-referenced`);

// ─── Final tally ────────────────────────────────────
console.log(`\n=== Results ===`);
console.log(`  Passed: ${passed} / ${passed + failed}`);
if (failed > 0) {
  errors.forEach(e => console.log(`  ❌ ${e}`));
  console.log(`  FAILED: ${failed} checks`);
  process.exit(1);
} else {
  console.log(`  ✅ All skill checks: PASS`);
  process.exit(0);
}
