<#
.SYNOPSIS
    Convert document to text and chain to a skill (Windows)
.DESCRIPTION
    Detects file format, converts to clean LLM-friendly text,
    then loads the target skill for processing.
    Falls back to Python when native tools are unavailable.
.USAGE
    .\scripts\process-document.ps1 <input-file> <target-skill>
    .\scripts\process-document.ps1 notes.pdf notes-generator
    .\scripts\process-document.ps1 syllabus.docx pyq-analyzer
    .\scripts\process-document.ps1 image.png flashcard-generator
#>

param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$InputFile,

    [Parameter(Mandatory=$true, Position=1)]
    [string]$TargetSkill,

    [Parameter(ValueFromRemainingArguments=$true)]
    [string[]]$ExtraArgs
)

$RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$SkillsDir = Join-Path $RepoRoot "skills"
$TempDir = Join-Path $env:TEMP "opencode\doc-reader-$PID"

# Colors via Write-Host
function Write-Error { param([string]$Msg) Write-Host "ERROR: $Msg" -ForegroundColor Red }
function Write-Info { param([string]$Msg) Write-Host "INFO: $Msg" -ForegroundColor Blue }
function Write-Success { param([string]$Msg) Write-Host "SUCCESS: $Msg" -ForegroundColor Green }
function Write-Warn { param([string]$Msg) Write-Host "WARNING: $Msg" -ForegroundColor Yellow }

# ============================================================
# VALIDATION
# ============================================================

if (-not (Test-Path $InputFile)) {
    Write-Error "Input file not found: $InputFile"
    exit 1
}

$SkillPath = Join-Path $SkillsDir $TargetSkill
if (-not (Test-Path $SkillPath)) {
    Write-Error "Target skill not found: $TargetSkill"
    exit 1
}

# Create temp dir
New-Item -ItemType Directory -Path $TempDir -Force | Out-Null

$Filename = Split-Path $InputFile -Leaf
$Extension = [System.IO.Path]::GetExtension($Filename).TrimStart('.').ToLower()
$Basename = [System.IO.Path]::GetFileNameWithoutExtension($Filename)
$OutputFile = Join-Path $TempDir "${Basename}_converted.txt"

Write-Info "Processing: $InputFile"
Write-Info "Target skill: $TargetSkill"

# ============================================================
# STEP 1: Convert document to text
# ============================================================

function Convert-Document {
    param([string]$Input, [string]$Output, [string]$Ext)

    switch ($Ext) {
        "pdf" {
            if (Get-Command pdftotext -ErrorAction SilentlyContinue) {
                Write-Info "Using pdftotext for PDF..."
                & pdftotext -layout $Input $Output 2>$null
                if ((Test-Path $Output) -and ((Get-Item $Output).Length -gt 0)) {
                    return
                }
                Write-Warn "pdftotext produced no output, trying OCR..."
                if (Get-Command tesseract -ErrorAction SilentlyContinue) {
                    $imgDir = Join-Path $TempDir "pdf_pages"
                    New-Item -ItemType Directory -Path $imgDir -Force | Out-Null
                    & pdftoppm -png -r 300 $Input "$imgDir\page" 2>$null
                    Get-ChildItem "$imgDir\page-*.png" | ForEach-Object {
                        $base = $_.FullName -replace '\.png$', ''
                        & tesseract $_.FullName $base -l eng 2>$null
                    }
                    $txtFiles = Get-ChildItem "$imgDir\page-*.txt" 2>$null
                    if ($txtFiles) {
                        Get-Content $txtFiles | Set-Content $Output
                    }
                }
            } else {
                # Fallback to Python (try pypdf first, then PyPDF2)
                Write-Info "pdftotext not found, using Python..."
                $ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
                & python "$ScriptDir\pdf-extract.py" $Input $Output
            }
        }

        "docx" {
            if (Get-Command pandoc -ErrorAction SilentlyContinue) {
                Write-Info "Using pandoc for DOCX..."
                & pandoc $Input -t plain -o $Output
            } else {
                Write-Info "pandoc not found, using Python (python-docx)..."
                & python -c @"
try:
    from docx import Document
    doc = Document('$Input'.replace('\\', '\\\\'))
    with open('$Output'.replace('\\', '\\\\'), 'w', encoding='utf-8') as f:
        for para in doc.paragraphs:
            f.write(para.text + '\n')
except Exception as e:
    print(f'python-docx failed: {e}', file=sys.stderr)
    sys.exit(1)
"@
            }
        }

        "txt" { Copy-Item $Input $Output; Write-Info "Text file — copied directly" }
        "md"  { Copy-Item $Input $Output; Write-Info "Markdown file — copied directly" }

        { @("png","jpg","jpeg","tiff","bmp","gif") -contains $_ } {
            if (Get-Command tesseract -ErrorAction SilentlyContinue) {
                Write-Info "Using tesseract for OCR..."
                $base = Join-Path $TempDir $Basename
                & tesseract $Input $base -l eng 2>$null
                if (Test-Path "${base}.txt") {
                    Move-Item "${base}.txt" $Output -Force
                }
            } else {
                Write-Info "tesseract not found, using Python (pytesseract)..."
                & python -c @"
try:
    from PIL import Image
    import pytesseract
    image = Image.open('$Input'.replace('\\', '\\\\'))
    text = pytesseract.image_to_string(image)
    with open('$Output'.replace('\\', '\\\\'), 'w', encoding='utf-8') as f:
        f.write(text)
except Exception as e:
    print(f'pytesseract failed: {e}', file=sys.stderr)
    sys.exit(1)
"@
            }
        }

        "pptx" {
            if (Get-Command pandoc -ErrorAction SilentlyContinue) {
                Write-Info "Using pandoc for PPTX..."
                & pandoc $Input -t plain -o $Output
            } else {
                Write-Error "pandoc not found. Install: winget install 9NBLGGH4W8GQ  (or: choco install pandoc / scoop install pandoc)"
            }
        }

        "epub" {
            if (Get-Command pandoc -ErrorAction SilentlyContinue) {
                Write-Info "Using pandoc for EPUB..."
                & pandoc $Input -t plain -o $Output
            } else {
                Write-Error "pandoc not found. Install: winget install 9NBLGGH4W8GQ  (or: choco install pandoc / scoop install pandoc)"
            }
        }

        "html" {
            if (Get-Command pandoc -ErrorAction SilentlyContinue) {
                Write-Info "Using pandoc for HTML..."
                & pandoc $Input -t plain -o $Output
            } else {
                Write-Error "pandoc not found. Install: winget install 9NBLGGH4W8GQ  (or: choco install pandoc / scoop install pandoc)"
            }
        }

        default {
            Write-Error "Unsupported file format: .$Ext"
            exit 1
        }
    }
}

