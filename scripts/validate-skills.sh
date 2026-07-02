#!/usr/bin/env bash
# ============================================================
# validate-skills.sh — Comprehensive skill validation
# Cross-platform: works on Linux (GNU) and macOS (BSD)
#
# Checks:
#   1. Each directory under skills/ has a SKILL.md
#   2. SKILL.md has valid YAML frontmatter (--- ... ---)
#   3. Frontmatter contains: name, description
#   4. Directory naming convention (kebab-case)
#   5. No orphan skill directories
#   6. Cross-references to other skills are valid
#   7. skills.json matches filesystem
#   8. University registry matches directories
#
# Usage:
#   bash scripts/validate-skills.sh              # Validate all
#   bash scripts/validate-skills.sh <skill-name>  # Validate one
#   bash scripts/validate-skills.sh --json        # JSON output
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$REPO_ROOT/skills"
REGISTRY="$REPO_ROOT/universities/university-registry.json"
SKILLS_JSON="$REPO_ROOT/skills/skills.json"
EXIT_CODE=0
JSON_MODE=false
TARGET_SKILL=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --json) JSON_MODE=true; shift ;;
    --) shift; break ;;
    -*)
      # Unknown option, skip
      shift
      ;;
    *) TARGET_SKILL="$1"; shift ;;
  esac
done

# Collect results
RESULTS=()
ERRORS=0
WARNINGS=0

record() {
  local level="$1" file="$2" message="$3"
  RESULTS+=("$(printf '{"level":"%s","file":"%s","message":"%s"}' "$level" "$file" "$message")")
  case "$level" in
    FAIL) echo "FAIL: $file — $message"; ERRORS=$((ERRORS + 1)) ;;
    WARN) echo "WARN: $file — $message"; WARNINGS=$((WARNINGS + 1)) ;;
    OK)   echo "OK:   $file — $message" ;;
  esac
}

# ─── Check 1: All skill dirs have SKILL.md ──────────────
check_skill_file_exists() {
  local dir="$1" name skill_file
  name=$(basename "$dir")
  skill_file="$dir/SKILL.md"

  if [ ! -f "$skill_file" ]; then
    record "FAIL" "$name" "missing SKILL.md"
    return 1
  fi
  record "OK" "$name" "SKILL.md exists"
  return 0
}

# ─── Check 2: Frontmatter validity ──────────────────────
check_frontmatter() {
  local dir="$1" name skill_file first_line frontmatter
  name=$(basename "$dir")
  skill_file="$dir/SKILL.md"
  local errors=0

  first_line=$(head -1 "$skill_file" 2>/dev/null || echo "")
  if [ "$first_line" != "---" ]; then
    record "FAIL" "$name" "SKILL.md must start with YAML frontmatter (---)"
    return 1
  fi

  frontmatter=$(sed -n '2,/^---$/p' "$skill_file" | grep -v '^---$' || true)

  if [ -z "$frontmatter" ]; then
    record "FAIL" "$name" "cannot parse YAML frontmatter"
    return 1
  fi

  local has_name=false has_desc=false name_val=""

  while IFS= read -r line; do
    case "$line" in
      name:*)
        has_name=true
        name_val="${line#name:}"
        name_val="${name_val## }"
        ;;
      description:*)
        has_desc=true
        ;;
    esac
  done <<< "$frontmatter"

  if [ "$has_name" = false ]; then
    record "FAIL" "$name" "frontmatter missing 'name:' field"
    errors=$((errors + 1))
  fi

  if [ "$has_desc" = false ]; then
    record "FAIL" "$name" "frontmatter missing 'description:' field"
    errors=$((errors + 1))
  fi

  if [ "$errors" -eq 0 ]; then
    record "OK" "$name" "frontmatter valid (name: $name_val)"
  fi
  return "$errors"
}

# ─── Check 3: Directory naming convention ───────────────
check_directory_name() {
  local dir="$1" name
  name=$(basename "$dir")

  if ! echo "$name" | grep -Eq '^[a-z0-9]+(-[a-z0-9]+)*$'; then
    record "WARN" "$name" "directory name not kebab-case: '$name'"
    return 1
  fi
  record "OK" "$name" "directory name follows kebab-case"
  return 0
}

