#!/usr/bin/env bash
# ==============================================================================
# scripts/pyq-index.sh — SPPU PYQ Index Generator
#
# Scans the ~/Downloads/Computer Engineering/ folder and generates a complete,
# organized markdown index of all previous year question paper PDFs.
#
# Usage:
#   ./scripts/pyq-index.sh                          # Generate index (default path)
#   ./scripts/pyq-index.sh --path ~/Downloads        # Custom root path
#   ./scripts/pyq-index.sh --out pyq-index/INDEX.md  # Custom output path
#   ./scripts/pyq-index.sh --stats                   # Stats-only mode
#   ./scripts/pyq-index.sh --refresh                 # Regenerate index from scratch
# ==============================================================================

set -euo pipefail

# --- Config ---
DOWNLOAD_ROOT="${HOME}/Downloads"
COMPENG_DIR="${DOWNLOAD_ROOT}/Computer Engineering"
OUTPUT_FILE="pyq-index/INDEX.md"
STATS_ONLY=false
REFRESH=false

# --- Parse Args ---
while [[ $# -gt 0 ]]; do
  case $1 in
    --path) DOWNLOAD_ROOT="$2"; COMPENG_DIR="${DOWNLOAD_ROOT}/Computer Engineering"; shift 2 ;;
    --out) OUTPUT_FILE="$2"; shift 2 ;;
    --stats) STATS_ONLY=true; shift ;;
    --refresh) REFRESH=true; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

# --- Check ---
if [[ ! -d "$COMPENG_DIR" ]]; then
  echo "ERROR: Computer Engineering directory not found at: $COMPENG_DIR"
  echo "Use --path to specify a different root or ensure it exists."
  exit 1
fi

echo "📂 Scanning: $COMPENG_DIR"
echo ""

# --- Helper: Normalize subject names ---
normalize_subject() {
  local raw="$1"
  # Remove leading numbers like "2 S.E./SEM 3/"
  raw=$(echo "$raw" | sed 's/^[0-9]*\s*S\.E\.\/SEM [0-9]*\///; s/^[0-9]*\s*T\.E\.\/SEM [0-9]*\///; s/^[0-9]*\s*B\.E\.\/SEM [0-9]*\///')
  # Clean up honors paths
  raw=$(echo "$raw" | sed 's/^[0-9]*\s*Honors\///')
  # Convert to Title Case
  echo "$raw" | sed 's/.*/\L&/; s/[a-z]*/\u&/g'
}

# --- Collect all PDFs ---
declare -A SUBJECT_COUNTS
declare -A YEAR_COUNTS
declare -A TYPE_COUNTS
declare -A SEMESTER_COUNTS
TOTAL_PDFS=0
ALL_PDFS=()

while IFS= read -r -d '' pdf; do
  ALL_PDFS+=("$pdf")

  # Extract relative path from Computer Engineering root
  rel_path="${pdf#$COMPENG_DIR/}"

  # Extract semester info
  sem=$(echo "$rel_path" | grep -oP 'SEM \d' | head -1 || echo "Unknown")
  SEMESTER_COUNTS["$sem"]=$(( ${SEMESTER_COUNTS["$sem"]:-0} + 1 ))

  # Extract subject folder name (the folder containing End Sem / In Sem)
  subject=$(echo "$rel_path" | grep -oP '^[^/]+/[^/]+/[^/]+' | sed 's/.*\///' || echo "Other")
  SUBJECT_COUNTS["$subject"]=$(( ${SUBJECT_COUNTS["$subject"]:-0} + 1 ))

  # Extract exam type (End Sem / In Sem)
  if echo "$rel_path" | grep -qi "End Sem"; then
    TYPE_COUNTS["End Semester"]=$(( ${TYPE_COUNTS["End Semester"]:-0} + 1 ))
  elif echo "$rel_path" | grep -qi "In Sem"; then
    TYPE_COUNTS["In Semester"]=$(( ${TYPE_COUNTS["In Semester"]:-0} + 1 ))
  else
    TYPE_COUNTS["Other"]=$(( ${TYPE_COUNTS["Other"]:-0} + 1 ))
  fi

  # Extract year (handles both '22' and '2024' formats)
  year=$(echo "$pdf" | grep -oP '20[2-9][0-9]' | head -1 || echo "")
  if [[ -z "$year" ]]; then
    # Try 2-digit year format
    short=$(echo "$pdf" | grep -oP '(?<![0-9])(2[2-5])(?![0-9])' | head -1 || echo "")
    if [[ -n "$short" ]]; then
      year="20${short}"
    else
      year="Unknown"
    fi
  fi
  YEAR_COUNTS["$year"]=$(( ${YEAR_COUNTS["$year"]:-0} + 1 ))

  TOTAL_PDFS=$((TOTAL_PDFS + 1))

  # Debug: show first 3 PDFs found
  if [[ $TOTAL_PDFS -le 3 ]]; then
    echo "  [Found] $rel_path" >&2
  fi
