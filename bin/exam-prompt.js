#!/usr/bin/env node
const { spawnSync } = require('child_process');
const fs = require('fs');
const path = require('path');

function findProjectRoot(dir) {
  const root = path.resolve(dir);
  const pkgPath = path.join(root, 'package.json');
  if (fs.existsSync(pkgPath)) {
    try {
      const pkg = JSON.parse(fs.readFileSync(pkgPath, 'utf-8'));
      if (pkg.name === 'exam-prompt') return root;
    } catch {}
  }
  const parent = path.dirname(root);
  if (parent === root) {
    console.error('exam-prompt: could not find project root (no package.json with name "exam-prompt" found)');
    process.exit(1);
  }
  return findProjectRoot(parent);
}

const ROOT = findProjectRoot(__dirname);
const SCRIPTS = path.join(ROOT, 'scripts');
const isWin = process.platform === 'win32';

function run(nodeScript, args) {
  const result = spawnSync('node', [path.join(SCRIPTS, nodeScript), ...args], {
    cwd: ROOT,
    stdio: 'inherit',
  });
  if (result.error) {
    console.error(`exam-prompt: failed to run ${nodeScript}: ${result.error.message}`);
    process.exit(1);
  }
  process.exit(result.status);
}

function runBash(script, args) {
  const scriptPath = path.join(SCRIPTS, script);
  let cmd, cmdArgs;
  if (isWin) {
    cmd = 'powershell';
    cmdArgs = ['-ExecutionPolicy', 'Bypass', '-File', scriptPath.replace(/\.sh$/, '.ps1'), ...args];
  } else {
    cmd = 'bash';
    cmdArgs = [scriptPath, ...args];
  }
  const result = spawnSync(cmd, cmdArgs, { cwd: ROOT, stdio: 'inherit' });
  if (result.error) {
    console.error(`exam-prompt: failed to run ${script}: ${result.error.message}`);
    process.exit(1);
  }
  process.exit(result.status);
}

const [cmd, subcmd, ...rest] = process.argv.slice(2);

function printHelp() {
  console.log(`
Usage: exam-prompt <command> [options]

Commands:
  fetch [--semester N] [--subject X] [--year Y] [--latest] [--list] [--branch B]
    Fetch question papers from SPPU site

  convert <input.md> [output.pdf] [--json] [--verbose]
    Convert a Markdown file to a PDF

  batch-convert [--parallel N] [--dry-run] [--year Y] [--subject X]
    Batch convert all sample papers to PDF

  detect university [--list] [--active] [--default] [--json]
    Detect and show active university configuration

  validate skills [skill-name] [--json]
    Validate all skill directories and their SKILL.md files

  init [--quick] [--university ID] [--dry-run]
    Initialize project (install deps, validate skills, create session profile)

  quickstart
    Generate a sample PDF to verify the pipeline

  --help, -h   Show this help

Examples:
  exam-prompt fetch --semester 5 dbms
  exam-prompt convert notes.md output.pdf
  exam-prompt batch-convert --parallel 4
  exam-prompt detect university --list
  exam-prompt validate skills
  exam-prompt init --quick
`);
}

if (!cmd || cmd === '--help' || cmd === '-h') {
  printHelp();
  process.exit(cmd ? 0 : 1);
}

switch (cmd) {
  case 'fetch':
    run('fetch-qp.js', rest);
    break;

  case 'convert':
    run('convert-to-pdf.js', rest);
    break;

  case 'batch-convert':
    run('batch-convert-to-pdf.js', rest);
    break;

  case 'detect':
    if (subcmd === 'university') {
      run('detect-university.js', rest);
    } else {
      console.error(`exam-prompt: unknown detect subcommand "${subcmd}". Use "detect university"`);
      process.exit(1);
    }
    break;

  case 'validate':
    if (subcmd === 'skills') {
      runBash('validate-skills.sh', rest);
    } else {
      console.error(`exam-prompt: unknown validate subcommand "${subcmd}". Use "validate skills"`);
      process.exit(1);
    }
    break;

  case 'init':
    runBash('init-project.sh', rest);
    break;

  case 'quickstart':
    run('quickstart.js', rest);
    break;

  default:
    console.error(`exam-prompt: unknown command "${cmd}". See exam-prompt --help`);
    process.exit(1);
}
