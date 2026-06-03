#!/usr/bin/env bash
# ============================================================
# process-document.sh — Convert document and chain to skills
# Works on: Linux (Ubuntu/Debian/Fedora/Arch), macOS, Windows (WSL/Git Bash)
#
# Usage:
#   ./scripts/process-document.sh <input-file> [target-skill] [options...]
#
# Examples:
#   ./scripts/process-document.sh notes.pdf notes-generator
#   ./scripts/process-document.sh syllabus.pdf pyq-analyzer
#   ./scripts/process-document.sh lecture.docx flashcard-generator
#   ./scripts/process-document.sh formulae.png formula-sheet-generator
#
# This script:
#   1. Detects input file format
#   2. Converts to clean text using universal-document-reader
#   3. Passes text to target skill
#   4. Returns skill output
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$REPO_ROOT/skills"

# Cross-platform temp directory
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OSTYPE" == "win32" ]]; then
    TEMP_DIR="${TEMP:-/tmp}/opencode/doc-reader-$$"
else
    TEMP_DIR="/tmp/opencode/doc-reader-$$"
fi

INPUT_FILE="${1:-}"
TARGET_SKILL="${2:-}"
shift 2 2>/dev/null || true
EXTRA_ARGS="$@"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

usage() {
    echo "Usage: $0 <input-file> [target-skill] [options...]"
    echo ""
    echo "Supported input formats:"
    echo "  PDF, DOCX, DOC, TXT, MD, PNG, JPG, PPTX, EPUB, HTML"
    echo ""
    echo "Target skills:"
    echo "  notes-generator       — Generate notes from document"
    echo "  answer-writer         — Write exam answers"
    echo "  pyq-analyzer          — Analyze question papers"
    echo "  imp-topics-generator  — Find important topics"
    echo "  flashcard-generator   — Create flashcards"
    echo "  formula-sheet-generator — Extract formulas"
    echo "  mcq-practice-generator — Generate MCQs"
    echo "  mind-map-generator    — Create mind maps"
    echo "  (or any skill name in skills/ directory)"
    echo ""
    echo "Examples:"
    echo "  $0 notes.pdf notes-generator"
    echo "  $0 syllabus.pdf imp-topics-generator"
    echo "  $0 lecture.docx flashcard-generator"
    exit 1
}

error() {
    echo -e "${RED}ERROR: $1${NC}" >&2
    exit 1
}

info() {
    echo -e "${BLUE}INFO: $1${NC}"
}

success() {
    echo -e "${GREEN}SUCCESS: $1${NC}"
}

warn() {
    echo -e "${YELLOW}WARNING: $1${NC}"
}

# Check arguments
if [ -z "$INPUT_FILE" ] || [ -z "$TARGET_SKILL" ]; then
    usage
fi

# Check input file exists
if [ ! -f "$INPUT_FILE" ]; then
    error "Input file not found: $INPUT_FILE"
fi

# Check target skill exists
if [ ! -d "$SKILLS_DIR/$TARGET_SKILL" ]; then
    error "Target skill not found: $TARGET_SKILL"
fi

# Create temp directory
mkdir -p "$TEMP_DIR"

# Get file extension and name
FILENAME=$(basename "$INPUT_FILE")
EXTENSION="${FILENAME##*.}"
EXTENSION_LOWER=$(echo "$EXTENSION" | tr '[:upper:]' '[:lower:]')
BASENAME="${FILENAME%.*}"
OUTPUT_FILE="$TEMP_DIR/${BASENAME}_converted.txt"

info "Processing: $INPUT_FILE"
info "Target skill: $TARGET_SKILL"

# ============================================================
# Detect Python command
# ============================================================

PYTHON_CMD=""
if command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
elif command -v python &> /dev/null; then
    PYTHON_CMD="python"
else
    error "Python not found. Please install Python 3."
fi

# ============================================================
# STEP 1: Convert document to text
# ============================================================

convert_document() {
    local input="$1"
    local output="$2"
    local ext="$3"

    case "$ext" in
        pdf)
            # Check if text-based or scanned PDF
            if command -v pdftotext &> /dev/null; then
                if pdftotext "$input" - 2>/dev/null | grep -q .; then
                    info "Detected: Text-based PDF"
                    pdftotext -layout "$input" "$output"
                else
                    warn "Detected: Scanned/Image PDF — attempting OCR..."
                    if command -v tesseract &> /dev/null && command -v pdftoppm &> /dev/null; then
                        pdftoppm -png -r 300 "$input" "$TEMP_DIR/page"
                        for img in "$TEMP_DIR"/page-*.png; do
                            tesseract "$img" "${img%.png}" -l eng 2>/dev/null
                        done
                        cat "$TEMP_DIR"/page-*.txt > "$output" 2>/dev/null || true
                    elif command -v tesseract &> /dev/null; then
                        # Windows with tesseract but no pdftoppm
                        warn "pdftoppm not available, trying alternative..."
                        $PYTHON_CMD -c "
import subprocess
import sys
try:
    import PyPDF2
    with open('$input', 'rb') as f:
        reader = PyPDF2.PdfReader(f)
        text = ''
        for page in reader.pages:
            text += page.extract_text() or ''
    with open('$output', 'w') as f:
        f.write(text)
except Exception as e:
    print(f'PyPDF2 failed: {e}', file=sys.stderr)
    sys.exit(1)
