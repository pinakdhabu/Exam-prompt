<#
.SYNOPSIS
  Cross-platform font installer for Windows
.DESCRIPTION
  Downloads free/open-source fonts for PDF generation.
.PARAMETER NotoOnly
  Download only Noto fonts
#>

param(
  [switch]$NotoOnly
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent (Split-Path -Parent $PSCommandPath)
$FontsDir = Join-Path $RepoRoot "fonts"

Write-Host "=== Exam Prompt - Font Downloader ===" -ForegroundColor Cyan
Write-Host "  Target: $FontsDir"
Write-Host ""

if (-not (Test-Path $FontsDir)) { New-Item -ItemType Directory -Path $FontsDir -Force | Out-Null }

function Download-Font {
  param([string]$DirName, [string]$FileName, [string]$Url)

  $targetDir = Join-Path $FontsDir $DirName
  $target = Join-Path $targetDir $FileName

  if (Test-Path -LiteralPath $target) {
    Write-Host "  [OK] $DirName/$FileName already exists" -ForegroundColor Green
    return $true
  }

  if (-not (Test-Path -LiteralPath $targetDir)) { New-Item -ItemType Directory -Path $targetDir -Force | Out-Null }

  Write-Host "  Downloading $DirName/$FileName..." -ForegroundColor Yellow
  try {
    Invoke-WebRequest -Uri $Url -OutFile $target -UseBasicParsing -ErrorAction Stop
    if ((Get-Item -LiteralPath $target).Length -gt 0) {
      $size = "{0:N1} KB" -f ((Get-Item -LiteralPath $target).Length / 1KB)
      Write-Host "  [OK] $DirName/$FileName downloaded ($size)" -ForegroundColor Green
      return $true
    } else {
      Write-Host "  [FAIL] $DirName/$FileName is empty" -ForegroundColor Red
      return $false
    }
  } catch {
    Write-Host "  [FAIL] Failed to download $DirName/$FileName" -ForegroundColor Red
    return $false
  }
}

function Download-GoogleFont {
  param([string]$DirName, [string]$FileName)
  $url = "https://github.com/google/fonts/raw/main/ofl/$DirName/$FileName"
  return Download-Font -DirName $DirName -FileName $FileName -Url $url
}

Write-Host "[1/6] Noto Devanagari (Indian script support)..."
Download-Font -DirName "notosansdevanagari" -FileName "NotoSansDevanagari-Variable.ttf" -Url "https://github.com/google/fonts/raw/main/ofl/notosansdevanagari/NotoSansDevanagari%5Bwdth,wght%5D.ttf"
Download-Font -DirName "notoserifdevanagari" -FileName "NotoSerifDevanagari-Variable.ttf" -Url "https://github.com/google/fonts/raw/main/ofl/notoserifdevanagari/NotoSerifDevanagari%5Bwdth,wght%5D.ttf"

if ($NotoOnly) {
  Write-Host "=== Font download complete (Noto only) ===" -ForegroundColor Green
  exit 0
}

Write-Host "[2/6] Shobhika (IIT Bombay Sanskrit)..."
foreach ($f in @("Shobhika-Regular.otf", "Shobhika-Bold.otf")) {
  $url = "https://github.com/Sandhi-IITBombay/Shobhika/raw/master/$f"
  Download-Font -DirName "shobhika" -FileName $f -Url $url
}

Write-Host "[3/6] Mukta (Ek Type multi-script)..."
foreach ($f in @("Mukta-Regular.ttf", "Mukta-Bold.ttf")) {
  $url = "https://github.com/EkType/Mukta/raw/2.203/fonts/ttf/$f"
  Download-Font -DirName "mukta" -FileName $f -Url $url
}

Write-Host "[4/6] OpenDyslexic (dyslexia-friendly)..."
foreach ($f in @("OpenDyslexic3-Regular.ttf", "OpenDyslexic3-Bold.ttf", "OpenDyslexic3-Italic.ttf")) {
  $url = "https://github.com/antijingoist/opendyslexic/raw/main/compressed/$f"
  Download-Font -DirName "opendyslexic" -FileName $f -Url $url
}

Write-Host "[5/6] Handwriting fonts (Klee, Patrick Hand, Kalam, Caveat)..."
foreach ($f in @("Klee-Regular.ttf", "Klee-Bold.ttf", "Klee-SemiBold.ttf")) {
  $url = "https://github.com/fontworks-fonts/Klee/raw/master/fonts/ttf/$f"
  Download-Font -DirName "klee" -FileName $f -Url $url
}
Download-GoogleFont -DirName "patrickhand" -FileName "PatrickHand-Regular.ttf"
Download-GoogleFont -DirName "kalam" -FileName "Kalam-Regular.ttf"
Download-GoogleFont -DirName "kalam" -FileName "Kalam-Bold.ttf"
Download-GoogleFont -DirName "kalam" -FileName "Kalam-Light.ttf"
$caveatUrl = "https://github.com/google/fonts/raw/main/ofl/caveat/Caveat%5Bwght%5D.ttf"
Download-Font -DirName "caveat" -FileName "Caveat-Variable.ttf" -Url $caveatUrl

Write-Host "[6/6] Chilanka (Malayalam handwriting)..."
Download-Font -DirName "chilanka" -FileName "Chilanka-Regular.ttf" -Url "https://smc.org.in/downloads/fonts/chilanka/Chilanka-Regular.ttf"

Write-Host "[7/6] CJK Bold fonts (download-only, ~15 MB each)..."
$cjkVariants = @(
  @{variant="sc"; dir="noto-sans-cjk-sc"}
  @{variant="tc"; dir="noto-sans-cjk-tc"}
  @{variant="jp"; dir="noto-sans-cjk-jp"}
  @{variant="kr"; dir="noto-sans-cjk-kr"}
  @{variant="hk"; dir="noto-sans-cjk-hk"}
)

foreach ($v in $cjkVariants) {
  $fileName = "NotoSansCJK$($v.variant)-Bold.otf"
  $targetDir = Join-Path $FontsDir $v.dir
  $target = Join-Path $targetDir $fileName

  if (Test-Path -LiteralPath $target) {
    Write-Host "  [OK] $($v.dir)/$fileName already exists" -ForegroundColor Green
    continue
  }

  Write-Host "  Downloading CJK Bold ($($v.variant))..."
  $zipUrl = "https://github.com/notofonts/noto-cjk/releases/download/Sans2.004/03_NotoSansCJK$($v.variant).zip"

  try {
    if (-not (Test-Path -LiteralPath $targetDir)) { New-Item -ItemType Directory -Path $targetDir -Force | Out-Null }
    $tmpZip = [System.IO.Path]::GetTempFileName() -replace '\.tmp$', '.zip'
    Invoke-WebRequest -Uri $zipUrl -OutFile $tmpZip -UseBasicParsing -ErrorAction Stop

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [System.IO.Compression.ZipFile]::OpenRead($tmpZip)
    $entry = $zip.Entries | Where-Object { $_.Name -eq $fileName }
    if ($entry) {
      [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry[0], $target, $true)
      $size = "{0:N1} KB" -f ((Get-Item -LiteralPath $target).Length / 1KB)
      Write-Host "  [OK] $($v.dir)/$fileName downloaded ($size)" -ForegroundColor Green
    } else {
      Write-Host "  [FAIL] $fileName not found in zip" -ForegroundColor Red
    }
    $zip.Dispose()
    Remove-Item -LiteralPath $tmpZip -Force -ErrorAction SilentlyContinue
  } catch {
    Write-Host "  [FAIL] Failed to download $fileName" -ForegroundColor Red
  }
}

Write-Host "=== Font download complete ===" -ForegroundColor Green
Write-Host "TIP: System fonts (Times New Roman, Cambria) are pre-installed." -ForegroundColor Cyan
