<#
.SYNOPSIS
    Validate all SKILL.md files in skills/ (PowerShell)
.DESCRIPTION
    Checks each skill for:
      - SKILL.md exists
      - YAML frontmatter present
      - Required fields: name, description
      - Directory naming convention (kebab-case)
      - Cross-reference validity (no broken skill links)
      - No trailing whitespace
      - Consistent line endings (no mixed CRLF/LF)
.USAGE
    .\scripts\validate-skills.ps1               # Validate all skills
    .\scripts\validate-skills.ps1 -SkillName <name>  # Validate specific skill
#>

param(
    [string]$SkillName = ""
)

$RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$SkillsDir = Join-Path $RepoRoot "skills"
$ExitCode = 0

function Write-Result {
    param([string]$Status, [string]$Name, [string]$Message)
    $color = @{ "OK" = "Green"; "FAIL" = "Red"; "WARN" = "Yellow" }[$Status]
    Write-Host "$Status : $Name - $Message" -ForegroundColor $color
}

function Validate-Skill {
    param([string]$Dir)

    $name = Split-Path $Dir -Leaf
    $skillFile = Join-Path $Dir "SKILL.md"
    $errors = 0

    # Check SKILL.md exists
    if (-not (Test-Path $skillFile)) {
        Write-Result -Status "FAIL" -Name $name -Message "missing SKILL.md"
        return $false
    }

    $lines = Get-Content $skillFile
    $content = $lines -join "`n"

    # Check frontmatter opening
    if ($lines.Count -eq 0 -or $lines[0] -ne "---") {
        Write-Result -Status "FAIL" -Name $name -Message 'SKILL.md must start with YAML frontmatter (---)'
        $errors++
    }

    # Extract frontmatter block
    $frontmatter = ""
    if ($lines.Count -gt 1 -and $lines[0] -eq "---") {
        $endIdx = -1
        for ($i = 1; $i -lt $lines.Count; $i++) {
            if ($lines[$i] -eq "---") {
                $endIdx = $i
                break
            }
        }
        if ($endIdx -gt 0) {
            $frontmatter = $lines[1..($endIdx-1)] -join "`n"
        }
    }

    if ([string]::IsNullOrEmpty($frontmatter)) {
        Write-Result -Status "FAIL" -Name $name -Message "cannot parse YAML frontmatter"
        $errors++
    } else {
        # Check name field
        if ($frontmatter -notmatch '(?m)^name:\s') {
            Write-Result -Status "FAIL" -Name $name -Message "frontmatter missing 'name:' field"
            $errors++
        }

        # Check description field
        if ($frontmatter -notmatch '(?m)^description:\s') {
            Write-Result -Status "FAIL" -Name $name -Message "frontmatter missing 'description:' field"
            $errors++
        }
    }

    # Check directory naming convention (kebab-case)
    if ($name -notmatch '^[a-z][a-z0-9]*(-[a-z0-9]+)*$') {
        Write-Result -Status "WARN" -Name $name -Message "directory name not kebab-case: '$name'"
    }

    # Check cross-references to other skills
    $rawContent = Get-Content $skillFile -Raw
    $refs = [regex]::Matches($rawContent, '`universal-[a-z-]+`|`setup-[a-z-]+`')
    $existingDirs = Get-ChildItem $SkillsDir -Directory | ForEach-Object { $_.Name }
    foreach ($ref in $refs) {
        $refName = $ref.Value -replace '^`|`$', ''
        $found = $false
        foreach ($dir in $existingDirs) {
            if ($dir -replace '-', '' -eq $refName -replace '-', '') {
                $found = $true
                break
            }
        }
        if (-not $found) {
            Write-Result -Status "WARN" -Name $name -Message "cross-reference to unknown skill: $refName"
        }
    }

    # Check trailing whitespace
    $hasTrailing = $false
    foreach ($line in $lines) {
        if ($line -match '\s+$') {
            $hasTrailing = $true
            break
        }
    }
    if ($hasTrailing) {
        Write-Result -Status "WARN" -Name $name -Message "trailing whitespace found"
    }

    # Check for mixed line endings (CRLF present)
    $raw = [System.IO.File]::ReadAllBytes($skillFile)
    $crlfCount = 0
    for ($i = 0; $i -lt $raw.Count - 1; $i++) {
        if ($raw[$i] -eq 0x0D -and $raw[$i+1] -eq 0x0A) {
            $crlfCount++
        }
    }
    if ($crlfCount -gt 0) {
        Write-Result -Status "WARN" -Name $name -Message "Windows line endings (CRLF) found - $crlfCount occurrences"
    }

    if ($errors -eq 0) {
        Write-Result -Status "OK" -Name $name -Message "SKILL.md valid"
        return $true
    } else {
        $script:ExitCode = 1
        return $false
    }
}

# ============================================================
# Main
# ============================================================

Write-Host "=== Validating skills in $SkillsDir ===" -ForegroundColor Blue
Write-Host ""

if ($SkillName) {
    $dir = Join-Path $SkillsDir $SkillName
    if (Test-Path $dir) {
        Validate-Skill -Dir $dir
    } else {
        Write-Result -Status "FAIL" -Name $SkillName -Message "skill directory not found"
        $ExitCode = 1
    }
} else {
    Get-ChildItem -Path $SkillsDir -Directory | ForEach-Object {
        Validate-Skill -Dir $_.FullName
    }
}

Write-Host ""
if ($ExitCode -eq 0) {
    Write-Host "All skills valid." -ForegroundColor Green
} else {
    Write-Host "Some skills have issues." -ForegroundColor Yellow
}

exit $ExitCode
