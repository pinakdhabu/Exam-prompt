<#
.SYNOPSIS
    Install Exam-prompt skills globally (PowerShell)
.DESCRIPTION
    Uses npx to install skills from this repository to ~/.agents/skills/,
    making them available to all universal agents (OpenCode, Amp, Cline, etc.).
.USAGE
    .\scripts\install.ps1
#>

$Source = "https://github.com/pinakdhabu/Exam-prompt"

Write-Host "Installing skills from $Source ..." -ForegroundColor Blue
Write-Host ""

# Install for opencode
$result = & npx skills add $Source -g -y -a opencode 2>&1 | Select-String -NotMatch "PromptScript"
Write-Output $result

# Check for astrbot config
$astrbotDir = Join-Path $env:USERPROFILE ".astrbot"
if (Test-Path $astrbotDir) {
    Write-Host "Astrbot detected — installing for astrbot too..." -ForegroundColor Blue
    $result = & npx skills add $Source -g -y -a astrbot 2>&1 | Select-String -NotMatch "PromptScript"
    Write-Output $result
}

Write-Host ""
Write-Host "Skills installed at ~/.agents/skills/ — available to all universal agents (OpenCode, Amp, Cline, PromptScript, etc.)" -ForegroundColor Green
