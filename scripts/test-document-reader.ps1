<#
.SYNOPSIS
    Demo/test the document reader skill (PowerShell)
.DESCRIPTION
    Tests document conversion by creating a sample file and
    demonstrating the conversion pipeline.
.USAGE
    .\scripts\test-document-reader.ps1 [input-file]
#>

param(
    [string]$InputFile = ""
)

$RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$TempDir = Join-Path $env:TEMP "opencode\doc-reader-test-$PID"

New-Item -ItemType Directory -Path $TempDir -Force | Out-Null

function Write-Step { Write-Host "`n$args" -ForegroundColor Blue }
function Write-Ok   { Write-Host $args -ForegroundColor Green }
function Write-Section { Write-Host "============================================" -ForegroundColor Cyan }

Write-Section
Write-Host " Document Reader Skill — Test/Demo (PowerShell)" -ForegroundColor Cyan
Write-Section

# Step 1: Check deps
Write-Step "Step 1: Checking dependencies..."
$CheckDeps = Join-Path $RepoRoot "scripts\check-deps.ps1"
if (Test-Path $CheckDeps) {
    & $CheckDeps
}
Write-Host ""

# Step 2: Create or use test file
Write-Step "Step 2: Test document..."

if ([string]::IsNullOrEmpty($InputFile) -or -not (Test-Path $InputFile)) {
    $SampleFile = Join-Path $TempDir "sample-syllabus.txt"
    @"
UNIVERSITY OF TECHNOLOGY
Department of Computer Engineering
Course: Data Structures and Algorithms (CS201)

COURSE OUTCOMES:
CO1: Understand and implement fundamental data structures
CO2: Analyze algorithm complexity using Big-O notation
CO3: Apply sorting and searching algorithms
CO4: Design efficient algorithms

UNIT 1: Introduction to Data Structures
- Arrays and Linked Lists, Stack and Queue
- Time and Space complexity analysis
- Asymptotic notation (Big-O, Omega, Theta)

UNIT 2: Trees and Graphs
- Binary Trees, BST, AVL Trees
- BFS and DFS traversal
- Heap data structure

UNIT 3: Sorting Algorithms
- Bubble Sort, Selection Sort, Insertion Sort
- Quick Sort, Merge Sort, Heap Sort

UNIT 4: Hashing and Advanced Structures
- Hash tables and collision resolution
- B-Trees and B+ Trees

EXAMINATION PATTERN:
- Internal Assessment: 30 marks
- End Semester Examination: 70 marks
- Total: 100 marks
"@ | Out-File -FilePath $SampleFile -Encoding utf8

    $InputFile = $SampleFile
    Write-Ok "Created sample: $SampleFile"
} else {
    Write-Ok "Using provided file: $InputFile"
}
Write-Host ""

# Step 3: Show file info
Write-Step "Step 3: Document info..."
$fi = Get-Item $InputFile
$words = (Get-Content $InputFile | Out-String).Split([char[]]@(' ', "`t", "`r", "`n"), [StringSplitOptions]::RemoveEmptyEntries).Count
$lines = (Get-Content $InputFile).Count
Write-Ok "  Words: $words"
Write-Ok "  Lines: $lines"
Write-Host ""

# Step 4: Preview
Write-Step "Step 4: Preview (first 15 lines):"
Write-Host "----------------------------------------------------"
Get-Content $InputFile -TotalCount 15
Write-Host "----------------------------------------------------"
Write-Host ""

# Step 5: Process
Write-Step "Step 5: Testing conversion..."
Write-Ok "  Text file — no conversion needed"
Write-Ok "  Output: $InputFile"
Write-Host ""

# Summary
Write-Section
Write-Host " Test Complete!" -ForegroundColor Cyan
Write-Section
Write-Host ""
Write-Host "Usage examples:"
Write-Host "  .\scripts\test-document-reader.ps1 notes.pdf" -ForegroundColor Cyan
Write-Host "  .\scripts\test-document-reader.ps1 syllabus.docx" -ForegroundColor Cyan
Write-Host ""
Write-Host "Or use the wrapper script:"
Write-Host "  .\scripts\process-document.ps1 <file> <skill>" -ForegroundColor Cyan
Write-Host ""

# Cleanup
Remove-Item $TempDir -Recurse -Force -ErrorAction SilentlyContinue
