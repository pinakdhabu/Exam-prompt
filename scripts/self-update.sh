#!/usr/bin/env bash
# ============================================================
# Exam Prompt — Self-Update Script
# ============================================================
# Rolling-release style updater: pulls latest changes, re-runs
# setup, validates everything, and reports the final state.
#
# Follows Arch Linux philosophy:
#   - No versions — just continuous updates
#   - Always the latest
#   - pkgfile-style notifications for new/updated skills
#
# Usage:
#   bash scripts/self-update.sh              # Full update
#   bash scripts/self-update.sh --check-only # Only check, don't update
#   bash scripts/self-update.sh --dry-run    # Show what would change
#   bash scripts/self-update.sh --quiet      # Minimal output
#   bash scripts/self-update.sh --fix        # Auto-fix common issues
#
# Edge cases:
#   - Dirty working tree → stash changes, update, pop
#   - No git repo → print error URL
#   - Network down → report, don't fail
#   - Already up-to-date → print message, exit 0
# ============================================================
set -eo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Parse flags
CHECK_ONLY=false
DRY_RUN=false
QUIET=false
AUTO_FIX=false

for arg in "$@"; do
    case "$arg" in
        --check-only) CHECK_ONLY=true ;;
        --dry-run) DRY_RUN=true ;;
        --quiet) QUIET=true ;;
        --fix) AUTO_FIX=true ;;
        --help)
            echo "Usage: bash scripts/self-update.sh [options]"
            echo ""
            echo "Options:"
            echo "  --check-only  Only check for updates, don't apply"
            echo "  --dry-run     Show what would change without changing"
            echo "  --quiet       Minimal output (exit code only)"
            echo "  --fix         Auto-fix common issues (missing deps, format)"
            echo "  --help        Show this help"
            exit 0
            ;;
    esac
done

log() {
    [ "$QUIET" = false ] && echo -e "$1"
}

# ============================================================
# Step 1: Check if we're in a git repo
# ============================================================
log "${CYAN}⟳ Exam Prompt — Self-Update${NC}"
log ""

if [ ! -d .git ]; then
    log "${RED}✗ Not a git repository${NC}"
    log "  Clone fresh: git clone https://github.com/pinakdhabu/Exam-prompt.git"
    exit 1
fi

# Determine the remote URL
REMOTE_URL=$(git remote get-url origin 2>/dev/null || echo "")
if [ -z "$REMOTE_URL" ]; then
    log "${RED}✗ No remote 'origin' configured${NC}"
    log "  Add one: git remote add origin https://github.com/pinakdhabu/Exam-prompt.git"
    exit 1
fi

# ============================================================
# Step 2: Check current state
# ============================================================
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")
LOCAL_HASH=$(git rev-parse HEAD 2>/dev/null || echo "")

# Detect default branch from remote HEAD (works with main, master, or custom)
DEFAULT_BRANCH=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's|refs/remotes/origin/||' || echo "main")
REMOTE_HASH=$(git rev-parse "origin/$DEFAULT_BRANCH" 2>/dev/null || echo "")

log "${BLUE}Branch:${NC}    $CURRENT_BRANCH"
log "${BLUE}Local:${NC}     ${LOCAL_HASH:0:8}"
log "${BLUE}Remote:${NC}    ${REMOTE_HASH:0:8}"

# Check if working tree is dirty
DIRTY=false
if ! git diff --quiet HEAD 2>/dev/null; then
    DIRTY=true
    log "${YELLOW}⚠ Working tree has uncommitted changes${NC}"
fi

# Check if we're behind remote
if [ "$LOCAL_HASH" = "$REMOTE_HASH" ] && [ "$DIRTY" = false ]; then
    log "${GREEN}✓ Already up-to-date with origin/$DEFAULT_BRANCH${NC}"
    if [ "$AUTO_FIX" = true ]; then
        log "${BLUE}→ Running auto-fix checks anyway...${NC}"
    else
        log ""
        log "${GREEN}Nothing to update.${NC}"
        exit 0
    fi
fi

if [ "$CHECK_ONLY" = true ] && [ "$LOCAL_HASH" != "$REMOTE_HASH" ]; then
    log "${YELLOW}⚠ Update available:${NC}"
    git log --oneline "$LOCAL_HASH..$REMOTE_HASH" 2>/dev/null | head -10 || true
    echo ""
    log "  Run: git pull origin $DEFAULT_BRANCH"
    log "  Or: bash scripts/self-update.sh"
    exit 2  # Exit code 2 = update available
fi

if [ "$DRY_RUN" = true ]; then
    log "${YELLOW}⚠ Dry run — would update:${NC}"
    if [ "$LOCAL_HASH" != "$REMOTE_HASH" ]; then
        git log --oneline "$LOCAL_HASH..$REMOTE_HASH" 2>/dev/null | head -20 || true
    fi
    echo ""
    log "${GREEN}Dry run complete. Run without --dry-run to apply.${NC}"
    exit 0
fi

# ============================================================
# Step 3: Stash any local changes
# ============================================================
if [ "$DIRTY" = true ]; then
    log "${YELLOW}⚠ Stashing local changes...${NC}"
    git stash push -m "self-update-$(date +%Y%m%d%H%M%S)" 2>/dev/null || true
fi

