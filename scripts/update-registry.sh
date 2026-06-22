#!/usr/bin/env bash
# ============================================================
# update-registry.sh — Auto-sync university-registry.json
#
# Scans universities/ directories and auto-updates the
# registry to reflect actual disk state.
#
# Usage:
#   bash scripts/update-registry.sh              # Update in-place
#   bash scripts/update-registry.sh --dry-run    # Show changes only
#   bash scripts/update-registry.sh --json       # Output JSON diff
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REGISTRY="$REPO_ROOT/universities/university-registry.json"
UNIVERSITIES_DIR="$REPO_ROOT/universities"

DRY_RUN=false
JSON_MODE=false

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
info()  { echo -e "${BLUE}[INFO]${NC} $*"; }
ok()    { echo -e "${GREEN}[OK]${NC}   $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; }

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=true; shift ;;
    --json) JSON_MODE=true; shift ;;
    *) shift ;;
  esac
done

TMP_OUT=$(mktemp)

python3 "$REPO_ROOT/scripts/_update_registry.py" \
  "$REGISTRY" "$UNIVERSITIES_DIR" "$DRY_RUN" "$JSON_MODE" 2>&1 | tee "$TMP_OUT"

# Extract JSON output if --json flag
if [ "$JSON_MODE" = true ]; then
  echo ""
  echo "--- JSON OUTPUT ---"
  sed -n '/^---JSON---$/,$p' "$TMP_OUT" | tail -n +2
fi

# If not dry-run, the Python script already wrote the file
if grep -q "^Written:" "$TMP_OUT" 2>/dev/null; then
  ok "Registry synced"
elif grep -q "^\[DRY-RUN\]" "$TMP_OUT" 2>/dev/null; then
  info "Dry run completed — no changes written"
fi

rm -f "$TMP_OUT"
