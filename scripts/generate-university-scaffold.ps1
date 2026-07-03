<#
.SYNOPSIS
    Exam Prompt - University Scaffold Generator (PowerShell)
.DESCRIPTION
    Scaffolds a new university from _TEMPLATE_ with interactive prompts.
    Cross-platform: runs on Windows, works with linux/macos via pwsh.
.PARAMETER NonInteractive
    Run in non-interactive mode (prompt for all values)
.PARAMETER DryRun
    Show what would be created without actually creating
.PARAMETER Help
    Show this help message
.EXAMPLE
    .\scripts\generate-university-scaffold.ps1
    .\scripts\generate-university-scaffold.ps1 -NonInteractive
    .\scripts\generate-university-scaffold.ps1 -DryRun
#>

param(
    [switch]$NonInteractive,
    [switch]$DryRun,
    [switch]$Help
)

if ($Help) {
    Write-Host "University Scaffold Generator (PowerShell)" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Usage: .\scripts\generate-university-scaffold.ps1 [options]"
    Write-Host ""
    Write-Host "Options:"
    Write-Host "  -NonInteractive    Prompt for all values (no defaults)"
    Write-Host "  -DryRun           Show what would be created"
    Write-Host "  -Help             Show this help"
    exit 0
}

$RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$TemplateDir = Join-Path $RepoRoot "universities\_TEMPLATE_"
$Registry = Join-Path $RepoRoot "universities\university-registry.json"
$UniversitiesDir = Join-Path $RepoRoot "universities"

function Write-Info  { Write-Host "INFO: $args" -ForegroundColor Blue }
function Write-Ok    { Write-Host "OK:   $args" -ForegroundColor Green }
function Write-Warn  { Write-Host "WARN: $args" -ForegroundColor Yellow }

if (-not (Test-Path $TemplateDir)) {
    Write-Host "ERROR: Template not found at $TemplateDir" -ForegroundColor Red
    exit 1
}

Write-Host "+------------------------------------------------------------+"
Write-Host "|   University Scaffold Generator                           |"
Write-Host "|   Creates a new university from _TEMPLATE_                |"
Write-Host "+------------------------------------------------------------+"
Write-Host ""

# Collect university info
if ($NonInteractive) {
    $FULL_NAME = Read-Host "Full university name (e.g., Savitribai Phule Pune University)"
    $SHORT_NAME = Read-Host "Short name (e.g., SPPU)"
    $COUNTRY = Read-Host "Country"
    $UNI_TYPE = Read-Host "Type (public/private/central/state/deemed)"
    $EXAM_SYSTEM = Read-Host "Exam system (semester/yearly/trimester)"
    $DEFAULT_PATTERN = Read-Host "Default pattern ID (e.g., 2024)"
} else {
    Write-Info "Enter university details (press Enter for defaults):"
    Write-Host ""

    $inputFull = Read-Host "Full name [Example University]"
    $FULL_NAME = if ($inputFull) { $inputFull } else { "Example University" }

    $inputShort = Read-Host "Short name [EXU]"
    $SHORT_NAME = if ($inputShort) { $inputShort } else { "EXU" }

    $inputCountry = Read-Host "Country [Country]"
    $COUNTRY = if ($inputCountry) { $inputCountry } else { "Country" }

    $inputType = Read-Host "Type (public/private/central/state/deemed) [public]"
    $UNI_TYPE = if ($inputType) { $inputType } else { "public" }

    $inputExam = Read-Host "Exam system (semester/yearly/trimester) [semester]"
    $EXAM_SYSTEM = if ($inputExam) { $inputExam } else { "semester" }

    $inputPattern = Read-Host "Default pattern ID [1.0]"
    $DEFAULT_PATTERN = if ($inputPattern) { $inputPattern } else { "1.0" }
}

# Derive directory name (uppercase, non-alphanum -> underscore)
$DIR_NAME = $FULL_NAME.ToUpper() -replace '[^A-Z0-9]', '_' -replace '_+', '_' -trim '_'
# Derive ID (lowercase, non-alphanum -> hyphen)
$UNI_ID = $FULL_NAME.ToLower() -replace '[^a-z0-9]', '-' -replace '-+', '-' -trim '-'

$TargetDir = Join-Path $UniversitiesDir $DIR_NAME

if (Test-Path $TargetDir) {
    Write-Host "ERROR: University directory already exists: $DIR_NAME" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Info "Scaffolding: $FULL_NAME ($SHORT_NAME)"
Write-Info "Directory: universities/$DIR_NAME"
Write-Info "ID: $UNI_ID"
Write-Host ""

if ($DryRun) {
    Write-Info "[DRY-RUN] Would create:"
    Write-Host "  universities/$DIR_NAME/"
    Write-Host "  universities/$DIR_NAME/config.json"
    Write-Host "  universities/$DIR_NAME/branches/"
    Write-Host "  universities/$DIR_NAME/patterns/"
    Write-Host ""
    Write-Info "[DRY-RUN] Would register in university-registry.json"
    exit 0
}

# Create directory structure
New-Item -ItemType Directory -Path (Join-Path $TargetDir "branches") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $TargetDir "patterns") -Force | Out-Null
Write-Ok "Created directory structure"

