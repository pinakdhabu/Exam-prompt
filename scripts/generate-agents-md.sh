#!/usr/bin/env bash
# ============================================================
# generate-agents-md.sh — Auto-generate AGENTS.md <available_skills>
#
# Uses Python yaml.safe_load() for robust frontmatter extraction
# (handles multi-line > and | descriptions, colons in values).
#
# Usage:
#   ./scripts/generate-agents-md.sh              # Update AGENTS.md in place
#   ./scripts/generate-agents-md.sh --dry-run    # Print to stdout
#   ./scripts/generate-agents-md.sh --json-only  # Only generate skills.json
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$REPO_ROOT/skills"
AGENTS_MD="$REPO_ROOT/AGENTS.md"
SKILLS_JSON="$REPO_ROOT/skills/skills.json"
TMP_DATA="/tmp/skills_data_$$.json"

DRY_RUN="${1:-}"

# ─── Extract all skill metadata via Python ─────────────────────
python3 << 'PYEOF' > "$TMP_DATA"
import os, json, yaml

base = os.environ.get('SKILLS_DIR', 'skills')
skills = []

for d in sorted(os.listdir(base)):
    dpath = os.path.join(base, d)
    if not os.path.isdir(dpath):
        continue
    skill_file = os.path.join(dpath, 'SKILL.md')
    if not os.path.isfile(skill_file):
        continue
    with open(skill_file) as f:
        content = f.read()
    parts = content.split('---', 2)
    if len(parts) < 3:
        continue
    try:
        data = yaml.safe_load(parts[1])
    except Exception:
        data = {}
    if not data or 'name' not in data:
        continue

    skills.append({
        'name': str(data.get('name', d)),
        'description': str(data.get('description', 'No description provided.')),
        'version': str(data.get('version', '1.0.0')),
        'directory': d,
    })

print(json.dumps(skills, ensure_ascii=False))
PYEOF

export SKILLS_DIR
SKILL_COUNT=$(python3 -c "import json; print(len(json.load(open('$TMP_DATA'))))" 2>/dev/null || echo 0)

# ─── Generate AGENTS.md ────────────────────────────────────────
generate_agents_md() {
  # Read everything before <!-- SKILLS_TABLE_START -->
  sed '/<!-- SKILLS_TABLE_START -->/q' "$AGENTS_MD" | sed '$d'
  echo '<!-- SKILLS_TABLE_START -->'

  # Read the <usage> block between SKILLS_TABLE_START and <available_skills>
  local usage
  usage=$(sed -n '/<!-- SKILLS_TABLE_START -->/,/<available_skills>/p' "$AGENTS_MD" | tail -n +2 | sed '$d')
  if [ -n "$usage" ]; then
    echo "$usage"
  fi

  # Generate available_skills block from JSON data
  python3 << PYEOF
import json, xml.sax.saxutils as saxutils

skills = json.load(open('$TMP_DATA'))

print('<available_skills>')
print()

for skill in skills:
    name = saxutils.escape(skill['name'])
    desc = saxutils.escape(skill['description'])
    print(f'''<skill>
<name>{name}</name>
<description>{desc}</description>
<location>project</location>
</skill>''')
    print()

print('</available_skills>')
print('<!-- SKILLS_TABLE_END -->')
PYEOF

  # Read everything after <!-- SKILLS_TABLE_END -->
  sed '1,/<!-- SKILLS_TABLE_END -->/d' "$AGENTS_MD"
}

# ─── Generate skills.json ──────────────────────────────────────
generate_skills_json() {
  python3 << PYEOF
import json
from datetime import datetime, timezone

skills = json.load(open('$TMP_DATA'))

manifest = {
    '\$schema': 'exam-prompt-skills-v1',
    'generated': datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%SZ'),
    'total_skills': len(skills),
    'skills': skills,
    'compatible_with': ['claude-code', 'opencode', 'cursor', 'windsurf', 'cline', 'github-copilot', 'continue-dev'],
}

print(json.dumps(manifest, indent=2, ensure_ascii=False))
PYEOF
}

# ─── Execute ──────────────────────────────────────────────────
case "$DRY_RUN" in
  --dry-run)
    generate_agents_md
    ;;
  --json-only)
    generate_skills_json > "$SKILLS_JSON"
    echo "Written: $SKILLS_JSON ($SKILL_COUNT skills)"
    ;;
  *)
    tmpfile=$(mktemp)
    generate_agents_md > "$tmpfile"
    mv "$tmpfile" "$AGENTS_MD"
    generate_skills_json > "$SKILLS_JSON"
    echo "Updated: $AGENTS_MD ($SKILL_COUNT skills registered)"
    echo "Updated: $SKILLS_JSON ($SKILL_COUNT skills)"
    ;;
esac

rm -f "$TMP_DATA"
