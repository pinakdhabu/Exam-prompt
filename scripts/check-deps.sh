#!/usr/bin/env bash
# ============================================================
# check-deps.sh — Verify all dependencies for document-reader
# Works on: Linux (Ubuntu/Debian/Fedora/Arch), macOS, Windows (WSL/Git Bash)
# Python deps via SYSTEM packages where possible, pip as fallback.
# ============================================================
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

detect_os() {
    case "$(uname -s)" in
        Linux*)
            if [ -f /etc/os-release ]; then
                . /etc/os-release
                case "$ID" in
                    ubuntu|debian|linuxmint|pop) echo "debian" ;;
                    fedora|rhel|centos|rocky|alma) echo "rhel" ;;
                    arch|manjaro|endeavouros) echo "arch" ;;
                    alpine) echo "alpine" ;;
                    opensuse*|suse*) echo "suse" ;;
                    *) echo "linux" ;;
                esac
            else
                echo "linux"
            fi
            ;;
        Darwin*) echo "macos" ;;
        MINGW*|MSYS*|CYGWIN*) echo "windows" ;;
        *) echo "unknown" ;;
    esac
}

OS=$(detect_os)

echo -e "${BLUE}==========================================${NC}"
echo -e "${BLUE}Dependency Check for Document Reader${NC}"
echo -e "${BLUE}OS Detected: $OS${NC}"
echo -e "${BLUE}==========================================${NC}"
echo ""

ERRORS=0

check_command() {
    local cmd="$1" name="$2" install_cmd="$3"
    if command -v "$cmd" &> /dev/null; then
        echo -e "${GREEN}✓${NC} $name found: $(which "$cmd")"
        return 0
    else
        echo -e "${RED}✗${NC} $name NOT found"
        echo "  Install: $install_cmd"
        ERRORS=$((ERRORS + 1))
        return 1
    fi
}

check_python_import() {
    local pkg="$1" name="$2" install_cmd="$3"
    if python3 -c "import $pkg" 2>/dev/null || python -c "import $pkg" 2>/dev/null; then
        echo -e "${GREEN}✓${NC} $name found (Python module)"
        return 0
    else
        echo -e "${RED}✗${NC} $name NOT found"
        echo "  Install: $install_cmd"
        ERRORS=$((ERRORS + 1))
        return 1
    fi
}

# ============================================================
# System tool install commands
# ============================================================

get_sys_install() {
    local tool="$1"
    case "$OS" in
        debian)
            case "$tool" in
                pdftotext) echo "sudo apt install -y poppler-utils" ;;
                tesseract) echo "sudo apt install -y tesseract-ocr" ;;
                pandoc)    echo "sudo apt install -y pandoc" ;;
                python3)   echo "sudo apt install -y python3 python3-pip" ;;
            esac
            ;;
        rhel)
            case "$tool" in
                pdftotext) echo "sudo dnf install -y poppler-utils" ;;
                tesseract) echo "sudo dnf install -y tesseract" ;;
                pandoc)    echo "sudo dnf install -y pandoc" ;;
                python3)   echo "sudo dnf install -y python3 python3-pip" ;;
            esac
            ;;
        arch)
            case "$tool" in
                pdftotext) echo "sudo pacman -S poppler" ;;
                tesseract) echo "sudo pacman -S tesseract tesseract-data-eng" ;;
                pandoc)    echo "sudo pacman -S pandoc" ;;
                python3)   echo "sudo pacman -S python python-pip" ;;
            esac
            ;;
        alpine)
            case "$tool" in
                pdftotext) echo "sudo apk add poppler" ;;
                tesseract) echo "sudo apk add tesseract-ocr" ;;
                pandoc)    echo "sudo apk add pandoc" ;;
                python3)   echo "sudo apk add python3 py3-pip" ;;
            esac
            ;;
        suse)
            case "$tool" in
                pdftotext) echo "sudo zypper install poppler-tools" ;;
                tesseract) echo "sudo zypper install tesseract" ;;
                pandoc)    echo "sudo zypper install pandoc" ;;
                python3)   echo "sudo zypper install python3 python3-pip" ;;
            esac
            ;;
        macos)
            case "$tool" in
                pdftotext) echo "brew install poppler" ;;
                tesseract) echo "brew install tesseract" ;;
                pandoc)    echo "brew install pandoc" ;;
                python3)   echo "brew install python3" ;;
            esac
            ;;
        windows)
            case "$tool" in
                pdftotext) echo "winget install XP89DCGQ3K6VLD  (or: choco install poppler)" ;;
                tesseract) echo "winget install UBMFFKJRRR9W2K  (or: choco install tesseract)" ;;
                pandoc)    echo "winget install 9NBLGGH4W8GQ    (or: choco install pandoc)" ;;
                python3)   echo "winget install 9PJPW5LDXLZ5    (or: choco install python3)" ;;
            esac
            ;;
    esac
}

# ============================================================
# Python system package names per distro
# ============================================================

get_py_pkg() {
    local pkg="$1"
    case "$OS" in
        debian)
            case "$pkg" in
                pypdf)      echo "python3-pypdf" ;;
                pytesseract) echo "python3-pytesseract" ;;
                pillow)     echo "python3-pil" ;;
                docx)       echo "python3-docx" ;;
            esac
            ;;
        rhel)
            case "$pkg" in
                pypdf)      echo "python3-pypdf" ;;
                pytesseract) echo "python3-pytesseract" ;;
                pillow)     echo "python3-pillow" ;;
                docx)       echo "python3-docx" ;;
            esac
            ;;
        arch)
            case "$pkg" in
                pypdf)      echo "python-pypdf" ;;
                pytesseract) echo "python-pytesseract" ;;
                pillow)     echo "python-pillow" ;;
                docx)       echo "python-docx (AUR: yay -S python-docx)" ;;
            esac
            ;;
        alpine)
            case "$pkg" in
                pypdf)      echo "py3-pypdf" ;;
                pytesseract) echo "py3-pytesseract" ;;
                pillow)     echo "py3-pillow" ;;
                docx)       echo "py3-docx" ;;
            esac
            ;;
        suse)
            case "$pkg" in
                pypdf)      echo "python3-pypdf" ;;
                pytesseract) echo "python3-pytesseract" ;;
                pillow)     echo "python3-pillow" ;;
                docx)       echo "python3-docx" ;;
            esac
            ;;
        macos|windows)
            echo ""  # No system packages — use pip
            ;;
    esac
}

