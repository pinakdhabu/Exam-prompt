#!/usr/bin/env bash
# ============================================================
# init-project.sh — Initialize Exam Prompt Project
#
# Detects university, installs deps, validates setup, and
# generates AGENTS.md + session profile.
#
# Usage:
#   bash scripts/init-project.sh                    # Full init (detect uni)
#   bash scripts/init-project.sh --university ID    # Force university
#   bash scripts/init-project.sh --dry-run          # Show what would happen
#   bash scripts/init-project.sh --quick            # Skip interactive prompts
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

# ─── Config ──────────────────────────────────────────────────
DRY_RUN=false
QUICK=false
FORCE_UNIVERSITY=""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info()  { echo -e "${BLUE}[INFO]${NC} $*"; }
ok()    { echo -e "${GREEN}[OK]${NC}   $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; }
fail()  { echo -e "${RED}[FAIL]${NC} $*"; }

# ─── Parse args ──────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case "$1" in
    --university) FORCE_UNIVERSITY="$2"; shift 2 ;;
    --dry-run) DRY_RUN=true; shift ;;
    --quick) QUICK=true; shift ;;
    *) fail "Unknown option: $1"; exit 1 ;;
  esac
done

echo "╔══════════════════════════════════════════════════════╗"
echo "║   Exam Prompt — Project Initializer                 ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""

