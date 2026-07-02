#!/usr/bin/env bash
# ==============================================================================
# deps/resolve.sh — Auto Dependency Resolver
#
# Scans the project, detects all required dependencies, resolves the best
# option for the student's platform/OS, checks what's installed, and outputs
# a JSON manifest that AI agents (Claude Code, OpenCode, Cursor, etc.) can
# read to understand the dependency landscape automatically.
#
# Usage:
#   bash deps/resolve.sh                    # Full resolve + check + output manifest
#   bash deps/resolve.sh --check-only       # Only check, don't write manifest
#   bash deps/resolve.sh --json             # Print JSON to stdout
#   bash deps/resolve.sh --install          # Attempt to install missing deps
#   bash deps/resolve.sh --platform linux   # Override OS detection
#
# Output: deps/manifest.json (auto-generated, agent-readable)
# ==============================================================================

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

MANIFEST_FILE="deps/manifest.json"
CHECK_ONLY=false
JSON_STDOUT=false
INSTALL_MODE=false

while [[ $# -gt 0 ]]; do
  case $1 in
    --check-only) CHECK_ONLY=true; shift ;;
    --json) JSON_STDOUT=true; shift ;;
    --install) INSTALL_MODE=true; shift ;;
    --platform) PLATFORM="$2"; shift 2 ;;
    --help)
      echo "Usage: bash deps/resolve.sh [options]"
      echo ""
      echo "Options:"
      echo "  --check-only   Only check status, don't write manifest"
      echo "  --json         Print JSON manifest to stdout"
      echo "  --install      Attempt to install missing dependencies"
      echo "  --platform     Override OS detection (linux/macos/windows)"
      echo "  --help         Show this help"
      exit 0
      ;;
    *) echo "Unknown: $1"; exit 1 ;;
  esac
done

# ─── Pre-flight Check ───────────────────────────────────────────────────
# The script requires python3. Check it early for a clear error message.
if ! command -v python3 &>/dev/null; then
  echo "ERROR: python3 is required but not installed." >&2
  echo "  Install it first:" >&2
  case "$(uname -s)" in
    Linux*)
      if command -v apt &>/dev/null; then echo "  sudo apt install -y python3" >&2
      elif command -v dnf &>/dev/null; then echo "  sudo dnf install -y python3" >&2
      elif command -v pacman &>/dev/null; then echo "  sudo pacman -S python" >&2
      else echo "  Install python3 via your package manager" >&2; fi
      ;;
    Darwin*) echo "  brew install python3" >&2 ;;
    *) echo "  https://www.python.org/downloads/" >&2 ;;
  esac
  exit 1
fi

# ─── OS Detection ────────────────────────────────────────────────────────
detect_os() {
  case "$(uname -s)" in
    Linux*)  echo "linux" ;;
    Darwin*) echo "macos" ;;
    MINGW*|MSYS*|CYGWIN*) echo "windows" ;;
    *) echo "unknown" ;;
  esac
}

detect_distro() {
  if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    case "$ID" in
      ubuntu|debian|linuxmint|pop) echo "debian" ;;
      fedora|rhel|centos) echo "rhel" ;;
      arch|manjaro) echo "arch" ;;
      alpine) echo "alpine" ;;
      opensuse*|suse*) echo "suse" ;;
      *) echo "linux" ;;
    esac
  else
    echo "linux"
  fi
}

detect_pkg_manager() {
  local os="$1"
  case "$os" in
    linux)
      if command -v apt &>/dev/null; then echo "apt"
      elif command -v dnf &>/dev/null; then echo "dnf"
      elif command -v yum &>/dev/null; then echo "yum"
      elif command -v pacman &>/dev/null; then echo "pacman"
      elif command -v apk &>/dev/null; then echo "apk"
      else echo "unknown"; fi
      ;;
    macos)
      command -v brew &>/dev/null && echo "brew" || echo "unknown"
      ;;
    windows)
      command -v winget &>/dev/null && echo "winget" || echo "unknown"
      ;;
    *) echo "unknown" ;;
  esac
}

OS="${PLATFORM:-$(detect_os)}"
DISTRO="N/A"
PKG_MANAGER=""
if [[ "$OS" == "linux" ]]; then
  DISTRO=$(detect_distro)
fi
PKG_MANAGER=$(detect_pkg_manager "$OS")

# ─── Scan Project Dependencies ───────────────────────────────────────────
NODE_DEPS="[]"
PYTHON_DEPS="[]"
SYSTEM_DEPS="[]"
AGENT_CONFIGS="[]"