# ─── Check 4: Cross-references to other skills ──────────
check_cross_references() {
  local dir="$1" name skill_file
  name=$(basename "$dir")
  skill_file="$dir/SKILL.md"

  # Use grep -E for cross-platform compatibility
  local refs
  refs=$(grep -oE '(universal-[a-z][a-z0-9]*(-[a-z0-9]+)*|setup-exam-prompt)' "$skill_file" 2>/dev/null | sort -u || true)

  if [ -z "$refs" ]; then
    return 0
  fi

  local bad_refs=()
  while IFS= read -r ref; do
    [ -z "$ref" ] && continue
    case "$ref" in
      universal-"$name"|"$name") continue ;;
    esac

    if [ -f "$SKILLS_JSON" ]; then
      if ! python3 -c "
import json, sys
s = json.load(open('$SKILLS_JSON'))
names = [sk['name'] for sk in s.get('skills', [])]
ref = '$ref'
# Exact match check
if ref in names:
    sys.exit(0)
# Prefix of a real skill name -> likely ASCII art truncation, skip
if any(n.startswith(ref) for n in names):
    sys.exit(0)
sys.exit(1)
" 2>/dev/null; then
        bad_refs+=("$ref")
      fi
    fi
  done <<< "$refs"

  if [ ${#bad_refs[@]} -gt 0 ]; then
    record "WARN" "$name" "references to unknown skills: ${bad_refs[*]}"
  fi
  return 0
}

# ─── Check 5: Trailing whitespace / line endings ────────
check_formatting() {
  local dir="$1" name skill_file
  name=$(basename "$dir")
  skill_file="$dir/SKILL.md"

  if grep -E '[[:space:]]$' "$skill_file" 2>/dev/null | head -1 | grep -q .; then
    record "WARN" "$name" "trailing whitespace found"
  fi

  # Check for CRLF using grep -E (cross-platform)
  if grep -E $'\r' "$skill_file" 2>/dev/null | head -1 | grep -q .; then
    record "WARN" "$name" "Windows line endings (CRLF) found"
  fi
}

# ─── Check 9: YAML frontmatter schema via Python yaml ────
check_frontmatter_schema() {
  local dir="$1" name skill_file
  name=$(basename "$dir")
  skill_file="$dir/SKILL.md"

  local result
  local py_script
  py_script=$(cat << 'PYEOF'
import sys, yaml, re, os

with open(os.environ['SKILL_FILE']) as f:
    content = f.read()
parts = content.split('---', 2)
if len(parts) < 3:
    print('FAIL:no frontmatter delimiters')
    sys.exit(1)
try:
    data = yaml.safe_load(parts[1])
except Exception as e:
    print(f'FAIL:YAML parse: {e}')
    sys.exit(1)
if not isinstance(data, dict):
    print('FAIL:not a YAML dict')
    sys.exit(1)

errors = []

if 'name' not in data or not isinstance(data['name'], str) or not data['name'].strip():
    errors.append('FAIL:missing or empty name')
elif not re.match(r'^[a-z][a-z0-9]*(-[a-z0-9]+)*$', data['name']):
    errors.append("FAIL:name not kebab-case: '{n}'".format(n=data['name']))

if 'description' not in data:
    errors.append('FAIL:missing description')
elif not isinstance(data['description'], str) or not data['description'].strip():
    errors.append('FAIL:empty description')
elif len(data['description'].strip()) < 20:
    errors.append("WARN:description short ({n} chars)".format(n=len(data['description'].strip())))

if 'version' in data:
    v = str(data['version'])
    if not re.match(r'^\d+\.\d+\.\d+$', v):
        errors.append("WARN:version not semver: '{v}'".format(v=v))

allowed = {'name', 'description', 'version', 'trigger'}
for field in data:
    if field not in allowed:
        errors.append("WARN:unknown field '{f}'".format(f=field))

if errors:
    for e in errors:
        print(e)
    sys.exit(1)
print('OK')
PYEOF
)
  result=$(SKILL_FILE="$skill_file" python3 -c "$py_script" 2>/dev/null) || true

  if [ -z "$result" ]; then
    return 0
  fi

  while IFS= read -r line; do
    [ -z "$line" ] && continue
    case "$line" in
      OK) record "OK" "$name" "frontmatter schema valid" ;;
      FAIL:*) record "FAIL" "$name" "${line#FAIL:}" ;;
      WARN:*) record "WARN" "$name" "${line#WARN:}" ;;
    esac
  done <<< "$result"
}

