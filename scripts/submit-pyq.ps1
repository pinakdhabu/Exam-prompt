<#
.SYNOPSIS
  One-command PYQ submission
.DESCRIPTION
  Submit a question paper PDF to the Exam Prompt collection.
.PARAMETER Path
  Path to the question paper PDF
.PARAMETER Subject
  Subject name (optional, auto-detected from filename)
.PARAMETER DryRun
  Validate without submitting
.PARAMETER Email
  Submit via email instead of GitHub
.PARAMETER Help
  Show help
.EXAMPLE
  .\scripts\submit-pyq.ps1 -Path "C:\papers\DBMS-2024-QP.pdf"
  .\scripts\submit-pyq.ps1 -Path "C:\papers\DBMS-2024-QP.pdf" -Subject "Database Management Systems"
#>

param(
  [string]$Path = "",
  [string]$Subject = "",
  [switch]$DryRun,
  [switch]$Email,
  [switch]$Help
)

if ($Help) {
  Write-Host "Usage: .\scripts\submit-pyq.ps1 -Path <path-to-pdf> [-Subject <subject-name>]"
  Write-Host ""
  Write-Host "Arguments:"
  Write-Host "  -Path <path-to-pdf>    Path to the question paper PDF (required)"
  Write-Host "  -Subject <subject>     Subject name (optional, auto-detected from filename)"
  Write-Host ""
  Write-Host "Options:"
  Write-Host "  -DryRun        Validate without submitting"
  Write-Host "  -Email         Submit via email instead of GitHub"
  Write-Host "  -Help          Show this help"
  exit 0
}

$DRY_RUN = $DryRun.IsPresent
$EMAIL_MODE = $Email.IsPresent

Write-Host "â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•" -ForegroundColor Cyan
Write-Host "  Exam-Prompt PYQ Submitter" -ForegroundColor Cyan
Write-Host "  Contribute to the network - one paper at a time" -ForegroundColor Cyan
Write-Host "â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•" -ForegroundColor Cyan
Write-Host ""

if (-not $Path) {
  Write-Host "Error: No PDF file specified." -ForegroundColor Red
  Write-Host "Usage: .\scripts\submit-pyq.ps1 -Path <path-to-pdf> [-Subject <subject>]"
  exit 1
}

if (-not (Test-Path -LiteralPath $Path)) {
  Write-Host "Error: File not found: $Path" -ForegroundColor Red
  exit 1
}

if ($Path -notmatch '\.pdf$') {
  Write-Host "Error: File must be a PDF. Got: $Path" -ForegroundColor Red
  exit 1
}

$FileSize = (Get-Item -LiteralPath $Path).Length
if ($FileSize -lt 1000) {
  Write-Host "Error: File is too small ($FileSize bytes). Not a valid PDF." -ForegroundColor Red
  exit 1
}
if ($FileSize -gt 100000000) {
  Write-Host "Error: File exceeds 100MB limit." -ForegroundColor Red
  exit 1
}

Write-Host "  [OK] PDF found: $(Split-Path -Leaf $Path) ($([math]::Round($FileSize / 1024)) KB)" -ForegroundColor Blue

$Basename = [System.IO.Path]::GetFileNameWithoutExtension($Path)

if (-not $Subject) {
  $Subject = $Basename -replace '[-_ ]?(202[0-9]|20[0-9]{2})[-_ ]?(QP|question[-_]?paper|paper|exam|end[-_]?sem|mid[-_]?sem|pyq|previous[-_]?year)?', '' -replace '[-_]', ' '
  $Subject = $Subject.Trim()
  if (-not $Subject) { $Subject = $Basename }
  Write-Host "  [â†’] Auto-detected subject: $Subject" -ForegroundColor Yellow
}

$Year = ""
if ($Basename -match '(202[0-9])') {
  $Year = $Matches[1]
}
if (-not $Year) {
  $Year = Get-Date -Format "yyyy"
  Write-Host "  [â†’] Year not detected in filename, using current: $Year" -ForegroundColor Yellow
}

$ExamType = "Unknown"
if ($Basename -match '(?i)end[-_]?sem|final') { $ExamType = "End-Sem" }
elseif ($Basename -match '(?i)mid[-_]?sem|midterm|inse') { $ExamType = "Mid-Sem" }
elseif ($Basename -match '(?i)insem|ise') { $ExamType = "In-Sem" }

Write-Host "  [OK] Year: $Year | Type: $ExamType" -ForegroundColor Blue

if (Test-Path "pyq-index/SKILL.md") {
  $indexContent = Get-Content "pyq-index/SKILL.md" -Raw
  if ($indexContent -match [regex]::Escape($Subject)) {
    Write-Host "  [â†’] Subject '$Subject' already exists in PYQ index." -ForegroundColor Yellow
    Write-Host "  [â†’] Adding as additional entry (duplicates are fine)." -ForegroundColor Yellow
  }
}