done < <(find "$COMPENG_DIR" -name "*.pdf" -type f -print0 | sort -z)

# --- Stats Only Mode ---
if $STATS_ONLY; then
  echo "========================================"
  echo "  SPPU PYQ Collection — Statistics"
  echo "========================================"
  echo ""
  echo "📊 Total PDFs: $TOTAL_PDFS"
  echo ""

  echo "📅 By Year:"
  for year in $(echo "${!YEAR_COUNTS[@]}" | tr ' ' '\n' | sort); do
    printf "  %s: %d papers\n" "$year" "${YEAR_COUNTS[$year]}"
  done
  echo ""

  echo "📋 By Exam Type:"
  for type in "End Semester" "In Semester" "Other"; do
    if [[ ${TYPE_COUNTS[$type]:-0} -gt 0 ]]; then
      printf "  %s: %d papers\n" "$type" "${TYPE_COUNTS[$type]}"
    fi
  done
  echo ""

  echo "📚 By Semester:"
  for sem in $(echo "${!SEMESTER_COUNTS[@]}" | tr ' ' '\n' | sort); do
    printf "  %s: %d papers\n" "$sem" "${SEMESTER_COUNTS[$sem]}"
  done
  echo ""

  echo "📖 Top Subjects by Paper Count:"
  for subj in $(echo "${!SUBJECT_COUNTS[@]}" | tr ' ' '\n' | sort -u); do
    printf "  %s: %d papers\n" "$subj" "${SUBJECT_COUNTS[$subj]}"
  done

  exit 0
fi

# --- Generate Index ---
OUTPUT_DIR=$(dirname "$OUTPUT_FILE")
mkdir -p "$OUTPUT_DIR"

