#!/usr/bin/env bash
# submit-pyq.sh — One-command PYQ submission
# Usage: bash scripts/submit-pyq.sh <path-to-pdf> [subject]
#
# Network effects lever: Each submitted PYQ makes the repo better for everyone.
# Students run this after downloading any question paper.
#
# Options:
#   bash scripts/submit-pyq.sh path/to/DBMS-2024-QP.pdf
#   bash scripts/submit-pyq.sh path/to/DBMS-2024-QP.pdf "Database Management Systems"
#   bash scripts/submit-pyq.sh --help

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}═══════════════════════════════════════════${NC}"
echo -e "${CYAN}  Exam-Prompt PYQ Submitter${NC}"
echo -e "${CYAN}  Contribute to the network — one paper at a time${NC}"
echo -e "${CYAN}═══════════════════════════════════════════${NC}"
echo ""

# --- Help ---
if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  echo "Usage: bash scripts/submit-pyq.sh <path-to-pdf> [subject-name]"
  echo ""
  echo "Arguments:"
  echo "  <path-to-pdf>    Path to the question paper PDF (required)"
  echo "  [subject-name]   Subject name (optional, auto-detected from filename)"
  echo ""
  echo "Options:"
  echo "  --help, -h       Show this help"
  echo "  --dry-run        Validate without submitting"
  echo "  --email          Submit via email instead of GitHub (for non-devs)"
  echo ""
  echo "Examples:"
  echo "  bash scripts/submit-pyq.sh path/to/DBMS_2024_QP.pdf"
  echo "  bash scripts/submit-pyq.sh path/to/DBMS_2024_QP.pdf \"Database Management Systems\""
  echo "  bash scripts/submit-pyq.sh --email path/to/DBMS_2024_QP.pdf"
  exit 0
fi

PDF_PATH="${1:-}"
SUBJECT_NAME="${2:-}"
DRY_RUN=false
EMAIL_MODE=false

for arg in "$@"; do
  if [[ "$arg" == "--dry-run" ]]; then DRY_RUN=true; fi
  if [[ "$arg" == "--email" ]]; then EMAIL_MODE=true; fi
done

# --- Validation ---
if [[ -z "$PDF_PATH" || "$PDF_PATH" == "--dry-run" || "$PDF_PATH" == "--email" ]]; then
  echo -e "${RED}Error: No PDF file specified.${NC}"
  echo "Usage: bash scripts/submit-pyq.sh <path-to-pdf> [subject-name]"
  exit 1
fi

if [[ ! -f "$PDF_PATH" ]]; then
  echo -e "${RED}Error: File not found: $PDF_PATH${NC}"
  exit 1
fi

if [[ "${PDF_PATH,,}" != *.pdf ]]; then
  echo -e "${RED}Error: File must be a PDF. Got: $PDF_PATH${NC}"
  exit 1
fi

# Check file size (PDFs should be reasonable)
FILE_SIZE=$(stat -c%s "$PDF_PATH" 2>/dev/null || stat -f%z "$PDF_PATH" 2>/dev/null || echo 0)
if [[ "$FILE_SIZE" -lt 1000 ]]; then
  echo -e "${RED}Error: File is too small (${FILE_SIZE} bytes). Not a valid PDF.${NC}"
  exit 1
fi
if [[ "$FILE_SIZE" -gt 100000000 ]]; then
  echo -e "${RED}Error: File exceeds 100MB limit.${NC}"
  exit 1
fi

echo -e "  ${BLUE}✓${NC} PDF found: $(basename "$PDF_PATH") ($(( FILE_SIZE / 1024 )) KB)"

# Extract basename early — needed for both subject and year detection
BASENAME=$(basename "$PDF_PATH" .pdf)

# --- Auto-detect subject from filename ---
if [[ -z "$SUBJECT_NAME" ]]; then
  # Remove common suffixes
  SUBJECT_NAME=$(echo "$BASENAME" | sed -E 's/[-_ ]?(202[0-9]|20[0-9]{2})[-_ ]?(QP|question[-_]?paper|paper|exam|end[-_]?sem|mid[-_]?sem|pyq|previous[-_]?year)?//gi' | sed 's/[-_]/ /g' | xargs)
  if [[ -z "$SUBJECT_NAME" ]]; then
    SUBJECT_NAME="$BASENAME"
  fi
  echo -e "  ${YELLOW}→${NC} Auto-detected subject: ${SUBJECT_NAME}"
fi

# --- Auto-detect year from filename ---
YEAR=""
if [[ "$BASENAME" =~ (202[0-9]) ]]; then
  YEAR="${BASH_REMATCH[1]}"
fi
if [[ -z "$YEAR" ]]; then
  YEAR=$(date +%Y)
  echo -e "  ${YELLOW}→${NC} Year not detected in filename, using current: $YEAR"
fi

# --- Detect semester/exam type ---
EXAM_TYPE=""
if echo "$BASENAME" | grep -qiE "end[-_]?sem|final"; then
  EXAM_TYPE="End-Sem"
elif echo "$BASENAME" | grep -qiE "mid[-_]?sem|midterm|inse"; then
  EXAM_TYPE="Mid-Sem"
elif echo "$BASENAME" | grep -qiE "insem|ise"; then
  EXAM_TYPE="In-Sem"
else
  EXAM_TYPE="Unknown"
