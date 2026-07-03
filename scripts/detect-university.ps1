<#
.SYNOPSIS
  Detect Active University Configuration
.DESCRIPTION
  Scans universities/ for active (non-template) configs and reports the current university setup.
.PARAMETER List
  List all universities
.PARAMETER Active
  List only active configs
.PARAMETER Default
  Show default
.EXAMPLE
  .\scripts\detect-university.ps1
  .\scripts\detect-university.ps1 -List
  .\scripts\detect-university.ps1 -Active
  .\scripts\detect-university.ps1 -Default
#>

param(
  [switch]$List,
  [switch]$Active,
  [switch]$Default
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent (Split-Path -Parent $PSCommandPath)
$Registry = Join-Path $RepoRoot "universities" "university-registry.json"

if (-not (Test-Path $Registry)) {
  Write-Host "Error: university-registry.json not found" -ForegroundColor Red
  exit 1
}

$registry = Get-Content $Registry -Raw | ConvertFrom-Json

if ($List) {
  Write-Host "Available universities:"
  foreach ($u in $registry.universities) {
    $icon = switch ($u.status) { "active" { "*" } "template-only" { "o" } default { "?" } }
    $defaultMarker = if ($u.directory -eq $registry.default_university) { " [DEFAULT]" } else { "" }
    Write-Host "  $icon $($u.full_name) ($($u.short_name)) -- $($u.status)$defaultMarker"
  }
  exit 0
}

if ($Active) {
  Write-Host "Active (non-template) university configs:"
  $activeFound = $false
  foreach ($u in $registry.universities) {
    if ($u.status -eq "active") {
      $activeFound = $true
      $dm = if ($u.directory -eq $registry.default_university) { " [DEFAULT]" } else { "" }
      Write-Host "  * $($u.full_name) ($($u.short_name))$dm" -ForegroundColor Green
      Write-Host "    Directory: universities/$($u.directory)"
      Write-Host "    Config exists: $($u.config_exists)"
      Write-Host "    Subjects data: $($u.subjects_data)"
      Write-Host "    Patterns data: $($u.patterns_data)"
      Write-Host "    PYQs available: $($u.pyqs_available)"
    }
  }
  if (-not $activeFound) { Write-Host "  (no active university configs found)" }
  exit 0
}

if ($Default) {
  $defaultDir = $registry.default_university
  foreach ($u in $registry.universities) {
    if ($u.directory -eq $defaultDir) {
      Write-Host "$($u.full_name) ($($u.short_name))"
      Write-Host "Directory: universities/$($u.directory)"
      exit 0
    }
  }
  Write-Host "Default university: $defaultDir"
  exit 0
}

# Default: show current university
$SessionFile = Join-Path $RepoRoot "deps" "session-profile.json"
if (Test-Path $SessionFile) {
  Write-Host "Current university (from session profile):"
  $s = Get-Content $SessionFile -Raw | ConvertFrom-Json
  Write-Host "  University: $($s.university)" -ForegroundColor Green
  Write-Host "  Session type: $($s.session_type)"
  Write-Host "  Created: $($s.created_at)"
} else {
  Write-Host "No session profile found."
  Write-Host "Run '.\scripts\init-project.ps1' to initialize."
  Write-Host ""
  Write-Host "Default university:"
  & $PSCommandPath -Default
}
