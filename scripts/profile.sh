#!/usr/bin/env bash
# profile.sh — Student Profile Configuration
# Usage: bash scripts/profile.sh [command]
#
# Lock-in mechanism: Creates a persistent student profile so the AI
# knows your university, subjects, and exam pattern without re-asking.
#
# Commands:
#   bash scripts/profile.sh           # Interactive setup
#   bash scripts/profile.sh show      # Show current profile
#   bash scripts/profile.sh edit      # Edit profile
#   bash scripts/profile.sh reset     # Delete profile and start fresh
#   bash scripts/profile.sh path      # Print profile path
#   bash scripts/profile.sh env       # Print profile as shell env vars (for sourcing)
#
# The profile is stored at ~/.exam-prompt/profile.json

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

PROFILE_DIR="$HOME/.exam-prompt"
PROFILE_PATH="$PROFILE_DIR/profile.json"

# --- Help ---
if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  echo "Usage: bash scripts/profile.sh [command]"
  echo ""
  echo "Commands:"
  echo "  (no command)    Interactive profile setup wizard"
  echo "  show            Display current profile"
  echo "  edit            Edit profile in your default editor"
  echo "  reset           Delete profile and start fresh"
  echo "  path            Print the profile file path"
  echo "  env             Print profile as shell environment variables"
  echo "  json            Print raw JSON profile"
  echo "  validate        Validate profile structure"
  echo "  --help, -h      Show this help"
  exit 0
fi

# --- Ensure profile directory ---
mkdir -p "$PROFILE_DIR"

# --- Default profile structure ---
create_default_profile() {
  cat <<'JSONEOF'
{
  "version": "1.0",
  "created": "",
  "updated": "",
  "student": {
    "name": "",
    "university": "",
    "department": "",
    "program": "",
    "year": "",
    "semester": ""
  },
  "exam": {
    "pattern": "",
    "default_marks": 70,
    "default_duration_minutes": 150,
    "preferred_language": "english"
  },
  "subjects": [],
  "settings": {
    "handwriting_size": "medium",
    "default_note_format": "cornell",
    "show_time_budget": true,
    "show_marks": true
  }
}
JSONEOF
}

# --- Validate profile ---
validate_profile() {
  if [[ ! -f "$PROFILE_PATH" ]]; then
    echo -e "${RED}No profile found. Run: bash scripts/profile.sh${NC}"
    return 1
  fi
  
  # Check it's valid JSON
  if ! python3 -c "import json; json.load(open('$PROFILE_PATH'))" 2>/dev/null; then
    echo -e "${RED}Invalid JSON in profile. Run: bash scripts/profile.sh reset${NC}"
    return 1
  fi
  
  # Check required fields
  local REQUIRED_FIELDS=("student.university" "exam.pattern" "student.department")
  for field in "${REQUIRED_FIELDS[@]}"; do
    if ! python3 -c "
import json,sys
p=json.load(open('$PROFILE_PATH'))
v=p
for k in '$field'.split('.'):
    v=v.get(k,{})
    if not v:
        sys.exit(1)
" 2>/dev/null; then
      echo -e "${YELLOW}⚠ Profile is missing: ${field}${NC}"
      return 1
    fi
  done
  
  return 0
}

# --- Show profile ---
show_profile() {
  if [[ ! -f "$PROFILE_PATH" ]]; then
    echo -e "${YELLOW}No profile found. Run: bash scripts/profile.sh${NC}"
    return 1
  fi
  
  echo -e "${CYAN}═══════════════════════════════════════════${NC}"
  echo -e "${CYAN}  Student Profile${NC}"
  echo -e "${CYAN}═══════════════════════════════════════════${NC}"
  echo ""
  
  python3 -c "
import json, sys
p = json.load(open('$PROFILE_PATH'))
s = p.get('student', {})
e = p.get('exam', {})
subs = p.get('subjects', [])
st = p.get('settings', {})

print(f'  🌍  University:   {s.get(\"university\", \"-\")}')
print(f'  🏫  Department:   {s.get(\"department\", \"-\")}')
print(f'  📚  Program:      {s.get(\"program\", \"-\")}')
print(f'  📖  Year/Sem:     {s.get(\"year\", \"-\")}/{s.get(\"semester\", \"-\")}')
print(f'  📋  Exam Pattern: {e.get(\"pattern\", \"-\")}')
print(f'  📝  Default Marks:{e.get(\"default_marks\", 70)}')
print(f'  ⏱   Duration:     {e.get(\"default_duration_minutes\", 150)} min')
print(f'  🌐  Language:     {e.get(\"preferred_language\", \"english\")}')
print(f'  ✍️   Handwriting:  {st.get(\"handwriting_size\", \"medium\")}')
print(f'  📓  Note Format:  {st.get(\"default_note_format\", \"cornell\")}')
if subs:
    print(f'  📖  Subjects ({len(subs)}):')
    for sub in subs:
        print(f'       • {sub}')
created = p.get('created', '')
updated = p.get('updated', '')
if created:
    print(f'')
    print(f'  Created: {created}')
    print(f'  Updated: {updated}')
"
  
  echo ""
  echo -e "${YELLOW}To edit: bash scripts/profile.sh edit${NC}"
  echo -e "${YELLOW}To reset: bash scripts/profile.sh reset${NC}"
}

