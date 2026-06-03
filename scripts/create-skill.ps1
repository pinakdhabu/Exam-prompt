<#
.SYNOPSIS
    Auto-generate a new skill from template (PowerShell)
.DESCRIPTION
    Creates skills/<skill-name>/SKILL.md from the template
    with placeholders replaced. Validates and registers the skill.
.USAGE
    .\scripts\create-skill.ps1 <skill-name> "<Title>" "<Description>"
.EXAMPLE
    .\scripts\create-skill.ps1 question-banker "Question Banker" "Generates question banks from any syllabus for ANY university"
#>

param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$SkillName,

    [Parameter(Mandatory=$true, Position=1)]
    [string]$SkillTitle,

    [Parameter(Mandatory=$true, Position=2)]
    [string]$SkillDesc
)

$RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$Template = Join-Path $RepoRoot "templates\skill\SKILL.md"
$SkillsDir = Join-Path $RepoRoot "skills"
$AgentsMd = Join-Path $RepoRoot "AGENTS.md"
$SkillDir = Join-Path $SkillsDir $SkillName
$UniversalName = "universal-$SkillName"

# Colors
function Write-Info  { Write-Host "INFO: $args" -ForegroundColor Blue }
function Write-Ok    { Write-Host "OK: $args" -ForegroundColor Green }
function Write-Error { Write-Host "ERROR: $args" -ForegroundColor Red }

# Validate
if (Test-Path $SkillDir) {
    Write-Error "Skill directory already exists: $SkillDir"
    exit 1
}

if (-not (Test-Path $Template)) {
    Write-Error "Template not found: $Template"
    exit 1
}

# Create directory
New-Item -ItemType Directory -Path $SkillDir -Force | Out-Null
Write-Info "Created directory: $SkillDir"

# Read template and replace placeholders
$content = Get-Content $Template -Raw
$content = $content -replace "{{SKILL_NAME}}", $SkillName
$content = $content -replace "{{SKILL_TITLE}}", $SkillTitle
$content = $content -replace "{{SHORT_DESCRIPTION}}", $SkillDesc
$content = $content -replace "{{OVERVIEW_PARAGRAPH}}", $SkillDesc
$content = $content -replace "{{INPUT_DESCRIPTION}}", "subject, syllabus, and question bank parameters"
$content = $content -replace "{{ANALYSIS_DESCRIPTION}}", "syllabus content, topic distribution, and question patterns"
$content = $content -replace "{{OUTPUT_DESCRIPTION}}", "formatted question bank with answers"
$content = $content -replace "{{FORMAT_DESCRIPTION}}", "in markdown, CSV, or JSON"
$content = $content -replace "{{FEATURE_1_NAME}}", "Feature 1 — Smart Analysis"
$content = $content -replace "{{FEATURE_1_DESCRIPTION}}", "Analyzes syllabus content to identify patterns"
$content = $content -replace "{{FEATURE_2_NAME}}", "Feature 2 — Custom Output"
$content = $content -replace "{{FEATURE_2_DESCRIPTION}}", "Generates output in multiple formats"
$content = $content -replace "{{FEATURE_3_NAME}}", "Feature 3 — Auto-Calibration"
$content = $content -replace "{{FEATURE_3_DESCRIPTION}}", "Calibrates depth to match exam pattern"
$content = $content -replace "{{USE_CASE_1}}", "Exam Preparation"
$content = $content -replace "{{USE_CASE_1_DESC}}", "Generate practice questions from syllabus"
$content = $content -replace "{{USE_CASE_2}}", "Quick Revision"
$content = $content -replace "{{USE_CASE_2_DESC}}", "Create targeted question banks"
$content = $content -replace "{{USE_CASE_3}}", "Mock Tests"
$content = $content -replace "{{USE_CASE_3_DESC}}", "Simulate exam conditions"
$content = $content -replace "{{OUTPUT_EXAMPLE}}", "# Generated Question Bank%newline%%newline## Unit 1: Topic A%newline%1. Question 1%newline%2. Question 2"
$content = $content -replace "%newline%", "`n"
$content = $content -replace "{{INTEGRATION_1}}", "Uses extracted text to generate answers"
$content = $content -replace "{{INTEGRATION_2}}", "Integrates with notes generation pipeline"
$content = $content -replace "{{INTEGRATION_3}}", "Analyzes PYQ patterns for better targeting"

$SkillFile = Join-Path $SkillDir "SKILL.md"
Set-Content -Path $SkillFile -Value $content -Encoding UTF8
Write-Info "Generated: $SkillFile"

# Run validation
$ValidateScript = Join-Path $RepoRoot "scripts\validate-skills.ps1"
if (Test-Path $ValidateScript) {
    Write-Info "Validating new skill..."
    & $ValidateScript $SkillName
}

# Re-generate AGENTS.md
$GenerateScript = Join-Path $RepoRoot "scripts\generate-agents-md.ps1"
if (Test-Path $GenerateScript) {
    Write-Info "Regenerating AGENTS.md..."
    & $GenerateScript
}

# Sync to global skills directory
$GlobalSkills = Join-Path $env:USERPROFILE ".agents\skills"
if (Test-Path $GlobalSkills) {
    $Target = Join-Path $GlobalSkills $UniversalName
    New-Item -ItemType Directory -Path $Target -Force | Out-Null
    Copy-Item $SkillFile (Join-Path $Target "SKILL.md") -Force
    Write-Info "Synced to global: $Target"
}

Write-Host ""
Write-Host "=== Skill created successfully ===" -ForegroundColor Green
Write-Host "Name: $UniversalName"
Write-Host "Dir:  $SkillDir"
Write-Host "To edit, open: $SkillFile"
Write-Host "To install globally: npx skills@latest add pinakdhabu/Exam-prompt"
