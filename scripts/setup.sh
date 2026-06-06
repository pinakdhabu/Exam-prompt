#!/usr/bin/env bash
# ============================================================
# Exam Prompt — Cross-Platform Dependency Installer
# ============================================================
# Installs all required dependencies for the Exam Prompt system
# across Linux, macOS, and Windows (via WSL/Git Bash).
#
# Priority: Node.js (primary) → Python (fallback)
# For Linux: Uses system package manager (apt/yum/pacman/apk)
#   to install Python packages (e.g., python3-weasyprint),
#   NOT pip (unless --use-pip flag is passed).
# For macOS: Uses Homebrew
# For Windows: Uses winget (or Chocolatey as fallback)
#
# Edge cases handled:
#   - No sudo access → fallback to pip --user or manual instructions
#   - No curl/wget → plain-text error with manual download URL
#   - Unsupported OS → print URL to download manually
#   - Partial install → resume-safe (re-checks before installing)
#   - Air-gapped (no internet) → print what's missing
#
# Usage:
#   bash scripts/setup.sh              # Full install
#   bash scripts/setup.sh --node-only  # Only Node.js + npm deps
#   bash scripts/setup.sh --python     # Force Python path
#   bash scripts/setup.sh --use-pip    # Allow pip on Linux
#   bash scripts/setup.sh --check      # Only check, don't install
#   bash scripts/setup.sh --offline    # Report what's missing, no install
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
NODE_ONLY=false
FORCE_PYTHON=false
USE_PIP=false
OFFLINE_MODE=false

for arg in "$@"; do
    case "$arg" in
        --check) CHECK_ONLY=true ;;
        --node-only) NODE_ONLY=true ;;
        --python) FORCE_PYTHON=true ;;
        --use-pip) USE_PIP=true ;;
        --offline) OFFLINE_MODE=true ; CHECK_ONLY=true ;;
        --help)
            echo "Usage: bash scripts/setup.sh [options]"
            echo ""
            echo "Options:"
            echo "  --check       Only check installed deps, don't install"
            echo "  --node-only   Only install Node.js + npm packages"
            echo "  --python      Force Python path (don't prefer Node.js)"
            echo "  --use-pip     Allow pip on Linux (otherwise uses apt/yum/pacman)"
            echo "  --offline     Report what's missing without attempting install"
            echo "  --help        Show this help"
            exit 0
            ;;
    esac
done

# ============================================================
# Check sudo availability (non-Windows)
# ============================================================
HAS_SUDO=false
if command -v sudo &>/dev/null; then
    # Check if sudo works without hanging (non-interactive check)
    if sudo -n true 2>/dev/null || sudo true 2>/dev/null; then
        HAS_SUDO=true
    fi
fi

if [ "$HAS_SUDO" = false ] && [ "$OFFLINE_MODE" = false ]; then
    # Check carefully — sudo might ask for password
    if command -v sudo &>/dev/null; then
        # Test sudo non-interactively first
        timeout 2 sudo -n true 2>/dev/null && HAS_SUDO=true || HAS_SUDO=false
    fi
fi

echo ""
echo -e "${CYAN}============================================================${NC}"
echo -e "${CYAN}  EXAM PROMPT — Cross-Platform Dependency Installer${NC}"
echo -e "${CYAN}============================================================${NC}"
echo ""

# ============================================================
# OS Detection
# ============================================================
OS="unknown"
OS_FAMILY="unknown"
PKG_MANAGER=""
INSTALL_CMD=""

# Create pyq-downloads directory immediately
mkdir -p pyq-downloads