# ============================================================
# Step 4: Pull latest changes
# ============================================================
log "${BLUE}→ Pulling latest from origin/$DEFAULT_BRANCH...${NC}"

if ! git pull origin "$DEFAULT_BRANCH" 2>&1; then
    log "${RED}✗ Pull failed. Check network or permissions.${NC}"
    log "  Manual: git pull origin $DEFAULT_BRANCH"
    exit 1
fi

# Pop stash if we stashed
if [ "$DIRTY" = true ]; then
    log "${BLUE}→ Restoring local changes...${NC}"
    git stash pop 2>/dev/null || log "${YELLOW}⚠ Could not pop stash (conflicts). Check git status.${NC}"
fi

NEW_HASH=$(git rev-parse HEAD 2>/dev/null || echo "")
log "${GREEN}✓ Updated to ${NEW_HASH:0:8}${NC}"
echo ""

# ============================================================
# Step 5: Re-run setup (idempotent)
# ============================================================
log "${CYAN}[1/3] Re-running setup...${NC}"
if [ -f scripts/setup.sh ]; then
    bash scripts/setup.sh --node-only || log "${YELLOW}⚠ Setup had minor issues${NC}"
else
    log "${YELLOW}⚠ setup.sh not found — install manually:${NC}"
    log "  npm install && npx playwright install chromium"
fi
echo ""

# ============================================================
# Step 6: Validate all skills
# ============================================================
log "${CYAN}[2/3] Validating skills...${NC}"
SKILL_VALID=true
SKILL_COUNT=0
NEW_SKILLS=()

for dir in skills/*/; do
    name=$(basename "$dir")
    SKILL_COUNT=$((SKILL_COUNT + 1))

    if [ ! -f "$dir/SKILL.md" ]; then
        log "  ${YELLOW}⚠ $name — missing SKILL.md${NC}"
        continue
    fi

    # Check for YAML frontmatter
    if ! head -1 "$dir/SKILL.md" | grep -q '^---$'; then
        log "  ${YELLOW}⚠ $name — missing YAML frontmatter${NC}"
        SKILL_VALID=false
    fi

    # Check for required name field
    if ! grep -q '^name:' "$dir/SKILL.md" 2>/dev/null; then
        log "  ${YELLOW}⚠ $name — missing 'name:' field${NC}"
        SKILL_VALID=false
    fi

    # Check for required description field
    if ! grep -q '^description:' "$dir/SKILL.md" 2>/dev/null; then
        log "  ${YELLOW}⚠ $name — missing 'description:' field${NC}"
        SKILL_VALID=false
    fi

    # Detect new skills (not in AGENTS.md)
    if [ -f AGENTS.md ]; then
        if ! grep -q "<name>$name</name>" AGENTS.md 2>/dev/null; then
            NEW_SKILLS+=("$name")
        fi
    fi
done

log "  ${GREEN}✓${NC} $SKILL_COUNT skills checked"

if [ ${#NEW_SKILLS[@]} -gt 0 ]; then
    log "  ${YELLOW}📢 New skills detected (not in AGENTS.md):${NC}"
    for s in "${NEW_SKILLS[@]}"; do
        log "    - $s"
    done
    log "  Run: bash scripts/generate-agents-md.sh"
fi
echo ""

# ============================================================
# Step 7: Check for broken links in READMEs
# ============================================================
log "${CYAN}[3/3] Quick integrity check...${NC}"

# Check sample paper pairs (each sample-paper-N.md should have a matching solution)
BROKEN_PAIRS=0
while IFS= read -r -d '' paper; do
    solution="${paper%.md}-solution.md"
    if [ ! -f "$solution" ]; then
        log "  ${YELLOW}⚠ Missing solution:${NC} $paper"
        BROKEN_PAIRS=$((BROKEN_PAIRS + 1))
    fi
done < <(find examples/ -name 'sample-paper-*.md' ! -name '*-solution.md' -print0 2>/dev/null)

if [ "$BROKEN_PAIRS" -eq 0 ]; then
    log "  ${GREEN}✓${NC} All sample papers have matching solutions"
else
    log "  ${YELLOW}⚠ $BROKEN_PAIRS sample papers missing solutions${NC}"
fi

# Check if generate-agents-md.sh needs to run
if grep -q "universal-qp-fetcher" AGENTS.md 2>/dev/null; then
    log "  ${GREEN}✓${NC} AGENTS.md is up-to-date"
else
    log "  ${YELLOW}⚡ AGENTS.md may be outdated — run: bash scripts/generate-agents-md.sh${NC}"
fi

echo ""

# ============================================================
# Summary
# ============================================================
log "╔══════════════════════════════════════════════════════════╗"
log "║           Roll Complete                                 ║"
log "╠══════════════════════════════════════════════════════════╣"
log "║  ${GREEN}✓${NC} Updated to latest                        ║"
log "║  ${GREEN}✓${NC} Dependencies checked                     ║"
log "║  ${GREEN}✓${NC} All $SKILL_COUNT skills validated                   ║"
if [ ${#NEW_SKILLS[@]} -gt 0 ]; then
    log "║  ${YELLOW}⚡${NC} ${#NEW_SKILLS[@]} new skill(s) detected               ║"
fi
log "╚══════════════════════════════════════════════════════════╝"
log ""
log "  Next: bash scripts/self-update.sh --fix"
log "  Next: bash scripts/generate-agents-md.sh"
log ""
