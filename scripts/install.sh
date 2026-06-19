#!/usr/bin/env bash
set -euo pipefail

SOURCE="https://github.com/pinakdhabu/Exam-prompt"

echo "Installing skills to OpenCode (universal agents)..."
npx skills add "$SOURCE" -g -y -a opencode 2>&1 | grep -v "PromptScript" || true

if ls ~/.astrbot &>/dev/null 2>&1; then
  echo "Installing skills to AstrBot..."
  npx skills add "$SOURCE" -g -y -a astrbot 2>&1 | grep -v "PromptScript" || true
fi

echo ""
echo "Skills installed at ~/.agents/skills/ — available to all universal agents (OpenCode, Amp, Cline, PromptScript, etc.)"
