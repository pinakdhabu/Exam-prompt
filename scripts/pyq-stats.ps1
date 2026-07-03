<#
.SYNOPSIS
  SPPU PYQ Collection Statistics (LOCAL ONLY)
.DESCRIPTION
  Generates real statistics from the SPPU PYQ PDF collection using file metadata.
.PARAMETER Path
  PYQ directory path
.PARAMETER Subjects
  Per-subject breakdown
.PARAMETER Gaps
  Find subjects with few papers
.PARAMETER Json
  Machine-readable JSON output
.PARAMETER Help
  Show help
.EXAMPLE
  .\scripts\pyq-stats.ps1 -Path "C:\Users\me\Downloads\Computer Engineering"
  .\scripts\pyq-stats.ps1 -Path "C:\papers" -Subjects
  .\scripts\pyq-stats.ps1 -Path "C:\papers" -Gaps
  .\scripts\pyq-stats.ps1 -Path "C:\papers" -Json
#>

param(
  [string]$Path = "",
  [switch]$Subjects,
  [switch]$Gaps,
  [switch]$Json,
  [switch]$Help
)

if ($Help) {
  Write-Host "Usage: .\scripts\pyq-stats.ps1 -Path <pyq-directory> [-Subjects|-Gaps|-Json]"
  exit 0
}

$OUTPUT_MODE = "full"
if ($Subjects) { $OUTPUT_MODE = "subjects" }
if ($Gaps) { $OUTPUT_MODE = "gaps" }
if ($Json) { $OUTPUT_MODE = "json" }

if (-not $Path) {
  $Path = Join-Path $env:USERPROFILE "Downloads" "Computer Engineering"
}

if (-not (Test-Path -LiteralPath $Path -PathType Container)) {
  Write-Host "ERROR: Not found: $Path" -ForegroundColor Red
  exit 1
}

$allPdfs = Get-ChildItem -LiteralPath $Path -Filter "*.pdf" -Recurse -File | Sort-Object FullName
$TOTAL = $allPdfs.Count
$SIZE = ($allPdfs | Measure-Object -Property Length -Sum).Sum

$SUBJ_TOTAL = @{}
$SUBJ_END = @{}
$SUBJ_IN = @{}
$CNT = @{}
$SEM = @{}

