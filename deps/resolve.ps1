<#
.SYNOPSIS
  Auto Dependency Resolver
.DESCRIPTION
  Scans the project, detects all required dependencies, checks what's installed.
.PARAMETER CheckOnly
  Only check, don't write manifest
.PARAMETER Json
  Print JSON to stdout
.PARAMETER Install
  Attempt to install missing deps
#>

param(
  [switch]$CheckOnly,
  [switch]$Json,
  [switch]$Install
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent (Split-Path -Parent $PSCommandPath)
Set-Location $RepoRoot

$ManifestFile = "deps/manifest.json"
$CHECK_ONLY = $CheckOnly.IsPresent
$JSON_STDOUT = $Json.IsPresent
$INSTALL_MODE = $Install.IsPresent

$OS = "windows"
$PKG_MANAGER = "winget"

# Scan package.json for Node deps
$NODE_DEPS = @()
if (Test-Path "package.json") {
  $pkg = Get-Content "package.json" -Raw -Encoding UTF8 | ConvertFrom-Json
  foreach ($section in @("dependencies", "devDependencies")) {
    if ($pkg.$section) {
      $props = $pkg.$section.PSObject.Properties
      foreach ($prop in $props) {
        $type = if ($section -eq "devDependencies") { "dev" } else { "" }
        $NODE_DEPS += [PSCustomObject]@{name=$prop.Name; version=$prop.Value; type=$type}
      }
    }
  }
}

# Scan requirements.txt for Python deps
$PYTHON_DEPS = @()
if (Test-Path "requirements.txt") {
  $lines = Get-Content "requirements.txt"
  foreach ($line in $lines) {
    $line = $line.Trim()
    if (-not $line -or $line.StartsWith("#") -or $line.StartsWith("--")) { continue }
    if ($line -match '(>=|==)') {
      $parts = $line -split '(>=|==)', 2
      $PYTHON_DEPS += [PSCustomObject]@{name=$parts[0].Trim(); version="$($parts[1])$($parts[2])"; required=$true}
    } else {
      $PYTHON_DEPS += [PSCustomObject]@{name=$line; version="latest"; required=$false}
    }
  }
}

# Check installed Python packages
$PYTHON_STATUS = @()
foreach ($dep in $PYTHON_DEPS) {
  $importName = $dep.name.ToLower() -replace '-', '_' -replace '\.', ''
  if ($dep.name -eq "Pillow") { $importName = "PIL" }
  elseif ($dep.name -eq "python-docx") { $importName = "docx" }
  elseif ($dep.name -eq "opencv-python") { $importName = "cv2" }
  elseif ($dep.name -eq "PyPDF2") { $importName = "PyPDF2" }

  try { $null = python3 -c "import $importName" 2>$null } catch {}
  $installed = $LASTEXITCODE -eq 0

  $PYTHON_STATUS += [PSCustomObject]@{
    name = $dep.name
    version = $dep.version
    required = $dep.required
    installed = $installed
  }
}

# System tool dependencies for Windows
$SYSTEM_DEPS = @(
  @{tool="node"; pkg="OpenJS.NodeJS.LTS"; purpose="npm scripts, PDF conversion"; required=$true}
  @{tool="npm"; pkg="npm"; purpose="Node package manager"; required=$true}
  @{tool="python3"; pkg="Python.Python.3.12"; purpose="OCR pipeline, PDF extraction"; required=$false}
  @{tool="pdftotext"; pkg="Poppler.Poppler"; purpose="PDF text extraction"; required=$false}
  @{tool="tesseract"; pkg="UB-Mannheim.TesseractOCR"; purpose="OCR for scanned PDFs"; required=$false}
  @{tool="pandoc"; pkg="JohnMacFarlane.Pandoc"; purpose="Document format conversion"; required=$false}
  @{tool="git"; pkg="Git.Git"; purpose="Version control"; required=$true}
  @{tool="gh"; pkg="GitHub.cli"; purpose="GitHub CLI"; required=$false}
)

$SYSTEM_STATUS = @()
foreach ($dep in $SYSTEM_DEPS) {
  $installed = $null -ne (Get-Command $dep.tool -ErrorAction SilentlyContinue)
  if (-not $installed -and $dep.tool -eq "python3") {
    $installed = $null -ne (Get-Command "python" -ErrorAction SilentlyContinue)
  }
  $SYSTEM_STATUS += [PSCustomObject]@{
    tool = $dep.tool
    installed = $installed
    purpose = $dep.purpose
    required = $dep.required
    install_command = "winget install $($dep.pkg)"
  }
}

# Agent config files
$AGENT_CONFIGS = @(
  @{file="AGENTS.md"; agent="universal"; purpose="Skill discovery"}
  @{file="AGENT-GUIDE.md"; agent="universal"; purpose="Agent instructions"}
  @{file="CLAUDE.md"; agent="claude-code"; purpose="Claude Code instructions"}
  @{file=".claude/settings.json"; agent="claude-code"; purpose="Claude Code settings"}
  @{file=".cursor/rules/000-global.mdc"; agent="cursor"; purpose="Cursor global rules"}
  @{file=".aider.conf.yml"; agent="aider"; purpose="Aider config"}
  @{file=".clinerules"; agent="cline"; purpose="Cline rules"}
  @{file="cline_docs/progress.md"; agent="cline"; purpose="Cline memory bank"}
  @{file=".github/copilot-instructions.md"; agent="copilot"; purpose="Copilot instructions"}
  @{file=".continue/config.yaml"; agent="continue"; purpose="Continue.dev config"}
  @{file=".devcontainer/devcontainer.json"; agent="codespaces"; purpose="Codespaces setup"}
)

$AGENT_CONFIGS_STATUS = @()
foreach ($cfg in $AGENT_CONFIGS) {
  $AGENT_CONFIGS_STATUS += [PSCustomObject]@{
    file = $cfg.file
    agent = $cfg.agent
    purpose = $cfg.purpose
    present = Test-Path $cfg.file
  }
}

$skillsCount = 0
if (Test-Path "skills") {
  $skillsCount = (Get-ChildItem "skills" -Directory).Count
}

$sampleCount = 0
if (Test-Path "examples") {
  $sampleCount = (Get-ChildItem -Path "examples" -Recurse -Filter "sample-paper-*.md" -File).Count
}

$nodeVersion = ">=18.0.0"
if (Test-Path "package.json") {
  try {
    $pkg = Get-Content "package.json" -Raw -Encoding UTF8 | ConvertFrom-Json
    if ($pkg.engines.node) { $nodeVersion = $pkg.engines.node }
  } catch {}
}

$TIMESTAMP = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")

$totalTools = $SYSTEM_STATUS.Count
$installedTools = ($SYSTEM_STATUS | Where-Object { $_.installed }).Count
$requiredTools = ($SYSTEM_STATUS | Where-Object { $_.required }).Count
$missingRequired = ($SYSTEM_STATUS | Where-Object { $_.required -and -not $_.installed }).Count

$health = if ($missingRequired -eq 0) { "good" } elseif ($missingRequired -le 3) { "fair" } else { "poor" }

$manifest = @{
  manifest_version = "1.0.0"
  generated = $TIMESTAMP
  project = "Exam Prompt - Universal Exam Preparation System"
  platform = @{
    os = "windows"
    distro = "N/A"
    package_manager = $PKG_MANAGER
  }
  runtimes = @{
    node = $nodeVersion
    python = ">=3.9"
  }
  dependencies = @{
    system_tools = @($SYSTEM_STATUS | ForEach-Object { @{tool=$_.tool; installed=$_.installed; purpose=$_.purpose; required=$_.required; install_command=$_.install_command} })
    npm_packages = @($NODE_DEPS | ForEach-Object { @{name=$_.name; version=$_.version; type=$_.type} })
    python_packages = @($PYTHON_STATUS | ForEach-Object { @{name=$_.name; version=$_.version; required=$_.required; installed=$_.installed} })
  }
  agent_configs = @($AGENT_CONFIGS_STATUS | ForEach-Object { @{file=$_.file; agent=$_.agent; purpose=$_.purpose; present=$_.present} })
  scripts = @{
    resolver = ".\deps\resolve.ps1"
    setup = ".\scripts\setup.ps1"
    check_deps = ".\scripts\check-deps.ps1"
    install_skills = ".\scripts\install.ps1"
  }
  skills_count = $skillsCount
  sample_papers_count = $sampleCount
  install_commands = @{
    all = ".\scripts\setup.ps1"
    node_only = ".\scripts\setup.ps1 --node-only"
    check_only = ".\scripts\setup.ps1 --check"
    quick = "npm install; pip install -r requirements.txt"
    skills = ".\scripts\install.ps1"
  }
  summary = @{
    total_deps = $totalTools
    installed = $installedTools
    missing = $totalTools - $installedTools
    required_deps = $requiredTools
    missing_required = $missingRequired
    health = $health
  }
}

if ($JSON_STDOUT) {
  Write-Output ($manifest | ConvertTo-Json -Depth 10)
  exit 0
}

$manifest | ConvertTo-Json -Depth 10 | Out-File -FilePath $ManifestFile -Encoding UTF8

if (-not $CHECK_ONLY) {
  Write-Host "Manifest generated: $ManifestFile" -ForegroundColor Green
}

Write-Host "  OS: $($manifest.platform.os) ($($manifest.platform.package_manager))"
Write-Host "  Tools: $($manifest.summary.installed)/$($manifest.summary.total_deps) installed ($($manifest.summary.missing_required) required missing)"
Write-Host "  Skills: $skillsCount"
Write-Host "  Sample Papers: $sampleCount"
Write-Host "  Agents configured: $(($AGENT_CONFIGS_STATUS | Where-Object { $_.present }).Count)/$($AGENT_CONFIGS_STATUS.Count)"
Write-Host "  Health: $($manifest.summary.health.ToUpper())"

Write-Host "  Agent files found:"
foreach ($cfg in $AGENT_CONFIGS_STATUS) {
  $status = if ($cfg.present) { "[OK]" } else { "[--]" }
  Write-Host "    $status $($cfg.file.PadRight(35)) ($($cfg.agent))"
}

if ($INSTALL_MODE) {
  $missingRequiredTools = $SYSTEM_STATUS | Where-Object { $_.required -and -not $_.installed }
  if ($missingRequiredTools.Count -gt 0) {
    Write-Host "Installing missing required system tools..." -ForegroundColor Cyan
    foreach ($tool in $missingRequiredTools) {
      $pkgName = ($SYSTEM_DEPS | Where-Object { $_.tool -eq $tool.tool }).pkg
      if ($pkgName -and (Get-Command "winget" -ErrorAction SilentlyContinue)) {
        winget install -e --id $pkgName --accept-source-agreements 2>$null | Out-Null
      }
    }
  }
  Write-Host "Installing npm packages..." -ForegroundColor Cyan
  npm install --no-audit --no-fund 2>&1 | Select-Object -Last 2
}

$missingRequired = ($SYSTEM_STATUS | Where-Object { $_.required -and -not $_.installed }).Count
if ($missingRequired -gt 0 -and $CHECK_ONLY) { exit 1 }
exit 0
