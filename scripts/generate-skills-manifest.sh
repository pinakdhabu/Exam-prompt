#!/usr/bin/env bash
# ============================================================
# generate-skills-manifest.sh — Generate skills.json + AGENTS.md
#
# Uses Python yaml.safe_load() for robust YAML frontmatter
# extraction (handles multi-line > and | descriptions, colons).
#
# Usage:
#   ./scripts/generate-skills-manifest.sh                      # Both files
#   ./scripts/generate-skills-manifest.sh --json-only           # Only skills.json
#   ./scripts/generate-skills-manifest.sh --agents-only         # Only AGENTS.md
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$REPO_ROOT/skills"
AGENTS_MD="$REPO_ROOT/AGENTS.md"
SKILLS_JSON="$REPO_ROOT/skills/skills.json"

MODE="${1:-all}"

echo "🔍 Scanning skills in $SKILLS_DIR..."

# ─── Step 1: Extract all skill metadata via Python ─────────────
python3 << 'PYEOF' > /tmp/skills_data.json
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
        'skill_path': f'skills/{d}/SKILL.md',
    })

print(json.dumps(skills, ensure_ascii=False))
PYEOF

SKILL_COUNT=$(python3 -c "import json; print(len(json.load(open('/tmp/skills_data.json'))))")
echo "  ✅ Found $SKILL_COUNT skills"

# ─── Step 2: Generate skills.json ──────────────────────────────
generate_json() {
  python3 << 'PYEOF'
import json
from datetime import datetime, timezone

skills = json.load(open('/tmp/skills_data.json'))

manifest = {
    '$schema': 'exam-prompt-skills-v1',
    'generated': datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%SZ'),
    'total_skills': len(skills),
    'skills': skills,
    'compatible_with': ['claude-code', 'opencode', 'cursor', 'windsurf', 'cline', 'github-copilot', 'continue-dev'],
}

print(json.dumps(manifest, indent=2, ensure_ascii=False))
PYEOF
}

# ─── Step 3: Generate AGENTS.md ────────────────────────────────
generate_agents_md() {
  python3 << 'PYEOF'
import json
import xml.sax.saxutils as saxutils

skills = json.load(open('/tmp/skills_data.json'))

# Header (everything before <available_skills>)
# Read from the existing AGENTS.md to preserve custom header content
content = open('/tmp/agents_existing.txt').read() if __import__('os').path.exists('/tmp/agents_existing.txt') else ''
PYEOF

  # Read existing AGENTS.md header if available
  if [ -f "$AGENTS_MD" ]; then
    # Extract header (everything before <available_skills>)
    sed '/<available_skills>/q' "$AGENTS_MD" | sed '$d'
  else
    # Default header
    cat << 'DEFAULT'
<skills_system priority="1">

## Available Skills

<!-- SKILLS_TABLE_START -->
<usage>
When users ask you to perform tasks related to exam preparation, answer writing, notes generation, PYQ analysis, or any academic work — check if any of the available skills below can help.

How to use skills:
- Skills are in the `skills/` directory, each with a `SKILL.md` file
- Read the appropriate skill's SKILL.md for detailed instructions
- Base directory for skills: `./skills/<skill-name>/`

Usage notes:

DEFAULT
  fi

  # Generate <available_skills> block
  echo '<available_skills>'
  echo ''

  for i in $(seq 0 $((SKILL_COUNT - 1))); do
    name=$(python3 -c "import json; print(json.load(open('/tmp/skills_data.json'))[$i]['name'])")
    desc=$(python3 -c "import json; print(json.load(open('/tmp/skills_data.json'))[$i]['description'])")
    # XML escape
    desc="${desc//&/&amp;}"
    desc="${desc//</&lt;}"
    desc="${desc//>/&gt;}"
    desc="${desc//\"/&quot;}"

    cat << EOF
<skill>
<name>${name}</name>
<description>${desc}</description>
<location>project</location>
</skill>

EOF
  done

  echo '</available_skills>'
  echo '<!-- SKILLS_TABLE_END -->'
  echo ''
}

# ─── Execute based on mode ─────────────────────────────────────
case "$MODE" in
  --json-only)
    echo ""
    echo "📦 Generating skills/skills.json..."
    export SKILLS_DIR
    generate_json > "$SKILLS_JSON"
    echo "  ✅ Written: $SKILLS_JSON ($SKILL_COUNT skills)"
    ;;
  --agents-only)
    echo ""
    echo "📝 Regenerating AGENTS.md..."
    generate_agents_md > "$AGENTS_MD"
    echo "  ✅ Written: $AGENTS_MD ($SKILL_COUNT skills)"
    ;;
  all|*)
    echo ""
    echo "📦 Generating skills/skills.json..."
    export SKILLS_DIR
    generate_json > "$SKILLS_JSON"
    echo "  ✅ Written: $SKILLS_JSON ($SKILL_COUNT skills)"

    echo ""
    echo "📝 Regenerating AGENTS.md..."
    generate_agents_md > "$AGENTS_MD"
    echo "  ✅ Written: $AGENTS_MD ($SKILL_COUNT skills)"
    ;;
esac

# Cleanup
rm -f /tmp/skills_data.json /tmp/agents_existing.txt

echo ""
echo "✅ Done. $SKILL_COUNT skills registered."
