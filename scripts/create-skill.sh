#!/usr/bin/env bash
# ============================================================
# create-skill.sh — Auto-generate a new skill from template
#
# Usage:
#   ./scripts/create-skill.sh <skill-name> "<Title>" "<Description>"
#
# Example:
#   ./scripts/create-skill.sh question-banker \
#     "Question Banker" \
#     "Generates question banks from any syllabus for ANY university"
#
# This script:
#   1. Creates skills/<skill-name>/ directory
#   2. Generates SKILL.md from template with placeholders replaced
#   3. Validates the frontmatter
#   4. Registers in AGENTS.md (if generate-agents-md.sh exists)
#   5. Syncs to ~/.agents/skills/ (if syncing is enabled)
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE="$REPO_ROOT/templates/skill/SKILL.md"
SKILLS_DIR="$REPO_ROOT/skills"
AGENTS_MD="$REPO_ROOT/AGENTS.md"

SKILL_NAME="${1:-}"
SKILL_TITLE="${2:-}"
SKILL_DESC="${3:-}"

if [ -z "$SKILL_NAME" ] || [ -z "$SKILL_TITLE" ] || [ -z "$SKILL_DESC" ]; then
  echo "Usage: ./scripts/create-skill.sh <skill-name> \"<Title>\" \"<Description>\""
  echo ""
  echo "Example:"
  echo "  ./scripts/create-skill.sh question-banker \\"
  echo '    "Question Banker" \'
  echo '    "Generates question banks from any syllabus for ANY university"'
  exit 1
fi

SKILL_DIR="$SKILLS_DIR/$SKILL_NAME"

if [ -d "$SKILL_DIR" ]; then
  echo "ERROR: Skill directory already exists: $SKILL_DIR"
  exit 1
fi

if [ ! -f "$TEMPLATE" ]; then
  echo "ERROR: Template not found: $TEMPLATE"
  exit 1
fi

# Create skill directory
mkdir -p "$SKILL_DIR"
echo "Created directory: $SKILL_DIR"

# Generate SKILL.md from template
UNIVERSAL_NAME="universal-$SKILL_NAME"
sed \
  -e "s/{{SKILL_NAME}}/$SKILL_NAME/g" \
  -e "s/{{SKILL_TITLE}}/$SKILL_TITLE/g" \
  -e "s/{{SHORT_DESCRIPTION}}/$SKILL_DESC/g" \
  -e "s/{{OVERVIEW_PARAGRAPH}}/$SKILL_DESC/" \
  -e "s/{{INPUT_DESCRIPTION}}/subject, syllabus, and question bank parameters/" \
  -e "s/{{ANALYSIS_DESCRIPTION}}/syllabus content, topic distribution, and question patterns/" \
  -e "s/{{OUTPUT_DESCRIPTION}}/formatted question bank with answers/" \
  -e "s/{{FORMAT_DESCRIPTION}}/in markdown, CSV, or JSON/" \
  "$TEMPLATE" > "$SKILL_DIR/SKILL.md"

echo "Generated: $SKILL_DIR/SKILL.md"

# Run validation
if [ -f "$REPO_ROOT/scripts/validate-skills.sh" ]; then
  echo "Validating new skill..."
  bash "$REPO_ROOT/scripts/validate-skills.sh" "$SKILL_NAME"
fi

# Re-generate AGENTS.md
if [ -f "$REPO_ROOT/scripts/generate-agents-md.sh" ]; then
  echo "Regenerating AGENTS.md..."
  bash "$REPO_ROOT/scripts/generate-agents-md.sh"
fi

# Sync to global skills directory
if [ -d "$HOME/.agents/skills" ]; then
  TARGET="$HOME/.agents/skills/$UNIVERSAL_NAME"
  mkdir -p "$TARGET"
  cp "$SKILL_DIR/SKILL.md" "$TARGET/SKILL.md"
  echo "Synced to global: $TARGET"
fi

echo ""
echo "=== Skill created successfully ==="
echo "Name: $UNIVERSAL_NAME"
echo "Dir:  $SKILL_DIR"
echo "To edit, open: $SKILL_DIR/SKILL.md"
echo "To install globally: npx skills@latest add pinakdhabu/Exam-prompt"
