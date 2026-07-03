<#
.SYNOPSIS
  SPPU PYQ Index Generator (LOCAL ONLY)
.DESCRIPTION
  Scans a local PDF collection and generates an organized markdown index.
.PARAMETER Path
  PYQ directory root
.PARAMETER Out
  Output file path
.PARAMETER Stats
  Stats-only mode
.PARAMETER Refresh
  Regenerate
.PARAMETER Help
  Show help
.EXAMPLE
  .\scripts\pyq-index.ps1 -Path "C:\Users\me\Downloads"
  .\scripts\pyq-index.ps1 -Path "C:\papers" -Stats
  .\scripts\pyq-index.ps1 -Path "C:\papers" -Out "index.md"
  .\scripts\pyq-index.ps1 -Path "C:\papers" -Refresh
#>

param(
  [string]$Path = "",
  [string]$Out = "",
  [switch]$Stats,
  [switch]$Refresh,
  [switch]$Help
)

if ($Help) {
  Write-Host "Usage: .\scripts\pyq-index.ps1 -Path <pyq-directory> [-Out <file>] [-Stats] [-Refresh]"
  exit 0
}

$STATS_ONLY = $Stats.IsPresent
$REFRESH = $Refresh.IsPresent

if (-not $Path) {
  $DOWNLOAD_ROOT = Join-Path $env:USERPROFILE "Downloads"
} else {
  $DOWNLOAD_ROOT = $Path
}
$COMPENG_DIR = Join-Path $DOWNLOAD_ROOT "Computer Engineering"

if (-not $Out) { $Out = "pyq-index/INDEX.md" }

if (-not (Test-Path -LiteralPath $COMPENG_DIR -PathType Container)) {
  Write-Host "ERROR: Computer Engineering directory not found at: $COMPENG_DIR" -ForegroundColor Red
  Write-Host "Use -Path to specify a different root or ensure it exists."
  exit 1
}

Write-Host "Scanning: $COMPENG_DIR" -ForegroundColor Cyan
Write-Host ""

$allPdfs = Get-ChildItem -LiteralPath $COMPENG_DIR -Filter "*.pdf" -Recurse -File | Sort-Object FullName

$SUBJECT_COUNTS = @{}
$YEAR_COUNTS = @{}
$TYPE_COUNTS = @{}
$SEMESTER_COUNTS = @{}
$TOTAL_PDFS = 0

