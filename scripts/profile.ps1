<#
.SYNOPSIS
  Student Profile Configuration
.DESCRIPTION
  Creates a persistent student profile so the AI knows your university and subjects.
.PARAMETER Command
  Command: show, edit, reset, path, env, json, validate
#>

param(
  [string]$Command = ""
)

$ErrorActionPreference = "Stop"

$ProfileDir = Join-Path $env:USERPROFILE ".exam-prompt"
$ProfilePath = Join-Path $ProfileDir "profile.json"

if ($Command -in @("--help", "-h", "help")) {
  Write-Host "Usage: .\scripts\profile.ps1 [command]"
  Write-Host ""
  Write-Host "Commands:"
  Write-Host "  (no command)    Interactive profile setup wizard"
  Write-Host "  show            Display current profile"
  Write-Host "  edit            Edit profile in notepad"
  Write-Host "  reset           Delete and start fresh"
  Write-Host "  path            Print the profile file path"
  Write-Host "  env             Print as environment variables"
  Write-Host "  json            Print raw JSON profile"
  Write-Host "  validate        Validate profile structure"
  exit 0
}

if (-not (Test-Path $ProfileDir)) { New-Item -ItemType Directory -Path $ProfileDir -Force | Out-Null }

function Get-DefaultProfile {
  return @{
    version = "1.0"
    created = ""
    updated = ""
    student = @{
      name = ""
      university = ""
      department = ""
      program = ""
      year = ""
      semester = ""
    }
    exam = @{
      pattern = ""
      default_marks = 70
      default_duration_minutes = 150
      preferred_language = "english"
    }
    subjects = @()
    settings = @{
      handwriting_size = "medium"
      default_note_format = "cornell"
      show_time_budget = $true
      show_marks = $true
    }
  }
}

function Validate-Profile {
  if (-not (Test-Path $ProfilePath)) {
    Write-Host "[WARN] No profile found. Run: .\scripts\profile.ps1" -ForegroundColor Yellow
    return $false
  }
  try {
    $p = Get-Content $ProfilePath -Raw -Encoding UTF8 | ConvertFrom-Json
    if (-not $p.student.university) {
      Write-Host "[WARN] Profile is missing: student.university" -ForegroundColor Yellow
      return $false
    }
    if (-not $p.exam.pattern) {
      Write-Host "[WARN] Profile is missing: exam.pattern" -ForegroundColor Yellow
      return $false
    }
    if (-not $p.student.department) {
      Write-Host "[WARN] Profile is missing: student.department" -ForegroundColor Yellow
      return $false
    }
    return $true
  } catch {
    Write-Host "[ERR] Invalid JSON in profile. Run: .\scripts\profile.ps1 reset" -ForegroundColor Red
    return $false
  }
}

function Show-Profile {
  if (-not (Test-Path $ProfilePath)) {
    Write-Host "[WARN] No profile found." -ForegroundColor Yellow
    return
  }
  $p = Get-Content $ProfilePath -Raw -Encoding UTF8 | ConvertFrom-Json
  $s = $p.student
  $e = $p.exam
  $st = $p.settings
  $subs = $p.subjects

  Write-Host "== Student Profile ==" -ForegroundColor Cyan
  Write-Host ""
  Write-Host "  University:   $($s.university)"
  Write-Host "  Department:   $($s.department)"
  Write-Host "  Program:      $($s.program)"
  Write-Host "  Year/Sem:     $($s.year)/$($s.semester)"
  Write-Host "  Exam Pattern: $($e.pattern)"
  Write-Host "  Default Marks:$($e.default_marks)"
  Write-Host "  Duration:     $($e.default_duration_minutes) min"
  Write-Host "  Language:     $($e.preferred_language)"
  Write-Host "  Handwriting:  $($st.handwriting_size)"
  Write-Host "  Note Format:  $($st.default_note_format)"
  if ($subs.Count -gt 0) {
    Write-Host "  Subjects ($($subs.Count)):"
    foreach ($sub in $subs) { Write-Host "       - $sub" }
  }
  if ($p.created) {
    Write-Host "  Created: $($p.created)"
    Write-Host "  Updated: $($p.updated)"
  }
  Write-Host ""
  Write-Host "To edit: .\scripts\profile.ps1 edit" -ForegroundColor Yellow
  Write-Host "To reset: .\scripts\profile.ps1 reset" -ForegroundColor Yellow
}

