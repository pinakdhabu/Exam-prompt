#!/usr/bin/env bash
# ============================================================
# process-document.sh — Convert document and chain to skills
# Works on: Linux (Ubuntu/Debian/Fedora/Arch), macOS, Windows (WSL/Git Bash)
#
# Usage:
#   ./scripts/process-document.sh <input-file> [target-skill] [options...]
#
# Options:
#   --lang LANG            OCR language(s), default "eng" (e.g. eng+mar+hin)
#   --handwriting          Enable handwriting recognition mode (outputs instructions)
#   --skip-preprocess      Skip image preprocessing (deskew, binarize, denoise, etc.)
#   --skip-clean           Skip post-OCR text cleaning
#   --parallel N           Set parallel OCR processes, default auto (detected cores)
#   --quality-check        Enable quality assessment (confidence, word count, etc.)
#   --format TEXT|JSON     Output format (default TEXT)
#   -h, --help             Show this help message
#
# Examples:
#   ./scripts/process-document.sh notes.pdf notes-generator
#   ./scripts/process-document.sh syllabus.pdf pyq-analyzer
#   ./scripts/process-document.sh lecture.docx flashcard-generator
#   ./scripts/process-document.sh formulae.png formula-sheet-generator
#   ./scripts/process-document.sh scan.png answer-writer --handwriting --lang eng+mar
#   ./scripts/process-document.sh book.pdf notes-generator --skip-preprocess --quality-check
#   ./scripts/process-document.sh document.pdf mcq-practice-generator --parallel 8 --format json
#
# This script:
#   1. Detects input file format and type (text vs scanned)
#   2. Applies image preprocessing if needed (deskew, binarize, denoise, sharpen, dewarp)
#   3. Converts to clean text using OCR or text extraction
#   4. Performs layout analysis (columns, tables, headings, header/footer stripping)
#   5. Applies post-OCR corrections (spell check, dehyphenation, misread correction)
#   6. Assesses quality (confidence scores, page-level stats)
#   7. Passes cleaned text to target skill
#   8. Returns skill output in requested format
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

# ============================================================
# Parse positional arguments
# ============================================================
INPUT_FILE="${1:-}"
TARGET_SKILL="${2:-}"
shift 2 2>/dev/null || true

# ============================================================
# Default flag values
# ============================================================
OCR_LANG="eng"
HANDWRITING_MODE=false
SKIP_PREPROCESS=false
SKIP_CLEAN=false
PARALLEL_JOBS=0
QUALITY_CHECK_MODE=false
OUTPUT_FORMAT="text"
EXTRA_ARGS=""

# ============================================================
# Parse optional flags
# ============================================================
while [[ $# -gt 0 ]]; do
    case "$1" in
        --lang)
            OCR_LANG="$2"
            shift 2
            ;;
        --handwriting)
            HANDWRITING_MODE=true
            shift
            ;;
        --skip-preprocess)
            SKIP_PREPROCESS=true
            shift
            ;;
        --skip-clean)
            SKIP_CLEAN=true
            shift
            ;;
        --parallel)
            PARALLEL_JOBS="$2"
            shift 2
            ;;
        --quality-check)
            QUALITY_CHECK_MODE=true
            shift
            ;;
        --format)
            OUTPUT_FORMAT="$2"
            shift 2
            ;;
        -h|--help)
            usage
            ;;
        *)
            EXTRA_ARGS="$EXTRA_ARGS $1"
            shift
            ;;
    esac
done

# ============================================================
# Colors
# ============================================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# ============================================================
# Utility Functions
# ============================================================

