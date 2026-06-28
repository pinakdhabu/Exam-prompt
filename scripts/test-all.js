#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const ROOT = path.resolve(__dirname, '..');
const SKILLS_DIR = path.join(ROOT, 'skills');
const SCHEMAS_DIR = path.join(ROOT, 'schemas');
const SCRIPTS_DIR = path.join(ROOT, 'scripts');
const UNIVERSITIES_DIR = path.join(ROOT, 'universities');
const AGENTS_PATH = path.join(ROOT, 'AGENTS.md');
const MANIFEST_PATH = path.join(SKILLS_DIR, 'skills.json');
const SCHEMA_PATH = path.join(SCHEMAS_DIR, 'skills-manifest.json');
const REGISTRY_PATH = path.join(UNIVERSITIES_DIR, 'university-registry.json');

let total = 0;
let pass = 0;
let fail = 0;

function ok(msg) {
  total++;
  pass++;
  console.log(`ok ${total} - ${msg}`);
}

function notOk(msg, detail) {
  total++;
  fail++;
  console.log(`not ok ${total} - ${msg}`);
  if (detail) process.stdout.write(`# ${detail.replace(/\n/g, '\n# ')}\n`);
}

function readJSON(p) {
  return JSON.parse(fs.readFileSync(p, 'utf-8'));
}

function dirNames(p) {
  return fs.readdirSync(p, { withFileTypes: true })
    .filter(d => d.isDirectory())
    .map(d => d.name)
    .sort();
}

// Test 1: SKILL.md frontmatter
(function () {
  const dirs = dirNames(SKILLS_DIR);
  const bad = [];
  for (const dir of dirs) {
    const sp = path.join(SKILLS_DIR, dir, 'SKILL.md');
    if (!fs.existsSync(sp)) { bad.push(`${dir}/SKILL.md not found`); continue; }
    const c = fs.readFileSync(sp, 'utf-8');
    if (!c.startsWith('---')) { bad.push(`${dir}: missing opening ---`); continue; }
    const end = c.indexOf('---', 3);
    if (end === -1) { bad.push(`${dir}: missing closing ---`); continue; }
    const fm = c.slice(3, end);
    if (!fm.includes('name:')) bad.push(`${dir}: missing 'name:'`);
    if (!fm.includes('description:')) bad.push(`${dir}: missing 'description:'`);
  }
  if (bad.length) notOk(`Skills validation: ${bad.length} file(s) have issues`, bad.join('\n'));
  else ok(`Skills validation: all ${dirs.length} SKILL.md files have frontmatter`);
})();

// Test 2: skills.json total_skills matches directory count
(function () {
  if (!fs.existsSync(MANIFEST_PATH)) { notOk('skills.json: file not found'); return; }
  let m;
  try { m = readJSON(MANIFEST_PATH); } catch (e) { notOk('skills.json: invalid JSON', e.message); return; }
  const dirs = dirNames(SKILLS_DIR);
  if (m.total_skills !== dirs.length) {
    notOk('skills.json: total_skills matches directory count',
      `total_skills=${m.total_skills}, directories=${dirs.length}`);
  } else {
    ok('skills.json: total_skills matches directory count');
  }
})();

// Test 3: skills.json entries have required fields
(function () {
  if (!fs.existsSync(MANIFEST_PATH)) { notOk('skills.json: file not found'); return; }
  let m;
  try { m = readJSON(MANIFEST_PATH); } catch (e) { notOk('skills.json: invalid JSON', e.message); return; }
  const bad = [];
  for (const entry of m.skills) {
    if (!entry.name) bad.push('entry missing name');
    if (!entry.directory) bad.push('entry missing directory');
    if (!entry.version) bad.push('entry missing version');
  }
  if (bad.length) notOk('skills.json: entries validated', bad.join('\n'));
  else ok('skills.json: all entries have name/directory/version');
})();

// Test 4: skills.json directories exist on disk
(function () {
  if (!fs.existsSync(MANIFEST_PATH)) { notOk('skills.json: file not found'); return; }
  let m;
  try { m = readJSON(MANIFEST_PATH); } catch (e) { notOk('skills.json: invalid JSON', e.message); return; }
  const bad = [];
  for (const entry of m.skills) {
    if (entry.directory && !fs.existsSync(path.join(SKILLS_DIR, entry.directory))) {
      bad.push(`directory '${entry.directory}' not found`);
    }
  }
  if (bad.length) notOk('skills.json: directories exist on disk', bad.join('\n'));
  else ok('skills.json: all skill directories exist on disk');
})();

