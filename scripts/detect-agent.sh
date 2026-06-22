#!/usr/bin/env bash
# ============================================================
# detect-agent.sh — Detect which AI coding agent is running
# Cross-platform: works on Linux, macOS, Windows (Git Bash/WSL)
#
# Detects 20 agents as of June 2026:
#   Terminal-native: OpenCode, Claude Code, Codex CLI, Gemini CLI,
#                    Grok Build, Aider
#   IDE-fork: Cursor, Windsurf, Void AI
#   VS Code ext: Cline, Roo Code, Kilo Code, Kiro, Continue.dev, Goose
#   Cloud: GitHub Copilot, Codegen, Devin, Sourcegraph Amp, Fabrik
#
# Usage:
#   bash scripts/detect-agent.sh             # Print primary agent name
#   bash scripts/detect-agent.sh --json      # JSON with all details
#   bash scripts/detect-agent.sh --all       # List all detected agents
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
JSON_MODE=false
ALL_MODE=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --json) JSON_MODE=true; shift ;;
    --all) ALL_MODE=true; shift ;;
    *) shift ;;
  esac
done

python3 -c "
import json, os

repo = '$REPO_ROOT'

# All 20 agents with their detection indicators
agents = {
    # Terminal-native
    'opencode': {'name': 'OpenCode', 'type': 'terminal-native', 'indicators': [
        (os.path.join(repo, '.opencode'), 'dir_exists:.opencode'),
    ]},
    'claude-code': {'name': 'Claude Code', 'type': 'terminal-native', 'indicators': [
        (os.path.join(repo, '.claude', 'settings.json'), 'config_exists:.claude/settings.json'),
        (os.path.join(repo, 'CLAUDE.md'), 'file_exists:CLAUDE.md'),
    ]},
    'codex-cli': {'name': 'Codex CLI', 'type': 'terminal-native', 'indicators': [
        (os.path.join(repo, '.codex'), 'dir_exists:.codex'),
    ]},
    'gemini-cli': {'name': 'Gemini CLI / Antigravity', 'type': 'terminal-native', 'indicators': [
        (os.path.join(repo, '.antigravity'), 'dir_exists:.antigravity'),
        (os.path.join(repo, '.gemini'), 'dir_exists:.gemini'),
    ]},
    'grok-build': {'name': 'Grok Build', 'type': 'terminal-native', 'indicators': [
        (os.path.join(repo, '.grok'), 'dir_exists:.grok'),
    ]},
    'aider': {'name': 'Aider', 'type': 'terminal-native', 'indicators': [
        (os.path.join(repo, '.aider.conf.yml'), 'file_exists:.aider.conf.yml'),
    ]},

    # IDE-fork
    'cursor': {'name': 'Cursor', 'type': 'ide-fork', 'indicators': [
        (os.path.join(repo, '.cursor', 'rules'), 'dir_exists:.cursor/rules'),
    ]},
    'windsurf': {'name': 'Windsurf', 'type': 'ide-fork', 'indicators': [
        (os.path.join(repo, '.windsurfrules'), 'file_exists:.windsurfrules'),
    ]},
    'void-ai': {'name': 'Void AI', 'type': 'ide-fork', 'indicators': [
        (os.path.join(repo, '.void'), 'dir_exists:.void'),
    ]},

    # VS Code extension / BYOK
    'cline': {'name': 'Cline', 'type': 'vscode-ext', 'indicators': [
        (os.path.join(repo, '.clinerules'), 'file_exists:.clinerules'),
        (os.path.join(repo, 'cline_docs'), 'dir_exists:cline_docs'),
    ]},
    'roo-code': {'name': 'Roo Code', 'type': 'vscode-ext', 'indicators': [
        (os.path.join(repo, '.roorules'), 'file_exists:.roorules'),
        (os.path.join(repo, 'roo_docs'), 'dir_exists:roo_docs'),
    ]},
    'kilo-code': {'name': 'Kilo Code', 'type': 'vscode-ext', 'indicators': [
        (os.path.join(repo, '.kilorules'), 'file_exists:.kilorules'),
        (os.path.join(repo, 'kilo_docs'), 'dir_exists:kilo_docs'),
    ]},
    'kiro': {'name': 'Kiro', 'type': 'vscode-ext', 'indicators': [
        (os.path.join(repo, '.kiro'), 'dir_exists:.kiro'),
    ]},
    'continue-dev': {'name': 'Continue.dev', 'type': 'vscode-ext', 'indicators': [
        (os.path.join(repo, '.continue', 'config.yaml'), 'dir_exists:.continue'),
    ]},
    'goose': {'name': 'Goose', 'type': 'vscode-ext', 'indicators': [
        (os.path.join(repo, '.goose'), 'dir_exists:.goose'),
    ]},

    # Cloud / Platform
    'copilot': {'name': 'GitHub Copilot', 'type': 'cloud', 'indicators': [
        (os.path.join(repo, '.github', 'copilot-instructions.md'), 'file_exists:.github/copilot-instructions.md'),
    ]},
    'codegen': {'name': 'Codegen', 'type': 'cloud', 'indicators': [
        (os.path.join(repo, '.codegen'), 'dir_exists:.codegen'),
    ]},
    'devin': {'name': 'Devin', 'type': 'cloud', 'indicators': [
        (os.path.join(repo, '.devin'), 'dir_exists:.devin'),
    ]},
    'sourcegraph-amp': {'name': 'Sourcegraph Amp', 'type': 'cloud', 'indicators': [
        (os.path.join(repo, '.amp'), 'dir_exists:.amp'),
    ]},
    'fabrik': {'name': 'Fabrik', 'type': 'cloud', 'indicators': [
        (os.path.join(repo, '.fabrik'), 'dir_exists:.fabrik'),
    ]},
}

# Process each agent
results = []
for agent_id, agent in agents.items():
    confidence = 0
    clues = []
    for path, label in agent['indicators']:
        if os.path.exists(path):
            confidence += 3
            clues.append(label)
    results.append({
        'id': agent_id,
        'name': agent['name'],
        'type': agent['type'],
        'detected': confidence > 0,
        'confidence': confidence,
        'clues': clues,
    })

# Sort by confidence descending
results.sort(key=lambda r: r['confidence'], reverse=True)

# Find primary
primary = next((r for r in results if r['detected']), None)

# Output
import sys as _sys

if '$JSON_MODE' == 'true':
    output = {
        'detected_agents': [r for r in results if r['detected']],
        'primary_agent': primary['id'] if primary else None,
        'primary_agent_name': primary['name'] if primary else None,
        'all_agents': {r['id']: {
            'name': r['name'], 'type': r['type'],
            'detected': r['detected'], 'confidence': r['confidence'],
            'clues': r['clues'],
        } for r in results},
    }
    print(json.dumps(output, indent=2))
elif '$ALL_MODE' == 'true':
    for r in results:
        status = 'ACTIVE' if r['detected'] else '---'
        clues = ', '.join(r['clues']) if r['clues'] else 'none'
        print(f'{status:8s} {r[\"name\"]:30s} conf={r[\"confidence\"]:2d} type={r[\"type\"]:16s} [{clues}]')
else:
    if primary:
        print(f'{primary[\"name\"]}')
    else:
        print('unknown')
"
