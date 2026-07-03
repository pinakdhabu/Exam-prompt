<#
.SYNOPSIS
  Auto-sync university-registry.json
.DESCRIPTION
  Scans universities/ directories and auto-updates the registry to reflect actual disk state.
.PARAMETER DryRun
  Show changes only, don't write
.PARAMETER Json
  Output JSON diff
.EXAMPLE
  .\scripts\update-registry.ps1
  .\scripts\update-registry.ps1 -DryRun
  .\scripts\update-registry.ps1 -Json
#>

param(
  [switch]$DryRun,
  [switch]$Json
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent (Split-Path -Parent $PSCommandPath)
$Registry = Join-Path $RepoRoot "universities" "university-registry.json"
$UniversitiesDir = Join-Path $RepoRoot "universities"

$DRY_RUN = $DryRun.IsPresent
$JSON_MODE = $Json.IsPresent

$TmpOut = [System.IO.Path]::GetTempFileName()

python3 "$RepoRoot/scripts/_update_registry.py" `
  "$Registry" "$UniversitiesDir" "$DRY_RUN" "$JSON_MODE" 2>&1 | Tee-Object -FilePath $TmpOut

if ($JSON_MODE) {
  Write-Host ""
  Write-Host "--- JSON OUTPUT ---"
  $lines = Get-Content $TmpOut
  $inJson = $false
  foreach ($line in $lines) {
    if ($line -match '^---JSON---$') { $inJson = $true; continue }
    if ($inJson) { Write-Output $line }
  }
}

$content = Get-Content $TmpOut -Raw
if ($content -match "Written:") {
  Write-Host "[OK]   Registry synced" -ForegroundColor Green
} elseif ($content -match "\[DRY-RUN\]") {
  Write-Host "[INFO] Dry run completed - no changes written" -ForegroundColor Blue
}

Remove-Item -LiteralPath $TmpOut -Force -ErrorAction SilentlyContinue
