<#
.SYNOPSIS
    Auto-generate AGENTS.md <available_skills> block (PowerShell)
.DESCRIPTION
    Scans all directories under skills/, reads the SKILL.md frontmatter,
    and generates/replaces the <available_skills> XML block in AGENTS.md.
.USAGE
    .\scripts\generate-agents-md.ps1           # Update AGENTS.md in place
    .\scripts\generate-agents-md.ps1 -DryRun   # Print to stdout only
#>

param(
    [switch]$DryRun
)

if ($args -contains '--dry-run' -or $args -contains '-DryRun') { $DryRun = $true }

$RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$SkillsDir = Join-Path $RepoRoot "skills"
$AgentsMd = Join-Path $RepoRoot "AGENTS.md"

function Write-Warn { Write-Host "WARN: $args" -ForegroundColor Yellow }
function Write-Info { Write-Host "INFO: $args" -ForegroundColor Blue }

# ============================================================
# Parse YAML frontmatter from a SKILL.md
# ============================================================
function Get-FrontMatter {
    param([string]$FilePath)

    $content = Get-Content $FilePath -Raw
    if ($content -notmatch '^---\s*\n(.*?)\n---') {
        return $null
    }

    $yaml = $Matches[1]
    $result = @{}

    if ($yaml -match '(?m)^name:\s*(.+)$') {
        $result['name'] = $Matches[1].Trim()
    }
    if ($yaml -match '(?m)^description:\s*(.+)$') {
        $result['description'] = $Matches[1].Trim()
    }

    return $result
}

# ============================================================
# Scan skills
# ============================================================

$Skills = @()

Get-ChildItem -Path $SkillsDir -Directory | ForEach-Object {
    $name = $_.Name
    $skillFile = Join-Path $_.FullName "SKILL.md"

    if (-not (Test-Path $skillFile)) {
        Write-Warn "$name has no SKILL.md, skipping"
        return
    }

    $fm = Get-FrontMatter -FilePath $skillFile

    $fmName = if ($fm -and $fm['name']) { $fm['name'] } else { $name; Write-Warn "$name has no 'name:' in frontmatter, using directory name" }
    $fmDesc = if ($fm -and $fm['description']) { $fm['description'] } else { "No description provided."; Write-Warn "$name has no 'description:' in frontmatter" }

    $Skills += @{
        Name = $fmName
        Description = $fmDesc
    }
}

# ============================================================
# Generate available_skills XML
# ============================================================

$sb = [System.Text.StringBuilder]::new()
[void]$sb.AppendLine('<available_skills>')
[void]$sb.AppendLine('')

foreach ($s in $Skills) {
    [void]$sb.AppendLine("<skill>")
    [void]$sb.AppendLine("<name>$($s.Name)</name>")
    [void]$sb.AppendLine("<description>$($s.Description)</description>")
    [void]$sb.AppendLine("<location>project</location>")
    [void]$sb.AppendLine("</skill>")
    [void]$sb.AppendLine('')
}

[void]$sb.AppendLine('</available_skills>')
$NewSkillsBlock = $sb.ToString()

# ============================================================
# Split AGENTS.md into 3 parts and reassemble
# ============================================================

$lines = Get-Content $AgentsMd
$totalLines = $lines.Count

# Part 1: Everything up to and including first <!-- SKILLS_TABLE_START -->
$idx1 = -1
for ($i = 0; $i -lt $totalLines; $i++) {
    if ($lines[$i] -match 'SKILLS_TABLE_START') {
        $idx1 = $i
        break
    }
}
if ($idx1 -lt 0) { Write-Error "AGENTS.md missing SKILLS_TABLE_START marker"; exit 1 }

# Part 2: From first SKILLS_TABLE_START to just before <available_skills>
$idx2 = -1
for ($i = $idx1; $i -lt $totalLines; $i++) {
    if ($lines[$i] -match '<available_skills>') {
        $idx2 = $i
        break
    }
}
if ($idx2 -lt 0) { Write-Error "AGENTS.md missing <available_skills>"; exit 1 }

# Part 3: Everything after </available_skills> (excluding it)
$idx3 = -1
for ($i = $idx2; $i -lt $totalLines; $i++) {
    if ($lines[$i] -match '</available_skills>') {
        $idx3 = $i
        break
    }
}
if ($idx3 -lt 0) { Write-Error "AGENTS.md missing </available_skills>"; exit 1 }

$part1 = $lines[0..$idx1] -join "`r`n"
$part2 = $lines[$idx1..($idx2-1)] -join "`r`n"
$part3 = $lines[($idx3+1)..($totalLines-1)] -join "`r`n"

$result = "$part1`r`n$part2`r`n$NewSkillsBlock`r`n$part3"

if ($DryRun) {
    Write-Output $result
} else {
    Set-Content -Path $AgentsMd -Value $result -Encoding UTF8 -NoNewline
    Write-Info "Updated: $AgentsMd ($($Skills.Count) skills registered)"
}
