<#
.SYNOPSIS
    Check dependencies for Document Reader on Windows
.DESCRIPTION
    Verifies all required tools (poppler, tesseract, pandoc, python, pip packages)
    are installed on Windows. Supports winget, Chocolatey, and Scoop.
.USAGE
    .\scripts\check-deps.ps1
    .\scripts\check-deps.ps1 -Fix   # Attempt to install missing deps
#>

param(
    [switch]$Fix
)

$ErrorCount = 0
$WarningCount = 0

# ============================================================
# Package manager commands for each tool
# ============================================================

$WingetPkg = @{
    "pdftotext" = "XP89DCGQ3K6VLD"   # poppler
    "tesseract" = "UBMFFKJRRR9W2K"   # tesseract
    "pandoc"    = "9NBLGGH4W8GQ"     # pandoc
    "python"    = "9PJPW5LDXLZ5"     # python 3.13
}

function Get-InstallCmd {
    param([string]$Tool)
    $wId = $WingetPkg[$Tool]
    $wCmd = if ($wId) { "winget install $wId" } else { "winget install $Tool" }
    
    $cmds = @(
        @{ Name = "winget";  Cmd = $wCmd },
        @{ Name = "choco";   Cmd = "choco install $Tool" },
        @{ Name = "scoop";   Cmd = "scoop install $Tool" }
    )
    return $cmds
}

function Format-InstallCmd {
    param([string]$Tool)
    $cmds = Get-InstallCmd -Tool $Tool
    return ($cmds | ForEach-Object { "$($_.Name): $($_.Cmd)" }) -join "`n                 "
}

function Write-Result {
    param([bool]$Pass, [string]$Name, [string]$Found, [string]$InstallCmd)

    if ($Pass) {
        Write-Host "  [PASS]" -ForegroundColor Green -NoNewline
        Write-Host " $Name" -NoNewline
        Write-Host " ($Found)" -ForegroundColor Gray
    } else {
        Write-Host "  [FAIL]" -ForegroundColor Red -NoNewline
        Write-Host " $Name"
        Write-Host "         $InstallCmd" -ForegroundColor Yellow
        $script:ErrorCount++
    }
}

function Check-Command {
    param([string]$Command, [string]$Name, [string]$InstallHint)

    try {
        $path = (Get-Command $Command -ErrorAction Stop).Source
        Write-Result -Pass $true -Name $Name -Found $path -InstallCmd $InstallHint
        return $true
    } catch {
        Write-Result -Pass $false -Name $Name -Found "" -InstallCmd $InstallHint
        return $false
    }
}

function Check-PythonPackage {
    param([string]$Package, [string]$Name, [string]$InstallCmd)

    $result = & python -c "import $Package; print('ok')" 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Result -Pass $true -Name $Name -Found "Python package" -InstallCmd $InstallCmd
        return $true
    } else {
        Write-Result -Pass $false -Name $Name -Found "" -InstallCmd $InstallCmd
        return $false
    }
}

function Install-With-Preferred {
    param([string]$Command, [string]$Name, [string]$WingetId)

    if ($Fix -and (-not (Get-Command $Command -ErrorAction SilentlyContinue))) {
        # Try winget first (built-in Windows 10/11), then choco, then scoop
        if (Get-Command winget -ErrorAction SilentlyContinue) {
            Write-Host "  Installing $Name via winget..." -ForegroundColor Cyan
            if ($WingetId) {
                Invoke-Expression "winget install --id $WingetId --accept-package-agreements --accept-source-agreements" 2>$null
            } else {
                Invoke-Expression "winget install $Command --accept-package-agreements --accept-source-agreements" 2>$null
            }
        }
        if (-not (Get-Command $Command -ErrorAction SilentlyContinue)) {
            if (Get-Command choco -ErrorAction SilentlyContinue) {
                Write-Host "  Installing $Name via Chocolatey..." -ForegroundColor Cyan
                Invoke-Expression "choco install $Command -y" 2>$null
            }
        }
        if (-not (Get-Command $Command -ErrorAction SilentlyContinue)) {
            if (Get-Command scoop -ErrorAction SilentlyContinue) {
                Write-Host "  Installing $Name via Scoop..." -ForegroundColor Cyan
                Invoke-Expression "scoop install $Command" 2>$null
            }
        }
        if (-not (Get-Command $Command -ErrorAction SilentlyContinue)) {
            Write-Host "  Failed to install $Name. Try manually." -ForegroundColor Red
        }
    }
}

# ============================================================
# HEADER
# ============================================================

Write-Host ""
Write-Host "============================================" -ForegroundColor Blue
Write-Host " Dependency Check for Document Reader" -ForegroundColor Blue
Write-Host " OS: Windows" -ForegroundColor Blue
Write-Host "============================================" -ForegroundColor Blue
Write-Host ""

# Detect package managers
$hasWinget = $null -ne (Get-Command winget -ErrorAction SilentlyContinue)
$hasChoco = $null -ne (Get-Command choco -ErrorAction SilentlyContinue)
$hasScoop = $null -ne (Get-Command scoop -ErrorAction SilentlyContinue)

Write-Host "Package Managers:" -ForegroundColor Cyan
if ($hasWinget) { Write-Host "  [OK] winget found (built-in Windows 10/11)" -ForegroundColor Green }
else { Write-Host "  [--] winget not found" -ForegroundColor Gray }

