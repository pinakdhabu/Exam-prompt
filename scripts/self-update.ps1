<#
.SYNOPSIS
  Self-Update Script
.DESCRIPTION
  Rolling-release style updater: pulls latest changes, re-runs setup, validates.
.PARAMETER CheckOnly
  Only check for updates, don't apply
.PARAMETER DryRun
  Show what would change
.PARAMETER Quiet
  Minimal output
.PARAMETER Fix
  Auto-fix common issues
#>

param(
  [switch]$CheckOnly,
  [switch]$DryRun,
  [switch]$Quiet,
  [switch]$Fix,
  [switch]$Help
)

if ($Help.IsPresent) {
  Write-Host "Usage: .\scripts\self-update.ps1 [options]"
  Write-Host ""
  Write-Host "Options:"
  Write-Host "  -CheckOnly   Only check for updates, don't apply"
  Write-Host "  -DryRun      Show what would change without changing"
  Write-Host "  -Quiet       Minimal output (exit code only)"
  Write-Host "  -Fix         Auto-fix common issues (missing deps, format)"
  Write-Host "  -Help        Show this help"
  exit 0
}

$CHECK_ONLY = $CheckOnly.IsPresent
$DRY_RUN = $DryRun.IsPresent
$QUIET = $Quiet.IsPresent
$AUTO_FIX = $Fix.IsPresent

function Log {
  param([string]$msg, [ConsoleColor]$ForegroundColor)
  if (-not $QUIET) {
    if ($ForegroundColor) { Write-Host $msg -ForegroundColor $ForegroundColor }
    else { Write-Host $msg }
  }
}

Log "== Exam Prompt - Self-Update ==" -ForegroundColor Cyan
Log ""

if (-not (Test-Path ".git")) {
  Log "[ERR] Not a git repository" -ForegroundColor Red
  exit 1
}

$RemoteUrl = git remote get-url origin 2>$null
if (-not $RemoteUrl) {
  Log "[ERR] No remote 'origin' configured" -ForegroundColor Red
  exit 1
}

$CurrentBranch = git rev-parse --abbrev-ref HEAD 2>$null
$LocalHash = git rev-parse HEAD 2>$null

$DefaultBranch = "main"
try {
  $symRef = git symbolic-ref refs/remotes/origin/HEAD 2>$null
  if ($symRef) { $DefaultBranch = $symRef -replace 'refs/remotes/origin/', '' }
} catch {}

$RemoteHash = git rev-parse "origin/$DefaultBranch" 2>$null

Log "Branch: $CurrentBranch" -ForegroundColor Blue
Log "Local: $($LocalHash.Substring(0, [Math]::Min(8, $LocalHash.Length)))" -ForegroundColor Blue
Log "Remote: $($RemoteHash.Substring(0, [Math]::Min(8, $RemoteHash.Length)))" -ForegroundColor Blue

$Dirty = $false
git diff --quiet HEAD 2>$null
if ($LASTEXITCODE -ne 0) {
  $Dirty = $true
  Log "[WARN] Working tree has uncommitted changes" -ForegroundColor Yellow
}

if ($LocalHash -eq $RemoteHash -and -not $Dirty) {
  Log "[OK] Already up-to-date" -ForegroundColor Green
  if ($AUTO_FIX) {
    Log "[->] Running auto-fix checks..." -ForegroundColor Blue
  } else {
    Log "Nothing to update." -ForegroundColor Green
    exit 0
  }
}

if ($CHECK_ONLY -and $LocalHash -ne $RemoteHash) {
  Log "[WARN] Update available:" -ForegroundColor Yellow
  git log --oneline "$LocalHash..$RemoteHash" 2>$null | Select-Object -First 10
  Log "Run: .\scripts\self-update.ps1"
  exit 2
}

if ($DRY_RUN) {
  Log "[WARN] Dry run - would update:" -ForegroundColor Yellow
  if ($LocalHash -ne $RemoteHash) {
    git log --oneline "$LocalHash..$RemoteHash" 2>$null | Select-Object -First 20
  }
  Log "Dry run complete." -ForegroundColor Green
  exit 0
}

if ($Dirty) {
  Log "[WARN] Stashing local changes..." -ForegroundColor Yellow
  $stamp = Get-Date -Format "yyyyMMddHHmmss"
  git stash push -m "self-update-$stamp" 2>$null
}

