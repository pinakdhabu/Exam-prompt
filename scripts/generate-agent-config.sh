#!/usr/bin/env bash
# ============================================================
# generate-agent-config.sh — Generate agent configs from
# skills.json single source of truth.
#
# Creates/updates:
#   - .cursorrules
#   - .windsurfrules
#   - .cursor/rules/000-global.mdc
#   - AGENTS.md (via generate-agents-md.sh)
#
# Usage:
#   bash scripts/generate-agent-config.sh
#   bash scripts/generate-agent-config.sh --dry-run
#   bash scripts/generate-agent-config.sh --check
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_JSON="$REPO_ROOT/skills/skills.json"
SKILLS_DIR="$REPO_ROOT/skills"
DRY_RUN=false
CHECK_MODE=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=true; shift ;;
    --check) CHECK_MODE=true; shift ;;
    *) shift ;;
  esac
done

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info()  { echo -e "${BLUE}[INFO]${NC} $*"; }
ok()    { echo -e "${GREEN}[OK]${NC}   $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; }

if [ ! -f "$SKILLS_JSON" ]; then
  fail "skills.json not found at $SKILLS_JSON"
  exit 1
fi

# ─── Extract skills data from skills.json ────────────────
SKILLS_DATA=$(python3 -c "
import json
s = json.load(open('$SKILLS_JSON'))
for sk in s.get('skills', []):
    print(json.dumps(sk))
" 2>/dev/null)

SKILL_COUNT=$(echo "$SKILLS_DATA" | grep -c . || echo 0)

info "Loaded $SKILL_COUNT skills from skills.json"
echo ""

# ─── Generate .cursorrules ─────────────────────────────
generate_cursorrules() {
  local file="$REPO_ROOT/.cursorrules"
  if [ "$DRY_RUN" = true ]; then
    info "[DRY-RUN] Would generate .cursorrules"
    return
  fi

  cat > "$file" << 'CURSOREOF'
# Exam Prompt — AI-Powered Exam Preparation System

## Project Overview
Universal exam preparation system supporting ANY university worldwide.
SPPU (Savitribai Phule Pune University) is the primary reference implementation.

## Key Architecture
CURSOREOF

  # Add skill list
  echo "" >> "$file"
  echo "## Available Skills ($SKILL_COUNT)" >> "$file"
  echo "" >> "$file"
  echo "| # | Skill | Description |" >> "$file"
  echo "|---|-------|-------------|" >> "$file"

  local i=1
  while IFS= read -r line; do
    local name desc
    name=$(echo "$line" | python3 -c "import json,sys; print(json.load(sys.stdin).get('name',''))")
    desc=$(echo "$line" | python3 -c "import json,sys; print(json.load(sys.stdin).get('description',''))")
    echo "| $i | $name | $desc |" >> "$file"
    i=$((i + 1))
  done <<< "$SKILLS_DATA"

  echo "" >> "$file"
  echo "## Key Files" >> "$file"
  echo "- \`skills/<name>/SKILL.md\` — Individual skill definitions" >> "$file"
  echo "- \`universities/\` — University configurations" >> "$file"
  echo "- \`scripts/\` — Utility scripts" >> "$file"
  echo "- \`AGENTS.md\` — Machine-readable XML registry (auto-generated)" >> "$file"

  ok "Generated .cursorrules"
}

# ─── Generate .windsurfrules ────────────────────────────
generate_windsurfrules() {
  local file="$REPO_ROOT/.windsurfrules"
  if [ "$DRY_RUN" = true ]; then
    info "[DRY-RUN] Would generate .windsurfrules"
    return
  fi

  cat > "$file" << 'WINDSURFEOF'
# Exam Prompt — Windsurf Configuration

## Available Skills

WINDSURFEOF

  while IFS= read -r line; do
    local name desc
    name=$(echo "$line" | python3 -c "import json,sys; print(json.load(sys.stdin).get('name',''))")
    desc=$(echo "$line" | python3 -c "import json,sys; print(json.load(sys.stdin).get('description',''))")
    echo "- **$name**: $desc" >> "$file"
  done <<< "$SKILLS_DATA"

  echo "" >> "$file"
  echo "## Usage" >> "$file"
  echo "Refer to \`AGENTS.md\` for the full machine-readable skill registry." >> "$file"

  ok "Generated .windsurfrules"
}

# ─── Generate .cursor/rules/000-global.mdc ──────────────
generate_cursor_mdc() {
  local file="$REPO_ROOT/.cursor/rules/000-global.mdc"
  if [ "$DRY_RUN" = true ]; then
    info "[DRY-RUN] Would generate .cursor/rules/000-global.mdc"
    return
  fi

  mkdir -p "$REPO_ROOT/.cursor/rules"

  cat > "$file" << 'MDCEOF'
---
description: Global Exam Prompt rules for Cursor IDE
globs: 
---

# Exam Prompt — Global Rules

## Skill Registry

MDCEOF

  while IFS= read -r line; do
    local name desc
    name=$(echo "$line" | python3 -c "import json,sys; print(json.load(sys.stdin).get('name',''))")
    desc=$(echo "$line" | python3 -c "import json,sys; print(json.load(sys.stdin).get('description',''))")
    echo "- \`$name\`: $desc" >> "$file"
  done <<< "$SKILLS_DATA"

  echo "" >> "$file"
  echo "## Source of Truth" >> "$file"
  echo "All configs are auto-generated from \`skills/skills.json\`. Do not edit manually." >> "$file"
  echo "Run \`bash scripts/generate-agent-config.sh\` to regenerate." >> "$file"

  ok "Generated .cursor/rules/000-global.mdc"
}

# ─── Generate AGENTS.md via existing script ─────────────
generate_agents() {
  if [ "$DRY_RUN" = true ]; then
    info "[DRY-RUN] Would run: bash scripts/generate-agents-md.sh"
    return
  fi

  if [ -f "$REPO_ROOT/scripts/generate-agents-md.sh" ]; then
    bash "$REPO_ROOT/scripts/generate-agents-md.sh" && ok "Regenerated AGENTS.md" || warn "AGENTS.md generation had issues"
  else
    warn "generate-agents-md.sh not found — skipping AGENTS.md"
  fi
}

# ─── Check mode: verify all configs are in sync ─────────
check_sync() {
  local issues=0

  for cfg in ".cursorrules" ".windsurfrules"; do
    if [ ! -f "$REPO_ROOT/$cfg" ]; then
      warn "$cfg does not exist — run generate-agent-config.sh"
      issues=$((issues + 1))
    fi
  done

  if [ ! -f "$REPO_ROOT/.cursor/rules/000-global.mdc" ]; then
    warn ".cursor/rules/000-global.mdc does not exist"
    issues=$((issues + 1))
  fi

  # Check if configs reference all skills
  local cursor_count windsurf_count mdc_count
  if [ -f "$REPO_ROOT/.cursorrules" ]; then
    cursor_count=$(grep -c '|.*|.*|' "$REPO_ROOT/.cursorrules" 2>/dev/null || echo 0)
    if [ "$cursor_count" -lt "$SKILL_COUNT" ]; then
      warn ".cursorrules only references $cursor_count/$SKILL_COUNT skills"
      issues=$((issues + 1))
    fi
  fi

  if [ "$issues" -eq 0 ]; then
    ok "All agent configs are in sync"
  fi
}

# ─── Main ────────────────────────────────────────────────
echo "╔══════════════════════════════════════════════════════╗"
echo "║   Agent Config Generator                            ║"
echo "║   Single source of truth: skills/skills.json        ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""

if [ "$CHECK_MODE" = true ]; then
  check_sync
  exit 0
fi

generate_cursorrules
generate_windsurfrules
generate_cursor_mdc
generate_agents

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║   Done!                                             ║"
echo "║                                                      ║"
echo "║   Generated from: skills/skills.json ($SKILL_COUNT skills)"
echo "║                                                      ║"
echo "║   Files:                                             ║"
echo "║     - .cursorrules                                   ║"
echo "║     - .windsurfrules                                 ║"
echo "║     - .cursor/rules/000-global.mdc                   ║"
echo "║     - AGENTS.md (via generate-agents-md.sh)          ║"
echo "║                                                      ║"
echo "║   Run with --check to verify sync                    ║"
echo "╚══════════════════════════════════════════════════════╝"