# 1. Scan package.json for Node deps
if [[ -f "package.json" ]]; then
  NODE_DEPS=$(python3 -c "
import json
with open('package.json') as f:
    data = json.load(f)
deps = []
for section in ['dependencies', 'devDependencies']:
    for name, ver in data.get(section, {}).items():
        deps.append({'name': name, 'version': ver, 'type': section.rstrip('Dependencies')})
print(json.dumps(deps))
" 2>/dev/null || echo "[]")
fi

# 2. Scan requirements.txt for Python deps AND check installed status
if [[ -f "requirements.txt" ]]; then
  PYTHON_DEPS=$(python3 -c "
import json
with open('requirements.txt') as f:
    lines = f.readlines()
deps = []
for line in lines:
    line = line.strip()
    if not line or line.startswith('#') or line.startswith('--'):
        continue
    if '>=' in line:
        parts = line.split('>=')
        deps.append({'name': parts[0].strip(), 'version': '>=' + parts[1].strip(), 'required': True})
    elif '==' in line:
        parts = line.split('==')
        deps.append({'name': parts[0].strip(), 'version': '==' + parts[1].strip(), 'required': True})
    else:
        deps.append({'name': line, 'version': 'latest', 'required': False})
print(json.dumps(deps))
" 2>/dev/null || echo "[]")

  # Check installed status for each Python package
  PYTHON_STATUS=$(python3 -c "
import json, subprocess, sys

deps = json.loads('''$PYTHON_DEPS''')
for dep in deps:
    name = dep['name']
    # Map package names to import names
    import_name = name.lower().replace('-', '_').replace('.', '')
    if name == 'Pillow': import_name = 'PIL'
    elif name == 'python-docx': import_name = 'docx'
    elif name == 'opencv-python': import_name = 'cv2'
    elif name == 'PyPDF2': import_name = 'PyPDF2'
    elif name == 'pytesseract': import_name = 'pytesseract'
    try:
        r = subprocess.run(['python3', '-c', f'import {import_name}'], capture_output=True, text=True)
        dep['installed'] = r.returncode == 0
    except:
        dep['installed'] = False
print(json.dumps(deps))
" 2>/dev/null || echo "[]")
else
  PYTHON_STATUS="[]"
fi

# 3. Scan scripts for system tool dependencies
SYSTEM_DEPS=$(python3 -c "
import json
deps = [
    {'tool': 'node', 'pkg': {'linux': 'nodejs', 'macos': 'node', 'windows': 'OpenJS.NodeJS.LTS'}, 'purpose': 'npm scripts, PDF conversion, QP fetching', 'required': True},
    {'tool': 'npm', 'pkg': {'linux': 'npm', 'macos': 'npm', 'windows': 'npm'}, 'purpose': 'Node package manager', 'required': True},
    {'tool': 'python3', 'pkg': {'linux': 'python3', 'macos': 'python', 'windows': 'Python.Python.3.12'}, 'purpose': 'OCR pipeline, PDF extraction, doc conversion', 'required': False},
    {'tool': 'pdftotext', 'pkg': {'linux': 'poppler-utils', 'macos': 'poppler', 'windows': 'Poppler.Poppler'}, 'purpose': 'PDF text extraction', 'required': False},
    {'tool': 'tesseract', 'pkg': {'linux': 'tesseract-ocr', 'macos': 'tesseract', 'windows': 'UB-Mannheim.TesseractOCR'}, 'purpose': 'OCR for scanned PDFs', 'required': False},
    {'tool': 'pandoc', 'pkg': {'linux': 'pandoc', 'macos': 'pandoc', 'windows': 'JohnMacFarlane.Pandoc'}, 'purpose': 'Document format conversion', 'required': False},
    {'tool': 'd2', 'pkg': {'linux': 'curl -fsSL https://d2lang.com/install.sh | sh', 'macos': 'brew install d2', 'windows': 'choco install d2'}, 'purpose': 'Architecture diagram rendering', 'required': False},
    {'tool': 'git', 'pkg': {'linux': 'git', 'macos': 'git', 'windows': 'Git.Git'}, 'purpose': 'Version control', 'required': True},
    {'tool': 'gh', 'pkg': {'linux': 'gh', 'macos': 'gh', 'windows': 'GitHub.cli'}, 'purpose': 'GitHub CLI for workflow + PR management', 'required': False},
]
print(json.dumps(deps))
")

# 4. Agent config files
AGENT_CONFIGS=$(python3 -c "
import json
configs = [
    {'file': 'AGENTS.md', 'agent': 'universal', 'purpose': 'Skill discovery for all AI agents', 'present': __import__('os').path.exists('AGENTS.md')},
    {'file': 'AGENT-GUIDE.md', 'agent': 'universal', 'purpose': 'Universal agent instructions with 30 skills table', 'present': __import__('os').path.exists('AGENT-GUIDE.md')},
    {'file': 'CLAUDE.md', 'agent': 'claude-code', 'purpose': 'Claude Code project instructions', 'present': __import__('os').path.exists('CLAUDE.md')},
    {'file': '.claude/settings.json', 'agent': 'claude-code', 'purpose': 'Claude Code project settings', 'present': __import__('os').path.exists('.claude/settings.json')},
    {'file': '.cursor/rules/000-global.mdc', 'agent': 'cursor', 'purpose': 'Cursor global rules', 'present': __import__('os').path.exists('.cursor/rules/000-global.mdc')},
    {'file': '.aider.conf.yml', 'agent': 'aider', 'purpose': 'Aider configuration', 'present': __import__('os').path.exists('.aider.conf.yml')},
    {'file': '.clinerules', 'agent': 'cline', 'purpose': 'Cline project rules', 'present': __import__('os').path.exists('.clinerules')},
    {'file': 'cline_docs/progress.md', 'agent': 'cline', 'purpose': 'Cline memory bank', 'present': __import__('os').path.exists('cline_docs/progress.md')},
    {'file': '.github/copilot-instructions.md', 'agent': 'copilot', 'purpose': 'GitHub Copilot instructions', 'present': __import__('os').path.exists('.github/copilot-instructions.md')},
    {'file': '.continue/config.yaml', 'agent': 'continue', 'purpose': 'Continue.dev configuration', 'present': __import__('os').path.exists('.continue/config.yaml')},
    {'file': '.devcontainer/devcontainer.json', 'agent': 'codespaces', 'purpose': 'One-click Codespaces setup', 'present': __import__('os').path.exists('.devcontainer/devcontainer.json')},
]
print(json.dumps(configs))
")

# ─── Check Installed Status ─────────────────────────────────────────────
check_installed() {
  command -v "$1" &>/dev/null && echo "installed" || echo "missing"
}

check_python_pkg() {
  python3 -c "import $1" 2>/dev/null && echo "installed" || echo "missing"
}

SYSTEM_STATUS="[]"
SYSTEM_STATUS=$(python3 -c "
import json, subprocess, sys

os_type = '$OS'
deps = json.loads('$SYSTEM_DEPS')
results = []
for dep in deps:
    tool = dep['tool']
    # Check if installed
    try:
        r = subprocess.run(['which', tool], capture_output=True, text=True)
        installed = r.returncode == 0
    except:
        installed = False
    results.append({
        'tool': tool,
        'installed': installed,
        'purpose': dep['purpose'],
        'required': dep['required'],
        'install_command': dep['pkg'].get(os_type, dep['pkg'].get('linux', 'see docs'))
    })
print(json.dumps(results))
")

# ─── Build Manifest ──────────────────────────────────────────────────────
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

MANIFEST=$(python3 -c "
import json

manifest = {
    'manifest_version': '1.0.0',
    'generated': '$TIMESTAMP',
    'project': 'Exam Prompt — Universal Exam Preparation System',
    'platform': {
        'os': '$OS',
        'distro': '$DISTRO',
        'package_manager': '$PKG_MANAGER',
    },
    'runtimes': {
        'node': json.loads(open('package.json').read()).get('engines', {}).get('node', '>=18.0.0') if __import__('os').path.exists('package.json') else 'unknown',
        'python': '>=3.9',
    },
    'dependencies': {
        'system_tools': json.loads('''$SYSTEM_STATUS'''),
        'npm_packages': json.loads('''$NODE_DEPS'''),
        'python_packages': json.loads('''$PYTHON_STATUS'''),
    },
    'agent_configs': json.loads('''$AGENT_CONFIGS'''),
    'scripts': {
        'resolver': 'bash deps/resolve.sh',
        'setup': 'bash scripts/setup.sh',
        'check_deps': 'bash scripts/check-deps.sh',
        'install_skills': 'bash scripts/install.sh',
    },
    'skills_count': len([d for d in __import__('os').listdir('skills') if __import__('os').path.isdir(f'skills/{d}')]) if __import__('os').path.exists('skills') else 0,
    'sample_papers_count': len(__import__('glob').glob('examples/**/sample-paper-*.md', recursive=True)) if __import__('os').path.exists('examples') else 0,
}

manifest['install_commands'] = {
    'all': 'bash scripts/setup.sh',
    'node_only': 'bash scripts/setup.sh --node-only',
    'check_only': 'bash scripts/setup.sh --check',
    'quick': 'npm install && pip install -r requirements.txt 2>/dev/null || true',
    'skills': 'bash scripts/install.sh',
}

# Count installed vs missing
total = len(manifest['dependencies']['system_tools'])
installed = sum(1 for d in manifest['dependencies']['system_tools'] if d['installed'])
required = sum(1 for d in manifest['dependencies']['system_tools'] if d['required'])
missing_required = sum(1 for d in manifest['dependencies']['system_tools'] if d['required'] and not d['installed'])

manifest['summary'] = {
    'total_deps': total,
    'installed': installed,
    'missing': total - installed,
    'required_deps': required,
    'missing_required': missing_required,
    'health': 'good' if missing_required == 0 else ('fair' if missing_required <= 3 else 'poor'),
}

print(json.dumps(manifest, indent=2))
")

# ─── Output ──────────────────────────────────────────────────────────────
if [[ "$JSON_STDOUT" == "true" ]]; then
  echo "$MANIFEST"
  exit 0
fi

mkdir -p "$(dirname "$MANIFEST_FILE")"
echo "$MANIFEST" > "$MANIFEST_FILE"

if [[ "$CHECK_ONLY" != "true" ]]; then
  echo "✅ Manifest generated: $MANIFEST_FILE"
fi

# ─── Summary ─────────────────────────────────────────────────────────────
SUMMARY=$(echo "$MANIFEST" | python3 -c "
import json, sys
m = json.load(sys.stdin)
s = m['summary']
print(f\"  OS: {m['platform']['os']} ({m['platform']['package_manager']})\")
print(f\"  Tools: {s['installed']}/{s['total_deps']} installed ({s['missing_required']} required missing)\")
print(f\"  Skills: {m['skills_count']}\")
print(f\"  Sample Papers: {m['sample_papers_count']}\")
print(f\"  Agents configured: {sum(1 for c in m['agent_configs'] if c['present'])}/{len(m['agent_configs'])}\")
print(f\"  Health: {s['health'].upper()}\")
")
echo "$SUMMARY"

# ─── Agent File Detection ────────────────────────────────────────────────
echo ""
echo "  Agent files found:"
echo "$MANIFEST" | python3 -c "
import json, sys
m = json.load(sys.stdin)
for c in m['agent_configs']:
    status = '✅' if c['present'] else '❌'
    print(f'    {status} {c[\"file\"]:35s} ({c[\"agent\"]})')
"

# ─── Install Mode ────────────────────────────────────────────────────────
if [[ "$INSTALL_MODE" == "true" ]]; then
  echo ""
  MISSING_REQUIRED=$(echo "$MANIFEST" | python3 -c "
import json, sys
m = json.load(sys.stdin)
missing = [d['tool'] for d in m['dependencies']['system_tools'] if d['required'] and not d['installed']]
print(' '.join(missing))
")
  if [[ -n "$MISSING_REQUIRED" ]]; then
    echo "🔧 Installing missing required system tools..."
    for tool in $MISSING_REQUIRED; do
      echo "  Installing: $tool"
      case "$OS" in
        linux)
          case "$PKG_MANAGER" in
            apt) sudo apt install -y "$tool" 2>/dev/null || true ;;
            dnf) sudo dnf install -y "$tool" 2>/dev/null || true ;;
            pacman) sudo pacman -S --noconfirm "$tool" 2>/dev/null || true ;;
          esac
          ;;
        macos) brew install "$tool" 2>/dev/null || true ;;
      esac
    done
  fi
  # Always install npm packages regardless of system tool status
  echo "📦 Installing npm packages..."
  npm install --no-audit --no-fund 2>&1 | tail -2 || true
  # Install Playwright for PDF generation
  if grep -q playwright package.json 2>/dev/null; then
    npx playwright install chromium 2>&1 | tail -2 || true
  fi
  echo "✅ Install complete. Run 'bash deps/resolve.sh' to verify."
fi

# ─── Exit with status ────────────────────────────────────────────────────
MISSING_REQUIRED=$(echo "$MANIFEST" | python3 -c "
import json, sys
m = json.load(sys.stdin)
print(m['summary']['missing_required'])
")
if [[ "$MISSING_REQUIRED" -gt 0 ]] && [[ "$CHECK_ONLY" == "true" ]]; then
  exit 1
fi
exit 0
