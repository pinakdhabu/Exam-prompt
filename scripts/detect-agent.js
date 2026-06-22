#!/usr/bin/env node
/**
 * detect-agent.js — Cross-platform AI coding agent detector
 *
 * Detects 20 agents as of June 2026:
 *   Terminal-native: OpenCode, Claude Code, Codex CLI, Gemini CLI, Grok Build, Aider
 *   IDE-fork: Cursor, Windsurf, Void AI
 *   VS Code ext: Cline, Roo Code, Kilo Code, Kiro, Continue.dev, Goose
 *   Cloud: GitHub Copilot, Codegen, Devin, Sourcegraph Amp, Fabrik
 *
 * Usage:
 *   node scripts/detect-agent.js            # Print primary agent name
 *   node scripts/detect-agent.js --json     # JSON with all details
 *   node scripts/detect-agent.js --all      # List all detected agents
 */

const fs = require('fs');
const path = require('path');

const REPO_ROOT = path.resolve(__dirname, '..');

const AGENTS = {
  // ── Terminal-native agents ──
  'opencode': {
    name: 'OpenCode',
    indicators: [
      { path: '.opencode', weight: 3, label: 'dir_exists:.opencode' },
    ],
  },
  'claude-code': {
    name: 'Claude Code',
    indicators: [
      { path: '.claude/settings.json', weight: 3, label: 'config_exists:.claude/settings.json' },
      { path: 'CLAUDE.md', weight: 3, label: 'file_exists:CLAUDE.md' },
    ],
  },
  'codex-cli': {
    name: 'Codex CLI',
    indicators: [
      { path: '.codex', weight: 3, label: 'dir_exists:.codex' },
    ],
  },
  'gemini-cli': {
    name: 'Gemini CLI / Antigravity',
    indicators: [
      { path: '.antigravity', weight: 3, label: 'dir_exists:.antigravity' },
      { path: '.gemini', weight: 2, label: 'dir_exists:.gemini' },
    ],
  },
  'grok-build': {
    name: 'Grok Build',
    indicators: [
      { path: '.grok', weight: 3, label: 'dir_exists:.grok' },
    ],
  },
  'aider': {
    name: 'Aider',
    indicators: [
      { path: '.aider.conf.yml', weight: 3, label: 'file_exists:.aider.conf.yml' },
    ],
  },

  // ── IDE-fork agents ──
  'cursor': {
    name: 'Cursor',
    indicators: [
      { path: '.cursor/rules', weight: 3, label: 'dir_exists:.cursor/rules' },
    ],
  },
  'windsurf': {
    name: 'Windsurf',
    indicators: [
      { path: '.windsurfrules', weight: 3, label: 'file_exists:.windsurfrules' },
    ],
  },
  'void-ai': {
    name: 'Void AI',
    indicators: [
      { path: '.void', weight: 3, label: 'dir_exists:.void' },
    ],
  },

  // ── VS Code Extension / BYOK agents ──
  'cline': {
    name: 'Cline',
    indicators: [
      { path: '.clinerules', weight: 3, label: 'file_exists:.clinerules' },
      { path: 'cline_docs', weight: 3, label: 'dir_exists:cline_docs' },
    ],
  },
  'roo-code': {
    name: 'Roo Code',
    indicators: [
      { path: '.roorules', weight: 3, label: 'file_exists:.roorules' },
      { path: 'roo_docs', weight: 3, label: 'dir_exists:roo_docs' },
    ],
  },
  'kilo-code': {
    name: 'Kilo Code',
    indicators: [
      { path: '.kilorules', weight: 3, label: 'file_exists:.kilorules' },
      { path: 'kilo_docs', weight: 3, label: 'dir_exists:kilo_docs' },
    ],
  },
  'kiro': {
    name: 'Kiro',
    indicators: [
      { path: '.kiro', weight: 3, label: 'dir_exists:.kiro' },
    ],
  },
  'continue-dev': {
    name: 'Continue.dev',
    indicators: [
      { path: '.continue/config.yaml', weight: 3, label: 'dir_exists:.continue' },
    ],
  },
  'goose': {
    name: 'Goose',
    indicators: [
      { path: '.goose', weight: 3, label: 'dir_exists:.goose' },
    ],
  },

  // ── Cloud / Platform agents ──
  'copilot': {
    name: 'GitHub Copilot',
    indicators: [
      { path: '.github/copilot-instructions.md', weight: 3, label: 'file_exists:.github/copilot-instructions.md' },
    ],
  },
  'codegen': {
    name: 'Codegen',
    indicators: [
      { path: '.codegen', weight: 3, label: 'dir_exists:.codegen' },
    ],
  },
  'devin': {
    name: 'Devin',
    indicators: [
      { path: '.devin', weight: 3, label: 'dir_exists:.devin' },
    ],
  },
  'sourcegraph-amp': {
    name: 'Sourcegraph Amp',
    indicators: [
      { path: '.amp', weight: 3, label: 'dir_exists:.amp' },
    ],
  },
  'fabrik': {
    name: 'Fabrik',
    indicators: [
      { path: '.fabrik', weight: 3, label: 'dir_exists:.fabrik' },
    ],
  },
};