$index = 0
foreach ($pdf in $allPdfs) {
  $relPath = $pdf.FullName.Substring($COMPENG_DIR.Length).TrimStart('\')
  $index++

  $sem = "Unknown"
  if ($relPath -match 'SEM (\d)') { $sem = "SEM $($Matches[1])" }
  $SEMESTER_COUNTS[$sem] = [int]($SEMESTER_COUNTS[$sem] -as [int]) + 1

  $subject = "Other"
  if ($relPath -match '^[^\\]+\\[^\\]+\\([^\\]+)') { $subject = $Matches[1] }
  $SUBJECT_COUNTS[$subject] = [int]($SUBJECT_COUNTS[$subject] -as [int]) + 1

  if ($relPath -match '(?i)End Sem') { $TYPE_COUNTS["End Semester"] = [int]($TYPE_COUNTS["End Semester"] -as [int]) + 1 }
  elseif ($relPath -match '(?i)In Sem') { $TYPE_COUNTS["In Semester"] = [int]($TYPE_COUNTS["In Semester"] -as [int]) + 1 }
  else { $TYPE_COUNTS["Other"] = [int]($TYPE_COUNTS["Other"] -as [int]) + 1 }

  $year = "Unknown"
  if ($pdf.BaseName -match '20[2-9][0-9]') { $year = $Matches[0] }
  elseif ($pdf.BaseName -match '(?<![0-9])(2[2-5])(?![0-9])') { $year = "20$($Matches[1])" }
  $YEAR_COUNTS[$year] = [int]($YEAR_COUNTS[$year] -as [int]) + 1

  $TOTAL_PDFS++
  if ($TOTAL_PDFS -le 3) {
    Write-Host "  [Found] $relPath" -ForegroundColor DarkGray
  }
}

if ($STATS_ONLY) {
  Write-Host "========================================"
  Write-Host "  SPPU PYQ Collection - Statistics"
  Write-Host "========================================"
  Write-Host ""
  Write-Host "Total PDFs: $TOTAL_PDFS"
  Write-Host ""
  Write-Host "By Year:"
  foreach ($y in ($YEAR_COUNTS.Keys | Sort-Object)) {
    Write-Host "  $y : $($YEAR_COUNTS[$y]) papers"
  }
  Write-Host ""
  Write-Host "By Exam Type:"
  foreach ($t in @("End Semester", "In Semester", "Other")) {
    $c = [int]($TYPE_COUNTS[$t] -as [int])
    if ($c -gt 0) { Write-Host "  $t : $c papers" }
  }
  Write-Host ""
  Write-Host "By Semester:"
  foreach ($s in ($SEMESTER_COUNTS.Keys | Sort-Object)) {
    Write-Host "  $s : $($SEMESTER_COUNTS[$s]) papers"
  }
  Write-Host ""
  Write-Host "Top Subjects by Paper Count:"
  foreach ($subj in ($SUBJECT_COUNTS.Keys | Sort-Object)) {
    Write-Host "  $subj : $($SUBJECT_COUNTS[$subj]) papers"
  }
  exit 0
}

$OutDir = Split-Path $Out -Parent
if (-not (Test-Path $OutDir)) { New-Item -ItemType Directory -Path $OutDir -Force | Out-Null }

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$maxSubject = ""
$maxCount = 0
foreach ($subj in $SUBJECT_COUNTS.Keys) {
  if ($SUBJECT_COUNTS[$subj] -gt $maxCount) {
    $maxCount = $SUBJECT_COUNTS[$subj]
    $maxSubject = $subj
  }
}

$lines = @()
$lines += "# SPPU Previous Year Question Papers â€” Index"
$lines += ""
$lines += "**Generated:** $timestamp"
$lines += "**Source:** `$COMPENG_DIR`"
$lines += "**Total PDFs:** $TOTAL_PDFS"
$lines += ""
$lines += "> âš ï¸ These PDFs are scanned images (no extractable text layer)."
$lines += "> Use OCR (e.g., `tesseract`) via `.\scripts\process-document.ps1` for text extraction."
$lines += ""
$lines += "---"
$lines += ""

$syllabusDir = Join-Path $COMPENG_DIR "Syllabus"
$lines += "## Syllabus Documents"
$lines += ""
if (Test-Path $syllabusDir) {
  $syllabusPdfs = Get-ChildItem $syllabusDir -Filter "*.pdf" -File | Sort-Object Name
  foreach ($spdf in $syllabusPdfs) {
    $rel = $spdf.FullName.Substring($COMPENG_DIR.Length).TrimStart('\')
    $name = [System.IO.Path]::GetFileNameWithoutExtension($spdf.Name)
    $lines += "- **$name** - `$rel`"
  }
} else {
  $lines += "*No syllabus documents found.*"
}
$lines += ""

$sections = @(
  @{title="Second Year (S.E.) â€” Computer Engineering"; semesters=@("SEM 3","SEM 4"); baseDir="2 S.E."},
  @{title="Third Year (T.E.) â€” Computer Engineering"; semesters=@("SEM 5","SEM 6"); baseDir="3 T.E."},
  @{title="Fourth Year (B.E.) â€” Computer Engineering"; semesters=@("SEM 7","SEM 8"); baseDir="4 B.E."}
)

foreach ($section in $sections) {
  $lines += "---"
  $lines += ""
  $lines += "## $($section.title)"
  $lines += ""

  foreach ($semName in $section.semesters) {
    $semDir = Join-Path $COMPENG_DIR $section.baseDir $semName
    if (-not (Test-Path $semDir)) { continue }

    $lines += "### Semester $($semName -replace 'SEM ','')"
    $lines += ""

    $subjectDirs = Get-ChildItem $semDir -Directory -ErrorAction SilentlyContinue
    foreach ($subjDir in $subjectDirs) {
      $subject = $subjDir.Name
      $lines += "#### $subject"
      $lines += ""

      $foundPapers = $false
      foreach ($examType in @("In Sem", "End Sem")) {
        $examDir = Join-Path $subjDir.FullName $examType
        if (-not (Test-Path $examDir)) { continue }

        $papers = Get-ChildItem $examDir -Filter "*.pdf" -File | Sort-Object Name
        if ($papers.Count -eq 0) { continue }

        $foundPapers = $true
        $lines += "**$examType** ($($papers.Count) papers):"
        $lines += ""
        foreach ($p in $papers) {
          $fname = [System.IO.Path]::GetFileNameWithoutExtension($p.Name)
          $lines += "  - $fname"
        }
        $lines += ""
      }

      if (-not $foundPapers) {
        $papers = Get-ChildItem $subjDir.FullName -Filter "*.pdf" -File | Sort-Object Name
        if ($papers.Count -gt 0) {
          $lines += "**Papers:**"
          $lines += ""
          foreach ($p in $papers) {
            $fname = [System.IO.Path]::GetFileNameWithoutExtension($p.Name)
            $lines += "  - $fname"
          }
          $lines += ""
        }
      }
    }
  }
}

$honorsDir = Join-Path $COMPENG_DIR "5 Honors"
if (Test-Path $honorsDir) {
  $lines += "---"
  $lines += ""
  $lines += "## Honors Tracks"
  $lines += ""

  $trackDirs = Get-ChildItem $honorsDir -Directory -ErrorAction SilentlyContinue
  foreach ($trackDir in $trackDirs) {
    $track = $trackDir.Name
    $lines += "### $track"
    $lines += ""

    $stageDirs = Get-ChildItem $trackDir.FullName -Directory -ErrorAction SilentlyContinue
    foreach ($stageDir in $stageDirs) {
      $stage = $stageDir.Name
      $lines += "**$stage**"
      $lines += ""

      foreach ($examType in @("In Sem", "End Sem")) {
        $papers = Get-ChildItem $stageDir.FullName -Filter "*.pdf" -Recurse -File | Where-Object { $_.FullName -match [regex]::Escape($examType) } | Sort-Object Name
        if ($papers.Count -eq 0) { continue }

        $lines += "- $examType ($($papers.Count) papers)"
        foreach ($p in $papers) {
          $fname = [System.IO.Path]::GetFileNameWithoutExtension($p.Name)
          $lines += "  - $fname"
        }
      }
      $lines += ""
    }
  }
}

$lines += "---"
$lines += ""
$lines += "## Collection Summary"
$lines += ""
$lines += "| Metric | Value |"
$lines += "|--------|-------|"
$lines += "| **Total PDFs** | $TOTAL_PDFS |"
$yearsStr = ($YEAR_COUNTS.Keys | Sort-Object) -join ", "
$lines += "| **Years Covered** | $yearsStr |"
$lines += "| **End Semester Papers** | $([int]($TYPE_COUNTS["End Semester"] -as [int])) |"
$lines += "| **In Semester Papers** | $([int]($TYPE_COUNTS["In Semester"] -as [int])) |"
$lines += "| **Most Papers** | $maxSubject ($maxCount) |"
$lines += ""

$lines | Out-File -FilePath $Out -Encoding utf8

Write-Host "Index generated: $Out" -ForegroundColor Green
Write-Host "   Total PDFs indexed: $TOTAL_PDFS" -ForegroundColor Green
Write-Host ""
Write-Host "Quick Stats:"
Write-Host "  - End Semester: $([int]($TYPE_COUNTS["End Semester"] -as [int]))"
Write-Host "  - In Semester: $([int]($TYPE_COUNTS["In Semester"] -as [int]))"
Write-Host "  - Years: $yearsStr"
Write-Host ""
Write-Host "Run with -Stats for detailed statistics."