{
  echo "# SPPU Previous Year Question Papers — Index"
  echo ""
  echo "**Generated:** $(date '+%Y-%m-%d %H:%M:%S')"
  echo "**Source:** \`${COMPENG_DIR}\`"
  echo "**Total PDFs:** ${TOTAL_PDFS}"
  echo ""
  echo "> ⚠️ These PDFs are scanned images (no extractable text layer)."
  echo "> Use OCR (e.g., \`tesseract\`) via \`scripts/process-document.sh\` for text extraction."
  echo ""
  echo "---"
  echo ""

  # --- Section: Syllabus ---
  echo "## 📋 Syllabus Documents"
  echo ""
  if [[ -d "$COMPENG_DIR/Syllabus" ]]; then
    find "$COMPENG_DIR/Syllabus" -name "*.pdf" -type f | sort | while read -r pdf; do
      rel="${pdf#$COMPENG_DIR/}"
      name=$(basename "$pdf" .pdf)
      echo "- **${name}** — \`${rel}\`"
    done
  else
    echo "*No syllabus documents found.*"
  fi
  echo ""

  # --- Section: SE (Second Year) ---
  echo "---"
  echo ""
  echo "## 🎓 Second Year (S.E.) — Computer Engineering"
  echo ""
  for sem_dir in "$COMPENG_DIR/2 S.E./SEM 3" "$COMPENG_DIR/2 S.E./SEM 4"; do
    sem_name=$(basename "$(dirname "$sem_dir")")/$(basename "$sem_dir")
    if [[ ! -d "$sem_dir" ]]; then continue; fi

    echo "### Semester $(echo "$sem_dir" | grep -oP 'SEM \d')"
    echo ""

    for subject_dir in "$sem_dir"/*/; do
      subject=$(basename "$subject_dir")
      echo "#### ${subject}"
      echo ""

      for exam_type in "In Sem" "End Sem"; do
        exam_dir="${subject_dir}/${exam_type}"
        if [[ ! -d "$exam_dir" ]]; then continue; fi

        papers=$(find "$exam_dir" -name "*.pdf" -type f | sort)
        paper_count=$(echo "$papers" | wc -l)
        if [[ $paper_count -eq 0 ]]; then continue; fi

        echo "**${exam_type}** (${paper_count} papers):"
        echo ""
        echo "$papers" | while read -r pdf; do
          fname=$(basename "$pdf" .pdf)
          echo "  - ${fname}"
        done
        echo ""
      done
    done
  done

  # --- Section: TE (Third Year) ---
  echo "---"
  echo ""
  echo "## 🎓 Third Year (T.E.) — Computer Engineering"
  echo ""
  for sem_dir in "$COMPENG_DIR/3 T.E./SEM 5" "$COMPENG_DIR/3 T.E./SEM 6"; do
    if [[ ! -d "$sem_dir" ]]; then continue; fi

    echo "### Semester $(echo "$sem_dir" | grep -oP 'SEM \d')"
    echo ""

    for subject_dir in "$sem_dir"/*/; do
      subject=$(basename "$subject_dir")
      echo "#### ${subject}"
      echo ""

      # Check for electives sub-structure
      found_papers=false
      for exam_type in "In Sem" "End Sem"; do
        exam_dir="${subject_dir}/${exam_type}"
        if [[ ! -d "$exam_dir" ]]; then continue; fi

        papers=$(find "$exam_dir" -name "*.pdf" -type f | sort)
        paper_count=$(echo "$papers" | wc -l)
        if [[ $paper_count -eq 0 ]]; then continue; fi

        found_papers=true
        echo "**${exam_type}** (${paper_count} papers):"
        echo ""
        echo "$papers" | while read -r pdf; do
          fname=$(basename "$pdf" .pdf)
          echo "  - ${fname}"
        done
        echo ""
      done

      # If no In Sem/End Sem folders, list PDFs directly
      if ! $found_papers; then
        papers=$(find "$subject_dir" -maxdepth 1 -name "*.pdf" -type f | sort)
        paper_count=$(echo "$papers" | wc -l)
        if [[ $paper_count -gt 0 ]]; then
          echo "**Papers:**"
          echo ""
          echo "$papers" | while read -r pdf; do
            fname=$(basename "$pdf" .pdf)
            echo "  - ${fname}"
          done
          echo ""
        fi
      fi
    done
  done

  # --- Section: BE (Fourth Year) ---
  echo "---"
  echo ""
  echo "## 🎓 Fourth Year (B.E.) — Computer Engineering"
  echo ""
  for sem_dir in "$COMPENG_DIR/4 B.E./SEM 7" "$COMPENG_DIR/4 B.E./SEM 8"; do
    if [[ ! -d "$sem_dir" ]]; then continue; fi

    echo "### Semester $(echo "$sem_dir" | grep -oP 'SEM \d')"
    echo ""

    for subject_dir in "$sem_dir"/*/; do
      subject=$(basename "$subject_dir")
      echo "#### ${subject}"
      echo ""

      found_papers=false
      for exam_type in "In Sem" "End Sem"; do
        exam_dir="${subject_dir}/${exam_type}"
        if [[ ! -d "$exam_dir" ]]; then continue; fi

        papers=$(find "$exam_dir" -name "*.pdf" -type f | sort)
        paper_count=$(echo "$papers" | wc -l)
        if [[ $paper_count -eq 0 ]]; then continue; fi

        found_papers=true
        echo "**${exam_type}** (${paper_count} papers):"
        echo ""
        echo "$papers" | while read -r pdf; do
          fname=$(basename "$pdf" .pdf)
          echo "  - ${fname}"
        done
        echo ""
      done

      if ! $found_papers; then
        papers=$(find "$subject_dir" -maxdepth 1 -name "*.pdf" -type f | sort)
        paper_count=$(echo "$papers" | wc -l)
        if [[ $paper_count -gt 0 ]]; then
          echo "**Papers:**"
          echo ""
          echo "$papers" | while read -r pdf; do
            fname=$(basename "$pdf" .pdf)
            echo "  - ${fname}"
          done
          echo ""
        fi
      fi
    done
  done

  # --- Section: Honors ---
  if [[ -d "$COMPENG_DIR/5 Honors" ]]; then
    echo "---"
    echo ""
    echo "## 🏅 Honors Tracks"
    echo ""
    for track_dir in "$COMPENG_DIR/5 Honors"/*/; do
      track=$(basename "$track_dir")
      echo "### ${track}"
      echo ""

      for stage_dir in "$track_dir"/*/; do
        stage=$(basename "$stage_dir")
        echo "**${stage}**"
        echo ""

        for exam_type in "In Sem" "End Sem"; do
          papers=$(find "$stage_dir" -name "*.pdf" -type f -path "*/${exam_type}/*" 2>/dev/null | sort)
          paper_count=$(echo "$papers" | wc -l)
          if [[ $paper_count -eq 0 ]]; then continue; fi

          echo "- ${exam_type} (${paper_count} papers)"
          echo "$papers" | while read -r pdf; do
            fname=$(basename "$pdf" .pdf)
            echo "  - ${fname}"
          done
        done
        echo ""
      done
    done
  fi

  # --- Stats Summary ---
  echo "---"
  echo ""
  echo "## 📊 Collection Summary"
  echo ""
  echo "| Metric | Value |"
  echo "|--------|-------|"
  echo "| **Total PDFs** | ${TOTAL_PDFS} |"
  echo "| **Years Covered** | $(echo "${!YEAR_COUNTS[@]}" | tr ' ' '\n' | sort | tr '\n' ' ' | sed 's/ /, /g; s/, $//') |"

  echo "| **End Semester Papers** | ${TYPE_COUNTS[End Semester]:-0} |"
  echo "| **In Semester Papers** | ${TYPE_COUNTS[In Semester]:-0} |"

  max_subject=""
  max_count=0
  for subj in "${!SUBJECT_COUNTS[@]}"; do
    if [[ ${SUBJECT_COUNTS[$subj]} -gt $max_count ]]; then
      max_count=${SUBJECT_COUNTS[$subj]}
      max_subject=$subj
    fi
  done
  echo "| **Most Papers** | ${max_subject} (${max_count}) |"
  echo ""

} > "$OUTPUT_FILE"

echo "✅ Index generated: $OUTPUT_FILE"
echo "   Total PDFs indexed: $TOTAL_PDFS"
echo ""
echo "Quick Stats:"
echo "  - End Semester: ${TYPE_COUNTS[End Semester]:-0}"
echo "  - In Semester: ${TYPE_COUNTS[In Semester]:-0}"
echo "  - Years: $(echo "${!YEAR_COUNTS[@]}" | tr ' ' '\n' | sort | tr '\n' ' ')"
echo ""
echo "Run with --stats for detailed statistics."