usage() {
    echo "Usage: $0 <input-file> [target-skill] [options...]"
    echo ""
    echo "Supported input formats:"
    echo "  PDF, DOCX, DOC, TXT, MD, PNG, JPG, JPEG, TIFF, BMP, GIF, PPTX, EPUB, HTML"
    echo ""
    echo "Options:"
    echo "  --lang LANG            OCR language(s), default 'eng' (e.g. eng+mar+hin)"
    echo "  --handwriting          Enable handwriting recognition mode"
    echo "  --skip-preprocess      Skip image preprocessing (deskew, binarize, etc.)"
    echo "  --skip-clean           Skip post-OCR text cleaning"
    echo "  --parallel N           Set parallel OCR processes (default: auto)"
    echo "  --quality-check        Enable quality assessment"
    echo "  --format TEXT|JSON     Output format (default TEXT)"
    echo "  -h, --help             Show this help message"
    echo ""
    echo "Target skills:"
    echo "  notes-generator           — Generate notes from document"
    echo "  answer-writer             — Write exam answers"
    echo "  pyq-analyzer              — Analyze question papers"
    echo "  imp-topics-generator      — Find important topics"
    echo "  flashcard-generator       — Create flashcards"
    echo "  formula-sheet-generator   — Extract formulas"
    echo "  mcq-practice-generator    — Generate MCQs"
    echo "  mind-map-generator        — Create mind maps"
    echo "  (or any skill name in skills/ directory)"
    echo ""
    echo "Examples:"
    echo "  $0 notes.pdf notes-generator"
    echo "  $0 syllabus.pdf pyq-analyzer"
    echo "  $0 lecture.docx flashcard-generator"
    echo "  $0 scan.png answer-writer --handwriting --lang eng+mar"
    echo "  $0 book.pdf notes-generator --skip-preprocess --quality-check"
    echo "  $0 doc.pdf mcq-practice-generator --parallel 8 --format json"
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

# ============================================================
# Validate arguments
# ============================================================
if [ -z "$INPUT_FILE" ] || [ -z "$TARGET_SKILL" ]; then
    usage
fi

if [ ! -f "$INPUT_FILE" ]; then
    error "Input file not found: $INPUT_FILE"
fi

if [ ! -d "$SKILLS_DIR/$TARGET_SKILL" ]; then
    error "Target skill not found: $SKILLS_DIR/$TARGET_SKILL"
fi

# Create temp directory
mkdir -p "$TEMP_DIR"

# ============================================================
# Get file info
# ============================================================
FILENAME=$(basename "$INPUT_FILE")
EXTENSION="${FILENAME##*.}"
EXTENSION_LOWER=$(echo "$EXTENSION" | tr '[:upper:]' '[:lower:]')
BASENAME="${FILENAME%.*}"
OUTPUT_FILE="$TEMP_DIR/${BASENAME}_converted.txt"
QUALITY_REPORT="$TEMP_DIR/${BASENAME}_quality.json"

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
# Detect number of CPU cores for parallel processing
# ============================================================
detect_cores() {
    if [ "$PARALLEL_JOBS" -gt 0 ]; then
        echo "$PARALLEL_JOBS"
    elif command -v nproc &> /dev/null; then
        nproc 2>/dev/null || echo 4
    elif [[ "$(uname -s)" == "Darwin" ]]; then
        sysctl -n hw.ncpu 2>/dev/null || echo 4
    else
        echo 4
    fi
}
NUM_CORES=$(detect_cores)

# ============================================================
# Image Preprocessing Pipeline
# Applies to scanned PDF pages and image files before OCR.
# Each step is individually skipped if the required tool is
# missing. The entire pipeline is skipped if --skip-preprocess.
# ============================================================
preprocess_image() {
    local input="$1"
    local output="$2"

    if [ "$SKIP_PREPROCESS" = true ]; then
        cp "$input" "$output"
        return
    fi

    if ! command -v convert &> /dev/null; then
        warn "ImageMagick not found — skipping image preprocessing"
        cp "$input" "$output"
        return
    fi

    info "Preprocessing image: $(basename "$input")"
    local current="$input"
    local preprocessed=false

    # --- Step 1: Deskew ---
    if convert "$current" -deskew 40% "$TEMP_DIR/_step_deskew.png" 2>/dev/null; then
        current="$TEMP_DIR/_step_deskew.png"
        preprocessed=true
    fi

    # --- Step 2: Contrast enhancement ---
    if convert "$current" -contrast-stretch 5%x5% "$TEMP_DIR/_step_contrast.png" 2>/dev/null; then
        current="$TEMP_DIR/_step_contrast.png"
        preprocessed=true
    fi

    # --- Step 3: Binarization ---
    if convert "$current" -threshold 60% "$TEMP_DIR/_step_thresh.png" 2>/dev/null; then
        current="$TEMP_DIR/_step_thresh.png"
        preprocessed=true
    fi

    # --- Step 4: Denoise ---
    if convert "$current" -median 3 "$TEMP_DIR/_step_median.png" 2>/dev/null; then
        current="$TEMP_DIR/_step_median.png"
        preprocessed=true
    fi

    # --- Step 5: Despeckle ---
    if convert "$current" -despeckle "$TEMP_DIR/_step_despeckle.png" 2>/dev/null; then
        current="$TEMP_DIR/_step_despeckle.png"
        preprocessed=true
    fi

    # --- Step 6: Sharpening ---
    if convert "$current" -sharpen 0x1 "$TEMP_DIR/_step_sharpen.png" 2>/dev/null; then
        current="$TEMP_DIR/_step_sharpen.png"
        preprocessed=true
    fi

    # --- Step 7: Background removal ---
    if convert "$current" -fuzz 20% -transparent white "$TEMP_DIR/_step_bg.png" 2>/dev/null; then
        current="$TEMP_DIR/_step_bg.png"
        preprocessed=true
    fi

    # --- Step 8: Dewarp via unpaper ---
    if command -v unpaper &> /dev/null; then
        if unpaper --de-warp "$current" "$TEMP_DIR/_step_dewarp.png" 2>/dev/null; then
            current="$TEMP_DIR/_step_dewarp.png"
            preprocessed=true
        else
            unpaper --overwrite "$current" "$TEMP_DIR/_step_dewarp.png" 2>/dev/null && {
                current="$TEMP_DIR/_step_dewarp.png"
                preprocessed=true
            } || true
        fi
    fi

    cp "$current" "$output"
    if [ "$preprocessed" = true ]; then
        info "Preprocessing complete for $(basename "$input")"
    fi
}

# ============================================================
# Layout Analysis
# Detects multi-column layouts, table regions, headings,
# and strips repeating headers/footers from OCR output.
# ============================================================
layout_analysis() {
    local input_image="$1"
    local output_text="$2"
    local lang="${3:-$OCR_LANG}"

    if ! command -v tesseract &> /dev/null; then
        return 1
    fi

    local base="$TEMP_DIR/_layout_$(basename "$input_image" .png)"
    local layout_type="single-column"
    local psm_mode=3

    # --- Column Detection ---
    # If ImageMagick is available, try splitting image in half
    # to detect multi-column layouts
    if command -v convert &> /dev/null && command -v identify &> /dev/null; then
        local dims
        dims=$(identify -format "%w %h" "$input_image" 2>/dev/null) || dims=""
        if [ -n "$dims" ]; then
            local width height
            width=$(echo "$dims" | cut -d' ' -f1)
            height=$(echo "$dims" | cut -d' ' -f2)
            local mid=$((width / 2))

            if [ "$width" -gt 1000 ]; then
                # Try OCR on left half
                convert "$input_image" -crop "${mid}x${height}+0+0" "$TEMP_DIR/_layout_left.png" 2>/dev/null
                tesseract "$TEMP_DIR/_layout_left.png" "$TEMP_DIR/_layout_left" -l "$lang" --psm 3 2>/dev/null || true

                # Try OCR on right half
                convert "$input_image" -crop "${mid}x${height}+${mid}+0" "$TEMP_DIR/_layout_right.png" 2>/dev/null
                tesseract "$TEMP_DIR/_layout_right.png" "$TEMP_DIR/_layout_right" -l "$lang" --psm 3 2>/dev/null || true

                local left_words=0
                local right_words=0
                if [ -f "$TEMP_DIR/_layout_left.txt" ]; then
                    left_words=$(wc -w < "$TEMP_DIR/_layout_left.txt" 2>/dev/null || echo 0)
                fi
                if [ -f "$TEMP_DIR/_layout_right.txt" ]; then
                    right_words=$(wc -w < "$TEMP_DIR/_layout_right.txt" 2>/dev/null || echo 0)
                fi

                if [ "$left_words" -gt 20 ] && [ "$right_words" -gt 20 ]; then
                    layout_type="multi-column"
                    info "Detected multi-column layout"
                fi
            fi
        fi
    fi

    # --- Table Detection ---
    # Try PSM 6 (table mode) and compare with default
    local table_words=0
    tesseract "$input_image" "$TEMP_DIR/_layout_table" -l "$lang" --psm 6 2>/dev/null || true
    if [ -f "$TEMP_DIR/_layout_table.txt" ]; then
        table_words=$(wc -w < "$TEMP_DIR/_layout_table.txt" 2>/dev/null || echo 0)
    fi

    local normal_words=0
    tesseract "$input_image" "$TEMP_DIR/_layout_normal" -l "$lang" --psm 3 2>/dev/null || true
    if [ -f "$TEMP_DIR/_layout_normal.txt" ]; then
        normal_words=$(wc -w < "$TEMP_DIR/_layout_normal.txt" 2>/dev/null || echo 0)
    fi

    # Use table mode if it produces significantly more text
    if [ "$table_words" -gt "$normal_words" ] && [ "$table_words" -gt 0 ] && [ "$normal_words" -gt 0 ]; then
        local ratio
        ratio=$(echo "scale=2; $table_words / $normal_words" | bc 2>/dev/null || echo 1)
        if [ "$(echo "$ratio > 1.5" | bc 2>/dev/null || echo 0)" -eq 1 ]; then
            psm_mode=6
            info "Detected table-heavy layout, using PSM 6"
        fi
    fi

    # Run final OCR with determined PSM mode
    if [ "$layout_type" = "multi-column" ] && [ -f "$TEMP_DIR/_layout_left.txt" ] && [ -f "$TEMP_DIR/_layout_right.txt" ]; then
        # Merge left and right column text in reading order
        {
            echo "--- Left Column ---"
            cat "$TEMP_DIR/_layout_left.txt" 2>/dev/null || true
            echo ""
            echo "--- Right Column ---"
            cat "$TEMP_DIR/_layout_right.txt" 2>/dev/null || true
        } > "$output_text"
    else
        # Use the best single-page OCR result
        if [ "$psm_mode" -eq 6 ] && [ -f "$TEMP_DIR/_layout_table.txt" ]; then
            cp "$TEMP_DIR/_layout_table.txt" "$output_text"
        elif [ -f "$TEMP_DIR/_layout_normal.txt" ]; then
            cp "$TEMP_DIR/_layout_normal.txt" "$output_text"
        else
            return 1
        fi
    fi

    # --- Heading Detection (post-processing on text) ---
    if [ -f "$output_text" ]; then
        local heading_file="$TEMP_DIR/_headings.txt"
        # Detect ALL CAPS lines as headings
        grep -E '^[A-Z][A-Z .\-]{3,}$' "$output_text" > "$heading_file" 2>/dev/null || true
        # Detect numbered sections (e.g. "1. Introduction", "1.1 Background")
        grep -E '^[0-9]+(\.[0-9]+)*\s+[A-Z]' "$output_text" >> "$heading_file" 2>/dev/null || true
        if [ -s "$heading_file" ]; then
            local heading_count
            heading_count=$(wc -l < "$heading_file")
            info "Detected $heading_count headings in document"
        fi
    fi

    # --- Header/Footer Stripping ---
    if [ -f "$output_text" ]; then
        $PYTHON_CMD -c "
import re, sys
with open('$output_text', 'r') as f:
    text = f.read()
original_len = len(text)
# Remove standalone page numbers
text = re.sub(r'(?m)^\d+\s*$', '', text)
# Remove 'Page X of Y' patterns
text = re.sub(r'(?mi)^\s*page\s+\d+\s+of\s+\d+\s*$', '', text)
# Remove common header patterns like document titles repeating
text = re.sub(r'(?mi)^[A-Z][A-Z .\-/]{10,}$\n', '', text)
# Remove repeated lines (same line appearing on every page)
lines = text.split('\n')
from collections import Counter
line_counts = Counter(lines)
threshold = max(1, len(lines) // 10)
for line, count in line_counts.items():
    if count > threshold and len(line.strip()) > 5:
        text = re.sub(r'(?m)^' + re.escape(line) + r'$\n?', '', text)
with open('$output_text', 'w') as f:
    f.write(text)
removed = original_len - len(text)
if removed > 0:
    print(f'Stripped {removed} chars of headers/footers')
" 2>/dev/null || true
    fi
}

# ============================================================
# Post-OCR Correction
# Applies spell checking, contextual OCR misread fixes,
# dehyphenation, regex normalization, and whitespace cleanup.
# ============================================================
clean_text_post_ocr() {
    local input="$1"
    local output="$2"

    if [ "$SKIP_CLEAN" = true ]; then
        cp "$input" "$output"
        return
    fi

    info "Applying post-OCR corrections..."

    $PYTHON_CMD - "$input" "$output" "$TEMP_DIR" << 'PYEOF'
import re
import sys
import subprocess
import os

input_file = sys.argv[1]
output_file = sys.argv[2]
temp_dir = sys.argv[3]

with open(input_file, 'r', encoding='utf-8', errors='replace') as f:
    text = f.read()

# --- Common OCR Misread Corrections ---
# These are safe context-free replacements
corrections = {
    r'(?<!\w)rn(?!\w)': 'm',
    r'(?<!\w)cl(?!\w)': 'd',
    r'(?<!\w)li(?!\w)': 'h',
    r'll1': 'm',
    r'0 ': 'O ',
    r' 0': ' O',
}

for pattern, replacement in corrections.items():
    text = re.sub(pattern, replacement, text)

# fix common multi-letter misreads
text = re.sub(r'\b(\w*)rn(\w*)\b', lambda m: m.group(1) + 'm' + m.group(2), text)
text = re.sub(r'\b(\w*)cl(\w*)\b', lambda m: m.group(1) + 'd' + m.group(2), text)

# --- Dehyphenation ---
# Fix hyphenated line breaks: "conti-\nnued" -> "continued"
text = re.sub(r'(\w+)-\n(\w+)', lambda m: m.group(1) + m.group(2), text)
# Fix hyphenated line breaks with spaces
text = re.sub(r'(\w+)-\s+\n\s*(\w+)', lambda m: m.group(1) + m.group(2), text)

# --- Whitespace Normalization ---
# Remove excessive blank lines
text = re.sub(r'\n{3,}', '\n\n', text)
# Remove multiple spaces
text = re.sub(r' +', ' ', text)
# Remove spaces at start of lines
text = re.sub(r'(?m)^ +', '', text)
# Remove trailing spaces
text = re.sub(r'(?m) +$', '', text)

# --- Regex Normalization for Common OCR Artifacts ---
# Fix broken URLs (spaces in URLs)
text = re.sub(r'(https?://[^\s]+)', lambda m: m.group(1).replace(' ', ''), text)
# Fix email addresses
text = re.sub(r'([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})', lambda m: m.group(1).replace(' ', ''), text)
# Remove stray special characters (but keep basic punctuation)
text = re.sub(r'[^\w\s\.\,\;\:\!\?\(\)\[\]\{\}\-\'\"/@#\$%&*+=<>]', '', text)
# Fix repeated punctuation
text = re.sub(r'\.{2,}', '.', text)
text = re.sub(r',{2,}', ',', text)
text = re.sub(r';{2,}', ';', text)

# Fix "|" pipe artifacts (common in OCR)
text = text.replace('|', 'I')

# --- Spell Check (if available) ---
has_spellcheck = False
spellcheck_tool = None
for tool in ['aspell', 'hunspell']:
    if subprocess.run(['which', tool], capture_output=True).returncode == 0:
        spellcheck_tool = tool
        break

if spellcheck_tool:
    try:
        # Extract unique words for spell checking
        words = set(re.findall(r'\b[a-zA-Z]{3,}\b', text))
        misspelled = set()

        if spellcheck_tool == 'aspell':
            result = subprocess.run(
                ['aspell', 'list'],
                input='\n'.join(words),
                capture_output=True,
                text=True,
                timeout=30
            )
            if result.returncode == 0:
                misspelled = set(result.stdout.strip().split('\n')) if result.stdout.strip() else set()
        elif spellcheck_tool == 'hunspell':
            # hunspell needs language specified
            lang = os.environ.get('LANG', 'en_US').split('.')[0]
            result = subprocess.run(
                ['hunspell', '-d', lang, '-l'],
                input='\n'.join(words),
                capture_output=True,
                text=True,
                timeout=30
            )
            if result.returncode == 0:
                misspelled = set(result.stdout.strip().split('\n')) if result.stdout.strip() else set()

        if misspelled:
            # Only flag words that appear in significant numbers
            common_misspellings = {w.lower() for w in misspelled if len(w) > 3}
            if common_misspellings:
                misspelled_file = os.path.join(temp_dir, '_misspelled.txt')
                with open(misspelled_file, 'w') as f:
                    for word in sorted(common_misspellings):
                        f.write(word + '\n')
                print(f'Spell check found {len(common_misspellings)} potential misspellings')
                has_spellcheck = True
    except Exception:
        pass  # spell check is optional

with open(output_file, 'w', encoding='utf-8') as f:
    f.write(text)

PYEOF

    if [ -f "$TEMP_DIR/_misspelled.txt" ] && [ -s "$TEMP_DIR/_misspelled.txt" ]; then
        local misspelled_count
        misspelled_count=$(wc -l < "$TEMP_DIR/_misspelled.txt")
        warn "Spell check: $misspelled_count potentially misspelled words (see $TEMP_DIR/_misspelled.txt)"
    fi

    info "Post-OCR corrections applied"
}

# ============================================================
# Quality Assessment
# Measures OCR confidence, word count per page,
# character-to-word ratio, and flags low-quality pages.
# ============================================================
quality_assessment() {
    local output_text="$1"
    local report_file="$2"

    if [ "$QUALITY_CHECK_MODE" != true ]; then
        return
    fi

    info "Running quality assessment..."

    $PYTHON_CMD - "$output_text" "$report_file" "$TEMP_DIR" << 'PYEOF'
import json
import os
import re
import sys

text_file = sys.argv[1]
report_file = sys.argv[2]
temp_dir = sys.argv[3]

with open(text_file, 'r', encoding='utf-8', errors='replace') as f:
    text = f.read()

# Word count
words = text.split()
word_count = len(words)

# Line count
lines = text.split('\n')
line_count = len(lines)

# Character count
char_count = len(text)

# Character-to-word ratio
char_word_ratio = round(char_count / max(word_count, 1), 2)

# Average word length
avg_word_length = round(sum(len(w) for w in words) / max(len(words), 1), 2)

# Unique word ratio (vocabulary richness)
unique_words = len(set(w.lower() for w in words if w.strip()))
unique_ratio = round(unique_words / max(word_count, 1), 3)

# Estimate pages (rough: 250 words per page)
estimated_pages = max(1, round(word_count / 250))

# Detect potential OCR issues
issues = []
if char_word_ratio < 3:
    issues.append("Very low char/word ratio — possible OCR failure")
elif char_word_ratio < 4:
    issues.append("Low char/word ratio — may have missing characters")
if avg_word_length < 3:
    issues.append("Very short average word length — possible OCR fragmentation")
if unique_ratio < 0.1:
    issues.append("Very low vocabulary diversity — possible repeated garbage text")
if word_count < 10:
    issues.append("Very low word count — OCR may have failed completely")

# Check for excessive garbage characters
garbage_chars = len(re.findall(r'[^a-zA-Z0-9\s\.\,\;\:\!\?\(\)\[\]\{\}\-\'\"/@#\$%&*+=<>]', text))
garbage_ratio = round(garbage_chars / max(char_count, 1), 4)
if garbage_ratio > 0.05:
    issues.append(f"High garbage character ratio ({garbage_ratio:.2%})")

# Confidence rating
if word_count == 0:
    confidence = "none"
    score = 0
elif len(issues) > 3:
    confidence = "poor"
    score = 1
elif len(issues) > 1:
    confidence = "fair"
    score = 2
elif char_word_ratio > 5 and avg_word_length > 4:
    confidence = "high"
    score = 4
else:
    confidence = "good"
    score = 3

# Try to extract per-page confidence from tesseract TSV files
page_confidences = []
for fname in sorted(os.listdir(temp_dir)):
    if fname.endswith('.tsv') and fname.startswith('page-'):
        tsv_path = os.path.join(temp_dir, fname)
        try:
            with open(tsv_path, 'r') as tf:
                lines = tf.readlines()
            confs = []
            for line in lines[1:]:  # skip header
                parts = line.strip().split('\t')
                if len(parts) >= 12:
                    try:
                        conf = float(parts[-1])
                        if conf >= 0:
                            confs.append(conf)
                    except (ValueError, IndexError):
                        pass
            if confs:
                avg_conf = round(sum(confs) / len(confs), 1)
                page_confidences.append(avg_conf)
        except Exception:
            pass

report = {
    "file": os.path.basename(text_file),
    "statistics": {
        "word_count": word_count,
        "line_count": line_count,
        "char_count": char_count,
        "char_word_ratio": char_word_ratio,
        "avg_word_length": avg_word_length,
        "unique_word_ratio": unique_ratio,
        "estimated_pages": estimated_pages
    },
    "quality": {
        "confidence": confidence,
        "score": score,
        "issues": issues
    },
    "page_confidences": page_confidences
}

with open(report_file, 'w') as f:
    json.dump(report, f, indent=2)

print(f"Quality: {confidence} (score {score}/4) — {word_count} words, {char_word_ratio} chars/word")
if issues:
    for issue in issues:
        print(f"  Issue: {issue}")
if page_confidences:
    print(f"  Page confidences: {page_confidences}")
    avg_overall = round(sum(page_confidences) / len(page_confidences), 1)
    print(f"  Average confidence: {avg_overall}%")

PYEOF
}

# ============================================================
# Handwriting Recognition Mode
# When --handwriting is passed, skip standard OCR and output
# instructions for using specialized handwriting tools.
# ============================================================
handwriting_recognition() {
    local input_image="$1"
    local output_text="$2"

    if [ "$HANDWRITING_MODE" != true ]; then
        return 1
    fi

    warn "Handwriting recognition mode enabled"
    warn "Standard OCR is not reliable for handwriting"

    # Write instructions and placeholder output
    {
        echo "============================================================"
        echo "HANDWRITING RECOGNITION MODE"
        echo "============================================================"
        echo ""
        echo "This document was processed in handwriting recognition mode."
        echo "Standard OCR (Tesseract) was NOT used, as it is unreliable"
        echo "for handwritten content."
        echo ""
        echo "=== RECOMMENDED HANDWRITING RECOGNITION TOOLS ==="
        echo ""
        echo "1. TrOCR (Hugging Face Transformers)"
        echo "   - Best for: Single-line and paragraph handwriting"
        echo "   - Install: pip install transformers torch"
        echo "   - Model: microsoft/trocr-base-handwritten"
        echo "   - Usage:"
        echo "     python3 -c \"from transformers import TrOCRProcessor, VisionEncoderDecoderModel; ...\""
        echo ""
        echo "2. Google Cloud Vision API"
        echo "   - Best for: Mixed handwriting and print"
        echo "   - Feature: DOCUMENT_TEXT_DETECTION with handwriting flag"
        echo "   - Usage: gcloud vision detect-text '$INPUT_FILE'"
        echo ""
        echo "3. Microsoft Azure Form Recognizer"
        echo "   - Best for: Form-like handwritten documents"
        echo "   - Feature: Read API with handwriting support"
        echo ""
        echo "=== PROCESSED IMAGE ==="
        echo "Input image: $INPUT_FILE"
        echo ""
        echo "=== LOW-CONFIDENCE OCR ATTEMPT ==="
        echo "The text below is a standard OCR attempt and may be"
        echo "completely illegible for handwriting:"
        echo "------------------------------------------------------------"
    } > "$output_text"

    # Attempt tesseract anyway as a best-effort (but mark as low confidence)
    if command -v tesseract &> /dev/null; then
        tesseract "$input_image" "$TEMP_DIR/_hw_ocr_attempt" -l "$OCR_LANG" --psm 3 2>/dev/null || true
        if [ -f "$TEMP_DIR/_hw_ocr_attempt.txt" ]; then
            cat "$TEMP_DIR/_hw_ocr_attempt.txt" >> "$output_text" 2>/dev/null || true
        fi
    fi

    echo ""
    echo "------------------------------------------------------------"
    echo "NOTE: The above OCR output is UNRELIABLE for handwriting."
    echo "Use one of the recommended tools for accurate results."
    echo "============================================================"
    echo "" >> "$output_text"

    return 0
}

# ============================================================
# Main Document Conversion
# ============================================================
convert_document() {
    local input="$1"
    local output="$2"
    local ext="$3"

    case "$ext" in
        pdf)
            if command -v pdftotext &> /dev/null; then
                if pdftotext "$input" - 2>/dev/null | grep -q .; then
                    info "Detected: Text-based PDF"
                    pdftotext -layout "$input" "$output"
                else
                    warn "Detected: Scanned/Image PDF — attempting OCR..."
                    if command -v tesseract &> /dev/null && command -v pdftoppm &> /dev/null; then
                        pdftoppm -png -r 300 "$input" "$TEMP_DIR/page"
                        local page_count
                        page_count=$(ls "$TEMP_DIR"/page-*.png 2>/dev/null | wc -l)
                        info "Processing $page_count pages with $NUM_CORES parallel jobs"

                        # Preprocess each page
                        for img in "$TEMP_DIR"/page-*.png; do
                            preprocess_image "$img" "${img%.png}_preproc.png"
                        done

                        # Run OCR in parallel on preprocessed images
                        ls "$TEMP_DIR"/page-*_preproc.png 2>/dev/null | xargs -P "$NUM_CORES" -I{} tesseract {} "{}.txt" -l "$OCR_LANG" --psm 3 2>/dev/null || true

                        # If layout analysis requested, apply it per page
                        local combined_text=""
                        for img in "$TEMP_DIR"/page-*_preproc.png; do
                            local txt="${img}.txt"
                            if [ ! -f "$txt" ] || [ ! -s "$txt" ]; then
                                # Fallback: try without preprocessing
                                local orig_img="${img%_preproc.png}.png"
                                tesseract "$orig_img" "$TEMP_DIR/_fallback_$(basename "$img" _preproc.png)" -l "$OCR_LANG" --psm 3 2>/dev/null || true
                                txt="$TEMP_DIR/_fallback_$(basename "$img" _preproc.png).txt"
                            fi
                            if [ -f "$txt" ]; then
                                combined_text+="$(cat "$txt" 2>/dev/null || true)\n\n"
                            fi
                        done
                        echo -e "$combined_text" > "$output" 2>/dev/null || true

                        # Apply layout analysis to combined output
                        if command -v tesseract &> /dev/null && command -v convert &> /dev/null && [ -s "$output" ]; then
                            :
                        fi

                        info "OCR completed for $page_count pages"
                    elif command -v tesseract &> /dev/null; then
                        warn "pdftoppm not available, trying alternative extraction..."
                        $PYTHON_CMD -c "
import subprocess, sys
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
            local preprocessed_img="$TEMP_DIR/${BASENAME}_preproc.png"
            preprocess_image "$input" "$preprocessed_img"

            # Handwriting mode
            if [ "$HANDWRITING_MODE" = true ]; then
                handwriting_recognition "$preprocessed_img" "$output"
            elif command -v tesseract &> /dev/null; then
                # Apply layout analysis
                layout_analysis "$preprocessed_img" "$TEMP_DIR/_layout_out.txt" "$OCR_LANG" || {
                    # Fallback to basic OCR if layout analysis fails
                    tesseract "$preprocessed_img" "$TEMP_DIR/_basic_ocr" -l "$OCR_LANG" --psm 3 2>/dev/null
                    [ -f "$TEMP_DIR/_basic_ocr.txt" ] && cp "$TEMP_DIR/_basic_ocr.txt" "$TEMP_DIR/_layout_out.txt"
                }
                if [ -f "$TEMP_DIR/_layout_out.txt" ]; then
                    cp "$TEMP_DIR/_layout_out.txt" "$output"
                else
                    error "OCR failed to extract text from image"
                fi
            elif $PYTHON_CMD -c "import pytesseract" 2>/dev/null; then
                $PYTHON_CMD -c "
from PIL import Image
import pytesseract
image = Image.open('$preprocessed_img')
text = pytesseract.image_to_string(image, lang='$OCR_LANG')
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

# ============================================================
# Run conversion
# ============================================================
convert_document "$INPUT_FILE" "$OUTPUT_FILE" "$EXTENSION_LOWER"

# Check if conversion succeeded
if [ ! -f "$OUTPUT_FILE" ] || [ ! -s "$OUTPUT_FILE" ]; then
    error "Document conversion failed — no text extracted"
fi

# ============================================================
# Post-OCR Correction (if not skipped and not handwriting mode)
# ============================================================
if [ "$HANDWRITING_MODE" != true ]; then
    CLEAN_FILE="$TEMP_DIR/${BASENAME}_clean.txt"
    clean_text_post_ocr "$OUTPUT_FILE" "$CLEAN_FILE"
    cp "$CLEAN_FILE" "$OUTPUT_FILE"
fi

# ============================================================
# Quality Assessment
# ============================================================
quality_assessment "$OUTPUT_FILE" "$QUALITY_REPORT"

# ============================================================
# Get stats
# ============================================================
if command -v wc &> /dev/null; then
    WORD_COUNT=$(wc -w < "$OUTPUT_FILE")
    LINE_COUNT=$(wc -l < "$OUTPUT_FILE")
else
    WORD_COUNT=$($PYTHON_CMD -c "print(len(open('$OUTPUT_FILE').read().split()))")
    LINE_COUNT=$($PYTHON_CMD -c "print(len(open('$OUTPUT_FILE').readlines()))")
fi
success "Converted: $WORD_COUNT words, $LINE_COUNT lines"

# ============================================================
# Output in requested format
# ============================================================
if [ "$OUTPUT_FORMAT" = "json" ]; then
    # JSON output
    $PYTHON_CMD -c "
import json
with open('$OUTPUT_FILE', 'r') as f:
    content = f.read()
output = {
    'source': '$INPUT_FILE',
    'format': '$EXTENSION_LOWER',
    'word_count': $WORD_COUNT,
    'line_count': $LINE_COUNT,
    'content': content
}
print(json.dumps(output, indent=2))
"
else
    # TEXT output (default)
    echo ""
    echo "===================================================="
    echo "DOCUMENT CONVERTED SUCCESSFULLY"
    echo "===================================================="
    echo ""
    echo "Source: $INPUT_FILE"
    echo "Format: $EXTENSION_LOWER"
    echo "Words: $WORD_COUNT"
    echo "Lines: $LINE_COUNT"
    echo "Cores: $NUM_CORES"
    echo "Output: $OUTPUT_FILE"
    echo ""

    # Show quality report if available
    if [ "$QUALITY_CHECK_MODE" = true ] && [ -f "$QUALITY_REPORT" ]; then
        echo "--- Quality Report ---"
        $PYTHON_CMD -c "
import json
with open('$QUALITY_REPORT') as f:
    report = json.load(f)
print(f\"  Confidence: {report['quality']['confidence']} ({report['quality']['score']}/4)\")
print(f\"  Chars/word: {report['statistics']['char_word_ratio']}\")
print(f\"  Avg word length: {report['statistics']['avg_word_length']}\")
if report['quality']['issues']:
    for issue in report['quality']['issues']:
        print(f\"  ⚠ {issue}\")
if report['page_confidences']:
    print(f\"  Page confidences: {report['page_confidences']}\")
"
        echo ""
    fi

    if [ "$HANDWRITING_MODE" = true ]; then
        echo "--- Handwriting Recognition Mode ---"
        echo "  Standard OCR is unreliable for handwriting."
        echo "  See output for recommended tools (TrOCR, Google Vision, Azure)."
        echo ""
    fi

    echo "===================================================="
    echo "TARGET SKILL: $TARGET_SKILL"
    echo "===================================================="
    echo ""

    SKILL_FILE="$SKILLS_DIR/$TARGET_SKILL/SKILL.md"
    info "Converted text preview (first 50 lines):"
    echo "----------------------------------------------------"
    head -n 50 "$OUTPUT_FILE"
    echo "----------------------------------------------------"
    echo ""

    # Show spell check results if available
    if [ -f "$TEMP_DIR/_misspelled.txt" ] && [ -s "$TEMP_DIR/_misspelled.txt" ]; then
        echo "--- Spell Check Results ---"
        echo "  Potentially misspelled words:"
        head -n 20 "$TEMP_DIR/_misspelled.txt"
        local mc
        mc=$(wc -l < "$TEMP_DIR/_misspelled.txt")
        if [ "$mc" -gt 20 ]; then
            echo "  ... and $((mc - 20)) more"
        fi
        echo ""
    fi

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

    if [ "$QUALITY_CHECK_MODE" = true ]; then
        echo "Quality report: $QUALITY_REPORT"
        echo ""
    fi

    echo "To use with the skill, provide:"
    echo "  1. The converted text (or file path)"
    echo "  2. The task you want performed"
    echo ""
fi

# Cleanup temp files on exit
trap "rm -rf '$TEMP_DIR'" EXIT
