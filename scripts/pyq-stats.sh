#!/usr/bin/env bash
# ==============================================================================
# scripts/pyq-stats.sh — SPPU PYQ Collection Statistics
#
# Generates real statistics from the SPPU PYQ PDF collection.
# Uses file metadata (names, dates, counts) — no OCR needed.
#
# Usage:
#   ./scripts/pyq-stats.sh                                    # Full stats report
#   ./scripts/pyq-stats.sh --subjects                         # Per-subject breakdown
#   ./scripts/pyq-stats.sh --gaps                             # Find subjects with few papers
#   ./scripts/pyq-stats.sh --json                             # Machine-readable JSON output
#   ./scripts/pyq-stats.sh --path ~/Downloads/Other\ branch   # Analyze a different directory
# ==============================================================================

set -euo pipefail

# --- Config ---
PYQ_DIR="${HOME}/Downloads/Computer Engineering"
OUTPUT_MODE="full"

# --- Help ---
if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  sed -n '2,/^$/p' "$0" | sed 's/^#//; s/^ //'
  exit 0
fi

while [[ $# -gt 0 ]]; do
  case $1 in
    --subjects) OUTPUT_MODE="subjects"; shift ;;
    --gaps) OUTPUT_MODE="gaps"; shift ;;
    --json) OUTPUT_MODE="json"; shift ;;
    --path) PYQ_DIR="$2"; shift 2 ;;
    *) echo "Usage: $0 [--subjects|--gaps|--json] [--path <dir>]"; exit 1 ;;
  esac
done

[[ -d "$PYQ_DIR" ]] || { echo "ERROR: Not found: $PYQ_DIR"; exit 1; }

# --- Collect Data ---
declare -A SUBJ_TOTAL SUBJ_END SUBJ_IN YEAR CNT SEM
TOTAL=0
SIZE=0

while IFS= read -r -d '' pdf; do
  rel="${pdf#$PYQ_DIR/}"
  TOTAL=$((TOTAL + 1))
  sz=$(stat -c%s "$pdf" 2>/dev/null || echo 0)
  SIZE=$((SIZE + sz))

  # Subject key (path minus filename and End Sem/In Sem)
  if echo "$rel" | grep -qi "End Sem"; then
    key=$(echo "$rel" | sed 's|/End Sem/.*||')
    SUBJ_END["$key"]=$(( ${SUBJ_END["$key"]:-0} + 1 ))
  elif echo "$rel" | grep -qi "In Sem"; then
    key=$(echo "$rel" | sed 's|/In Sem/.*||')
    SUBJ_IN["$key"]=$(( ${SUBJ_IN["$key"]:-0} + 1 ))
  else
    key=$(echo "$rel" | sed 's|/[^/]*$||')
  fi
  SUBJ_TOTAL["$key"]=$(( ${SUBJ_TOTAL["$key"]:-0} + 1 ))

  # Year
  yr=$(echo "$pdf" | grep -oP '20[2-9][0-9]' | head -1 || echo "")
  if [[ -z "$yr" ]]; then
    sh=$(echo "$pdf" | grep -oP '(?<![0-9])(2[2-5])(?![0-9])' | head -1 || echo "")
    yr="${sh:+20$sh}"
    yr="${yr:-Unknown}"
  fi
  CNT["$yr"]=$(( ${CNT["$yr"]:-0} + 1 ))

  # Semester
  s=$(echo "$rel" | grep -oP 'SEM \d' | head -1 || echo "Other")
  SEM["$s"]=$(( ${SEM["$s"]:-0} + 1 ))
done < <(find "$PYQ_DIR" -name "*.pdf" -type f -print0 | sort -z)

# --- Helpers ---
fmt_size() {
  local b=$1
  (( b >= 1073741824 )) && echo "$(bc <<< "scale=1; $b/1073741824") GB" && return
  (( b >= 1048576 )) && echo "$(bc <<< "scale=1; $b/1048576") MB" && return
  (( b >= 1024 )) && echo "$(bc <<< "scale=1; $b/1024") KB" && return
  echo "${b}B"
}

sort_keys() { printf '%s\n' "$@" | sort; }

basename_key() { echo "${1##*/}"; }

# ========== JSON ==========
if [[ "$OUTPUT_MODE" == "json" ]]; then
  echo '{'
  echo "  \"total_pdfs\": $TOTAL,"
  echo "  \"total_size_bytes\": $SIZE,"
  echo "  \"total_size_human\": \"$(fmt_size $SIZE)\","
  echo '  "years": {'
  first=1
  while IFS= read -r y; do
    [[ -z "$y" ]] && continue
    [[ $first -eq 1 ]] && first=0 || echo ','
    echo -n "    \"$y\": ${CNT[$y]}"
  done < <(sort_keys "${!CNT[@]}")
  echo ''; echo '  },'
  echo '  "semesters": {'
  first=1
  while IFS= read -r s; do
    [[ -z "$s" ]] && continue
    [[ $first -eq 1 ]] && first=0 || echo ','
    echo -n "    \"$s\": ${SEM[$s]}"
  done < <(sort_keys "${!SEM[@]}")
  echo ''; echo '  },'
  echo '  "subjects": ['
  first=1
  while IFS= read -r k; do
    [[ -z "$k" ]] && continue
    [[ $first -eq 1 ]] && first=0 || echo ','
    n=$(basename_key "$k")
    t=${SUBJ_TOTAL["$k"]}
    e=${SUBJ_END["$k"]:-0}
    i=${SUBJ_IN["$k"]:-0}
    echo -n "    {\"name\": \"$n\", \"total\": $t, \"end_sem\": $e, \"in_sem\": $i}"
  done < <(sort_keys "${!SUBJ_TOTAL[@]}")
  echo ''; echo '  ]'
  echo '}'
  exit 0
