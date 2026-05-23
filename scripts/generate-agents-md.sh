#!/usr/bin/env bash
# ============================================================
# generate-agents-md.sh — Auto-generate AGENTS.md <available_skills>
#
# Scans all directories under skills/, reads the SKILL.md
# frontmatter, and generates the <available_skills> block.
#
# Usage:
#   ./scripts/generate-agents-md.sh   # Update AGENTS.md in place
#   ./scripts/generate-agents-md.sh --dry-run  # Print to stdout
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$REPO_ROOT/skills"
AGENTS_MD="$REPO_ROOT/AGENTS.md"

DRY_RUN="${1:-}"

# Read skill frontmatter
declare -a SKILL_NAMES
declare -a SKILL_DESCS

for dir in "$SKILLS_DIR"/*/; do
  name=$(basename "$dir")
  skill_file="$dir/SKILL.md"

  if [ ! -f "$skill_file" ]; then
    echo "WARN: $name has no SKILL.md, skipping" >&2
    continue
  fi

  # Extract name from frontmatter
  fm_name=$(sed -n '/^---$/,/^---$/p' "$skill_file" | grep '^name:' | sed 's/^name: //' | tr -d '[:space:]' || true)
  # Extract description from frontmatter (first line only)
  fm_desc=$(sed -n '/^---$/,/^---$/p' "$skill_file" | grep '^description:' | sed 's/^description: //' || true)

  if [ -z "$fm_name" ]; then
    echo "WARN: $name has no 'name:' in frontmatter, using directory name" >&2
    fm_name="$name"
  fi

  if [ -z "$fm_desc" ]; then
    echo "WARN: $name has no 'description:' in frontmatter" >&2
    fm_desc="No description provided."
  fi

  SKILL_NAMES+=("$fm_name")
  SKILL_DESCS+=("$fm_desc")
done

# Generate available_skills XML
generate_xml() {
  echo '<available_skills>'
  echo ''

  for i in "${!SKILL_NAMES[@]}"; do
    cat << EOF
<skill>
<name>${SKILL_NAMES[$i]}</name>
<description>${SKILL_DESCS[$i]}</description>
<location>project</location>
</skill>

EOF
  done

  echo '</available_skills>'
}

# Generate the full AGENTS.md
generate_agents_md() {
  # Read everything before <!-- SKILLS_TABLE_START -->
  sed '/<!-- SKILLS_TABLE_START -->/q' "$AGENTS_MD"

  # Read the <usage> block between SKILLS_TABLE_START and <available_skills>
  sed -n '/<!-- SKILLS_TABLE_START -->/,/<available_skills>/p' "$AGENTS_MD" | sed '$d'

  # Generate available_skills
  generate_xml

  # Read everything after </available_skills>
  sed -n '/<\/available_skills>/,$p' "$AGENTS_MD" | tail -n +2
}

if [ "$DRY_RUN" = "--dry-run" ]; then
  generate_agents_md
else
  tmpfile=$(mktemp)
  generate_agents_md > "$tmpfile"
  mv "$tmpfile" "$AGENTS_MD"
  echo "Updated: $AGENTS_MD ($(echo "${#SKILL_NAMES[@]}") skills registered)"
fi