Write-Host "  [â†’] Running validation..." -ForegroundColor Blue

$VALIDATION_OK = $true
$pdftotext = Get-Command "pdftotext" -ErrorAction SilentlyContinue
if ($pdftotext) {
  $pdfText = & "pdftotext" $Path - 2>$null | Select-Object -First 200
  if ($pdfText -match '(?i)(question|marks|time|hours)') {
    Write-Host "  [OK] PDF contains question paper patterns (marks/questions found)" -ForegroundColor Green
  } else {
    Write-Host "  [WARN] PDF may not be a question paper (no marks/questions found in text)" -ForegroundColor Yellow
  }
} else {
  Write-Host "  [WARN] pdftotext not installed - skipping content validation" -ForegroundColor Yellow
  Write-Host "  [WARN] Install: winget install Poppler.Poppler or choco install poppler" -ForegroundColor Yellow
}

Write-Host ""

if ($DRY_RUN) {
  Write-Host "[DRY RUN] Would submit:" -ForegroundColor Cyan
  Write-Host "  File: $Path"
  Write-Host "  Subject: $Subject"
  Write-Host "  Year: $Year"
  Write-Host "  Type: $ExamType"
  Write-Host ""
  Write-Host "Dry run complete. No changes made." -ForegroundColor Green
  exit 0
}

if ($EMAIL_MODE) {
  Write-Host "Email submission mode:" -ForegroundColor Cyan
  Write-Host ""
  Write-Host "Forward this PDF to: exam-prompt-pyqs@proton.me"
  Write-Host ""
  Write-Host "In the email body, include:"
  Write-Host "  Subject: $Subject"
  Write-Host "  Year: $Year"
  Write-Host "  Exam Type: $ExamType"
  Write-Host "  University: [your university]"
  Write-Host "  Semester: [semester number]"
  Write-Host ""
  Write-Host "We'll process it within 48 hours." -ForegroundColor Green
  exit 0
}

Write-Host "Creating GitHub issue for PYQ submission..." -ForegroundColor Cyan
Write-Host ""

$Repo = "pinakdhabu/Exam-prompt"
$IssueTitle = "PYQ: ${Subject} (${Year} ${ExamType})"
$IssueBody = @"
## PYQ Submission

**Subject:** ${Subject}
**Year:** ${Year}
**Exam Type:** ${ExamType}
**File:** $(Split-Path -Leaf $Path)
**File Size:** $([math]::Round($FileSize / 1024)) KB
**Submitted by:** $env:USERNAME on $(Get-Date -Format "yyyy-MM-dd")

### Instructions for Maintainer

This is an auto-generated issue from `submit-pyq.ps1`.
The PDF is attached below. Please:

1. Add to `pyq-index/SKILL.md`
2. Move to the correct semester directory
3. Run `.\scripts\generate-agents-md.ps1` to update index

### Download Link

To upload the PDF, drag and drop the file into this issue comment.

---

*Submitted via submit-pyq.ps1 â€” the 1-command PYQ submission tool*
"@

$gh = Get-Command "gh" -ErrorAction SilentlyContinue
if ($gh) {
  Write-Host "  [â†’] Creating issue via GitHub CLI..." -ForegroundColor Blue
  $issueResult = gh issue create `
    --repo $Repo `
    --title "$IssueTitle" `
    --body "$IssueBody" `
    --label "pyq-submission" `
    --label "help wanted" 2>&1
  if ($LASTEXITCODE -ne 0) {
    Write-Host "  [WARN] GitHub CLI failed. Falling back to manual submission." -ForegroundColor Yellow
    $EMAIL_MODE_REAL = $true
  }
} else {
  Write-Host "  [WARN] GitHub CLI not available or not authenticated." -ForegroundColor Yellow
  Write-Host ""
  Write-Host "To submit manually:" -ForegroundColor Cyan
  Write-Host "  1. Go to: https://github.com/$Repo/issues/new"
  Write-Host "  2. Choose template: 'PYQ Submission'"
  Write-Host "  3. Attach your PDF"
  Write-Host "  4. Submit"
  Write-Host ""
  Write-Host "Or use email submission:" -ForegroundColor Yellow
  Write-Host "  Forward the PDF to: exam-prompt-pyqs@proton.me"
  Write-Host "  Subject: PYQ: ${Subject} (${Year})"
}

Write-Host ""
Write-Host "â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•" -ForegroundColor Green
Write-Host "  Thank you! Your PYQ makes this repo better for everyone." -ForegroundColor Green
Write-Host "  Every submitted paper improves analysis accuracy for all students." -ForegroundColor Green
Write-Host "â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•" -ForegroundColor Green
