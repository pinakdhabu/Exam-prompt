<#
.SYNOPSIS
    Exam Prompt — Windows Dependency Installer
.DESCRIPTION
    Installs all required dependencies for the Exam Prompt system on Windows.
    Uses winget (primary) or Chocolatey (fallback) for package management.
    Handles edge cases: no admin rights, no winget/choco, PATH refresh issues.
.PARAMETER Check
    Only check installed dependencies, don't install
.PARAMETER NodeOnly
    Only install Node.js + npm packages
.PARAMETER Offline
    Report what's missing without attempting install
.PARAMETER Help
    Show this help message
.EXAMPLE
    .\scripts\setup.ps1
    .\scripts\setup.ps1 -Check
    .\scripts\setup.ps1 -NodeOnly
    .\scripts\setup.ps1 -Offline
#>

param(
    [switch]$Check,
    [switch]$NodeOnly,
    [switch]$Offline,
    [switch]$Help
)

if ($Help) {
    Write-Host "Exam Prompt — Windows Dependency Installer" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Usage: .\scripts\setup.ps1 [options]"
    Write-Host ""
    Write-Host "Options:"
    Write-Host "  -Check       Only check installed deps, don't install"
    Write-Host "  -NodeOnly    Only install Node.js + npm packages"
    Write-Host "  -Offline     Report what's missing, don't install"
    Write-Host "  -Help        Show this help"
    exit 0
}

# ---- Admin Check ----
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin -and -not $Check -and -not $Offline) {
    Write-Host "  ⚠ Not running as Administrator." -ForegroundColor Yellow
    Write-Host "    Some installations may fail without admin rights." -ForegroundColor Yellow
    Write-Host "    Restart as Admin, then re-run." -ForegroundColor Yellow
    Write-Host "    Continuing anyway (will try user-level install)..." -ForegroundColor Yellow
}

if ($Offline) { $Check = $true }

# ---- Create pyq-downloads directory ----
New-Item -ItemType Directory -Force -Path "pyq-downloads" | Out-Null

# ---- Detect Package Manager ----
$pkgManager = $null
$pkgCmd = $null

if (Get-Command winget -ErrorAction SilentlyContinue) {
    $pkgManager = "winget"
    $pkgCmd = "winget install --accept-source-agreements"
    Write-Host "  ✓ Package manager: winget" -ForegroundColor Green
} elseif (Get-Command choco -ErrorAction SilentlyContinue) {
    $pkgManager = "choco"
    $pkgCmd = "choco install -y"
    Write-Host "  ✓ Package manager: Chocolatey" -ForegroundColor Green
} else {
    Write-Host "  ✗ No package manager found." -ForegroundColor Red
    Write-Host ""
    Write-Host "    winget: Included with Windows 10/11"
    Write-Host "    Chocolatey: https://chocolatey.org/install"
    if ($Check) { exit 0 } else { exit 1 }
}

# ---- Helper: Refresh PATH from registry ----
function Refresh-Path {
    # Get system + user PATH from registry
    $machinePath = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
    $userPath = [System.Environment]::GetEnvironmentVariable("Path", "User")
    $env:Path = $machinePath + ";" + $userPath + ";" + [System.Environment]::GetEnvironmentVariable("Path", "Process")
}

# ---- Helper: Check tool ----
function Check-Tool {
    param($Name)
    $result = Get-Command $Name -ErrorAction SilentlyContinue
    if ($result) {
        Write-Host "  ✓ $Name" -ForegroundColor Green
        return $true
    } else {
        Write-Host "  ✗ $Name" -ForegroundColor Red
        return $false
    }
}

# ---- Helper: Install tool ----
function Install-Tool {
    param($Name, $WingetId, $ChocoName)
    if ($Check) { return }
    Write-Host "  → Installing $Name..." -ForegroundColor Yellow
    if ($pkgManager -eq "winget") {
        winget install $WingetId --accept-source-agreements --accept-package-agreements 2>&1 | Out-Null
    } else {
        choco install $ChocoName -y 2>&1 | Out-Null
    }
    Refresh-Path
}

