#!/usr/bin/env bash
# ============================================================
# download-fonts.sh — Cross-platform font installer
#
# Downloads free/open-source fonts (SIL OFL, MIT, GFL) for PDF generation.
# Works on Linux, macOS, and Windows (Git Bash / WSL).
#
# Usage:
#   bash scripts/download-fonts.sh           # download all fonts
#   bash scripts/download-fonts.sh noto-only  # download only Noto
#
# DejaVu, Times New Roman, Caskaydia, STIX Two Math, TeX Gyre Termes
# Math are already bundled in fonts/.
# ============================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FONTS_DIR="$REPO_ROOT/fonts"

# Detect OS
case "$(uname -s)" in
  Linux*)   OS="linux" ;;
  Darwin*)  OS="macos" ;;
  CYGWIN*|MINGW*|MSYS*) OS="windows" ;;
  *)        OS="unknown" ;;
esac

echo "=== Exam Prompt — Font Downloader ==="
echo "  OS detected: $OS"
echo "  Target: $FONTS_DIR"
echo ""

mkdir -p "$FONTS_DIR"

# ─── Helper: download a font if not present ────────────
download_google_font_direct() {
  local dirname="$1" filename="$2"
  local target="$FONTS_DIR/$dirname/$filename"
  if [ -f "$target" ]; then
    echo "  ✅ $dirname/$filename already exists"
    return 0
  fi
  mkdir -p "$FONTS_DIR/$dirname"
  local url="https://github.com/google/fonts/raw/main/ofl/$dirname/$filename"
  echo "  ⬇️  Downloading $dirname/$filename..."
  if command -v curl &>/dev/null; then
    curl -sL -o "$target" "$url"
  elif command -v wget &>/dev/null; then
    wget -q -O "$target" "$url"
  else
    echo "  ❌ Need curl or wget to download fonts"
    return 1
  fi
  if [ -f "$target" ] && [ -s "$target" ]; then
    echo "  ✅ $dirname/$filename downloaded ($(du -h "$target" | cut -f1))"
  else
    echo "  ❌ Failed to download $dirname/$filename"
    return 1
  fi
}

# ─── Noto Devanagari (Hindi/Marathi/Sanskrit) ──────────
echo "[1/6] Noto Devanagari (Indian script support)..."
download_google_font_direct "notosansdevanagari" "NotoSansDevanagari-Regular.ttf"
download_google_font_direct "notosansdevanagari" "NotoSansDevanagari-Bold.ttf"
download_google_font_direct "notoserifdevanagari" "NotoSerifDevanagari-Regular.ttf"
download_google_font_direct "notoserifdevanagari" "NotoSerifDevanagari-Bold.ttf"

# ─── Shobhika (IIT Bombay — Sanskrit/Marathi) ──────────
echo "[2/6] Shobhika (IIT Bombay Sanskrit)..."
mkdir -p "$FONTS_DIR/shobhika"
for f in Shobhika-Regular.otf Shobhika-Bold.otf; do
  target="$FONTS_DIR/shobhika/$f"
  if [ ! -f "$target" ]; then
    echo "  ⬇️  Downloading shobhika/$f..."
    curl -sL -o "$target" "https://github.com/Sandhi-IITBombay/Shobhika/raw/master/$f"
    [ -f "$target" ] && [ -s "$target" ] && echo "  ✅ shobhika/$f downloaded" || echo "  ❌ shobhika/$f failed"
  else
    echo "  ✅ shobhika/$f already exists"
  fi
done

# ─── Mukta (Ek Type — multi-script Indian) ─────────────
echo "[3/6] Mukta (Ek Type multi-script)..."
mkdir -p "$FONTS_DIR/mukta"
for f in Mukta-Regular.ttf Mukta-Bold.ttf; do
  target="$FONTS_DIR/mukta/$f"
  if [ ! -f "$target" ]; then
    echo "  ⬇️  Downloading mukta/$f..."
    curl -sL -o "$target" "https://github.com/EkType/Mukta/raw/2.203/fonts/ttf/$f"
    [ -f "$target" ] && [ -s "$target" ] && echo "  ✅ mukta/$f downloaded" || echo "  ❌ mukta/$f failed"
  else
    echo "  ✅ mukta/$f already exists"
  fi
done

# ─── OpenDyslexic (accessibility) ──────────────────────
echo "[4/6] OpenDyslexic (dyslexia-friendly)..."
mkdir -p "$FONTS_DIR/opendyslexic"
for f in OpenDyslexic3-Regular.ttf OpenDyslexic3-Bold.ttf OpenDyslexic3-Italic.ttf; do
  target="$FONTS_DIR/opendyslexic/$f"
  if [ ! -f "$target" ]; then
    echo "  ⬇️  Downloading opendyslexic/$f..."
    curl -sL -o "$target" "https://github.com/antijingoist/opendyslexic/raw/main/compressed/$f"
    [ -f "$target" ] && [ -s "$target" ] && echo "  ✅ opendyslexic/$f downloaded" || echo "  ❌ opendyslexic/$f failed"
  else
    echo "  ✅ opendyslexic/$f already exists"
  fi
done

# ─── Klee + Patrick Hand (handwriting) ─────────────────
echo "[5/6] Handwriting fonts (Klee, Patrick Hand)..."
mkdir -p "$FONTS_DIR/klee"
for f in Klee-Regular.ttf Klee-Bold.ttf Klee-SemiBold.ttf; do
  target="$FONTS_DIR/klee/$f"
  if [ ! -f "$target" ]; then
    echo "  ⬇️  Downloading klee/$f..."
    curl -sL -o "$target" "https://github.com/fontworks-fonts/Klee/raw/master/fonts/ttf/$f"
    [ -f "$target" ] && [ -s "$target" ] && echo "  ✅ klee/$f downloaded" || echo "  ❌ klee/$f failed"
  else
    echo "  ✅ klee/$f already exists"
  fi
done
download_google_font_direct "patrickhand" "PatrickHand-Regular.ttf"

# ─── Chilanka (Malayalam) ──────────────────────────────
echo "[6/6] Chilanka (Malayalam handwriting)..."
mkdir -p "$FONTS_DIR/chilanka"
target="$FONTS_DIR/chilanka/Chilanka-Regular.ttf"
if [ ! -f "$target" ]; then
  echo "  ⬇️  Downloading chilanka/Chilanka-Regular.ttf..."
  curl -sL -o "$target" "https://smc.org.in/downloads/fonts/chilanka/Chilanka-Regular.ttf"
  [ -f "$target" ] && [ -s "$target" ] && echo "  ✅ chilanka downloaded" || echo "  ❌ chilanka failed"
else
  echo "  ✅ chilanka already exists"
fi

echo ""
echo "=== Font download complete ==="
echo "  Check fonts/ for available fonts."
echo "  Total size: $(du -sh "$FONTS_DIR" | cut -f1)"
echo ""

# ─── System-specific instructions ──────────────────────
case "$OS" in
  linux)
    echo "TIP: Install system fonts for full support:"
    echo "  sudo apt install fonts-noto fonts-noto-cjk fonts-noto-color-emoji"
    echo "  sudo apt install ttf-mscorefonts-installer  # Times New Roman"
    ;;
  macos)
    echo "TIP: System fonts (Times New Roman, Cambria) are pre-installed on macOS."
    ;;
  windows)
    echo "TIP: System fonts (Times New Roman, Cambria) are pre-installed on Windows."
    echo "     Bundled fonts in fonts/ serve as cross-platform fallback."
    ;;
esac
