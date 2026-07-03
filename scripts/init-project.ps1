<#
.SYNOPSIS
  Initialize Exam Prompt Project
.DESCRIPTION
  Detects university, installs deps, validates setup, and generates session profile.
.PARAMETER University
  Force university ID
.PARAMETER DryRun
  Show what would happen
.PARAMETER Quick
  Skip interactive prompts
#>

param(
  [string]$University = "",
  [switch]$DryRun,
  [switch]$Quick
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent (Split-Path -Parent $PSCommandPath)
Set-Location $RepoRoot

$DRY_RUN = $DryRun.IsPresent
$QUICK = $Quick.IsPresent
$FORCE_UNIVERSITY = $University

function Info  { Write-Host "[INFO] $args" -ForegroundColor Blue }
function Ok    { Write-Host "[OK]   $args" -ForegroundColor Green }
function Warn  { Write-Host "[WARN] $args" -ForegroundColor Yellow }
function Fail  { Write-Host "[FAIL] $args" -ForegroundColor Red }

function Detect-University {
  $registry = "$RepoRoot\universities\university-registry.json"

  if ($FORCE_UNIVERSITY) { return $FORCE_UNIVERSITY }

  $sessionProfile = "$RepoRoot\deps\session-profile.json"
  if (Test-Path $sessionProfile) {
    try {
      $sp = Get-Content $sessionProfile -Raw -Encoding UTF8
      $spObj = $sp | ConvertFrom-Json
      if ($spObj.university) {
        Info "Found existing session profile: $($spObj.university)"
        return $spObj.university
      }
    } catch {}
  }

  if (Test-Path $registry) {
    try {
      $r = Get-Content $registry -Raw -Encoding UTF8 | ConvertFrom-Json
      if ($r.default_university) {
        Info "Using default university: $($r.default_university)"
        return $r.default_university
      }
    } catch {}
  }

  Warn "Could not detect university. Defaulting to SAVITRIBAI_PHULE_PUNE_UNIVERSITY"
  return "SAVITRIBAI_PHULE_PUNE_UNIVERSITY"
}

function Install-Deps {
  Info "Installing npm dependencies..."
  if ($DRY_RUN) { Info "[DRY-RUN] Would run: npm install"; return }

  if (-not (Test-Path "package.json")) {
    Fail "package.json not found. Are you in the project root?"
    exit 1
  }

  npm install --yes 2>$null
  if ($LASTEXITCODE -ne 0) { Warn "npm install had issues - continuing anyway" }
  else { Ok "Dependencies installed" }
}

function Install-Hooks {
  if ($DRY_RUN) { Info "[DRY-RUN] Would configure git hooks path"; return }
  if ((Test-Path ".git") -and (Test-Path ".githooks/pre-commit")) {
    git config core.hooksPath .githooks 2>$null
    if ($LASTEXITCODE -eq 0) { Ok "Git hooks installed (.githooks/)" }
    else { Warn "Could not set hooks path" }
  } else {
    Info "Skipping hooks - no .git or .githooks/pre-commit found"
  }
}

function Create-Dirs {
  Info "Creating project directories..."
  $dirs = @("pyq-downloads", "pdf_output", "_diagrams")
  foreach ($d in $dirs) {
    if (-not (Test-Path $d)) {
      if ($DRY_RUN) { Info "[DRY-RUN] Would create: $d" }
      else {
        New-Item -ItemType Directory -Path $d -Force | Out-Null
        New-Item -ItemType File -Path (Join-Path $d ".gitkeep") -Force | Out-Null
        Ok "Created: $d/"
      }
    } else { Info "Exists: $d/" }
  }
}

function Validate-Skills {
  Info "Validating skills..."
  if ($DRY_RUN) { Info "[DRY-RUN] Would run: .\scripts\validate-skills.ps1"; return }

  $validateScript = "$RepoRoot\scripts\validate-skills.ps1"
  if (Test-Path $validateScript) {
    & $validateScript 2>$null
    if ($LASTEXITCODE -eq 0) { Ok "All skills valid" }
    else { Warn "Some skills have issues - check output above" }
  } else {
    & ".\scripts\validate-skills.sh" 2>$null
    if ($LASTEXITCODE -eq 0) { Ok "All skills valid" }
    else { Warn "Some skills have issues - check output above" }
  }
}

function Generate-Agents {
  Info "Generating AGENTS.md from skill manifests..."
  if ($DRY_RUN) { Info "[DRY-RUN] Would run: .\scripts\generate-agents-md.ps1"; return }

  $genScript = "$RepoRoot\scripts\generate-agents-md.ps1"
  if (Test-Path $genScript) {
    & $genScript
    if ($LASTEXITCODE -eq 0) { Ok "AGENTS.md generated" }
    else { Warn "AGENTS.md generation had issues" }
  } elseif (Test-Path "scripts/generate-agents-md.sh") {
    bash scripts/generate-agents-md.sh
  } else {
    Warn "generate-agents-md.ps1 not found - skipping"
  }
}

function Create-SessionProfile {
  $profile = "$RepoRoot\deps\session-profile.json"
  if (Test-Path $profile) {
    Info "Session profile already exists at deps/session-profile.json"
    return
  }
  if ($DRY_RUN) { Info "[DRY-RUN] Would create deps/session-profile.json"; return }

  New-Item -ItemType Directory -Path (Join-Path $RepoRoot "deps") -Force | Out-Null
  $now = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
  $profileObj = @{
    university = $UNIVERSITY_DIR
    session_type = "exam_prep"
    created_at = $now
    version = "1.0.0"
  }
  $profileObj | ConvertTo-Json | Out-File -FilePath $profile -Encoding UTF8
  Ok "Created session profile: deps/session-profile.json"
}

function Check-Node {
  $node = Get-Command "node" -ErrorAction SilentlyContinue
  if (-not $node) {
    Fail "Node.js is required but not installed. Install Node.js 18+ from https://nodejs.org"
    exit 1
  }
  $nodeVer = (node -v) -replace 'v', ''
  $majorVer = [int]($nodeVer -split '\.')[0]
  if ($majorVer -lt 18) {
    Fail "Node.js 18+ required. Found: $(node -v)"
    exit 1
  }
  Ok "Node.js $(node -v)"
}

function Check-UniversityConfig {
  $uniConfig = "$RepoRoot\universities\$UNIVERSITY_DIR\config.json"
  if (Test-Path $uniConfig) {
    Ok "University config found: universities/$UNIVERSITY_DIR/config.json"
    try {
      $c = Get-Content $uniConfig -Raw -Encoding UTF8 | ConvertFrom-Json
      $patterns = ($c.patterns.available | ForEach-Object { $_.id }) -join " "
      Info "  Available patterns: $patterns"
    } catch {}
  } else {
    Warn "University config not found - run 'npm run setup' first"
  }
}

$UNIVERSITY_DIR = Detect-University
Info "University: $UNIVERSITY_DIR"

Write-Host "--- Step 1: Checking Node.js ---"
Check-Node
Write-Host ""

Write-Host "--- Step 2: Installing Dependencies ---"
Install-Deps
Write-Host ""

Write-Host "--- Step 3: Installing Git Hooks ---"
Install-Hooks
Write-Host ""

Write-Host "--- Step 4: Creating Directories ---"
Create-Dirs
Write-Host ""

Write-Host "--- Step 5: Validating Skills ---"
Validate-Skills
Write-Host ""

Write-Host "--- Step 6: Generating AGENTS.md ---"
Generate-Agents
Write-Host ""

Write-Host "--- Step 7: Session Profile ---"
Create-SessionProfile
Write-Host ""

Write-Host "--- Step 8: University Config ---"
Check-UniversityConfig
Write-Host ""

Ok "Init complete. University: $UNIVERSITY_DIR"
Write-Host "Next: npm run setup"
Write-Host "Next: .\scripts\detect-university.ps1"