"
                    else
                        error "Scanned PDF detected but tesseract OCR not installed."
                    fi
                fi
            elif $PYTHON_CMD -c "import PyPDF2" 2>/dev/null || $PYTHON_CMD -c "import pypdf" 2>/dev/null; then
                info "Using Python for PDF extraction..."
                $PYTHON_CMD "$REPO_ROOT/scripts/pdf-extract.py" "$input" "$output"
            else
                error "No PDF tools available. Install pdftotext or PyPDF2."
            fi
            ;;
        docx|doc)
            info "Detected: Word document"
            if command -v pandoc &> /dev/null; then
                pandoc "$input" -t plain -o "$output"
            elif $PYTHON_CMD -c "import docx" 2>/dev/null; then
                $PYTHON_CMD -c "
from docx import Document
doc = Document('$input')
with open('$output', 'w') as f:
    for para in doc.paragraphs:
        f.write(para.text + '\n')
"
            else
                error "Neither pandoc nor python-docx available."
            fi
            ;;
        txt|md|text)
            info "Detected: Text file"
            cp "$input" "$output"
            ;;
        png|jpg|jpeg|tiff|bmp|gif)
            info "Detected: Image file"
            if command -v tesseract &> /dev/null; then
                tesseract "$input" "${output%.*}" -l eng 2>/dev/null
                mv "${output%.*}.txt" "$output" 2>/dev/null || true
            elif $PYTHON_CMD -c "import pytesseract" 2>/dev/null; then
                $PYTHON_CMD -c "
from PIL import Image
import pytesseract
image = Image.open('$input')
text = pytesseract.image_to_string(image)
with open('$output', 'w') as f:
    f.write(text)
"
            else
                error "No OCR tools available. Install tesseract."
            fi
            ;;
        pptx)
            info "Detected: PowerPoint"
            if command -v pandoc &> /dev/null; then
                pandoc "$input" -t plain -o "$output"
            else
                error "Pandoc not installed."
            fi
            ;;
        epub)
            info "Detected: EPUB"
            if command -v pandoc &> /dev/null; then
                pandoc "$input" -t plain -o "$output"
            else
                error "Pandoc not installed."
            fi
            ;;
        html|htm)
            info "Detected: HTML"
            if command -v pandoc &> /dev/null; then
                pandoc "$input" -t plain -o "$output"
            elif command -v lynx &> /dev/null; then
                lynx -dump "$input" > "$output"
            else
                error "Neither pandoc nor lynx available."
            fi
            ;;
        *)
            error "Unsupported file format: .$ext"
            ;;
    esac
}

# Run conversion
convert_document "$INPUT_FILE" "$OUTPUT_FILE" "$EXTENSION_LOWER"

# Check if conversion succeeded
if [ ! -f "$OUTPUT_FILE" ] || [ ! -s "$OUTPUT_FILE" ]; then
    error "Document conversion failed — no text extracted"
fi

# Get stats
if command -v wc &> /dev/null; then
    WORD_COUNT=$(wc -w < "$OUTPUT_FILE")
    LINE_COUNT=$(wc -l < "$OUTPUT_FILE")
else
    WORD_COUNT=$($PYTHON_CMD -c "print(len(open('$OUTPUT_FILE').read().split()))")
    LINE_COUNT=$($PYTHON_CMD -c "print(len(open('$OUTPUT_FILE').readlines()))")
fi
success "Converted: $WORD_COUNT words, $LINE_COUNT lines"

# ============================================================
# STEP 2: Clean text
# ============================================================

CLEAN_FILE="$TEMP_DIR/${BASENAME}_clean.txt"

if $PYTHON_CMD -c "import re" 2>/dev/null; then
    $PYTHON_CMD - "$OUTPUT_FILE" "$CLEAN_FILE" << 'PYEOF'
import re
import sys

input_file = sys.argv[1]
output_file = sys.argv[2]

with open(input_file, 'r') as f:
    text = f.read()

# Clean: remove excessive whitespace
text = re.sub(r'\n\s*\n', '\n\n', text)
text = re.sub(r' +', ' ', text)

# Remove common page artifacts
text = re.sub(r'(?m)^\d+\s*$', '', text)
text = re.sub(r'(?m)^Page \d+.*$', '', text)

# Fix hyphenation at line breaks
text = re.sub(r'(\w)-\n(\w)', r'\1\2', text)

with open(output_file, 'w') as f:
    f.write(text)
PYEOF
    cp "$CLEAN_FILE" "$OUTPUT_FILE"
    info "Text cleaned"
fi

# ============================================================
# STEP 3: Pass to target skill
# ============================================================

SKILL_FILE="$SKILLS_DIR/$TARGET_SKILL/SKILL.md"

info "Loading skill: $TARGET_SKILL"

# Output the converted text and skill info
echo ""
echo "===================================================="
echo "DOCUMENT CONVERTED SUCCESSFULLY"
echo "===================================================="
echo ""
echo "Source: $INPUT_FILE"
echo "Format: $EXTENSION_LOWER"
echo "Words: $WORD_COUNT"
echo "Lines: $LINE_COUNT"
echo "Output: $OUTPUT_FILE"
echo ""
echo "===================================================="
echo "TARGET SKILL: $TARGET_SKILL"
echo "===================================================="
echo ""

# Show first 50 lines of converted text as preview
info "Converted text preview (first 50 lines):"
echo "----------------------------------------------------"
head -n 50 "$OUTPUT_FILE"
echo "----------------------------------------------------"
echo ""

# Show skill description
if [ -f "$SKILL_FILE" ]; then
    info "Skill instructions loaded from: $SKILL_FILE"
    echo ""
    head -n 20 "$SKILL_FILE"
    echo "..."
fi

echo ""
echo "===================================================="
echo "READY FOR PROCESSING"
echo "===================================================="
echo ""
echo "Converted text is available at: $OUTPUT_FILE"
echo ""
echo "To use with the skill, provide:"
echo "  1. The converted text (or file path)"
echo "  2. The task you want performed"
echo ""

# Cleanup temp files on exit
trap "rm -rf '$TEMP_DIR'" EXIT
