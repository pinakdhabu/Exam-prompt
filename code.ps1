<#
.SYNOPSIS
  VS Code Config Installer for Windows
.DESCRIPTION
  Installs VS Code settings.json and extensions from a remote GitHub repository.
.EXAMPLE
  .\code.ps1
#>

$ErrorActionPreference = "Stop"

$URL_BASE = "https://raw.githubusercontent.com/thepinak503/vscode-config/refs/heads/main"

function Install-Settings {
  param([string]$CodePath, [string]$VSCodeDir)

  $Settings = Join-Path $VSCodeDir "settings.json"
  $Backup = Join-Path $VSCodeDir "settings.json.bak"
  $URL = "$URL_BASE/settings.json"

  Write-Host "[SCAN] Checking for VS Code..."
  Write-Host "    Code: $CodePath"
  Write-Host "    User path: $VSCodeDir"

  if (-not (Test-Path $VSCodeDir)) {
    Write-Host "[WARN] VS Code user directory not found." -ForegroundColor Yellow
    return $false
  }

  Write-Host "[FOUND] VS Code settings folder." -ForegroundColor Green

  if (Test-Path $Settings) {
    Write-Host "Backing up existing settings.json..."
    Copy-Item -LiteralPath $Settings -Destination $Backup -Force
  }

  try {
    Invoke-WebRequest -Uri $URL -OutFile $Settings -UseBasicParsing -ErrorAction Stop
    Write-Host "[OK] Settings updated successfully!" -ForegroundColor Green
    return $true
  } catch {
    Write-Host "[ERR] Failed to download settings." -ForegroundColor Red
    return $false
  }
}

function Install-Extensions {
  param([string]$CodePath)
  Write-Host "[INFO] Downloading and running install-extensions.sh..."
  try {
    $scriptContent = Invoke-WebRequest -Uri "$URL_BASE/install-extensions.sh" -UseBasicParsing
    # We can't run .sh directly on Windows; provide instructions
    Write-Host "[INFO] install-extensions.sh downloaded." -ForegroundColor Yellow
    Write-Host "[INFO] To install extensions, manually run:" -ForegroundColor Yellow
    Write-Host "  & `"$CodePath`" --install-extension <extension-id>" -ForegroundColor Yellow
  } catch {
    Write-Host "[ERR] Failed to download install-extensions.sh" -ForegroundColor Red
  }
}

function Get-VSCodeInstallations {
  $installations = @()
  $programFiles = ${env:ProgramFiles}
  $localAppData = ${env:LOCALAPPDATA}

  $paths = @(
    @{path = Join-Path $programFiles "Microsoft VS Code" "bin" "code.cmd"; name = "VS Code (System)"; settings = Join-Path $env:APPDATA "Code" "User"}
    @{path = Join-Path $localAppData "Programs" "Microsoft VS Code" "bin" "code.cmd"; name = "VS Code (User)"; settings = Join-Path $env:APPDATA "Code" "User"}
    @{path = Join-Path $localAppData "Programs" "Microsoft VS Code Insiders" "bin" "code-insiders.cmd"; name = "VS Code Insiders"; settings = Join-Path $env:APPDATA "Code - Insiders" "User"}
  )

  foreach ($entry in $paths) {
    if (Test-Path $entry.path) {
      $installations += $entry
    }
  }

  return $installations
}

# Main
Write-Host "Detecting VS Code installations on Windows..."
Write-Host ""

$installations = Get-VSCodeInstallations

if ($installations.Count -eq 0) {
  Write-Host "[ERR] No VS Code installation found." -ForegroundColor Red
  Write-Host "Please install VS Code from: https://code.visualstudio.com"
  exit 1
}

$count = 1
foreach ($inst in $installations) {
  Write-Host "$count. $($inst.name)"
  $count++
}

$selected = 1
if ($installations.Count -gt 1) {
  $choice = Read-Host "Select installation [1-$($installations.Count)]"
  if ($choice) { $selected = [int]$choice }
}

$selectedInst = $installations[$selected - 1]
$CODE_PATH = $selectedInst.path
$VSCODE_DIR = $selectedInst.settings

Write-Host ""
Write-Host "=========================================="
Write-Host "  VS Code Config Installer"
Write-Host "  Edition: $CODE_PATH"
Write-Host "=========================================="
Write-Host ""
Write-Host "1. Install settings.json"
Write-Host "2. Install Extensions"
Write-Host "3. Install Both"
Write-Host "4. Exit"
Write-Host ""

$choice = Read-Host "Select option [1-4]"
Write-Host ""

switch ($choice) {
  "1" { Install-Settings -CodePath $CODE_PATH -VSCodeDir $VSCODE_DIR }
  "2" { Install-Extensions -CodePath $CODE_PATH }
  "3" {
    Install-Settings -CodePath $CODE_PATH -VSCodeDir $VSCODE_DIR
    Write-Host ""
    Install-Extensions -CodePath $CODE_PATH
  }
  default { Write-Host "[INFO] Exiting." }
}