function detect() {
  const results = [];

  for (const [id, agent] of Object.entries(AGENTS)) {
    let confidence = 0;
    const clues = [];

    for (const indicator of agent.indicators) {
      const fullPath = path.join(REPO_ROOT, indicator.path);
      try {
        fs.accessSync(fullPath, fs.constants.F_OK);
        confidence += indicator.weight;
        clues.push(indicator.label);
      } catch {
        // Not found
      }
    }

    results.push({
      id,
      name: agent.name,
      detected: confidence > 0,
      confidence,
      clues,
    });
  }

  results.sort((a, b) => b.confidence - a.confidence);

  return results;
}

function main() {
  const args = process.argv.slice(2);
  const jsonMode = args.includes('--json');
  const allMode = args.includes('--all');

  const detected = detect();
  const primary = detected.find(a => a.detected);

  if (jsonMode) {
    console.log(JSON.stringify({
      detected_agents: detected.filter(a => a.detected),
      primary_agent: primary ? primary.id : null,
      primary_agent_name: primary ? primary.name : null,
      all_agents: Object.fromEntries(
        detected.map(a => [a.id, { name: a.name, detected: a.detected, confidence: a.confidence, clues: a.clues }])
      ),
    }, null, 2));
  } else if (allMode) {
    for (const agent of detected) {
      const status = agent.detected ? 'ACTIVE' : '---';
      const clues = agent.clues.length > 0 ? `[${agent.clues.join(', ')}]` : '[none]';
      const type = getAgentType(agent.id);
      console.log(`${status.padEnd(8)} ${agent.name.padEnd(30)} conf=${String(agent.confidence).padEnd(2)} type=${type.padEnd(16)} ${clues}`);
    }
  } else {
    console.log(primary ? primary.name : 'unknown');
  }
}

function getAgentType(id) {
  const terminal = ['opencode', 'claude-code', 'codex-cli', 'gemini-cli', 'grok-build', 'aider'];
  const ideFork = ['cursor', 'windsurf', 'void-ai'];
  const vscode = ['cline', 'roo-code', 'kilo-code', 'kiro', 'continue-dev', 'goose'];
  const cloud = ['copilot', 'codegen', 'devin', 'sourcegraph-amp', 'fabrik'];

  if (terminal.includes(id)) return 'terminal-native';
  if (ideFork.includes(id)) return 'ide-fork';
  if (vscode.includes(id)) return 'vscode-ext';
  if (cloud.includes(id)) return 'cloud';
  return 'unknown';
}

if (require.main === module) {
  main();
}

module.exports = { detect, AGENTS };
