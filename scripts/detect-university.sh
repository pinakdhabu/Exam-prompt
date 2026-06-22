#!/usr/bin/env bash
# ============================================================
# detect-university.sh — Detect Active University Configuration
#
# Scans universities/ for active (non-template) configs and
# reports the current university setup.
#
# Usage:
#   bash scripts/detect-university.sh              # Show current
#   bash scripts/detect-university.sh --list       # List all universities
#   bash scripts/detect-university.sh --active     # List only active configs
#   bash scripts/detect-university.sh --default    # Show default
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REGISTRY="$REPO_ROOT/universities/university-registry.json"
MODE="${1:-}"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

info()  { echo -e "${BLUE}$*${NC}"; }
active_color() { echo -e "${GREEN}$*${NC}"; }
template_color() { echo -e "${YELLOW}$*${NC}"; }

# ─── Check prerequisites ─────────────────────────────────────
if ! command -v python3 &>/dev/null; then
  echo "Error: python3 is required" >&2
  exit 1
fi

if [ ! -f "$REGISTRY" ]; then
  echo "Error: university-registry.json not found" >&2
  exit 1
fi

# ─── Modes ──────────────────────────────────────────────────
case "$MODE" in
  --list)
    echo "Available universities:"
    python3 -c "
import json
r = json.load(open('$REGISTRY'))
default = r.get('default_university', '')
for u in r.get('universities', []):
    status = u.get('status', '')
    if status == 'active':
        icon = '●'
    elif status == 'template-only':
        icon = '○'
    else:
        icon = '?'
    default_marker = ' [DEFAULT]' if u.get('directory') == default else ''
    print(f'  {icon}  {u[\"full_name\"]} ({u[\"short_name\"]}) — {status}{default_marker}')
"
    ;;

  --active)
    echo "Active (non-template) university configs:"
    python3 -c "
import json
r = json.load(open('$REGISTRY'))
default = r.get('default_university', '')
active_found = False
for u in r.get('universities', []):
    if u.get('status') == 'active':
        active_found = True
        dm = ' [DEFAULT]' if u.get('directory') == default else ''
        print(f'  ● {u[\"full_name\"]} ({u[\"short_name\"]}){dm}')
        print(f'    Directory: universities/{u[\"directory\"]}')
        print(f'    Config exists: {u.get(\"config_exists\", False)}')
        print(f'    Subjects data: {u.get(\"subjects_data\", False)}')
        print(f'    Patterns data: {u.get(\"patterns_data\", False)}')
        print(f'    PYQs available: {u.get(\"pyqs_available\", False)}')
if not active_found:
    print('  (no active university configs found)')
"
    ;;

  --default)
    python3 -c "
import json
r = json.load(open('$REGISTRY'))
default = r.get('default_university', 'NONE')
for u in r.get('universities', []):
    if u.get('directory') == default:
        print(f'{u[\"full_name\"]} ({u[\"short_name\"]})')
        print(f'Directory: universities/{u[\"directory\"]}')
        break
else:
    print(f'Default university: {default}')
"
    ;;

  *)
    # Show current university (from session or default)
    SESSION_FILE="$REPO_ROOT/deps/session-profile.json"
    if [ -f "$SESSION_FILE" ]; then
      echo "Current university (from session profile):"
      python3 -c "
import json
s = json.load(open('$SESSION_FILE'))
uni = s.get('university', 'unknown')
print(f'  University: {uni}')
print(f'  Session type: {s.get(\"session_type\", \"unknown\")}')
print(f'  Created: {s.get(\"created_at\", \"unknown\")}')
"
    else
      echo "No session profile found."
      echo "Run 'bash scripts/init-project.sh' to initialize."
      echo ""
      echo "Default university:"
      bash "$0" --default
    fi
    ;;

esac