# ─── Check 6: No orphan directories ─────────────────────
check_orphans() {
  local orphans=0
  for dir in "$SKILLS_DIR"/*/; do
    if [ ! -f "$dir/SKILL.md" ]; then
      name=$(basename "$dir")
      record "FAIL" "$name" "orphan directory — no SKILL.md"
      orphans=$((orphans + 1))
    fi
  done
  if [ "$orphans" -eq 0 ]; then
    record "OK" "(all)" "no orphan skill directories"
  fi
}

# ─── Check 7: skills.json sync ──────────────────────────
check_skills_json() {
  if [ ! -f "$SKILLS_JSON" ]; then
    record "WARN" "skills.json" "file not found — cannot validate"
    return 0
  fi

  local disk_skills json_skills
  disk_skills=$(find "$SKILLS_DIR" -mindepth 1 -maxdepth 1 -type d | wc -l)
  json_skills=$(python3 -c "
import json
s = json.load(open('$SKILLS_JSON'))
print(len(s.get('skills', [])))
" 2>/dev/null || echo "0")

  if [ "$disk_skills" -ne "$json_skills" ]; then
    record "WARN" "skills.json" "lists $json_skills skills but disk has $disk_skills — out of sync"
  else
    record "OK" "skills.json" "count matches disk ($disk_skills skills)"
  fi
}

# ─── Check 8: University registry sync ──────────────────
check_university_registry() {
  if [ ! -f "$REGISTRY" ]; then
    record "WARN" "university-registry.json" "not found — skipping"
    return 0
  fi

  local registry_dirs
  registry_dirs=$(python3 -c "
import json
r = json.load(open('$REGISTRY'))
for u in r.get('universities', []):
    d = u.get('directory', '')
    if d:
        print(d)
" 2>/dev/null || true)

  while IFS= read -r dir_name; do
    [ -z "$dir_name" ] && continue
    if [ ! -d "$REPO_ROOT/universities/$dir_name" ]; then
      record "WARN" "registry" "references '$dir_name' but directory does not exist"
    fi
  done <<< "$registry_dirs"

  # Check for university dirs not in registry
  for dir in "$REPO_ROOT/universities"/*/; do
    local dir_base
    dir_base=$(basename "$dir")
    [ "$dir_base" = "_TEMPLATE_" ] && continue
    [ "$dir_base" = "scripts" ] && continue

    if ! echo "$registry_dirs" | grep -Fxq "$dir_base" 2>/dev/null; then
      record "WARN" "disk" "universities/$dir_base not in registry"
    fi
  done
}

# ─── Run validation on single skill ─────────────────────
validate_one() {
  local dir="$1"
  check_skill_file_exists "$dir" || return
  check_frontmatter "$dir" || true
  check_frontmatter_schema "$dir" || true
  check_directory_name "$dir" || true
  check_cross_references "$dir" || true
  check_formatting "$dir" || true
}

# ─── Main ────────────────────────────────────────────────
echo "=== Exam Prompt — Comprehensive Skill Validation ==="
echo ""

if [ -n "$TARGET_SKILL" ]; then
  if [ -d "$SKILLS_DIR/$TARGET_SKILL" ]; then
    validate_one "$SKILLS_DIR/$TARGET_SKILL"
  else
    echo "FAIL: skill '$TARGET_SKILL' not found"
    exit 1
  fi
else
  check_orphans

  echo ""
  echo "── Validating individual skills ──"
  for dir in "$SKILLS_DIR"/*/; do
    [ ! -d "$dir" ] && continue
    validate_one "$dir"
  done

  echo ""
  echo "── Global checks ──"
  check_skills_json
  check_university_registry
fi

echo ""
echo "=== Summary ==="
echo "  Errors:   $ERRORS"
echo "  Warnings: $WARNINGS"

if [ "$JSON_MODE" = true ]; then
  echo ""
  echo "--- JSON OUTPUT ---"
  python3 -c "
import json
results = []
for r in """${RESULTS[*]}""":
    results.append(json.loads(r))
print(json.dumps({'errors': $ERRORS, 'warnings': $WARNINGS, 'results': results}, indent=2))
" 2>/dev/null || echo "{\"error\": \"JSON output failed\"}"
fi

[ "$ERRORS" -gt 0 ] && exit 1
exit 0