if ($hasChoco) { Write-Host "  [OK] Chocolatey found" -ForegroundColor Green }
else { Write-Host "  [--] Chocolatey not found" -ForegroundColor Gray }

if ($hasScoop) { Write-Host "  [OK] Scoop found" -ForegroundColor Green }
else { Write-Host "  [--] Scoop not found" -ForegroundColor Gray }

if (-not $hasWinget -and -not $hasChoco -and -not $hasScoop) {
    Write-Host "  [WARN] No package manager detected." -ForegroundColor Yellow
    Write-Host "         winget is built into Windows 10/11 — try it first." -ForegroundColor Yellow
    Write-Host "         Install Chocolatey: https://chocolatey.org/install" -ForegroundColor Yellow
    Write-Host "         Install Scoop: https://scoop.sh/" -ForegroundColor Yellow
}
Write-Host ""

# ============================================================
# SYSTEM TOOLS
# ============================================================

Write-Host "System Tools:" -ForegroundColor Cyan
Write-Host "--------------------------------------------"

Check-Command -Command "pdftotext" -Name "pdftotext (PDF extraction)" -InstallCmd (Format-InstallCmd -Tool "poppler")
Install-With-Preferred -Command "pdftotext" -Name "poppler" -WingetId "XP89DCGQ3K6VLD"

Check-Command -Command "tesseract" -Name "Tesseract (OCR)" -InstallCmd (Format-InstallCmd -Tool "tesseract")
Install-With-Preferred -Command "tesseract" -Name "tesseract" -WingetId "UBMFFKJRRR9W2K"

Check-Command -Command "pandoc" -Name "Pandoc (document conversion)" -InstallCmd (Format-InstallCmd -Tool "pandoc")
Install-With-Preferred -Command "pandoc" -Name "pandoc" -WingetId "9NBLGGH4W8GQ"

# Python
try {
    $pyPath = (Get-Command python -ErrorAction Stop).Source
    $pyVer = & python --version 2>&1
    Write-Result -Pass $true -Name "Python" -Found "$pyPath ($pyVer)" -InstallCmd (Format-InstallCmd -Tool "python")
} catch {
    Write-Result -Pass $false -Name "Python" -Found "" -InstallCmd (Format-InstallCmd -Tool "python")
}
Install-With-Preferred -Command "python" -Name "python" -WingetId "9PJPW5LDXLZ5"
Write-Host ""

# ============================================================
# PYTHON PACKAGES
# ============================================================

Write-Host "Python Packages:" -ForegroundColor Cyan
Write-Host "--------------------------------------------"

Check-PythonPackage -Package "PyPDF2" -Name "PyPDF2" -InstallCmd "pip install PyPDF2"
Check-PythonPackage -Package "pytesseract" -Name "pytesseract" -InstallCmd "pip install pytesseract"
Check-PythonPackage -Package "PIL" -Name "Pillow (PIL)" -InstallCmd "pip install Pillow"
Check-PythonPackage -Package "docx" -Name "python-docx" -InstallCmd "pip install python-docx"
Write-Host ""

# ============================================================
# SUMMARY
# ============================================================

Write-Host "============================================" -ForegroundColor Blue
Write-Host " Summary" -ForegroundColor Blue
Write-Host "============================================" -ForegroundColor Blue

if ($ErrorCount -eq 0) {
    Write-Host " [PASS] All dependencies satisfied!" -ForegroundColor Green
    Write-Host ""
    Write-Host " You can now use the document reader:"
    Write-Host "   .\scripts\process-document.ps1 <file> <skill>" -ForegroundColor Cyan
    exit 0
} else {
    Write-Host " [FAIL] Found $ErrorCount missing dependencies" -ForegroundColor Yellow
    Write-Host ""
    Write-Host " Quick fix:" -ForegroundColor Yellow

    if ($hasWinget) {
        Write-Host "   winget install XP89DCGQ3K6VLD    # poppler (pdftotext)" -ForegroundColor Cyan
        Write-Host "   winget install UBMFFKJRRR9W2K    # tesseract" -ForegroundColor Cyan
        Write-Host "   winget install 9NBLGGH4W8GQ      # pandoc" -ForegroundColor Cyan
        Write-Host "   winget install 9PJPW5LDXLZ5      # python 3" -ForegroundColor Cyan
    } elseif ($hasChoco) {
        Write-Host "   choco install poppler tesseract pandoc python3 -y" -ForegroundColor Cyan
    } elseif ($hasScoop) {
        Write-Host "   scoop install poppler tesseract pandoc python" -ForegroundColor Cyan
    } else {
        Write-Host "   Option 1 (built-in): winget is available on Windows 10/11 — run above commands" -ForegroundColor Cyan
        Write-Host "   Option 2: Install Chocolatey first: https://chocolatey.org/install" -ForegroundColor Cyan
    }

    Write-Host "   pip install PyPDF2 pytesseract Pillow python-docx" -ForegroundColor Cyan

    if ($Fix) {
        Write-Host ""
        Write-Host " Auto-fix enabled but some installs may have failed." -ForegroundColor Yellow
        Write-Host " Check errors above and install manually if needed." -ForegroundColor Yellow
    } else {
        Write-Host ""
        Write-Host " Re-run with -Fix to auto-install missing dependencies:" -ForegroundColor Yellow
        Write-Host "   .\scripts\check-deps.ps1 -Fix" -ForegroundColor Cyan
    }
    exit 1
}
