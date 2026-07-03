<#
.SYNOPSIS
  Generate skills.json + AGENTS.md
.DESCRIPTION
  Uses Python yaml.safe_load() for robust YAML frontmatter extraction.
.PARAMETER JsonOnly
  Only generate skills.json
.PARAMETER AgentsOnly
  Only generate AGENTS.md
.EXAMPLE
  .\scripts\generate-skills-manifest.ps1
  .\scripts\generate-skills-manifest.ps1 -JsonOnly
  .\scripts\generate-skills-manifest.ps1 -AgentsOnly
#>

param(
  [switch]$JsonOnly,
  [switch]$AgentsOnly
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent (Split-Path -Parent $PSCommandPath)
$SkillsDir = Join-Path $RepoRoot "skills"
$AgentsMd = Join-Path $RepoRoot "AGENTS.md"
$SkillsJson = Join-Path $RepoRoot "skills" "skills.json"

$env:SKILLS_DIR = $SkillsDir

$MODE = "all"
if ($JsonOnly) { $MODE = "json-only" }
if ($AgentsOnly) { $MODE = "agents-only" }

Write-Host "Scanning skills in $SkillsDir..."

# Step 1: Extract all skill metadata via Python
$pythonScript = @'
import os, json, yaml

base = os.environ.get('SKILLS_DIR', 'skills')
skills = []

for d in sorted(os.listdir(base)):
    dpath = os.path.join(base, d)
    if not os.path.isdir(dpath):
        continue
    skill_file = os.path.join(dpath, 'SKILL.md')
    if not os.path.isfile(skill_file):
        continue
    with open(skill_file) as f:
        content = f.read()
    parts = content.split('---', 2)
    if len(parts) < 3:
        continue
    try:
        data = yaml.safe_load(parts[1])
    except Exception:
        data = {}
    if not data or 'name' not in data:
        continue

    skills.append({
        'name': str(data.get('name', d)),
        'description': str(data.get('description', 'No description provided.')),
        'version': str(data.get('version', '1.0.0')),
        'directory': d,
        'skill_path': f'skills/{d}/SKILL.md',
    })

print(json.dumps(skills, ensure_ascii=False))
'@

$skillsData = python3 -c $pythonScript 2>$null
$skills = $skillsData | ConvertFrom-Json
$SKILL_COUNT = $skills.Count
Write-Host "  Found $SKILL_COUNT skills" -ForegroundColor Green

$now = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")

# Step 2: Generate skills.json
function Generate-Json {
  $manifest = @{
    '$schema' = 'exam-prompt-skills-v1'
    generated = $now
    total_skills = $SKILL_COUNT
    skills = @($skills)
    compatible_with = @('claude-code', 'opencode', 'cursor', 'windsurf', 'cline', 'github-copilot', 'continue-dev')
  }
  $manifest | ConvertTo-Json -Depth 10 | Out-File -FilePath $SkillsJson -Encoding utf8
  Write-Host "  Written: $SkillsJson ($SKILL_COUNT skills)" -ForegroundColor Green
}

# Step 3: Generate AGENTS.md
function Generate-AgentsMd {
  $header = ""
  if (Test-Path $AgentsMd) {
    $content = Get-Content $AgentsMd -Raw
    $idx = $content.IndexOf('<available_skills>')
    if ($idx -ge 0) { $header = $content.Substring(0, $idx).TrimEnd() }
  }
  if (-not $header) {
    $header = @'
<skills_system priority="1">

## Available Skills

<!-- SKILLS_TABLE_START -->
<usage>
When users ask you to perform tasks related to exam preparation, answer writing, notes generation, PYQ analysis, or any academic work â€” check if any of the available skills below can help.

How to use skills:
- Skills are in the `skills/` directory, each with a `SKILL.md` file
- Read the appropriate skill's SKILL.md for detailed instructions
- Base directory for skills: `./skills/<skill-name>/`

Usage notes:

'@.TrimEnd()
  }

  $lines = @()
  $lines += $header
  $lines += ""
  $lines += "<available_skills>"
  $lines += ""

  foreach ($skill in $skills) {
    $name = [System.Security.SecurityElement]::Escape($skill.name)
    $desc = [System.Security.SecurityElement]::Escape($skill.description)
    $lines += "<skill>"
    $lines += "<name>$name</name>"
    $lines += "<description>$desc</description>"
    $lines += "<location>project</location>"
    $lines += "</skill>"
    $lines += ""
  }

  $lines += "</available_skills>"
  $lines += "<!-- SKILLS_TABLE_END -->"
  $lines += ""

  $lines | Out-File -FilePath $AgentsMd -Encoding utf8
  Write-Host "  Written: $AgentsMd ($SKILL_COUNT skills)" -ForegroundColor Green
}

switch ($MODE) {
  "json-only" {
    Write-Host ""
    Write-Host "Generating skills/skills.json..." -ForegroundColor Cyan
    Generate-Json
  }
  "agents-only" {
    Write-Host ""
    Write-Host "Regenerating AGENTS.md..." -ForegroundColor Cyan
    Generate-AgentsMd
  }
  default {
    Write-Host ""
    Write-Host "Generating skills/skills.json..." -ForegroundColor Cyan
    Generate-Json

    Write-Host ""
    Write-Host "Regenerating AGENTS.md..." -ForegroundColor Cyan
    Generate-AgentsMd
  }
}

Write-Host ""
Write-Host "Done. $SKILL_COUNT skills registered." -ForegroundColor Green