# --- Interactive setup ---
interactive_setup() {
  echo -e "${CYAN}═══════════════════════════════════════════${NC}"
  echo -e "${CYAN}  Exam-Prompt Student Profile Setup${NC}"
  echo -e "${CYAN}  Set once — the AI remembers you forever${NC}"
  echo -e "${CYAN}═══════════════════════════════════════════${NC}"
  echo ""
  
  # Load existing if present
  local PROFILE
  if [[ -f "$PROFILE_PATH" ]]; then
    PROFILE=$(cat "$PROFILE_PATH")
    echo -e "${YELLOW}Existing profile found. Press Enter to keep current values.${NC}"
    echo ""
  else
    PROFILE=$(create_default_profile)
  fi
  
  # Parse current values
  local CUR_UNIV CUR_DEPT CUR_PROG CUR_YEAR CUR_SEM CUR_PATTERN CUR_MARKS CUR_DUR CUR_LANG CUR_HAND CUR_NOTE
  CUR_UNIV=$(echo "$PROFILE" | python3 -c "import json,sys; p=json.load(sys.stdin); print(p.get('student',{}).get('university',''))" 2>/dev/null || echo "")
  CUR_DEPT=$(echo "$PROFILE" | python3 -c "import json,sys; p=json.load(sys.stdin); print(p.get('student',{}).get('department',''))" 2>/dev/null || echo "")
  CUR_PROG=$(echo "$PROFILE" | python3 -c "import json,sys; p=json.load(sys.stdin); print(p.get('student',{}).get('program',''))" 2>/dev/null || echo "")
  CUR_YEAR=$(echo "$PROFILE" | python3 -c "import json,sys; p=json.load(sys.stdin); print(p.get('student',{}).get('year',''))" 2>/dev/null || echo "")
  CUR_SEM=$(echo "$PROFILE" | python3 -c "import json,sys; p=json.load(sys.stdin); print(p.get('student',{}).get('semester',''))" 2>/dev/null || echo "")
  CUR_PATTERN=$(echo "$PROFILE" | python3 -c "import json,sys; p=json.load(sys.stdin); print(p.get('exam',{}).get('pattern',''))" 2>/dev/null || echo "")
  CUR_MARKS=$(echo "$PROFILE" | python3 -c "import json,sys; p=json.load(sys.stdin); print(p.get('exam',{}).get('default_marks',70))" 2>/dev/null || echo "70")
  CUR_DUR=$(echo "$PROFILE" | python3 -c "import json,sys; p=json.load(sys.stdin); print(p.get('exam',{}).get('default_duration_minutes',150))" 2>/dev/null || echo "150")
  CUR_LANG=$(echo "$PROFILE" | python3 -c "import json,sys; p=json.load(sys.stdin); print(p.get('exam',{}).get('preferred_language','english'))" 2>/dev/null || echo "english")
  CUR_HAND=$(echo "$PROFILE" | python3 -c "import json,sys; p=json.load(sys.stdin); print(p.get('settings',{}).get('handwriting_size','medium'))" 2>/dev/null || echo "medium")
  CUR_NOTE=$(echo "$PROFILE" | python3 -c "import json,sys; p=json.load(sys.stdin); print(p.get('settings',{}).get('default_note_format','cornell'))" 2>/dev/null || echo "cornell")
  
  # University
  read -p "$(echo -e "${BLUE}University${NC} [${CUR_UNIV:-SPPU}]: ")" INPUT
  UNIV="${INPUT:-${CUR_UNIV:-SPPU}}"
  
  # Department
  read -p "$(echo -e "${BLUE}Department${NC} [${CUR_DEPT:-Computer Engineering}]: ")" INPUT
  DEPT="${INPUT:-${CUR_DEPT:-Computer Engineering}}"
  
  # Program
  read -p "$(echo -e "${BLUE}Program${NC} (BE/BTech/ME/MTech/BCA/MCA) [${CUR_PROG:-BE}]: ")" INPUT
  PROG="${INPUT:-${CUR_PROG:-BE}}"
  
  # Year
  read -p "$(echo -e "${BLUE}Year${NC} (FE/SE/TE/BE) [${CUR_YEAR:-FE}]: ")" INPUT
  YEAR="${INPUT:-${CUR_YEAR:-FE}}"
  
  # Semester
  read -p "$(echo -e "${BLUE}Semester${NC} (1-8) [${CUR_SEM:-1}]: ")" INPUT
  SEM="${INPUT:-${CUR_SEM:-1}}"
  
  # Exam pattern
  echo ""
  echo -e "${YELLOW}Exam Patterns:${NC}"
  echo "  1) SPPU 2019 Pattern (6 units, 4 OR pairs, 70 marks, 2.5 hrs)"
  echo "  2) SPPU 2024 Pattern (5 units, 5 OR pairs, 70 marks, 2.5 hrs)"
  echo "  3) VTU Pattern (5 modules, OR within module, 100 marks, 3 hrs)"
  echo "  4) JNTU Pattern (8 units, Part A+B, 70 marks, 3 hrs)"
  echo "  5) Mumbai Univ Pattern (6 units, Q1 compulsory, 80 marks, 3 hrs)"
  echo "  6) AKTU Pattern (5 units, A=MCQ B=short C=long, 100 marks, 3 hrs)"
  echo "  7) Generic (custom)"
  read -p "$(echo -e "${BLUE}Select pattern${NC} [${CUR_PATTERN:-1}]: ")" PATTERN_INPUT
  PATTERN_INPUT="${PATTERN_INPUT:-${CUR_PATTERN:-1}}"
  case "$PATTERN_INPUT" in
    1|"SPPU 2019") PATTERN="SPPU 2019"; MARKS=70; DUR=150 ;;
    2|"SPPU 2024") PATTERN="SPPU 2024"; MARKS=70; DUR=150 ;;
    3|"VTU") PATTERN="VTU"; MARKS=100; DUR=180 ;;
    4|"JNTU") PATTERN="JNTU"; MARKS=70; DUR=180 ;;
    5|"Mumbai") PATTERN="Mumbai Univ"; MARKS=80; DUR=180 ;;
    6|"AKTU") PATTERN="AKTU"; MARKS=100; DUR=180 ;;
    *) PATTERN="$PATTERN_INPUT"; MARKS="$CUR_MARKS"; DUR="$CUR_DUR" ;;
  esac
  
  # Custom marks/duration if generic
  if [[ "$PATTERN_INPUT" == "7" || "$PATTERN_INPUT" == "Generic" || "$PATTERN_INPUT" == "generic" ]]; then
    read -p "$(echo -e "${BLUE}Total marks${NC} [${MARKS}]: ")" INPUT
    MARKS="${INPUT:-$MARKS}"
    read -p "$(echo -e "${BLUE}Duration (minutes)${NC} [${DUR}]: ")" INPUT
    DUR="${INPUT:-$DUR}"
  fi
  
  # Language
  echo ""
  read -p "$(echo -e "${BLUE}Preferred language${NC} (english/hindi/marathi) [${CUR_LANG:-english}]: ")" INPUT
  LANG="${INPUT:-${CUR_LANG:-english}}"
  
  # Handwriting size
  read -p "$(echo -e "${BLUE}Handwriting size${NC} (small/medium/large) [${CUR_HAND:-medium}]: ")" INPUT
  HAND="${INPUT:-${CUR_HAND:-medium}}"
  
  # Default note format
  read -p "$(echo -e "${BLUE}Default note format${NC} (cornell/outline/mindmap/flowchart/qa) [${CUR_NOTE:-cornell}]: ")" INPUT
  NOTE="${INPUT:-${CUR_NOTE:-cornell}}"
  
  # Subjects
  echo ""
  echo -e "${YELLOW}Enter subjects you're currently studying (one per line).${NC}"
  echo -e "${YELLOW}Type 'done' when finished, or press Enter to skip.${NC}"
  SUBJECTS=()
  while true; do
    read -p "$(echo -e "${BLUE}Subject${NC}: ")" INPUT
    [[ "$INPUT" == "" || "$INPUT" == "done" ]] && break
    SUBJECTS+=("$INPUT")
  done
  
  # Build JSON
  NOW=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  
  # Write subjects to temp file for safe JSON transfer to Python
  if [[ ${#SUBJECTS[@]} -gt 0 ]]; then
    printf '%s\n' "${SUBJECTS[@]}" | python3 -c "
import json, sys
subs = [line.rstrip('\n') for line in sys.stdin if line.strip()]
with open('/tmp/exam_prompt_subjects.json', 'w') as f:
    json.dump(subs, f)
" 2>/dev/null || echo '[]' > /tmp/exam_prompt_subjects.json
  else
    echo '[]' > /tmp/exam_prompt_subjects.json
  fi
  
  python3 -c "
import json, sys

profile = {}
try:
    with open('$PROFILE_PATH', 'r') as f:
        profile = json.load(f)
except (FileNotFoundError, json.JSONDecodeError):
    profile = {}

profile['version'] = '1.0'
profile['created'] = profile.get('created', '$NOW')
profile['updated'] = '$NOW'
profile['student'] = {
    'name': profile.get('student', {}).get('name', ''),
    'university': '$UNIV',
    'department': '$DEPT',
    'program': '$PROG',
    'year': '$YEAR',
    'semester': '$SEM'
}
profile['exam'] = {
    'pattern': '$PATTERN',
    'default_marks': $MARKS,
    'default_duration_minutes': $DUR,
    'preferred_language': '$LANG'
}
profile['subjects'] = $(python3 -c "
import json, sys
try:
    subs = json.load(open('/tmp/exam_prompt_subjects.json'))
    print(json.dumps(subs))
except:
    print(json.dumps([]))
" 2>/dev/null || echo '[]')
profile['settings'] = {
    'handwriting_size': '$HAND',
    'default_note_format': '$NOTE',
    'show_time_budget': True,
    'show_marks': True
}

with open('$PROFILE_PATH', 'w') as f:
    json.dump(profile, f, indent=2)

print('Profile saved to: $PROFILE_PATH')
" 2>&1 || {
    # Fallback: write directly
    cat > "$PROFILE_PATH" << JSONEOF
{
  "version": "1.0",
  "created": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "updated": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "student": {
    "name": "",
    "university": "$UNIV",
    "department": "$DEPT",
    "program": "$PROG",
    "year": "$YEAR",
    "semester": "$SEM"
  },
  "exam": {
    "pattern": "$PATTERN",
    "default_marks": $MARKS,
    "default_duration_minutes": $DUR,
    "preferred_language": "$LANG"
  },
  "subjects": [],
  "settings": {
    "handwriting_size": "$HAND",
    "default_note_format": "$NOTE",
    "show_time_budget": true,
    "show_marks": true
  }
}
JSONEOF
  }
  
  echo ""
  echo -e "${GREEN}═══════════════════════════════════════════${NC}"
  echo -e "${GREEN}  Profile saved! The AI will now remember your preferences.${NC}"
  echo -e "${GREEN}  Run 'bash scripts/profile.sh show' to view.${NC}"
  echo -e "${GREEN}═══════════════════════════════════════════${NC}"
}

# --- Main ---
COMMAND="${1:-}"

case "$COMMAND" in
  show)
    show_profile
    ;;
  edit)
    if [[ ! -f "$PROFILE_PATH" ]]; then
      interactive_setup
    else
      ${EDITOR:-vim} "$PROFILE_PATH"
      echo -e "${GREEN}Profile updated.${NC}"
      validate_profile || true
    fi
    ;;
  reset)
    rm -f "$PROFILE_PATH"
    echo -e "${YELLOW}Profile deleted.${NC}"
    interactive_setup
    ;;
  path)
    echo "$PROFILE_PATH"
    ;;
  env)
    if [[ ! -f "$PROFILE_PATH" ]]; then
      echo -e "${RED}No profile found.${NC}" >&2
      exit 1
    fi
    echo "# Exam-Prompt profile sourced from $PROFILE_PATH"
    python3 -c "
