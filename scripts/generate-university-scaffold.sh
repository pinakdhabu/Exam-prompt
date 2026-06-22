#!/usr/bin/env bash
# ============================================================
# generate-university-scaffold.sh — Scaffold a new university
# from the _TEMPLATE_ with interactive prompts.
#
# Usage:
#   bash scripts/generate-university-scaffold.sh
#   bash scripts/generate-university-scaffold.sh --non-interactive
#   bash scripts/generate-university-scaffold.sh --dry-run
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE_DIR="$REPO_ROOT/universities/_TEMPLATE_"
REGISTRY="$REPO_ROOT/universities/university-registry.json"
UNIVERSITIES_DIR="$REPO_ROOT/universities"

DRY_RUN=false
NON_INTERACTIVE=false

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info()  { echo -e "${BLUE}[INFO]${NC} $*"; }
ok()    { echo -e "${GREEN}[OK]${NC}   $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; }
fail()  { echo -e "${RED}[FAIL]${NC} $*"; }

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=true; shift ;;
    --non-interactive) NON_INTERACTIVE=true; shift ;;
    *) fail "Unknown option: $1"; exit 1 ;;
  esac
done

if [ ! -d "$TEMPLATE_DIR" ]; then
  fail "Template not found at $TEMPLATE_DIR"
  exit 1
fi

echo "╔══════════════════════════════════════════════════════╗"
echo "║   University Scaffold Generator                     ║"
echo "║   Creates a new university from _TEMPLATE_          ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""

# ─── Collect university info ─────────────────────────────
if [ "$NON_INTERACTIVE" = true ]; then
  read -p "Full university name (e.g., Savitribai Phule Pune University): " FULL_NAME
  read -p "Short name (e.g., SPPU): " SHORT_NAME
  read -p "Country: " COUNTRY
  read -p "Type (public/private/central/state/deemed): " UNI_TYPE
  read -p "Exam system (semester/yearly/trimester): " EXAM_SYSTEM
  read -p "Default pattern ID (e.g., 2024): " DEFAULT_PATTERN
else
  info "Enter university details (press Enter for defaults):"
  echo ""

  DEFAULT_FULL="Example University"
  read -p "Full name [$DEFAULT_FULL]: " FULL_NAME
  FULL_NAME="${FULL_NAME:-$DEFAULT_FULL}"

  DEFAULT_SHORT="EXU"
  read -p "Short name [$DEFAULT_SHORT]: " SHORT_NAME
  SHORT_NAME="${SHORT_NAME:-$DEFAULT_SHORT}"

  DEFAULT_COUNTRY="Country"
  read -p "Country [$DEFAULT_COUNTRY]: " COUNTRY
  COUNTRY="${COUNTRY:-$DEFAULT_COUNTRY}"

  DEFAULT_TYPE="public"
  read -p "Type (public/private/central/state/deemed) [$DEFAULT_TYPE]: " UNI_TYPE
  UNI_TYPE="${UNI_TYPE:-$DEFAULT_TYPE}"

  DEFAULT_EXAM="semester"
  read -p "Exam system (semester/yearly/trimester) [$DEFAULT_EXAM]: " EXAM_SYSTEM
  EXAM_SYSTEM="${EXAM_SYSTEM:-$DEFAULT_EXAM}"

  DEFAULT_PATTERN="1.0"
  read -p "Default pattern ID [$DEFAULT_PATTERN]: " DEFAULT_PATTERN
  DEFAULT_PATTERN="${DEFAULT_PATTERN:-1.0}"
fi