function Interactive-Setup {
  Write-Host "== Exam-Prompt Student Profile Setup ==" -ForegroundColor Cyan
  Write-Host "Set once - the AI remembers you forever" -ForegroundColor Cyan
  Write-Host ""

  $PROFILE_OBJ = Get-DefaultProfile
  if (Test-Path $ProfilePath) {
    try { $PROFILE_OBJ = Get-Content $ProfilePath -Raw -Encoding UTF8 | ConvertFrom-Json } catch {}
    Write-Host "[WARN] Existing profile found. Press Enter to keep current values." -ForegroundColor Yellow
    Write-Host ""
  }

  function Get-Current($path) {
    $val = $PROFILE_OBJ
    $path.Split('.') | ForEach-Object { $val = $val.$_ }
    return $val
  }

  $CUR_UNIV = Get-Current "student.university"
  $CUR_DEPT = Get-Current "student.department"
  $CUR_PROG = Get-Current "student.program"
  $CUR_YEAR = Get-Current "student.year"
  $CUR_SEM = Get-Current "student.semester"
  $CUR_PATTERN = Get-Current "exam.pattern"
  $CUR_MARKS = Get-Current "exam.default_marks"
  $CUR_DUR = Get-Current "exam.default_duration_minutes"
  $CUR_LANG = Get-Current "exam.preferred_language"
  $CUR_HAND = Get-Current "settings.handwriting_size"
  $CUR_NOTE = Get-Current "settings.default_note_format"

  $UNIV = Read-Host "University [$($CUR_UNIV)]"
  if (-not $UNIV) { $UNIV = if ($CUR_UNIV) { $CUR_UNIV } else { "SPPU" } }

  $DEPT = Read-Host "Department [$($CUR_DEPT)]"
  if (-not $DEPT) { $DEPT = if ($CUR_DEPT) { $CUR_DEPT } else { "Computer Engineering" } }

  $PROG = Read-Host "Program (BE/BTech/ME/MTech) [$($CUR_PROG)]"
  if (-not $PROG) { $PROG = if ($CUR_PROG) { $CUR_PROG } else { "BE" } }

  $YEAR = Read-Host "Year (FE/SE/TE/BE) [$($CUR_YEAR)]"
  if (-not $YEAR) { $YEAR = if ($CUR_YEAR) { $CUR_YEAR } else { "FE" } }

  $SEM = Read-Host "Semester (1-8) [$($CUR_SEM)]"
  if (-not $SEM) { $SEM = if ($CUR_SEM) { $CUR_SEM } else { "1" } }

  Write-Host ""
  Write-Host "Exam Patterns:" -ForegroundColor Yellow
  Write-Host "  1 - SPPU 2019 Pattern | 6 units, 4 OR pairs, 70 marks"
  Write-Host "  2 - SPPU 2024 Pattern | 5 units, 5 OR pairs, 70 marks"
  Write-Host "  3 - VTU Pattern | 5 modules, 100 marks, 3 hrs"
  Write-Host "  4 - JNTU Pattern | 8 units, 70 marks, 3 hrs"
  Write-Host "  5 - Mumbai Univ Pattern | 6 units, 80 marks, 3 hrs"
  Write-Host "  6 - AKTU Pattern | 5 units, 100 marks, 3 hrs"
  Write-Host "  7 - Generic (custom)"
  $PATTERN_DEFAULT = if ($CUR_PATTERN) { $CUR_PATTERN } else { "1" }
  $PATTERN_INPUT = Read-Host "Select pattern [$PATTERN_DEFAULT]"
  if (-not $PATTERN_INPUT) { $PATTERN_INPUT = $PATTERN_DEFAULT }

  switch -regex ($PATTERN_INPUT) {
    '^1$|^SPPU 2019$' { $PATTERN = "SPPU 2019"; $MARKS = 70; $DUR = 150 }
    '^2$|^SPPU 2024$' { $PATTERN = "SPPU 2024"; $MARKS = 70; $DUR = 150 }
    '^3$|^VTU$' { $PATTERN = "VTU"; $MARKS = 100; $DUR = 180 }
    '^4$|^JNTU$' { $PATTERN = "JNTU"; $MARKS = 70; $DUR = 180 }
    '^5$|^Mumbai$' { $PATTERN = "Mumbai Univ"; $MARKS = 80; $DUR = 180 }
    '^6$|^AKTU$' { $PATTERN = "AKTU"; $MARKS = 100; $DUR = 180 }
    default { $PATTERN = $PATTERN_INPUT; $MARKS = $CUR_MARKS; $DUR = $CUR_DUR }
  }

  if ($PATTERN_INPUT -match '^7$|^Generic$|^generic$') {
    $MARKS_INPUT = Read-Host "Total marks [$MARKS]"
    if ($MARKS_INPUT) { $MARKS = [int]$MARKS_INPUT }
    $DUR_INPUT = Read-Host "Duration (minutes) [$DUR]"
    if ($DUR_INPUT) { $DUR = [int]$DUR_INPUT }
  }

  $LANG = Read-Host "Language (english/hindi/marathi) [$($CUR_LANG)]"
  if (-not $LANG) { $LANG = if ($CUR_LANG) { $CUR_LANG } else { "english" } }

  $HAND = Read-Host "Handwriting (small/medium/large) [$($CUR_HAND)]"
  if (-not $HAND) { $HAND = if ($CUR_HAND) { $CUR_HAND } else { "medium" } }

  $NOTE = Read-Host "Note format (cornell/outline/mindmap/qa) [$($CUR_NOTE)]"
  if (-not $NOTE) { $NOTE = if ($CUR_NOTE) { $CUR_NOTE } else { "cornell" } }

  Write-Host ""
  Write-Host "Enter subjects (one per line, blank to skip):" -ForegroundColor Yellow
  $SUBJECTS = @()
  while ($true) {
    $INPUT = Read-Host "Subject"
    if ($INPUT -eq "") { break }
    $SUBJECTS += $INPUT
  }

  $NOW = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")

  $profileJson = @{
    version = "1.0"
    created = if ($PROFILE_OBJ.created) { $PROFILE_OBJ.created } else { $NOW }
    updated = $NOW
    student = @{
      name = if ($PROFILE_OBJ.student.name) { $PROFILE_OBJ.student.name } else { "" }
      university = $UNIV
      department = $DEPT
      program = $PROG
      year = $YEAR
      semester = $SEM
    }
    exam = @{
      pattern = $PATTERN
      default_marks = [int]$MARKS
      default_duration_minutes = [int]$DUR
      preferred_language = $LANG
    }
    subjects = @($SUBJECTS)
    settings = @{
      handwriting_size = $HAND
      default_note_format = $NOTE
      show_time_budget = $true
      show_marks = $true
    }
  }

  $profileJson | ConvertTo-Json -Depth 10 | Out-File -FilePath $ProfilePath -Encoding UTF8

  Write-Host ""
  Write-Host "== Profile saved! ==" -ForegroundColor Green
  Write-Host "Run '.\scripts\profile.ps1 show' to view." -ForegroundColor Green
}