Convert-Document -Input $InputFile -Output $OutputFile -Ext $Extension

# Check if conversion succeeded
if (-not (Test-Path $OutputFile) -or ((Get-Item $OutputFile).Length -eq 0)) {
    Write-Error "Document conversion failed — no text extracted"
    exit 1
}

$WordCount = (Get-Content $OutputFile | Measure-Object -Word).Words
$LineCount = (Get-Content $OutputFile | Measure-Object -Line).Lines
Write-Success "Converted: $WordCount words, $LineCount lines"

# ============================================================
# STEP 2: Clean text
# ============================================================

$CleanFile = Join-Path $TempDir "${Basename}_clean.txt"

& python -c @"
import re, sys

input_file = '$OutputFile'.replace('\\', '\\\\')
output_file = '$CleanFile'.replace('\\', '\\\\')

with open(input_file, 'r', encoding='utf-8') as f:
    text = f.read()

text = re.sub(r'\n\s*\n', '\n\n', text)
text = re.sub(r' +', ' ', text)
text = re.sub(r'(?m)^\d+\s*$', '', text)
text = re.sub(r'(?m)^Page \d+.*$', '', text)
text = re.sub(r'(\w)-\n(\w)', r'\1\2', text)

with open(output_file, 'w', encoding='utf-8') as f:
    f.write(text)
"@

Copy-Item $CleanFile $OutputFile -Force
Write-Info "Text cleaned"

# ============================================================
# STEP 3: Output result
# ============================================================

$SkillFile = Join-Path $SkillPath "SKILL.md"

Write-Host ""
Write-Host "====================================================" -ForegroundColor Blue
Write-Host " DOCUMENT CONVERTED SUCCESSFULLY" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Blue
Write-Host ""
Write-Host "Source: $InputFile"
Write-Host "Format: $Extension"
Write-Host "Words:  $WordCount"
Write-Host "Lines:  $LineCount"
Write-Host "Output: $OutputFile"
Write-Host ""
Write-Host "====================================================" -ForegroundColor Blue
Write-Host " TARGET SKILL: $TargetSkill"
Write-Host "====================================================" -ForegroundColor Blue
Write-Host ""

# Show preview
Write-Host "Converted text preview (first 30 lines):" -ForegroundColor Cyan
Write-Host "----------------------------------------------------"
Get-Content $OutputFile -TotalCount 30
Write-Host "----------------------------------------------------"
Write-Host ""

if (Test-Path $SkillFile) {
    Write-Host "Skill instructions loaded from: $SkillFile" -ForegroundColor Cyan
    Write-Host ""
    Get-Content $SkillFile -TotalCount 15
    Write-Host "..."
}

Write-Host ""
Write-Host "====================================================" -ForegroundColor Blue
Write-Host " READY FOR PROCESSING" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Blue
Write-Host ""
Write-Host "Converted text available at: $OutputFile"
Write-Host ""

# Cleanup
Remove-Item $TempDir -Recurse -Force -ErrorAction SilentlyContinue
