#!/usr/bin/env bash
# ============================================================
# validate-skills.sh — Validate all SKILL.md files in skills/
#
# Checks:
#   1. Each directory under skills/ has a SKILL.md
#   2. SKILL.md has YAML frontmatter (--- ... ---)
#   3. Frontmatter contains required fields: name, description
#   4. The name in frontmatter matches the expected pattern
#   5. No trailing spaces, consistent line endings
#
# Usage:
#   ./scripts/validate-skills.sh              # Validate all skills
#   ./scripts/validate-skills.sh <skill-name>  # Validate specific skill
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$REPO_ROOT/skills"
EXIT_CODE=0

TARGET_SKILL="${1:-}"

validate_skill() {
  local dir="$1"
  local name
  name=$(basename "$dir")
  local skill_file="$dir/SKILL.md"
  local errors=0

  # Check SKILL.md exists
  if [ ! -f "$skill_file" ]; then
    echo "FAIL: $name — missing SKILL.md"
    return 1
  fi

  # Check frontmatter opening
  if ! head -1 "$skill_file" | grep -q '^---$'; then
    echo "FAIL: $name — SKILL.md must start with YAML frontmatter (---)"
    errors=$((errors + 1))
  fi

  # Extract frontmatter block (first --- ... --- only)
  local frontmatter
  frontmatter=$(head -1 "$skill_file")
  if [ "$frontmatter" = "---" ]; then
    frontmatter=$(sed -n '2,/^---$/p' "$skill_file" | grep -v '^---$' || true)
  fi

  if [ -z "$frontmatter" ]; then
    echo "FAIL: $name — cannot parse YAML frontmatter"
    errors=$((errors + 1))
  else
    # Check name field
    if ! echo "$frontmatter" | grep -Eq '^name:\s'; then
      echo "FAIL: $name — frontmatter missing 'name:' field"
      errors=$((errors + 1))
    fi

    # Check description field
    if ! echo "$frontmatter" | grep -Eq '^description:\s'; then
      echo "FAIL: $name — frontmatter missing 'description:' field"
      errors=$((errors + 1))
    fi
  fi

  # Check for trailing whitespace
  if grep -q '[[:space:]]$' "$skill_file"; then
    echo "WARN: $name — trailing whitespace found"
  fi

  # Check for Windows line endings
  if grep -q $'\r' "$skill_file"; then
    echo "WARN: $name — Windows line endings (CRLF) found"
  fi

  if [ "$errors" -eq 0 ]; then
    echo "OK:   $name — SKILL.md valid"
    return 0
  else
    return 1
  fi
}

echo "=== Validating skills in $SKILLS_DIR ==="
echo ""

if [ -n "$TARGET_SKILL" ]; then
  validate_skill "$SKILLS_DIR/$TARGET_SKILL" || EXIT_CODE=1
else
  for dir in "$SKILLS_DIR"/*/; do
    validate_skill "$dir" || EXIT_CODE=1
  done
fi

echo ""
if [ "$EXIT_CODE" -eq 0 ]; then
  echo "All skills valid."
else
  echo "Some skills have issues."
fi

exit "$EXIT_CODE"