# Generate config.json
$establishYear = (Get-Date).Year
$configContent = @"
{
  "`$schema": "exam-prompt-university-v1",
  "id": "$UNI_ID",
  "full_name": "$FULL_NAME",
  "short_name": "$SHORT_NAME",
  "aliases": [],
  "country": "$COUNTRY",
  "region": "unknown",
  "type": "$UNI_TYPE",
  "website": "https://www.$($UNI_ID).edu",
  "established": $establishYear,
  "description": "$FULL_NAME -- Add description here",
  "exam_system": "$EXAM_SYSTEM",
  "grading_system": "percentage",
  "academic_calendar": {
    "type": "$EXAM_SYSTEM",
    "details": "Odd semester: Jul-Dec, Even semester: Jan-Jun"
  },
  "patterns": {
    "default": "$DEFAULT_PATTERN",
    "available": [
      {
        "id": "$DEFAULT_PATTERN",
        "name": "$DEFAULT_PATTERN Pattern",
        "total_units": 5,
        "or_pairs": 5,
        "total_marks": 70,
        "time_hours": 2.5
      }
    ]
  },
  "branches": {
    "departments": []
  },
  "contributing": {
    "how_to_add": "See how-to-add.md in _TEMPLATE_",
    "maintainers_needed": true
  }
}
"@
Set-Content -Path (Join-Path $TargetDir "config.json") -Value $configContent -Encoding UTF8
Write-Ok "Created config.json"

# Generate default pattern
$patternContent = @"
{
  "`$schema": "exam-prompt-pattern-v1",
  "id": "$DEFAULT_PATTERN",
  "name": "$DEFAULT_PATTERN Pattern",
  "description": "Default exam pattern for $FULL_NAME",
  "total_units": 5,
  "or_pairs": 5,
  "total_marks": 70,
  "time_hours": 2.5,
  "instructions": [
    "Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8, Q.9 or Q.10.",
    "Neat diagrams must be drawn wherever necessary.",
    "Figures to the right indicate full marks.",
    "Assume suitable data, if necessary."
  ],
  "unit_distribution": {
    "q1_q2": "Unit 1",
    "q3_q4": "Unit 2",
    "q5_q6": "Unit 3",
    "q7_q8": "Unit 4",
    "q9_q10": "Unit 5"
  }
}
"@
Set-Content -Path (Join-Path $TargetDir "patterns\$DEFAULT_PATTERN.json") -Value $patternContent -Encoding UTF8
Write-Ok "Created default pattern: $DEFAULT_PATTERN.json"

# Add to registry
if (Test-Path $Registry) {
    try {
        $registry = Get-Content $Registry -Raw | ConvertFrom-Json

        # Check for duplicate ID
        $dup = $registry.universities | Where-Object { $_.id -eq $UNI_ID }
        if ($dup) {
            Write-Warn "Duplicate ID $UNI_ID in registry -- skipping registry update"
        } else {
            $newEntry = [PSCustomObject]@{
                id             = $UNI_ID
                directory      = $DIR_NAME
                full_name      = $FULL_NAME
                short_name     = $SHORT_NAME
                country        = $COUNTRY
                type           = $UNI_TYPE
                status         = "template-only"
                maintained_by  = $null
                config_exists  = $true
                subjects_data  = $false
                patterns_data  = $true
                pyqs_available = $false
            }
            $registry.universities = @($registry.universities) + @($newEntry)
            $registry.universities = $registry.universities | Sort-Object full_name

            $json = $registry | ConvertTo-Json -Depth 10
            Set-Content -Path $Registry -Value $json -Encoding UTF8
            Write-Ok "Added to registry"
        }
    } catch {
        Write-Warn "Registry update failed: $_"
    }
}

Write-Host ""
Write-Host "+------------------------------------------------------------+"
Write-Host "|   University scaffolded successfully!                     |"
Write-Host "|                                                            |"
Write-Host "|   Directory: universities/$DIR_NAME"
Write-Host "|   Config:    universities/$DIR_NAME/config.json"
Write-Host "|   Pattern:   universities/$DIR_NAME/patterns/$DEFAULT_PATTERN.json"
Write-Host "|                                                            |"
Write-Host "|   Next steps:                                              |"
Write-Host "|     1. Edit config.json with real details                  |"
Write-Host "|     2. Add branches/subjects in branches/                  |"
Write-Host "|     3. Add more patterns if needed                         |"
Write-Host "|     4. Run .\scripts\init-project.sh (bash) or             |"
Write-Host "|        manually validate                                   |"
Write-Host "+------------------------------------------------------------+"
