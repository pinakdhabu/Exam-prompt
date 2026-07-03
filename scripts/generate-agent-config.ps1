<#
.SYNOPSIS
  Generate agent configs from skills.json single source of truth.
.DESCRIPTION
  Creates/updates .cursorrules, .windsurfrules, .cursor/rules/000-global.mdc, and AGENTS.md.
.PARAMETER DryRun
  Show what would change without changing
.PARAMETER Check
  Verify all configs are in sync
.EXAMPLE
  .\scripts\generate-agent-config.ps1
  .\scripts\generate-agent-config.ps1 -DryRun
  .\scripts\generate-agent-config.ps1 -Check
#>

param(
  [switch]$DryRun,
  [switch]$Check
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent (Split-Path -Parent $PSCommandPath)
$SkillsJson = Join-Path $RepoRoot "skills" "skills.json"
$SkillsDir = Join-Path $RepoRoot "skills"

$DRY_RUN = $DryRun.IsPresent
$CHECK_MODE = $Check.IsPresent

function Info  { Write-Host "[INFO] $args" -ForegroundColor Blue }
function Ok    { Write-Host "[OK]   $args" -ForegroundColor Green }
function Warn  { Write-Host "[WARN] $args" -ForegroundColor Yellow }
function Fail  { Write-Host "[FAIL] $args" -ForegroundColor Red }

if (-not (Test-Path $SkillsJson)) {
  Fail "skills.json not found at $SkillsJson"
  exit 1
}

$skillsData = Get-Content $SkillsJson -Raw | ConvertFrom-Json
$skills = $skillsData.skills
$SKILL_COUNT = $skills.Count

Info "Loaded $SKILL_COUNT skills from skills.json"
Write-Host ""

# Generate .cursorrules
function Generate-CursorRules {
  $file = Join-Path $RepoRoot ".cursorrules"
  if ($DRY_RUN) { Info "[DRY-RUN] Would generate .cursorrules"; return }

  $lines = @()
  $lines += "# Exam Prompt -- AI-Powered Exam Preparation System"
  $lines += ""
  $lines += "## Project Overview"
  $lines += "Universal exam preparation system supporting ANY university worldwide."
  $lines += "SPPU (Savitribai Phule Pune University) is the primary reference implementation."
  $lines += ""
  $lines += "## Key Architecture"
  $lines += ""
  $lines += "## Available Skills ($SKILL_COUNT)"
  $lines += ""
  $lines += "| # | Skill | Description |"
  $lines += "|---|-------|-------------|"

  $i = 1
  foreach ($skill in $skills) {
    $name = $skill.name
    $desc = $skill.description -replace '\|', '/'
    $lines += "| $i | $name | $desc |"
    $i++
  }

  $lines += ""
  $lines += "## Key Files"
  $lines += "- `skills/<name>/SKILL.md` -- Individual skill definitions"
  $lines += "- `universities/` -- University configurations"
  $lines += "- `scripts/` -- Utility scripts"
  $lines += "- `AGENTS.md` -- Machine-readable XML registry (auto-generated)"

  $lines | Out-File -FilePath $file -Encoding utf8
  Ok "Generated .cursorrules"
}

# Generate .windsurfrules
function Generate-WindsurfRules {
  $file = Join-Path $RepoRoot ".windsurfrules"
  if ($DRY_RUN) { Info "[DRY-RUN] Would generate .windsurfrules"; return }

  $lines = @()
  $lines += "# Exam Prompt -- Windsurf Configuration"
  $lines += ""
  $lines += "## Available Skills"
  $lines += ""

  foreach ($skill in $skills) {
    $name = $skill.name
    $desc = $skill.description
    $lines += "- **$name**: $desc"
  }

  $lines += ""
  $lines += "## Usage"
  $lines += "Refer to `AGENTS.md` for the full machine-readable skill registry."

  $lines | Out-File -FilePath $file -Encoding utf8
  Ok "Generated .windsurfrules"
}

# Generate .cursor/rules/000-global.mdc
function Generate-CursorMdc {
  $file = Join-Path $RepoRoot ".cursor" "rules" "000-global.mdc"
  if ($DRY_RUN) { Info "[DRY-RUN] Would generate .cursor/rules/000-global.mdc"; return }

  $dir = Split-Path $file -Parent
  if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }

  $lines = @()
  $lines += "---"
  $lines += "description: Global Exam Prompt rules for Cursor IDE"
  $lines += "globs:"
  $lines += "---"
  $lines += ""
  $lines += "# Exam Prompt -- Global Rules"
  $lines += ""
  $lines += "## Skill Registry"
  $lines += ""

  foreach ($skill in $skills) {
    $name = $skill.name
    $desc = $skill.description -replace '`', "'"
    $lines += "- `$name`: $desc"
  }

  $lines += ""
  $lines += "## Source of Truth"
  $lines += "All configs are auto-generated from `skills/skills.json`. Do not edit manually."
  $lines += "Run `.\scripts\generate-agent-config.ps1` to regenerate."

  $lines | Out-File -FilePath $file -Encoding utf8
  Ok "Generated .cursor/rules/000-global.mdc"
}

