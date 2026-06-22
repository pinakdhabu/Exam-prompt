#!/usr/bin/env node
/**
 * detect-university.js — Cross-platform University Detection
 *
 * Detects active university configuration. Can be used on any platform
 * (Linux, macOS, Windows) without bash dependencies.
 *
 * Usage:
 *   node scripts/detect-university.js                   # Show current
 *   node scripts/detect-university.js --list            # List all
 *   node scripts/detect-university.js --active          # List active only
 *   node scripts/detect-university.js --default         # Show default
 *   node scripts/detect-university.js --json            # Output as JSON
 */
const fs = require('fs');
const path = require('path');

const REPO_ROOT = path.resolve(__dirname, '..');
const REGISTRY = path.join(REPO_ROOT, 'universities', 'university-registry.json');
const SESSION_FILE = path.join(REPO_ROOT, 'deps', 'session-profile.json');

const MODE = process.argv[2] || '';

function readJSON(filePath) {
  try {
    return JSON.parse(fs.readFileSync(filePath, 'utf-8'));
  } catch {
    return null;
  }
}

function showAll() {
  console.log('Available universities:');
  const registry = readJSON(REGISTRY);
  if (!registry) { console.log('  (registry not found)'); return; }

  const defaultUni = registry.default_university || '';
  for (const u of registry.universities || []) {
    const icon = u.status === 'active' ? '\u25CF' : '\u25CB';
    const dm = u.directory === defaultUni ? ' [DEFAULT]' : '';
    console.log(`  ${icon}  ${u.full_name} (${u.short_name}) — ${u.status}${dm}`);
  }
}

function showActive() {
  const registry = readJSON(REGISTRY);
  if (!registry) { console.log('(registry not found)'); return; }

  const defaultUni = registry.default_university || '';
  const active = (registry.universities || []).filter(u => u.status === 'active');

  if (active.length === 0) {
    console.log('(no active university configs found)');
    return;
  }

  for (const u of active) {
    const dm = u.directory === defaultUni ? ' [DEFAULT]' : '';
    console.log(`  \u25CF ${u.full_name} (${u.short_name})${dm}`);
    console.log(`    Directory: universities/${u.directory}`);
    console.log(`    Config exists: ${u.config_exists}`);
    console.log(`    Subjects data: ${u.subjects_data}`);
    console.log(`    Patterns data: ${u.patterns_data}`);
    console.log(`    PYQs available: ${u.pyqs_available}`);
  }
}

function showDefault() {
  const registry = readJSON(REGISTRY);
  if (!registry) { console.log('(registry not found)'); return; }

  const defaultDir = registry.default_university || 'NONE';
  const found = (registry.universities || []).find(u => u.directory === defaultDir);
  if (found) {
    console.log(`${found.full_name} (${found.short_name})`);
    console.log(`Directory: universities/${found.directory}`);
  } else {
    console.log(`Default university directory: ${defaultDir}`);
  }
}

function showCurrent() {
  const session = readJSON(SESSION_FILE);
  if (session) {
    console.log(`Current university (from session profile):`);
    console.log(`  University: ${session.university || 'unknown'}`);
    console.log(`  Session type: ${session.session_type || 'unknown'}`);
    console.log(`  Created: ${session.created_at || 'unknown'}`);
  } else if (MODE === '--json' || process.argv.includes('--json')) {
    console.log(JSON.stringify({ university: null, error: 'no session profile' }));
  } else {
    console.log('No session profile found.');
    console.log("Run 'node scripts/init-project.js' to initialize.");
    console.log('');
    console.log('Default university:');
    showDefault();
  }
}

function outputJSON() {
  const session = readJSON(SESSION_FILE);
  const registry = readJSON(REGISTRY);

  const result = {
    session: session,
    registry: registry ? {
      default_university: registry.default_university,
      universities: (registry.universities || []).map(u => ({
        id: u.id,
        full_name: u.full_name,
        short_name: u.short_name,
        status: u.status,
        directory: u.directory,
        config_exists: u.config_exists,
        subjects_data: u.subjects_data,
        patterns_data: u.patterns_data
      }))
    } : null
  };

  console.log(JSON.stringify(result, null, 2));
}

switch (MODE) {
  case '--list':   showAll(); break;
  case '--active': showActive(); break;
  case '--default': showDefault(); break;
  case '--json':   outputJSON(); break;
  default:         showCurrent(); break;
}