Log "[->] Pulling latest..." -ForegroundColor Blue
git pull origin $DefaultBranch 2>&1
if ($LASTEXITCODE -ne 0) {
  Log "[ERR] Pull failed." -ForegroundColor Red
  exit 1
}

if ($Dirty) {
  Log "[->] Restoring local changes..." -ForegroundColor Blue
  git stash pop 2>$null
  if ($LASTEXITCODE -ne 0) {
    Log "[WARN] Could not pop stash (conflicts)." -ForegroundColor Yellow
  }
}

$NewHash = git rev-parse HEAD 2>$null
Log "[OK] Updated to $($NewHash.Substring(0, [Math]::Min(8, $NewHash.Length)))" -ForegroundColor Green

Log "[1/3] Re-running setup..." -ForegroundColor Cyan
if (Test-Path "scripts/setup.ps1") {
  & ".\scripts\setup.ps1" --node-only 2>$null
  if ($LASTEXITCODE -ne 0) {
    Log "[WARN] Setup had minor issues" -ForegroundColor Yellow
  }
} elseif (Test-Path "scripts/setup.sh") {
  bash scripts/setup.sh --node-only 2>$null
} else {
  Log "[WARN] setup script not found - install manually" -ForegroundColor Yellow
}

Log "[2/3] Validating skills..." -ForegroundColor Cyan
$SkillCount = 0
$NewSkills = @()

$skillDirs = Get-ChildItem -Path "skills" -Directory
foreach ($dir in $skillDirs) {
  $name = $dir.Name
  $SkillCount++
  $skillMd = Join-Path $dir.FullName "SKILL.md"
  if (-not (Test-Path $skillMd)) {
    Log "  [WARN] $name - missing SKILL.md" -ForegroundColor Yellow
    continue
  }

  $firstLine = Get-Content $skillMd -First 1 -Encoding UTF8
  if ($firstLine -notmatch '^---$') {
    Log "  [WARN] $name - missing YAML frontmatter" -ForegroundColor Yellow
  }

  $content = Get-Content $skillMd -Raw -Encoding UTF8
  if ($content -notmatch '^name:') {
    Log "  [WARN] $name - missing 'name:' field" -ForegroundColor Yellow
  }
  if ($content -notmatch '^description:') {
    Log "  [WARN] $name - missing 'description:' field" -ForegroundColor Yellow
  }

  if (Test-Path "AGENTS.md") {
    $agentsContent = Get-Content "AGENTS.md" -Raw -Encoding UTF8
    if ($agentsContent -notmatch "<name>$([regex]::Escape($name))</name>") {
      $NewSkills += $name
    }
  }
}

Log "  [OK] $SkillCount skills checked" -ForegroundColor Green

if ($NewSkills.Count -gt 0) {
Log "  [NEW] New skills detected:" -ForegroundColor Yellow
    foreach ($s in $NewSkills) { Log "    - $s" }
    Log "  Run: .\scripts\generate-agents-md.ps1"
}

Log "[3/3] Quick integrity check..." -ForegroundColor Cyan

$BrokenPairs = 0
$papers = Get-ChildItem -Path "examples" -Filter "sample-paper-*.md" -File 2>$null
foreach ($paper in $papers) {
  $solution = $paper.FullName -replace '\.md$', '-solution.md'
  if (-not (Test-Path $solution)) {
    Log "  [WARN] Missing solution: $($paper.Name)" -ForegroundColor Yellow
    $BrokenPairs++
  }
}

if ($BrokenPairs -eq 0) {
  Log "  [OK] All sample papers have matching solutions" -ForegroundColor Green
} else {
  Log "  [WARN] $BrokenPairs sample papers missing solutions" -ForegroundColor Yellow
}

if (Test-Path "AGENTS.md") {
  $agentsContent = Get-Content "AGENTS.md" -Raw -Encoding UTF8
  if ($agentsContent -match "universal-qp-fetcher") {
    Log "  [OK] AGENTS.md is up-to-date" -ForegroundColor Green
  } else {
    Log "  [WARN] AGENTS.md may be outdated - run generate-agents-md.ps1" -ForegroundColor Yellow
  }
}

Log "== Roll Complete ==" -ForegroundColor Cyan
Log "Next: .\scripts\self-update.ps1 -Fix"
Log "Next: .\scripts\generate-agents-md.ps1"
