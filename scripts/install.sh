#!/usr/bin/env bash
set -euo pipefail

SOURCE="https://github.com/pinakdhabu/Exam-prompt"
AGENTS=$(npx skills add "$SOURCE" --list 2>/dev/null | head -1 || true)

npx skills add "$SOURCE" -g -y -a opencode 2>&1 | grep -v "PromptScript"

if ls ~/.astrbot &>/dev/null 2>&1; then
  npx skills add "$SOURCE" -g -y -a astrbot 2>&1 | grep -v "PromptScript"
fi

echo ""
echo "Skills installed at ~/.agents/skills/ — available to all universal agents (OpenCode, Amp, Cline, PromptScript, etc.)"