case "$(uname -s)" in
    Linux*)
        OS="linux"
        OS_FAMILY="linux"
        if command -v apt &>/dev/null; then
            PKG_MANAGER="apt"
            INSTALL_CMD="apt install -y"
            [ "$HAS_SUDO" = true ] && INSTALL_CMD="sudo $INSTALL_CMD"
        elif command -v yum &>/dev/null; then
            PKG_MANAGER="yum"
            INSTALL_CMD="yum install -y"
            [ "$HAS_SUDO" = true ] && INSTALL_CMD="sudo $INSTALL_CMD"
        elif command -v dnf &>/dev/null; then
            PKG_MANAGER="dnf"
            INSTALL_CMD="dnf install -y"
            [ "$HAS_SUDO" = true ] && INSTALL_CMD="sudo $INSTALL_CMD"
        elif command -v pacman &>/dev/null; then
            PKG_MANAGER="pacman"
            INSTALL_CMD="pacman -S --noconfirm"
            [ "$HAS_SUDO" = true ] && INSTALL_CMD="sudo $INSTALL_CMD"
        elif command -v apk &>/dev/null; then
            PKG_MANAGER="apk"
            INSTALL_CMD="apk add"
            [ "$HAS_SUDO" = true ] && INSTALL_CMD="sudo $INSTALL_CMD"
        else
            echo -e "${RED}✗ No supported package manager found (apt/yum/dnf/pacman/apk)${NC}"
            echo "  Install one of: curl -fsSL https://github.com/pinakdhabu/Exam-prompt"
            echo "  Then run: pip install --user -r requirements.txt"
            echo "  And:       npm install (if Node.js available)"
            exit 1
        fi
        ;;
    Darwin*)
        OS="macos"
        OS_FAMILY="macos"
        if command -v brew &>/dev/null; then
            PKG_MANAGER="brew"
            INSTALL_CMD="brew install"
        else
            echo -e "${YELLOW}⚠ Homebrew not found. Installing Homebrew...${NC}"
            if command -v curl &>/dev/null; then
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
                    echo -e "${RED}✗ Homebrew install failed.${NC}"
                    echo "  Install manually: https://brew.sh"
                    exit 1
                }
            else
                echo -e "${RED}✗ curl not found.${NC}"
                echo "  Install Homebrew manually: https://brew.sh"
                exit 1
            fi
            PKG_MANAGER="brew"
            INSTALL_CMD="brew install"
        fi
        ;;
    MINGW*|MSYS*|CYGWIN*)
        OS="windows"
        OS_FAMILY="windows"
        if command -v winget &>/dev/null; then
            PKG_MANAGER="winget"
            INSTALL_CMD="winget install --accept-source-agreements"
        elif command -v choco &>/dev/null; then
            PKG_MANAGER="choco"
            INSTALL_CMD="choco install -y"
        else
            echo -e "${RED}✗ No supported package manager found (winget/choco)${NC}"
            echo "  Install winget (Win 10/11) or Chocolatey (https://chocolatey.org/install)"
            echo "  Then re-run this script."
            exit 1
        fi
        ;;
esac

echo -e "${BLUE}Detected:${NC} OS=${OS}, Package Manager=${PKG_MANAGER}, Sudo=${HAS_SUDO}"
echo ""

# ============================================================
# Helper Functions
# ============================================================
check_cmd() {
    if command -v "$1" &>/dev/null; then
        echo -e "  ${GREEN}✓${NC} $1"
        return 0
    else
        echo -e "  ${RED}✗${NC} $1"
        return 1
    fi
}

install_pkg() {
    local pkg_name="$1"
    local pkg_linux="$2"
    local pkg_macos="$3"
    local pkg_windows="$4"

    if [ "$CHECK_ONLY" = true ]; then
        return 1
    fi

    echo -e "  ${BLUE}→${NC} Installing $pkg_name..."

    case "$OS_FAMILY" in
        linux)
            case "$PKG_MANAGER" in
                apt|yum|dnf|pacman|apk)
                    # shellcheck disable=SC2086
                    $INSTALL_CMD $pkg_linux || { echo -e "  ${YELLOW}⚠ Failed to install $pkg_name${NC}"; return 1; }
                    ;;
            esac
            ;;
        macos)
            $INSTALL_CMD "$pkg_macos" || { echo -e "  ${YELLOW}⚠ Failed to install $pkg_name${NC}"; return 1; }
            ;;
        windows)
            $INSTALL_CMD "$pkg_windows" || { echo -e "  ${YELLOW}⚠ Failed to install $pkg_name${NC}"; return 1; }
            ;;
    esac
}

# ============================================================
# Step 1: Check/Install Node.js (Primary Path)
# ============================================================
echo -e "${CYAN}[1/4] Checking Node.js (Primary Runtime)${NC}"