# Generate AGENTS.md via existing script
function Generate-Agents {
  if ($DRY_RUN) { Info "[DRY-RUN] Would run: .\scripts\generate-agents-md.ps1"; return }

  $genScript = Join-Path $RepoRoot "scripts" "generate-agents-md.ps1"
  $genSh = Join-Path $RepoRoot "scripts" "generate-agents-md.sh"

  if (Test-Path $genScript) {
    & $genScript
    if ($LASTEXITCODE -eq 0) { Ok "Regenerated AGENTS.md" }
    else { Warn "AGENTS.md generation had issues" }
  } elseif (Test-Path $genSh) {
    bash $genSh
  } else {
    Warn "generate-agents-md.ps1 not found -- skipping AGENTS.md"
  }
}

# Check mode: verify all configs are in sync
function Check-Sync {
  $issues = 0

  foreach ($cfg in @(".cursorrules", ".windsurfrules")) {
    $path = Join-Path $RepoRoot $cfg
    if (-not (Test-Path $path)) {
      Warn "$cfg does not exist -- run generate-agent-config.ps1"
      $issues++
    }
  }

  $mdcPath = Join-Path $RepoRoot ".cursor" "rules" "000-global.mdc"
  if (-not (Test-Path $mdcPath)) {
    Warn ".cursor/rules/000-global.mdc does not exist"
    $issues++
  }

  $cursorRules = Join-Path $RepoRoot ".cursorrules"
  if (Test-Path $cursorRules) {
    $content = Get-Content $cursorRules -Raw
    $refCount = [regex]::Matches($content, '\|.*\|.*\|').Count
    if ($refCount -lt $SKILL_COUNT) {
      Warn ".cursorrules only references $refCount/$SKILL_COUNT skills"
      $issues++
    }
  }

  if ($issues -eq 0) { Ok "All agent configs are in sync" }
}

# Main
Write-Host "+------------------------------------------------------------+"
Write-Host "|   Agent Config Generator                                   |"
Write-Host "|   Single source of truth: skills/skills.json               |"
Write-Host "+------------------------------------------------------------+"
Write-Host ""

if ($CHECK_MODE) { Check-Sync; exit 0 }

Generate-CursorRules
Generate-WindsurfRules
Generate-CursorMdc
Generate-Agents

Write-Host ""
Write-Host "+------------------------------------------------------------+"
Write-Host "|   Done!                                                    |"
Write-Host "|                                                            |"
Write-Host "|   Generated from: skills/skills.json ($SKILL_COUNT skills)          |"
Write-Host "|                                                            |"
Write-Host "|   Files:                                                   |"
Write-Host "|     - .cursorrules                                         |"
Write-Host "|     - .windsurfrules                                       |"
Write-Host "|     - .cursor/rules/000-global.mdc                         |"
Write-Host "|     - AGENTS.md (via generate-agents-md.ps1)               |"
Write-Host "|                                                            |"
Write-Host "|   Run with -Check to verify sync                          |"
Write-Host "+------------------------------------------------------------+"