fi

echo -e "  ${BLUE}✓${NC} Year: ${YEAR} | Type: ${EXAM_TYPE}"

# --- Check for duplicates in PYQ index ---
if [[ -f "pyq-index/SKILL.md" ]]; then
  if grep -qi "$SUBJECT_NAME" "pyq-index/SKILL.md" 2>/dev/null; then
    echo -e "  ${YELLOW}→${NC} Subject '${SUBJECT_NAME}' already exists in PYQ index."
    echo -e "  ${YELLOW}→${NC} Adding as additional entry (duplicates are fine — more data = better analysis)."
  fi
fi

# --- Validate PDF content (is it a real question paper?) ---
echo -e "  ${BLUE}→${NC} Running validation..."

# Check if pdftotext is available
VALIDATION_OK=true
if command -v pdftotext &>/dev/null; then
  PDF_TEXT=$(pdftotext "$PDF_PATH" - 2>/dev/null | head -200)
  if echo "$PDF_TEXT" | grep -qiE "(question|marks|time|hours)" ; then
    echo -e "  ${GREEN}✓${NC} PDF contains question paper patterns (marks/questions found)"
  else
    echo -e "  ${YELLOW}⚠${NC} PDF may not be a question paper (no marks/questions found in text)"
    echo -e "  ${YELLOW}  ${NC} (This is just a warning — submitting anyway)"
  fi
else
  echo -e "  ${YELLOW}⚠${NC} pdftotext not installed — skipping content validation"
  echo -e "  ${YELLOW}  ${NC} Install: apt install poppler-utils or brew install poppler"
fi

echo ""

# --- Submit ---
if $DRY_RUN; then
  echo -e "${CYAN}[DRY RUN] Would submit:${NC}"
  echo "  File: $PDF_PATH"
  echo "  Subject: $SUBJECT_NAME"
  echo "  Year: $YEAR"
  echo "  Type: $EXAM_TYPE"
  echo ""
  echo -e "${GREEN}Dry run complete. No changes made.${NC}"
  exit 0
fi

if $EMAIL_MODE; then
  echo -e "${CYAN}Email submission mode:${NC}"
  echo ""
  echo "Forward this PDF to: exam-prompt-pyqs@proton.me"
  echo ""
  echo "In the email body, include:"
  echo "  Subject: $SUBJECT_NAME"
  echo "  Year: $YEAR"
  echo "  Exam Type: $EXAM_TYPE"
  echo "  University: [your university]"
  echo "  Semester: [semester number]"
  echo ""
  echo -e "${GREEN}We'll process it and add it to the collection within 48 hours.${NC}"
  exit 0
fi

# --- GitHub submission via issue ---
echo -e "${CYAN}Creating GitHub issue for PYQ submission...${NC}"
echo ""

REPO="pinakdhabu/Exam-prompt"
ISSUE_TITLE="PYQ: ${SUBJECT_NAME} (${YEAR} ${EXAM_TYPE})"
ISSUE_BODY=$(cat <<EOF
## PYQ Submission

**Subject:** ${SUBJECT_NAME}
**Year:** ${YEAR}
**Exam Type:** ${EXAM_TYPE}
**File:** $(basename "$PDF_PATH")
**File Size:** $(( FILE_SIZE / 1024 )) KB
**Submitted by:** $(whoami) on $(date +%Y-%m-%d)

### Instructions for Maintainer

This is an auto-generated issue from \`scripts/submit-pyq.sh\`.
The PDF is attached below. Please:

1. Add to \`pyq-index/SKILL.md\`
2. Move to the correct semester directory
3. Run \`bash scripts/generate-agents-md.sh\` to update index

### Download Link

To upload the PDF, drag and drop the file into this issue comment.

---

*Submitted via submit-pyq.sh — the 1-command PYQ submission tool*
EOF
)

if command -v gh &>/dev/null && gh auth status &>/dev/null 2>&1; then
  echo -e "  ${BLUE}→${NC} Creating issue via GitHub CLI..."
  gh issue create \
    --repo "$REPO" \
    --title "$ISSUE_TITLE" \
    --body "$ISSUE_BODY" \
    --label "pyq-submission" \
    --label "help wanted" || {
    echo -e "  ${YELLOW}⚠${NC} GitHub CLI failed. Falling back to manual submission."
    EMAIL_MODE=true
  }
else
  echo -e "  ${YELLOW}⚠${NC} GitHub CLI not available or not authenticated."
  echo ""
  echo -e "${CYAN}To submit manually:${NC}"
  echo "  1. Go to: https://github.com/$REPO/issues/new"
  echo "  2. Choose template: 'PYQ Submission'"
  echo "  3. Attach your PDF"
  echo "  4. Submit"
  echo ""
  echo -e "${YELLOW}Or use email submission:${NC}"
  echo "  Forward the PDF to: exam-prompt-pyqs@proton.me"
  echo "  Subject: PYQ: ${SUBJECT_NAME} (${YEAR})"
fi

echo ""
echo -e "${GREEN}═══════════════════════════════════════════${NC}"
echo -e "${GREEN}  Thank you! Your PYQ makes this repo better for everyone.${NC}"
echo -e "${GREEN}  Every submitted paper improves analysis accuracy for all students.${NC}"
echo -e "${GREEN}═══════════════════════════════════════════${NC}"