if [ "$FORCE_PYTHON" = false ]; then
    if command -v node &>/dev/null; then
        NODE_VER=$(node --version)
        echo -e "  ${GREEN}✓${NC} Node.js $NODE_VER"
    else
        if [ "$CHECK_ONLY" = true ] || [ "$OFFLINE_MODE" = true ]; then
            echo -e "  ${YELLOW}⚠ Node.js not installed${NC}"
        else
            echo -e "  ${YELLOW}⚠ Node.js not found. Installing...${NC}"
            case "$OS_FAMILY" in
                linux)
                    if command -v curl &>/dev/null; then
                        echo -e "  ${BLUE}→${NC} Adding NodeSource repository (Node.js 22 LTS)..."
                        if [ "$HAS_SUDO" = true ]; then
                            curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash - || {
                                echo -e "${YELLOW}⚠ NodeSource setup failed, trying distro packages...${NC}"
                                install_pkg "nodejs" "nodejs npm" "" "" || true
                            }
                            install_pkg "nodejs" "nodejs" "" "" || true
                        else
                            echo -e "${YELLOW}⚠ No sudo access. Using nvm (Node Version Manager)...${NC}"
                            # Try nvm as no-sudo fallback
                            export NVM_DIR="$HOME/.nvm"
                            if [ ! -d "$NVM_DIR" ]; then
                                curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
                            fi
                            [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
                            nvm install --lts 2>/dev/null || {
                                echo -e "${RED}✗ Cannot install Node.js without sudo.${NC}"
                                echo "  Manual install: https://nodejs.org/en/download/"
                                echo "  Or: npm install (if Node.js is already available)"
                            }
                        fi
                    else
                        echo -e "${RED}✗ curl not found. Cannot download Node.js installer.${NC}"
                        echo "  Install Node.js manually: https://nodejs.org/en/download/"
                    fi
                    ;;
                macos)
                    brew install node@22 || {
                        echo -e "${YELLOW}⚠ brew install failed.${NC}"
                        echo "  Download manually: https://nodejs.org/en/download/"
                    }
                    ;;
                windows)
                    if command -v winget &>/dev/null; then
                        winget install OpenJS.NodeJS.LTS --accept-source-agreements || {
                            choco install nodejs-lts -y 2>/dev/null || {
                                echo -e "${YELLOW}⚠ Download Node.js from: https://nodejs.org/en/download/${NC}"
                            }
                        }
                    elif command -v choco &>/dev/null; then
                        choco install nodejs-lts -y || {
                            echo -e "${YELLOW}⚠ Download Node.js from: https://nodejs.org/en/download/${NC}"
                        }
                    fi
                    ;;
            esac
        fi
    fi

    if command -v npm &>/dev/null; then
        echo -e "  ${GREEN}✓${NC} npm $(npm --version)"
    fi

    # Only install npm packages if NOT running in check/offline mode
    if [ "${NODE_ONLY:-false}" = false ] && [ "${CHECK_ONLY:-false}" = false ] && command -v npm &>/dev/null; then
        echo -e "  ${BLUE}→${NC} Installing npm packages (npm install)..."
        npm install --no-audit --no-fund 2>&1 | tail -3 || true

        # Check Playwright browsers
        if [ -f package.json ] && grep -q playwright package.json 2>/dev/null; then
            echo -e "  ${BLUE}→${NC} Installing Playwright Chromium (for PDF conversion + QP fetching)..."
            npx playwright install chromium 2>&1 | tail -3 || true
        fi
    elif [ "$CHECK_ONLY" = true ] && command -v npm &>/dev/null; then
        # Check if node_modules exists
        if [ -d node_modules ]; then
            PKG_COUNT=$(ls node_modules/.package-lock.json 2>/dev/null | wc -l)
            echo -e "  ${GREEN}✓${NC} npm packages installed"
        else
            echo -e "  ${YELLOW}⚠ npm packages not installed (run without --check)${NC}"
        fi
    fi
else
    echo -e "  ${YELLOW}⚠ Skipping Node.js (--python flag set)${NC}"
fi

echo ""

# ============================================================
# Step 2: Check/Install Python + System Packages
# ============================================================
echo -e "${CYAN}[2/4] Checking Python (Secondary Runtime)${NC}"

# Find Python
PYTHON_CMD=""
for cmd in python3 python; do
    if command -v "$cmd" &>/dev/null; then
        PYTHON_CMD="$cmd"
        break
    fi