import json
p = json.load(open('$PROFILE_PATH'))
s = p.get('student', {})
e = p.get('exam', {})
print(f'export EXAM_UNIVERSITY=\"{s.get(\"university\",\"\")}\"')
print(f'export EXAM_DEPARTMENT=\"{s.get(\"department\",\"\")}\"')
print(f'export EXAM_PROGRAM=\"{s.get(\"program\",\"\")}\"')
print(f'export EXAM_YEAR=\"{s.get(\"year\",\"\")}\"')
print(f'export EXAM_SEMESTER=\"{s.get(\"semester\",\"\")}\"')
print(f'export EXAM_PATTERN=\"{e.get(\"pattern\",\"\")}\"')
print(f'export EXAM_MARKS={e.get(\"default_marks\",70)}')
print(f'export EXAM_DURATION={e.get(\"default_duration_minutes\",150)}')
print(f'export EXAM_LANGUAGE=\"{e.get(\"preferred_language\",\"english\")}\"')
print(f'export EXAM_HANDWRITING=\"{p.get(\"settings\",{}).get(\"handwriting_size\",\"medium\")}\"')
"
    ;;
  json)
    if [[ ! -f "$PROFILE_PATH" ]]; then
      echo "{}"
    else
      cat "$PROFILE_PATH"
    fi
    ;;
  validate)
    if validate_profile; then
      echo -e "${GREEN}✓ Profile is valid.${NC}"
      show_profile
    fi
    ;;
  *)
    interactive_setup
    ;;
esac