switch ($Command) {
  "show" { Show-Profile }
  "edit" {
    if (-not (Test-Path $ProfilePath)) { Interactive-Setup }
    else {
      notepad $ProfilePath
      Write-Host "[OK] Profile updated." -ForegroundColor Green
      Validate-Profile | Out-Null
    }
  }
  "reset" {
    if (Test-Path $ProfilePath) { Remove-Item -LiteralPath $ProfilePath -Force }
    Write-Host "[WARN] Profile deleted." -ForegroundColor Yellow
    Interactive-Setup
  }
  "path" { Write-Output $ProfilePath }
  "env" {
    if (-not (Test-Path $ProfilePath)) { Write-Host "[ERR] No profile found." -ForegroundColor Red; exit 1 }
    $p = Get-Content $ProfilePath -Raw -Encoding UTF8 | ConvertFrom-Json
    $s = $p.student; $e = $p.exam; $st = $p.settings
    Write-Output "# Exam-Prompt profile sourced from $ProfilePath"
    Write-Output "`$env:EXAM_UNIVERSITY='$($s.university)'"
    Write-Output "`$env:EXAM_DEPARTMENT='$($s.department)'"
    Write-Output "`$env:EXAM_PROGRAM='$($s.program)'"
    Write-Output "`$env:EXAM_YEAR='$($s.year)'"
    Write-Output "`$env:EXAM_SEMESTER='$($s.semester)'"
    Write-Output "`$env:EXAM_PATTERN='$($e.pattern)'"
    Write-Output "`$env:EXAM_MARKS=$($e.default_marks)"
    Write-Output "`$env:EXAM_DURATION=$($e.default_duration_minutes)"
    Write-Output "`$env:EXAM_LANGUAGE='$($e.preferred_language)'"
    Write-Output "`$env:EXAM_HANDWRITING='$($st.handwriting_size)'"
  }
  "json" {
    if (Test-Path $ProfilePath) { Get-Content $ProfilePath -Raw -Encoding UTF8 } else { Write-Output "{}" }
  }
  "validate" {
    if (Validate-Profile) { Write-Host "[OK] Profile is valid." -ForegroundColor Green; Show-Profile }
  }
  default { Interactive-Setup }
}