done

if [ -n "$PYTHON_CMD" ]; then
    PY_VER=$($PYTHON_CMD --version 2>&1)
    echo -e "  ${GREEN}✓${NC} $PY_VER"
else
    if [ "$CHECK_ONLY" = true ]; then
        echo -e "  ${YELLOW}⚠ Python not installed${NC}"
    else
        echo -e "  ${YELLOW}⚠ Python not found. Installing...${NC}"
        case "$OS_FAMILY" in
            linux)
                case "$PKG_MANAGER" in
                    apt)   $INSTALL_CMD python3 python3-pip python3-venv 2>/dev/null || true ;;
                    yum|dnf) $INSTALL_CMD python3 python3-pip 2>/dev/null || true ;;
                    pacman) $INSTALL_CMD python python-pip 2>/dev/null || true ;;
                    apk)   $INSTALL_CMD python3 py3-pip 2>/dev/null || true ;;
                esac
                PYTHON_CMD="python3"
                ;;
            macos)
                brew install python@3.12 2>/dev/null || true
                PYTHON_CMD="python3"
                ;;
            windows)
                if command -v winget &>/dev/null; then
                    winget install Python.Python.3.12 --accept-source-agreements 2>/dev/null || true
                else
                    choco install python -y 2>/dev/null || true
                fi
                PYTHON_CMD="python"
                ;;
        esac

        # Verify Python is now available
        if ! command -v "$PYTHON_CMD" &>/dev/null; then
            PYTHON_CMD=""
        fi
    fi
fi

# Install Python dependencies
if [ -n "$PYTHON_CMD" ] && [ "$CHECK_ONLY" = false ]; then
    echo -e "  ${BLUE}→${NC} Installing Python dependencies..."

    case "$OS_FAMILY" in
        linux)
            if [ "$USE_PIP" = true ]; then
                echo -e "  ${YELLOW}⚠ Using pip (--use-pip flag)${NC}"
                $PYTHON_CMD -m pip install -r requirements.txt 2>&1 | tail -3 || \
                $PYTHON_CMD -m pip install --break-system-packages -r requirements.txt 2>&1 | tail -3 || true
            else
                # Install system packages via package manager (NOT pip)
                case "$PKG_MANAGER" in
                    apt)
                        $INSTALL_CMD python3-weasyprint python3-markdown python3-pypdf2 python3-pil python3-opencv python3-docx tesseract-ocr 2>/dev/null || {
                            echo -e "  ${YELLOW}⚠ Some Python system packages not in repos, trying pip --user...${NC}"
                            $PYTHON_CMD -m pip install --user -r requirements.txt 2>&1 | tail -3 || true
                        }
                        ;;
                    yum|dnf)
                        $INSTALL_CMD python3-weasyprint python3-markdown python3-pypdf2 python3-pillow python3-docx 2>/dev/null || {
                            $PYTHON_CMD -m pip install --user -r requirements.txt 2>&1 | tail -3 || true
                        }
                        ;;
                    pacman)
                        $INSTALL_CMD python-weasyprint python-markdown python-pypdf2 python-pillow python-opencv python-docx 2>/dev/null || {
                            $PYTHON_CMD -m pip install --user -r requirements.txt 2>&1 | tail -3 || true
                        }
                        ;;
                    apk)
                        $INSTALL_CMD py3-weasyprint py3-markdown py3-pypdf2 py3-pillow py3-opencv py3-docx 2>/dev/null || {
                            $PYTHON_CMD -m pip install --user -r requirements.txt 2>&1 | tail -3 || true
                        }
                        ;;
                esac
            fi
            ;;
        macos)
            brew install weasyprint 2>/dev/null || true
            $PYTHON_CMD -m pip install --user -r requirements.txt 2>&1 | tail -3 || true
            ;;
        windows)
            $PYTHON_CMD -m pip install -r requirements.txt 2>&1 | tail -3 || true
            ;;
    esac
elif [ -n "$PYTHON_CMD" ] && [ "$CHECK_ONLY" = true ]; then
    # Check Python packages availability
    echo -e "  ${BLUE}→${NC} Checking Python packages..."
    for pkg in weasyprint markdown PyPDF2 PIL; do
        if $PYTHON_CMD -c "import $pkg" 2>/dev/null; then
            echo -e "    ${GREEN}✓${NC} $pkg"
        else
            echo -e "    ${YELLOW}⚠${NC} $pkg (not installed)"
        fi
    done