# ---- Step 1: Node.js ----
Write-Host ""
Write-Host ("─" * 50)
Write-Host "STEP 1: Node.js" -ForegroundColor Cyan
Write-Host ("─" * 50)

$nodeVersion = & node --version 2>$null
if ($nodeVersion) {
    Write-Host "  ✓ Node.js $nodeVersion" -ForegroundColor Green
} else {
    if (-not $Check) {
        Write-Host "  Installing Node.js..." -ForegroundColor Yellow
        if ($pkgManager -eq "winget") {
            winget install OpenJS.NodeJS.LTS --accept-source-agreements --accept-package-agreements 2>&1 | Out-Null
        } else {
            choco install nodejs-lts -y 2>&1 | Out-Null
        }
        # Refresh PATH
        Refresh-Path
        # Retry check
        $nodeVersion = & node --version 2>$null
        if (-not $nodeVersion) {
            Write-Host "  ⚠ Node.js installed but not in PATH yet." -ForegroundColor Yellow
            Write-Host "    Restart terminal or add to PATH manually." -ForegroundColor Yellow
        }
    } else {
        Write-Host "  ✗ Node.js not installed" -ForegroundColor Red
    }
}

$npmVersion = & npm --version 2>$null
if ($npmVersion) {
    Write-Host "  ✓ npm $npmVersion" -ForegroundColor Green
}

# ---- Install npm packages ----
if (-not $Check -and (Get-Command npm -ErrorAction SilentlyContinue)) {
    Write-Host ""
    Write-Host "  Installing npm packages..." -ForegroundColor Yellow
    $npmResult = npm install --no-audit --no-fund 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "  ⚠ npm install had issues (non-fatal)" -ForegroundColor Yellow
    }

    # Check Playwright
    if (Test-Path "node_modules\playwright") {
        Write-Host "  Installing Playwright Chromium..." -ForegroundColor Yellow
        $playResult = npx playwright install chromium 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Host "  ✓ Playwright Chromium installed" -ForegroundColor Green
        } else {
            Write-Host "  ⚠ Playwright install had issues (can be installed later)" -ForegroundColor Yellow
        }
    }
} elseif ($Check -and (Get-Command npm -ErrorAction SilentlyContinue)) {
    if (Test-Path "node_modules") {
        Write-Host "  ✓ npm packages installed"
    } else {
        Write-Host "  ⚠ npm packages not installed (run without -Check)" -ForegroundColor Yellow
    }
}