get_py_install_cmd() {
    local pkg="$1" import_name="$2"
    local sys_pkg
    sys_pkg=$(get_py_pkg "$pkg")

    case "$OS" in
        debian)
            if [ -n "$sys_pkg" ]; then
                echo "sudo apt install -y $sys_pkg"
            else
                echo "pip3 install $pkg"
            fi
            ;;
        rhel)
            if [ -n "$sys_pkg" ]; then
                echo "sudo dnf install -y $sys_pkg"
            else
                echo "pip3 install $pkg"
            fi
            ;;
        arch)
            if [ -n "$sys_pkg" ]; then
                echo "sudo pacman -S $sys_pkg"
            else
                echo "pip install $pkg"
            fi
            ;;
        alpine)
            if [ -n "$sys_pkg" ]; then
                echo "sudo apk add $sys_pkg"
            else
                echo "pip3 install $pkg"
            fi
            ;;
        suse)
            if [ -n "$sys_pkg" ]; then
                echo "sudo zypper install $sys_pkg"
            else
                echo "pip3 install $pkg"
            fi
            ;;
        macos)
            echo "pip3 install $pkg"
            ;;
        windows)
            echo "pip install $pkg"
            ;;
    esac
}

# ============================================================
# System Tools
# ============================================================

echo "System Tools:"
echo "------------------------------------------"

check_command "pdftotext" "pdftotext (PDF extraction)" "$(get_sys_install pdftotext)"
check_command "pdftoppm" "pdftoppm (PDF to images)" "$(get_sys_install pdftotext)"
check_command "tesseract" "Tesseract (OCR)" "$(get_sys_install tesseract)"
check_command "pandoc" "Pandoc (document conversion)" "$(get_sys_install pandoc)"
check_command "python3" "Python 3" "$(get_sys_install python3)"
echo ""

# ============================================================
# Python Packages (via system package manager, not pip)
# ============================================================

echo "Python Packages:"
echo "------------------------------------------"

# PyPDF → pypdf (modern replacement)
check_python_import "PyPDF2" "PyPDF2 / pypdf" "$(get_py_install_cmd pypdf PyPDF2)"
# If PyPDF2 not found, also check pypdf
if ! python3 -c "import PyPDF2" 2>/dev/null && ! python -c "import PyPDF2" 2>/dev/null; then
    check_python_import "pypdf" "pypdf (PyPDF2 replacement)" "$(get_py_install_cmd pypdf pypdf)"
fi

check_python_import "pytesseract" "pytesseract" "$(get_py_install_cmd pytesseract pytesseract)"
check_python_import "PIL" "Pillow (PIL)" "$(get_py_install_cmd pillow PIL)"
check_python_import "docx" "python-docx" "$(get_py_install_cmd docx docx)"
echo ""

# ============================================================
# Summary
# ============================================================

echo "=========================================="
echo "Summary"
echo "=========================================="

if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}All dependencies satisfied!${NC}"
    echo ""
    echo "You can now use the document reader:"
    echo "  ./scripts/process-document.sh <file> <skill>"
    exit 0
else
    echo -e "${YELLOW}Found $ERRORS missing dependencies${NC}"
    echo ""
    echo "Quick install ($OS):"
    case "$OS" in
        debian)
            echo "  sudo apt update"
            echo "  sudo apt install -y poppler-utils tesseract-ocr pandoc python3 python3-pip"
            echo "  sudo apt install -y python3-pypdf python3-pytesseract python3-pil python3-docx"
            ;;
        rhel)
            echo "  sudo dnf install -y poppler-utils tesseract pandoc python3 python3-pip"
            echo "  sudo dnf install -y python3-pypdf python3-pytesseract python3-pillow python3-docx"
            ;;
        arch)
            echo "  sudo pacman -S poppler tesseract tesseract-data-eng pandoc python python-pip"
            echo "  sudo pacman -S python-pypdf python-pytesseract python-pillow"
            echo "  # python-docx is in AUR: yay -S python-docx  (or: pip install python-docx)"
            ;;
        alpine)
            echo "  sudo apk add poppler tesseract-ocr pandoc python3 py3-pip"
            echo "  sudo apk add py3-pypdf py3-pytesseract py3-pillow py3-docx"
            ;;
        suse)
            echo "  sudo zypper install poppler-tools tesseract pandoc python3 python3-pip"
            echo "  sudo zypper install python3-pypdf python3-pytesseract python3-pillow python3-docx"
            ;;
        macos)
            echo "  brew install poppler tesseract pandoc python3"
            echo "  pip3 install pypdf pytesseract Pillow python-docx"
            ;;
        windows)
            echo "  winget install XP89DCGQ3K6VLD"
            echo "  winget install UBMFFKJRRR9W2K"
            echo "  winget install 9NBLGGH4W8GQ"
            echo "  winget install 9PJPW5LDXLZ5"
            echo "  pip install pypdf pytesseract Pillow python-docx"
            ;;
    esac
    echo ""
    exit 1
fi