fi

# ========== Gaps ==========
if [[ "$OUTPUT_MODE" == "gaps" ]]; then
  echo "Subjects with <8 total papers (weak coverage):"
  echo ""
  while IFS= read -r k; do
    [[ -z "$k" ]] && continue
    t=${SUBJ_TOTAL["$k"]}
    [[ $t -ge 8 ]] && continue
    n=$(basename_key "$k")
    e=${SUBJ_END["$k"]:-0}
    i=${SUBJ_IN["$k"]:-0}
    printf "  %-45s %2d total  (End: %d, In: %d)\n" "$(basename_key "$k")" "$t" "$e" "$i"
  done < <(sort_keys "${!SUBJ_TOTAL[@]}")
  echo ""
  echo "Note: Core SE/TE subjects have 10-11 papers. Electives may have fewer."
  exit 0
fi

# ========== Subjects ==========
if [[ "$OUTPUT_MODE" == "subjects" ]]; then
  printf "%-50s %5s %6s %6s\n" "Subject" "Total" "EndSem" "InSem"
  printf "%-50s %5s %6s %6s\n" "$(printf '%.0s-' {1..50})" "-----" "------" "------"
  while IFS= read -r k; do
    [[ -z "$k" ]] && continue
    t=${SUBJ_TOTAL["$k"]}
    e=${SUBJ_END["$k"]:-0}
    i=${SUBJ_IN["$k"]:-0}
    n=$(basename_key "$k" | sed 's/^COMPUTER //; s/AND/\&/')
    printf "%-50s %5d %6d %6d\n" "$n" "$t" "$e" "$i"
  done < <(sort_keys "${!SUBJ_TOTAL[@]}")
  exit 0
fi

# ========== Full Report ==========
echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║  SPPU Previous Year Question Papers — Stats  ║"
echo "╚══════════════════════════════════════════════╝"
echo ""
echo "📂 Source: $PYQ_DIR"
echo ""

echo "───────────────────────────────────────────────"
echo "  OVERVIEW"
echo "───────────────────────────────────────────────"
printf "  %-25s %s\n" "Total PDFs:" "$TOTAL"
printf "  %-25s %s\n" "Total Size:" "$(fmt_size $SIZE)"
printf "  %-25s %s\n" "Subjects:" "${#SUBJ_TOTAL[@]}"
printf "  %-25s %s\n" "End Sem Subjects:" "${#SUBJ_END[@]}"
printf "  %-25s %s\n" "In Sem Subjects:" "${#SUBJ_IN[@]}"
echo ""

echo "───────────────────────────────────────────────"
echo "  BY YEAR"
echo "───────────────────────────────────────────────"
while IFS= read -r y; do
  [[ -z "$y" ]] && continue
  c=${CNT["$y"]}
  bar=$(printf '%*s' $((c / 10)) '' | tr ' ' '█')
  printf "  %s  %5d  %s\n" "$y" "$c" "$bar"
done < <(sort_keys "${!CNT[@]}")
echo ""

echo "───────────────────────────────────────────────"
echo "  BY SEMESTER"
echo "───────────────────────────────────────────────"
while IFS= read -r s; do
  [[ -z "$s" ]] && continue
  c=${SEM["$s"]}
  bar=$(printf '%*s' $((c / 10)) '' | tr ' ' '▊')
  printf "  %-6s  %4d  %s\n" "$s" "$c" "$bar"
done < <(sort_keys "${!SEM[@]}")
echo ""

echo "───────────────────────────────────────────────"
echo "  TOP SUBJECTS (by paper count)"
echo "───────────────────────────────────────────────"
printf "  %-40s %5s %6s %6s\n" "Subject" "Total" "EndSem" "InSem"
printf "  %-40s %5s %6s %6s\n" "$(printf '%.0s-' {1..40})" "-----" "------" "------"
# Collect and sort by count descending
SUBJ_SORTED=()
while IFS= read -r k; do
  [[ -z "$k" ]] && continue
  SUBJ_SORTED+=("${SUBJ_TOTAL["$k"]}|$k")
done < <(sort_keys "${!SUBJ_TOTAL[@]}")
while IFS= read -r entry; do
  [[ -z "$entry" ]] && continue
  cnt="${entry%%|*}"
  key="${entry#*|}"
  e=${SUBJ_END["$key"]:-0}
  i=${SUBJ_IN["$key"]:-0}
  n=$(basename_key "$key" | sed 's/^COMPUTER //; s/AND/\&/')
  printf "  %-40s %5d %6d %6d\n" "$n" "$cnt" "$e" "$i"
done < <(printf '%s\n' "${SUBJ_SORTED[@]}" | sort -t'|' -k1 -rn | head -20)
echo ""

echo "───────────────────────────────────────────────"
echo "  COVERAGE ASSESSMENT"
echo "───────────────────────────────────────────────"
strong=0; moderate=0; weak=0
while IFS= read -r k; do
  [[ -z "$k" ]] && continue
  t=${SUBJ_TOTAL["$k"]}
  (( t >= 10 )) && { strong=$((strong+1)); continue; }
  (( t >= 5 )) && { moderate=$((moderate+1)); continue; }
  weak=$((weak+1))
done < <(sort_keys "${!SUBJ_TOTAL[@]}")
printf "  %-30s %d subjects (10+ papers each)\n" "🟢 Strong coverage:" $strong
printf "  %-30s %d subjects (5-9 papers)\n"    "🟡 Moderate coverage:" $moderate
printf "  %-30s %d subjects (<5 papers)\n"     "🔴 Weak coverage:" $weak
echo ""
echo "Run --subjects for per-subject breakdown."
echo "Run --gaps to find coverage gaps."
echo "Run --json for machine-readable output."