fi

echo ""

# ============================================================
# Step 3: Check/Install System Tools
# ============================================================
echo -e "${CYAN}[3/4] Checking System Tools${NC}"

if [ "$CHECK_ONLY" = true ]; then
    check_cmd pdftotext || true
    check_cmd pandoc || true
    check_cmd tesseract || true
    check_cmd convert || true
    check_cmd git || true
else
    check_cmd pdftotext || install_pkg "pdftotext" "poppler-utils" "poppler" "Poppler.Poppler" || true
    check_cmd pandoc || install_pkg "pandoc" "pandoc" "pandoc" "JohnMacFarlane.Pandoc" || true
    check_cmd tesseract || install_pkg "tesseract" "tesseract-ocr" "tesseract" "UB-Mannheim.TesseractOCR" || true
    check_cmd convert || install_pkg "imagemagick" "imagemagick" "imagemagick" "ImageMagick.ImageMagick" || true
    check_cmd git || install_pkg "git" "git" "git" "Git.Git" || true
fi

echo ""

# ============================================================
# Step 4: Verify Installation
# ============================================================
echo -e "${CYAN}[4/4] Verification${NC}"

VERIFY_PASSED=true

# Check Node.js path
if [ "$FORCE_PYTHON" = false ]; then
    if command -v node &>/dev/null; then
        echo -e "  ${GREEN}✓${NC} Node.js runtime: $(node --version)"
    else
        echo -e "  ${YELLOW}⚠ Node.js not available (some features won't work)${NC}"
        if [ "$CHECK_ONLY" = false ]; then
            VERIFY_PASSED=false
        fi
    fi
fi

# Check Python
if [ -n "$PYTHON_CMD" ] && command -v "$PYTHON_CMD" &>/dev/null; then
    echo -e "  ${GREEN}✓${NC} Python runtime: $($PYTHON_CMD --version 2>&1)"

    # Check key Python packages
    for pkg in weasyprint markdown PyPDF2 PIL; do
        if $PYTHON_CMD -c "import $pkg" 2>/dev/null; then
            true
        else
            echo -e "  ${YELLOW}⚠ Python package '$pkg' not found${NC}"
        fi
    done
else
    echo -e "  ${YELLOW}⚠ Python not available (some features won't work)${NC}"
fi

# Check scripts and skills
SCRIPT_COUNT=$(ls scripts/*.sh scripts/*.js scripts/*.py scripts/*.ps1 2>/dev/null | wc -l)
SKILL_COUNT=$(ls -d skills/*/ 2>/dev/null | wc -l)
echo -e "  ${GREEN}✓${NC} $SCRIPT_COUNT scripts, $SKILL_COUNT skills available"

# Check pyq-downloads directory
if [ -d pyq-downloads ]; then
    PYQ_COUNT=$(ls pyq-downloads/ 2>/dev/null | wc -l)
    echo -e "  ${GREEN}✓${NC} pyq-downloads/ ready ($PYQ_COUNT items)"
else
    mkdir -p pyq-downloads
    echo -e "  ${GREEN}✓${NC} pyq-downloads/ created"
fi

echo ""

if [ "$OFFLINE_MODE" = true ]; then
    echo -e "${YELLOW}Offline report complete. Install missing items manually:${NC}"
    echo "  - Python packages: pip install -r requirements.txt"
    echo "  - Node.js packages: npm install"
    echo "  - System tools: See CONTRIBUTING.md"
elif [ "$CHECK_ONLY" = true ]; then
    echo -e "${GREEN}Check complete. Run without --check to install missing deps.${NC}"
else
    echo -e "${GREEN}============================================================${NC}"
    echo -e "${GREEN}  Setup complete!${NC}"
    echo -e "${GREEN}============================================================${NC}"
    echo ""
    echo "  Next steps:"
    echo "    1. Run:  node scripts/fetch-qp.js --help"
    echo "    2. Run:  npm run convert:pdf -- examples/fe/2019-pattern/engineering-mathematics-1/sample-paper-1.md"
    echo "    3. Run:  bash scripts/install.sh"
    echo ""
fi