// Test 5: AGENTS.md skills table
(function () {
  if (!fs.existsSync(AGENTS_PATH)) { notOk('AGENTS.md: file not found'); return; }
  const c = fs.readFileSync(AGENTS_PATH, 'utf-8');
  const re = /<name>([^<]+)<\/name>/g;
  const names = [];
  let m;
  while ((m = re.exec(c)) !== null) names.push(m[1]);
  const manifest = readJSON(MANIFEST_PATH);
  const expected = manifest.skills.map(s => s.name).sort();
  const missing = expected.filter(n => !names.includes(n));
  if (missing.length) {
    notOk(`AGENTS.md: missing ${missing.length} skill(s)`, missing.join('\n'));
  } else {
    ok(`AGENTS.md: all ${expected.length} skills present in table`);
  }
})();

// Test 6: JS scripts parse
(function () {
  const scripts = fs.readdirSync(SCRIPTS_DIR).filter(f => f.endsWith('.js'));
  const bad = [];
  for (const script of scripts) {
    const sp = path.join(SCRIPTS_DIR, script);
    try {
      execSync(`"${process.execPath}" -c "${sp.replace(/"/g, '\\"')}"`, { stdio: 'pipe' });
    } catch (e) {
      bad.push(script);
    }
  }
  if (bad.length) notOk(`JS scripts parse: ${bad.length} script(s) failed`, bad.join('\n'));
  else ok(`JS scripts parse: all ${scripts.length} scripts pass syntax check`);
})();

// Test 7: University registry - entries match directories
(function () {
  if (!fs.existsSync(REGISTRY_PATH)) { notOk('university-registry.json: file not found'); return; }
  let reg;
  try { reg = readJSON(REGISTRY_PATH); } catch (e) { notOk('university-registry.json: invalid JSON', e.message); return; }
  const bad = [];
  for (const entry of reg.universities) {
    if (!entry.directory) { bad.push('entry missing directory'); continue; }
    if (!fs.existsSync(path.join(UNIVERSITIES_DIR, entry.directory))) {
      bad.push(`directory '${entry.directory}' not found`);
    }
  }
  if (bad.length) notOk('University registry: entries match directories', bad.join('\n'));
  else ok(`University registry: all ${reg.universities.length} entries have matching directories`);
})();

// Test 8: University registry - each has config.json
(function () {
  if (!fs.existsSync(REGISTRY_PATH)) { notOk('university-registry.json: file not found'); return; }
  let reg;
  try { reg = readJSON(REGISTRY_PATH); } catch (e) { notOk('university-registry.json: invalid JSON', e.message); return; }
  const bad = [];
  for (const entry of reg.universities) {
    if (!entry.directory) continue;
    const cfg = path.join(UNIVERSITIES_DIR, entry.directory, 'config.json');
    if (!fs.existsSync(cfg)) bad.push(`${entry.directory}/config.json not found`);
  }
  if (bad.length) notOk('University registry: config.json exists for each', bad.join('\n'));
  else ok(`University registry: all ${reg.universities.length} entries have config.json`);
})();

// Test 9: Schema validation - top-level properties
(function () {
  if (!fs.existsSync(MANIFEST_PATH)) { notOk('skills.json: file not found', ''); return; }
  if (!fs.existsSync(SCHEMA_PATH)) { notOk('skills-manifest.json: schema not found', ''); return; }
  let m, schema;
  try { m = readJSON(MANIFEST_PATH); } catch (e) { notOk('skills.json: invalid JSON', e.message); return; }
  try { schema = readJSON(SCHEMA_PATH); } catch (e) { notOk('skills-manifest.json: invalid JSON', e.message); return; }
  const required = schema.required || [];
  const missing = required.filter(k => !(k in m));
  if (missing.length) notOk('Schema: top-level required properties', `missing: ${missing.join(', ')}`);
  else ok('Schema: all required top-level properties present');
})();

// Test 10: Schema validation - skills array entries
(function () {
  if (!fs.existsSync(MANIFEST_PATH)) { notOk('skills.json: file not found'); return; }
  if (!fs.existsSync(SCHEMA_PATH)) { notOk('skills-manifest.json: schema not found'); return; }
  let m, schema;
  try { m = readJSON(MANIFEST_PATH); } catch (e) { notOk('skills.json: invalid JSON', e.message); return; }
  try { schema = readJSON(SCHEMA_PATH); } catch (e) { notOk('skills-manifest.json: invalid JSON', e.message); return; }
  const itemRequired = schema.properties.skills.items.required || [];
  const bad = [];
  for (let i = 0; i < m.skills.length; i++) {
    const missing = itemRequired.filter(k => !(k in m.skills[i]));
    if (missing.length) bad.push(`skills[${i}] missing: ${missing.join(', ')}`);
  }
  if (bad.length) notOk('Schema: skills array entries have required properties', bad.join('\n'));
  else ok('Schema: all skills array entries have required properties');
})();

console.log(`# tests ${total}`);
console.log(`# pass  ${pass}`);
console.log(`# fail  ${fail}`);
process.exit(fail > 0 ? 1 : 0);
