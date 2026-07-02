# Dependencies — Exam Prompt MD → PDF Pipeline

## Overview

The core MD→PDF pipeline runs on **Node.js + Playwright** only. Python is **optional** and only
needed for PDF text extraction or the WeasyPrint fallback backend.

---

## Node.js (Required, >= 18)

| Platform          | Install command                                                                                    |
| ----------------- | -------------------------------------------------------------------------------------------------- |
| **Ubuntu/Debian** | `curl -fsSL https://deb.nodesource.com/setup_22.x \| sudo -E bash - && sudo apt install -y nodejs` |
| **Fedora/RHEL**   | `sudo dnf module enable nodejs:22 -y && sudo dnf install nodejs -y`                                |
| **Arch**          | `sudo pacman -S nodejs npm`                                                                        |
| **macOS**         | `brew install node`                                                                                |
| **Windows**       | `winget install -e --id OpenJS.NodeJS` or download from [nodejs.org](https://nodejs.org/)          |

> **Windows users:** If `npm` is not recognized after install, reopen your terminal to refresh PATH.
> If PowerShell blocks npm scripts, run:
> `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

### Verify

```bash
node --version   # >= 18.0.0
npm --version
```

---

## npm Packages (Required)

```bash
npm install
```

This installs from `package.json`:

| Package                  | Role                               |
| ------------------------ | ---------------------------------- |
| `marked`                 | Markdown → HTML parser             |
| `marked-katex-extension` | LaTeX equation rendering via KaTeX |
| `playwright`             | Headless Chromium → A4 PDF         |
| `mermaid`                | Diagram rendering                  |

### Install Playwright + Chromium

```bash
npx playwright install chromium
```

#### Linux — System Libraries for Chromium

Run the automated installer (recommended — it detects your distro):

```bash
npx playwright install-deps chromium
```

On **Ubuntu 24.04+** , some packages have been renamed (`libasound2` → `libasound2t64`,
`libatk1.0-0` → `libatk1.0-0t64`). The `install-deps` command handles this automatically.

If you prefer manual install:

| Distro            | Command                                                                                                                                                                                            |
| ----------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Ubuntu/Debian** | `sudo apt install -y libnss3 libnspr4 libatk1.0-0t64 libatk-bridge2.0-0t64 libcups2t64 libdrm2 libxkbcommon0 libxcomposite1 libxdamage1 libxrandr2 libgbm1 libasound2t64 libpango-1.0-0 libcairo2` |
| **Fedora/RHEL**   | `sudo dnf install -y nss nspr atk at-spi2-atk cups-libs libdrm libxkbcommon libXcomposite libXdamage libXrandr mesa-libgbm alsa-lib pango cairo`                                                   |
| **Arch**          | `sudo pacman -S nss nspr atk at-spi2-atk cups libdrm libxkbcommon libxcomposite libxdamage libxrandr libgbm pango cairo alsa-lib`                                                                  |

| Platform    | Notes                                                                                                                         |
| ----------- | ----------------------------------------------------------------------------------------------------------------------------- |
| **macOS**   | Works out of the box — no extra deps needed                                                                                   |
| **Windows** | Works out of the box — no extra deps needed (may need [VC++ redistributable](https://aka.ms/vs/17/release/vc_redist.x64.exe)) |

---

## Python (Optional)

Only needed for:

- `scripts/pdf-extract.py` — PDF text extraction
- `scripts/convert-to-pdf.py` — WeasyPrint PDF backend (fallback, no KaTeX math)

| Platform          | Install                                                                          |
| ----------------- | -------------------------------------------------------------------------------- |
| **Ubuntu/Debian** | `sudo apt install -y python3 python3-pip`                                        |
| **Fedora/RHEL**   | `sudo dnf install -y python3 python3-pip`                                        |
| **Arch**          | `sudo pacman -S python python-pip`                                               |
| **macOS**         | `brew install python`                                                            |
| **Windows**       | `winget install -e --id Python.Python.3.12` or [python.org](https://python.org/) |

### Python Packages

```bash
pip install -r requirements.txt
```

---

## System Tools (Optional)

| Tool        | Role                       | Ubuntu/Debian                    | Fedora                     | Arch                     | macOS                  | Windows                                                                                     |
| ----------- | -------------------------- | -------------------------------- | -------------------------- | ------------------------ | ---------------------- | ------------------------------------------------------------------------------------------- |
| `pdftotext` | PDF text extraction        | `sudo apt install poppler-utils` | `sudo dnf install poppler` | `sudo pacman -S poppler` | `brew install poppler` | Download from [poppler-windows](https://github.com/oschwartz10612/poppler-windows/releases) |
| `pandoc`    | Document format conversion | `sudo apt install pandoc`        | `sudo dnf install pandoc`  | `sudo pacman -S pandoc`  | `brew install pandoc`  | `winget install pandoc` or [pandoc.org](https://pandoc.org/)                                |

---

## Quick Reference

```bash
# ✅ MD → PDF with equations (RECOMMENDED — Node.js + KaTeX + Playwright)
npm install && npx playwright install chromium
node scripts/convert-to-pdf.js paper.md paper.pdf

# ✅ MD → PDF (Python fallback — no equation rendering)
pip install -r requirements.txt
python3 scripts/convert-to-pdf.py paper.md paper.pdf

# ✅ Batch convert all sample papers
npm run convert:pdf:all
```

## Verification

```bash
node -e "require('marked'); require('marked-katex-extension'); console.log('Node deps OK')"
npx playwright --version
```