foreach ($pdf in $allPdfs) {
  $rel = $pdf.FullName.Substring($Path.Length).TrimStart('\')
  $sz = $pdf.Length

  if ($rel -match '(?i)End Sem') {
    $key = $rel -replace '\\End Sem\\.*', ''
    $SUBJ_END[$key] = [int]($SUBJ_END[$key] -as [int]) + 1
  } elseif ($rel -match '(?i)In Sem') {
    $key = $rel -replace '\\In Sem\\.*', ''
    $SUBJ_IN[$key] = [int]($SUBJ_IN[$key] -as [int]) + 1
  } else {
    $key = Split-Path $rel
  }
  $SUBJ_TOTAL[$key] = [int]($SUBJ_TOTAL[$key] -as [int]) + 1

  $yr = ""
  if ($pdf.BaseName -match '20[2-9][0-9]') { $yr = $Matches[0] }
  if (-not $yr) {
    if ($pdf.BaseName -match '(?<![0-9])(2[2-5])(?![0-9])') { $yr = "20$($Matches[1])" }
    else { $yr = "Unknown" }
  }
  $CNT[$yr] = [int]($CNT[$yr] -as [int]) + 1

  $s = "Other"
  if ($rel -match 'SEM (\d)') { $s = "SEM $($Matches[1])" }
  $SEM[$s] = [int]($SEM[$s] -as [int]) + 1
}

function Format-Size($bytes) {
  if ($bytes -ge 1GB) { return "$([math]::Round($bytes / 1GB, 1)) GB" }
  if ($bytes -ge 1MB) { return "$([math]::Round($bytes / 1MB, 1)) MB" }
  if ($bytes -ge 1KB) { return "$([math]::Round($bytes / 1KB, 1)) KB" }
  return "${bytes}B"
}

function Get-Basename($key) {
  return Split-Path -Leaf $key
}

if ($OUTPUT_MODE -eq "json") {
  $jsonObj = @{
    total_pdfs = $TOTAL
    total_size_bytes = $SIZE
    total_size_human = Format-Size $SIZE
    years = $CNT
    semesters = $SEM
    subjects = @(
      $SUBJ_TOTAL.GetEnumerator() | Sort-Object Name | ForEach-Object {
        @{
          name = Get-Basename $_.Key
          total = $_.Value
          end_sem = [int]($SUBJ_END[$_.Key] -as [int])
          in_sem = [int]($SUBJ_IN[$_.Key] -as [int])
        }
      }
    )
  }
  Write-Output ($jsonObj | ConvertTo-Json -Depth 5)
  exit 0
}

if ($OUTPUT_MODE -eq "gaps") {
  Write-Host "Subjects with <8 total papers (weak coverage):"
  Write-Host ""
  foreach ($k in ($SUBJ_TOTAL.Keys | Sort-Object)) {
    $t = $SUBJ_TOTAL[$k]
    if ($t -ge 8) { continue }
    $n = Get-Basename $k
    $e = [int]($SUBJ_END[$k] -as [int])
    $i = [int]($SUBJ_IN[$k] -as [int])
    Write-Host ("  {0,-45} {1,2} total  (End: {2}, In: {3})" -f $n, $t, $e, $i)
  }
  Write-Host ""
  Write-Host "Note: Core SE/TE subjects have 10-11 papers. Electives may have fewer."
  exit 0
}

if ($OUTPUT_MODE -eq "subjects") {
  Write-Host ("{0,-50} {1,5} {2,6} {3,6}" -f "Subject", "Total", "EndSem", "InSem")
  Write-Host ("{0,-50} {1,5} {2,6} {3,6}" -f ("-" * 50), "-----", "------", "------")
  foreach ($k in ($SUBJ_TOTAL.Keys | Sort-Object)) {
    $t = $SUBJ_TOTAL[$k]
    $e = [int]($SUBJ_END[$k] -as [int])
    $i = [int]($SUBJ_IN[$k] -as [int])
    $n = (Get-Basename $k) -replace '^COMPUTER ', '' -replace 'AND', '&'
    Write-Host ("{0,-50} {1,5} {2,6} {3,6}" -f $n, $t, $e, $i)
  }
  exit 0
}

Write-Host ""
Write-Host "â•”â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•—"
Write-Host "â•‘  SPPU Previous Year Question Papers â€” Stats  â•‘"
Write-Host "â•šâ•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•"
Write-Host ""
Write-Host "Source: $Path"
Write-Host ""

Write-Host "â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€"
Write-Host "  OVERVIEW"
Write-Host "â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€"
Write-Host ("  {0,-25} {1}" -f "Total PDFs:", $TOTAL)
Write-Host ("  {0,-25} {1}" -f "Total Size:", (Format-Size $SIZE))
Write-Host ("  {0,-25} {1}" -f "Subjects:", $SUBJ_TOTAL.Count)
Write-Host ("  {0,-25} {1}" -f "End Sem Subjects:", $SUBJ_END.Count)
Write-Host ("  {0,-25} {1}" -f "In Sem Subjects:", $SUBJ_IN.Count)
Write-Host ""

Write-Host "â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€"
Write-Host "  BY YEAR"
Write-Host "â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€"
foreach ($y in ($CNT.Keys | Sort-Object)) {
  $c = $CNT[$y]
  $bar = "â–ˆ" * [Math]::Floor($c / 10)
  Write-Host ("  {0}  {1,5}  {2}" -f $y, $c, $bar)
}
Write-Host ""

Write-Host "â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€"
Write-Host "  BY SEMESTER"
Write-Host "â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€"
foreach ($s in ($SEM.Keys | Sort-Object)) {
  $c = $SEM[$s]
  $bar = "â–Š" * [Math]::Floor($c / 10)
  Write-Host ("  {0,-6}  {1,4}  {2}" -f $s, $c, $bar)
}
Write-Host ""

Write-Host "â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€"
Write-Host "  TOP SUBJECTS (by paper count)"
Write-Host "â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€"
Write-Host ("  {0,-40} {1,5} {2,6} {3,6}" -f "Subject", "Total", "EndSem", "InSem")
Write-Host ("  {0,-40} {1,5} {2,6} {3,6}" -f ("-" * 40), "-----", "------", "------")
$sortedSubjects = $SUBJ_TOTAL.GetEnumerator() | Sort-Object Value -Descending | Select-Object -First 20
foreach ($entry in $sortedSubjects) {
  $k = $entry.Key
  $cnt = $entry.Value
  $e = [int]($SUBJ_END[$k] -as [int])
  $i = [int]($SUBJ_IN[$k] -as [int])
  $n = (Get-Basename $k) -replace '^COMPUTER ', '' -replace 'AND', '&'
  Write-Host ("  {0,-40} {1,5} {2,6} {3,6}" -f $n, $cnt, $e, $i)
}
Write-Host ""

Write-Host "â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€"
Write-Host "  COVERAGE ASSESSMENT"
Write-Host "â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€"
$strong = 0; $moderate = 0; $weak = 0
foreach ($k in $SUBJ_TOTAL.Keys) {
  $t = $SUBJ_TOTAL[$k]
  if ($t -ge 10) { $strong++ }
  elseif ($t -ge 5) { $moderate++ }
  else { $weak++ }
}
Write-Host ("  {0,-30} {1} subjects (10+ papers each)" -f "Strong coverage:", $strong)
Write-Host ("  {0,-30} {1} subjects (5-9 papers)" -f "Moderate coverage:", $moderate)
Write-Host ("  {0,-30} {1} subjects (<5 papers)" -f "Weak coverage:", $weak)
Write-Host ""
Write-Host "Run with -Subjects for per-subject breakdown."
Write-Host "Run with -Gaps to find coverage gaps."
Write-Host "Run with -Json for machine-readable output."