# ---- Step 2: Python (if not NodeOnly) ----
if (-not $NodeOnly) {
    Write-Host ""
    Write-Host ("─" * 50)
    Write-Host "STEP 2: Python" -ForegroundColor Cyan
    Write-Host ("─" * 50)

    $pyVersion = & python --version 2>$null
    if ($pyVersion) {
        Write-Host "  ✓ $pyVersion" -ForegroundColor Green
    } else {
        if (-not $Check) {
            Write-Host "  Installing Python..." -ForegroundColor Yellow
            if ($pkgManager -eq "winget") {
                winget install Python.Python.3.12 --accept-source-agreements --accept-package-agreements 2>&1 | Out-Null
            } else {
                choco install python -y 2>&1 | Out-Null
            }
            Refresh-Path
        } else {
            Write-Host "  ✗ Python not installed" -ForegroundColor Red
        }
    }

    # Check Python packages
    if (Get-Command python -ErrorAction SilentlyContinue) {
        if (-not $Check) {
            Write-Host ""
            Write-Host "  Installing Python packages..." -ForegroundColor Yellow
            python -m pip install -r requirements.txt 2>&1 | Out-Null
        }

        # Verify key packages
        $packages = @("weasyprint", "markdown", "PyPDF2", "PIL")
        foreach ($pkg in $packages) {
            $result = python -c "import $pkg" 2>&1 | Out-String
            if ($LASTEXITCODE -eq 0) {
                Write-Host "  ✓ $pkg" -ForegroundColor Green
            } else {
                Write-Host "  ⚠ $pkg — not installed" -ForegroundColor Yellow
            }
        }
    }

    # ---- Step 3: System Tools ----
    Write-Host ""
    Write-Host ("─" * 50)
    Write-Host "STEP 3: System Tools" -ForegroundColor Cyan
    Write-Host ("─" * 50)

    $tools = @(
        @{Name="Git"; Cmd="git --version"; Winget="Git.Git"; Choco="git"}
        @{Name="Pandoc"; Cmd="pandoc --version"; Winget="JohnMacFarlane.Pandoc"; Choco="pandoc"}
        @{Name="ImageMagick"; Cmd="convert --version"; Winget="ImageMagick.ImageMagick"; Choco="imagemagick"}
        @{Name="Poppler (pdftotext)"; Cmd="pdftotext --version"; Winget="Poppler.Poppler"; Choco="poppler"}
        @{Name="Tesseract OCR"; Cmd="tesseract --version"; Winget="UB-Mannheim.TesseractOCR"; Choco="tesseract"}
    )

    foreach ($tool in $tools) {
        $found = Get-Command -Name ($tool.Cmd.Split(" ")[0]) -ErrorAction SilentlyContinue
        if ($found) {
            Write-Host "  ✓ $($tool.Name)" -ForegroundColor Green
        } elseif (-not $Check) {
            Write-Host "  Installing $($tool.Name)..." -ForegroundColor Yellow
            if ($pkgManager -eq "winget") {
                winget install $($tool.Winget) --accept-source-agreements --accept-package-agreements 2>&1 | Out-Null
            } else {
                choco install $($tool.Choco) -y 2>&1 | Out-Null
            }
            Refresh-Path
        } else {
            Write-Host "  ✗ $($tool.Name) — not installed" -ForegroundColor Red
        }
    }
}

# ---- Summary ----
Write-Host ""
Write-Host ("─" * 50)
Write-Host "VERIFICATION" -ForegroundColor Cyan
Write-Host ("─" * 50)

$scriptCount = (Get-ChildItem "scripts\*.sh", "scripts\*.ps1", "scripts\*.js", "scripts\*.py" -ErrorAction SilentlyContinue).Count
Write-Host "  ✓ $scriptCount scripts available" -ForegroundColor Green

$skillCount = (Get-ChildItem "skills" -Directory -ErrorAction SilentlyContinue).Count
Write-Host "  ✓ $skillCount skills available" -ForegroundColor Green

$pyqCount = (Get-ChildItem "pyq-downloads" -ErrorAction SilentlyContinue).Count
Write-Host "  ✓ pyq-downloads directory ready" -ForegroundColor Green

if ($Offline) {
    Write-Host ""
    Write-Host "Offline report complete. Install missing items manually." -ForegroundColor Yellow
} elseif ($Check) {
    Write-Host ""
    Write-Host "Check complete. Run without -Check to install missing deps." -ForegroundColor Yellow
} else {
    Write-Host ""
    Write-Host ("╔" + "═" * 40 + "╗") -ForegroundColor Green
    Write-Host "║      Setup complete!               ║" -ForegroundColor Green
    Write-Host ("╚" + "═" * 40 + "╝") -ForegroundColor Green
    Write-Host ""
    Write-Host "  Next steps:"
    Write-Host "    1. Run:  node scripts\fetch-qp.js --help"
    Write-Host "    2. Run:  node scripts\fetch-qp.js dbms"
    Write-Host "    3. Run:  npm run convert:pdf -- examples\fe\2019-pattern\engineering-mathematics-1\sample-paper-1.md"
    Write-Host ""
}