# ─── Step 1: Detect University ──────────────────────────────
detect_university() {
  local registry="$REPO_ROOT/universities/university-registry.json"

  if [ -n "$FORCE_UNIVERSITY" ]; then
    echo "$FORCE_UNIVERSITY"
    return
  fi

  # Check for existing session profile
  if [ -f "$REPO_ROOT/deps/session-profile.json" ]; then
    local existing
    existing=$(python3 -c "import json; print(json.load(open('deps/session-profile.json')).get('university', ''))" 2>/dev/null || echo "")
    if [ -n "$existing" ]; then
      info "Found existing session profile: $existing" >&2
      echo "$existing"
      return
    fi
  fi

  # Use default from registry
  if [ -f "$registry" ]; then
    local default
    default=$(python3 -c "
import json
r = json.load(open('$registry'))
print(r.get('default_university', ''))
" 2>/dev/null || echo "")
    if [ -n "$default" ]; then
      info "Using default university: $default" >&2
      echo "$default"
      return
    fi
  fi

  warn "Could not detect university. Defaulting to SAVITRIBAI_PHULE_PUNE_UNIVERSITY" >&2
  echo "SAVITRIBAI_PHULE_PUNE_UNIVERSITY"
}

detect_univ_name() {
  UNIVERSITY_DIR=$(detect_university)
  info "University: $UNIVERSITY_DIR"
}

detect_univ_name

# ─── Step 2: Install Dependencies ────────────────────────────
install_deps() {
  info "Installing npm dependencies..."

  if [ "$DRY_RUN" = true ]; then
    info "[DRY-RUN] Would run: npm install"
    return
  fi

  if [ ! -f "package.json" ]; then
    fail "package.json not found. Are you in the project root?"
    exit 1
  fi

  npm install --yes 2>/dev/null || {
    warn "npm install had issues — continuing anyway"
  }
  ok "Dependencies installed"
}

# ─── Step 3: Create Necessary Directories ────────────────────
create_dirs() {
  info "Creating project directories..."

  local dirs=(
    "pyq-downloads"
    "pdf_output"
    "_diagrams"
  )

  for d in "${dirs[@]}"; do
    if [ ! -d "$d" ]; then
      if [ "$DRY_RUN" = true ]; then
        info "[DRY-RUN] Would create: $d"
      else
        mkdir -p "$d"
        touch "$d/.gitkeep"
        ok "Created: $d/"
      fi
    else
      info "Exists: $d/"
    fi
  done
}

# ─── Step 4: Validate Skills ─────────────────────────────────
validate_skills() {
  info "Validating skills..."

  if [ "$DRY_RUN" = true ]; then
    info "[DRY-RUN] Would run: bash scripts/validate-skills.sh"
    return
  fi

  if bash scripts/validate-skills.sh 2>/dev/null; then
    ok "All skills valid"
  else
    warn "Some skills have issues — check output above"
  fi
}

# ─── Step 5: Generate AGENTS.md ──────────────────────────────
generate_agents() {
  info "Generating AGENTS.md from skill manifests..."

  if [ "$DRY_RUN" = true ]; then
    info "[DRY-RUN] Would run: bash scripts/generate-agents-md.sh"
    return
  fi

  if [ -f "scripts/generate-agents-md.sh" ]; then
    bash scripts/generate-agents-md.sh && ok "AGENTS.md generated" || warn "AGENTS.md generation had issues"
  else
    warn "generate-agents-md.sh not found — skipping"
  fi
}

# ─── Step 6: Create Session Profile ──────────────────────────
create_session_profile() {
  local profile="$REPO_ROOT/deps/session-profile.json"

  if [ -f "$profile" ]; then
    info "Session profile already exists at deps/session-profile.json"
    return
  fi

  if [ "$DRY_RUN" = true ]; then
    info "[DRY-RUN] Would create deps/session-profile.json"
    return
  fi

  mkdir -p "$REPO_ROOT/deps"

  cat > "$profile" << PROFILEEOF
{
  "university": "$UNIVERSITY_DIR",
  "session_type": "exam_prep",
  "created_at": "$(date -u +%Y-%m-%dT%H:%M:%SZ 2>/dev/null || date -u +%Y-%m-%dT%H:%M:%SZ)",
  "version": "1.0.0"
}
PROFILEEOF
  ok "Created session profile: deps/session-profile.json"
}

# ─── Step 7: Verify Node.js ──────────────────────────────────
check_node() {
  if ! command -v node &>/dev/null; then
    fail "Node.js is required but not installed. Install Node.js 18+ from https://nodejs.org"
    exit 1
  fi

  local node_ver
  node_ver=$(node -v | sed 's/v//' | cut -d. -f1)
  if [ "$node_ver" -lt 18 ] 2>/dev/null; then
    fail "Node.js 18+ required. Found: $(node -v)"
    exit 1
  fi
  ok "Node.js $(node -v)"
}

# ─── Step 8: Verify University Config ────────────────────────
check_university_config() {
  local uni_config="$REPO_ROOT/universities/$UNIVERSITY_DIR/config.json"

  if [ -f "$uni_config" ]; then
    ok "University config found: universities/$UNIVERSITY_DIR/config.json"

    local patterns
    patterns=$(python3 -c "
import json
c = json.load(open('$uni_config'))
pats = c.get('patterns', {}).get('available', [])
print(' '.join([p.get('id','') for p in pats]))
" 2>/dev/null || echo "")
    if [ -n "$patterns" ]; then
      info "  Available patterns: $patterns"
    fi
  else
    warn "University config not found — run 'npm run setup' first"
  fi
}

# ─── Main ────────────────────────────────────────────────────
echo "── Step 1: Checking Node.js ──"
check_node

echo ""
echo "── Step 2: Installing Dependencies ──"
install_deps

echo ""
echo "── Step 3: Creating Directories ──"
create_dirs

echo ""
echo "── Step 4: Validating Skills ──"
validate_skills

echo ""
echo "── Step 5: Generating AGENTS.md ──"
generate_agents

echo ""
echo "── Step 6: Session Profile ──"
create_session_profile

echo ""
echo "── Step 7: University Config ──"
check_university_config

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║   Init Complete!                                     ║"
echo "║                                                      ║"
echo "║   University: $UNIVERSITY_DIR"
echo "║                                                      ║"
echo "║   Next steps:                                        ║"
echo "║     npm run setup       — Full dependency install    ║"
echo "║     bash scripts/detect-university.sh — Show detected uni"
echo "║     npm run quickstart  — Generate sample PDF       ║"
echo "╚══════════════════════════════════════════════════════╝"