# ─── Derive directory name ────────────────────────────────
DIR_NAME=$(echo "$FULL_NAME" | tr '[:lower:]' '[:upper:]' | sed 's/[^A-Z0-9]/_/g' | sed 's/__*/_/g' | sed 's/^_//;s/_$//')
UNI_ID=$(echo "$FULL_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//;s/-$//')

TARGET_DIR="$UNIVERSITIES_DIR/$DIR_NAME"

if [ -d "$TARGET_DIR" ]; then
  fail "University directory already exists: $DIR_NAME"
  exit 1
fi

echo ""
info "Scaffolding: $FULL_NAME ($SHORT_NAME)"
info "Directory: universities/$DIR_NAME"
info "ID: $UNI_ID"
echo ""

# ─── Create directory structure ───────────────────────────
if [ "$DRY_RUN" = true ]; then
  info "[DRY-RUN] Would create:"
  echo "  universities/$DIR_NAME/"
  echo "  universities/$DIR_NAME/config.json"
  echo "  universities/$DIR_NAME/branches/"
  echo "  universities/$DIR_NAME/patterns/"
  echo ""
  info "[DRY-RUN] Would register in university-registry.json"
  exit 0
fi

mkdir -p "$TARGET_DIR/branches"
mkdir -p "$TARGET_DIR/patterns"
ok "Created directory structure"

# ─── Generate config.json ─────────────────────────────────
cat > "$TARGET_DIR/config.json" << CONFIGEOF
{
  "\$schema": "exam-prompt-university-v1",
  "id": "$UNI_ID",
  "full_name": "$FULL_NAME",
  "short_name": "$SHORT_NAME",
  "aliases": [],
  "country": "$COUNTRY",
  "region": "asia-pacific",
  "type": "$UNI_TYPE",
  "website": "https://www.${UNI_ID}.edu",
  "established": $(date +%Y),
  "description": "$FULL_NAME — Add description here",
  "exam_system": "$EXAM_SYSTEM",
  "grading_system": "percentage",
  "academic_calendar": {
    "type": "$EXAM_SYSTEM",
    "details": "Odd semester: Jul-Dec, Even semester: Jan-Jun"
  },
  "patterns": {
    "default": "$DEFAULT_PATTERN",
    "available": [
      {
        "id": "$DEFAULT_PATTERN",
        "name": "$DEFAULT_PATTERN Pattern",
        "total_units": 5,
        "or_pairs": 5,
        "total_marks": 70,
        "time_hours": 2.5
      }
    ]
  },
  "branches": {
    "departments": []
  },
  "contributing": {
    "how_to_add": "See how-to-add.md in _TEMPLATE_",
    "maintainers_needed": true
  }
}
CONFIGEOF
ok "Created config.json"

# ─── Generate default pattern ─────────────────────────────
cat > "$TARGET_DIR/patterns/$DEFAULT_PATTERN.json" << PATTERNEOF
{
  "\$schema": "exam-prompt-pattern-v1",
  "id": "$DEFAULT_PATTERN",
  "name": "$DEFAULT_PATTERN Pattern",
  "description": "Default exam pattern for $FULL_NAME",
  "total_units": 5,
  "or_pairs": 5,
  "total_marks": 70,
  "time_hours": 2.5,
  "instructions": [
    "Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8, Q.9 or Q.10.",
    "Neat diagrams must be drawn wherever necessary.",
    "Figures to the right indicate full marks.",
    "Assume suitable data, if necessary."
  ],
  "unit_distribution": {
    "q1_q2": "Unit 1",
    "q3_q4": "Unit 2",
    "q5_q6": "Unit 3",
    "q7_q8": "Unit 4",
    "q9_q10": "Unit 5"
  }
}
PATTERNEOF
ok "Created default pattern: $DEFAULT_PATTERN.json"

# ─── Add to registry ──────────────────────────────────────
if [ -f "$REGISTRY" ]; then
  python3 -c "
import json, sys

registry = json.load(open('$REGISTRY'))

# Check for duplicate ID
for u in registry.get('universities', []):
    if u['id'] == '$UNI_ID':
        print(f'DUPLICATE: University with ID $UNI_ID already exists')
        sys.exit(1)

new_entry = {
    'id': '$UNI_ID',
    'directory': '$DIR_NAME',
    'full_name': '$FULL_NAME',
    'short_name': '$SHORT_NAME',
    'country': '$COUNTRY',
    'type': '$UNI_TYPE',
    'status': 'template-only',
    'maintained_by': None,
    'config_exists': True,
    'subjects_data': False,
    'patterns_data': True,
    'pyqs_available': False
}

registry.setdefault('universities', []).append(new_entry)
registry['universities'].sort(key=lambda x: x['full_name'].lower())

json.dump(registry, open('$REGISTRY', 'w'), indent=2)
print(f'Registered $UNI_ID in university-registry.json')
" && ok "Added to registry" || warn "Registry update failed — check university-registry.json"
fi

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║   University scaffolded successfully!               ║"
echo "║                                                      ║"
echo "║   Directory: universities/$DIR_NAME"
echo "║   Config:    universities/$DIR_NAME/config.json"
echo "║   Pattern:   universities/$DIR_NAME/patterns/$DEFAULT_PATTERN.json"
echo "║                                                      ║"
echo "║   Next steps:                                        ║"
echo "║     1. Edit config.json with real details            ║"
echo "║     2. Add branches/subjects in branches/            ║"
echo "║     3. Add more patterns if needed                   ║"
echo "║     4. Run bash scripts/init-project.sh to validate  ║"
echo "╚══════════════════════════════════════════════════════╝"
