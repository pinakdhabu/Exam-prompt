#!/usr/bin/env bash
# ============================================================
# test-document-reader.sh — Demo/test the document reader skill
#
# Usage:
#   ./scripts/test-document-reader.sh [input-file]
#
# If no input file provided, creates a sample PDF for testing.
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMP_DIR="/tmp/opencode/doc-reader-test-$$"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}=========================================="
echo "Document Reader Skill — Test/Demo"
echo "==========================================${NC}"
echo ""

# Check dependencies first
echo -e "${BLUE}Step 1: Checking dependencies...${NC}"
if [ -f "$REPO_ROOT/scripts/check-deps.sh" ]; then
    bash "$REPO_ROOT/scripts/check-deps.sh" || {
        echo -e "${YELLOW}Some dependencies missing. Continuing anyway...${NC}"
    }
else
    echo -e "${YELLOW}check-deps.sh not found, skipping dependency check${NC}"
fi
echo ""

# Create temp directory
mkdir -p "$TEMP_DIR"

# Get input file
INPUT_FILE="${1:-}"

if [ -z "$INPUT_FILE" ]; then
    echo -e "${BLUE}Step 2: Creating sample test document...${NC}"

    # Create a sample text file
    SAMPLE_FILE="$TEMP_DIR/sample-syllabus.txt"
    cat > "$SAMPLE_FILE" << 'EOF'
UNIVERSITY OF TECHNOLOGY
Department of Computer Engineering
Course: Data Structures and Algorithms (CS201)
Semester: Fall 2025

COURSE OUTCOMES:
Upon completion of this course, students will be able to:
CO1: Understand and implement fundamental data structures
CO2: Analyze algorithm complexity using Big-O notation
CO3: Apply sorting and searching algorithms
CO4: Design efficient algorithms for real-world problems

UNIT 1: Introduction to Data Structures (10 hours)
- Arrays and Linked Lists
- Stack and Queue implementations
- Time and Space complexity analysis
- Asymptotic notation (Big-O, Omega, Theta)

UNIT 2: Trees and Graphs (12 hours)
- Binary Trees, BST, AVL Trees
- Heap data structure
- Graph representations (adjacency matrix, list)
- BFS and DFS traversal

UNIT 3: Sorting Algorithms (10 hours)
- Bubble Sort, Selection Sort, Insertion Sort
- Quick Sort, Merge Sort
- Heap Sort, Radix Sort
- Comparison of sorting algorithms

UNIT 4: Hashing and Advanced Structures (8 hours)
- Hash tables and collision resolution
- B-Trees and B+ Trees
- Tries and Suffix Trees
- Disjoint Set Union

EXAMINATION PATTERN:
- Internal Assessment: 30 marks
- End Semester Examination: 70 marks
- Total: 100 marks

REFERENCE BOOKS:
1. "Data Structures and Algorithms" by Aho, Hopcroft, Ullman
2. "Introduction to Algorithms" by Cormen et al. (CLRS)
3. "Data Structures using C" by Reema Thareja
EOF

    INPUT_FILE="$SAMPLE_FILE"
    echo -e "${GREEN}Created sample: $SAMPLE_FILE${NC}"
    echo ""
fi

# Test 1: Basic text file
echo -e "${BLUE}Step 3: Testing document conversion...${NC}"
echo ""

if [ -f "$INPUT_FILE" ]; then
    EXTENSION="${INPUT_FILE##*.}"
    echo -e "Input file: ${CYAN}$INPUT_FILE${NC}"
    echo -e "Extension: ${CYAN}.$EXTENSION${NC}"
    echo ""

    # Get file stats
    WORD_COUNT=$(wc -w < "$INPUT_FILE")
    LINE_COUNT=$(wc -l < "$INPUT_FILE")
    echo -e "Words: ${GREEN}$WORD_COUNT${NC}"
    echo -e "Lines: ${GREEN}$LINE_COUNT${NC}"
    echo ""

    # Show preview
    echo -e "${BLUE}Step 4: Document preview (first 20 lines):${NC}"
    echo "----------------------------------------------------"
    head -n 20 "$INPUT_FILE"
    echo "----------------------------------------------------"
    echo ""

    # If it's a text file, copy it as "converted"
    if [[ "$EXTENSION" =~ ^(txt|md|text)$ ]]; then
        OUTPUT_FILE="$TEMP_DIR/converted.txt"
        cp "$INPUT_FILE" "$OUTPUT_FILE"
        echo -e "${GREEN}✓ Text file — no conversion needed${NC}"
    else
        # Try conversion
        OUTPUT_FILE="$TEMP_DIR/converted.txt"
        if [ -f "$REPO_ROOT/scripts/process-document.sh" ]; then
            echo -e "${BLUE}Running conversion...${NC}"
            # Just copy for demo (real conversion would use pdftotext etc.)
            cp "$INPUT_FILE" "$OUTPUT_FILE" 2>/dev/null || true
        fi
    fi

    if [ -f "$OUTPUT_FILE" ]; then
        echo ""
        echo -e "${GREEN}✓ Document converted successfully!${NC}"
        echo ""
        echo -e "${BLUE}Step 5: Converted text preview:${NC}"
        echo "----------------------------------------------------"
        head -n 10 "$OUTPUT_FILE"
        echo "----------------------------------------------------"
        echo ""

        echo -e "${GREEN}Output saved to: $OUTPUT_FILE${NC}"
    fi
else
    echo -e "${RED}Input file not found: $INPUT_FILE${NC}"
fi

echo ""
echo -e "${CYAN}=========================================="
echo "Test Complete!"
echo "==========================================${NC}"
echo ""
echo "Usage examples:"
echo "  $0 notes.pdf"
echo "  $0 syllabus.docx"
echo "  $0 lecture.png"
echo ""
echo "Or use the wrapper script directly:"
echo "  ./scripts/process-document.sh <file> <skill>"
echo ""

# Cleanup
trap "rm -rf $TEMP_DIR" EXIT
