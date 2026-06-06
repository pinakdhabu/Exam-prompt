# Technical Context — Exam-Prompt

## Architecture Overview
```
exam-prompt/
├── AGENTS.md                    # XML skill registry (agent auto-discovery)
├── CLAUDE.md                    # Claude Code hub
├── AGENT-GUIDE.md               # Universal agent instructions
│
├── skills/                      # 24 SKILL.md modules
│   ├── answer-writer/           # Exam answer pipeline (15 phases)
│   ├── notes-generator/         # 12+ note formats
│   ├── pyq-analyzer/            # 13+ analysis types
│   ├── imp-topics-generator/    # 5 probability levels
│   ├── assignment-writer/       # 12 assignment types
│   ├── exam-paper-generator/    # 11+ university patterns
│   ├── subject-prompt-bank/     # 8 discipline templates
│   ├── universal-document-reader/ / document-generator/
│   ├── universal-university-adapter/
│   ├── flashcard-generator/     # SRS-optimized
│   ├── study-planner/           # 4 plan types
│   ├── mcq-practice-generator/  # 9 MCQ patterns
│   ├── viva-oral-exam-prep/     # 8 viva types
│   ├── last-minute-crammer/     # 4 emergency plans
│   ├── lab-report-writer/       # 4 lab templates
│   ├── formula-sheet-generator/ # 10 categories
│   ├── mind-map-generator/      # 3 output formats
│   ├── case-study-solver/       # 10+ frameworks
│   ├── essay-grader/            # Per-criterion scoring
│   ├── cross-subject-mapper/    # Dependency graphs
│   ├── sppu-exam-simulator/     # Exam hall simulation
│   ├── session-config/          # Student profiles
│   └── qp-fetcher/              # PYQ auto-fetch
│
├── scripts/                     # Utility scripts
├── examples/                    # Sample papers + solutions
├── docs/                        # GitHub Pages site
├── .github/workflows/           # CI/CD pipelines
└── .devcontainer/               # Codespaces
```

## Tech Stack
- **Content**: Markdown (all skills, docs, examples)
- **CI/CD**: GitHub Actions (8 workflows)
- **Website**: Vanilla HTML/CSS/JS (GitHub Pages)
- **Scripts**: Bash, Python, Node.js
- **Dev environment**: Dev Containers (Codespaces)

## Key Design Decisions
1. **Skills as Markdown** — No code, no compilation. Any agent reads SKILL.md directly.
2. **AGENTS.md registry** — XML format for universal agent auto-discovery
3. **No dependencies** — Skills are pure instructions. No npm install needed for core functionality.
4. **Rolling release** — No version numbers. `main` is always latest.
5. **Self-healing** — Nightly CI detects orphans, missing solutions, stale deps.

## Agent Configurations
| Agent | Config File | Purpose |
|---|---|---|
| Claude Code | `CLAUDE.md`, `.claude/settings.json` | Skill hub, MCP config |
| Cursor | `.cursorrules`, `.cursor/rules/*.mdc` | Project rules |
| Windsurf | `.windsurfrules` | Project rules |
| Aider | `.aider.conf.yml` | CLI config |
| Cline | `.clinerules`, `cline_docs/` | Memory bank |
| GitHub Copilot | `.github/copilot-instructions.md` | IDE context |
| Continue.dev | `.continue/config.yaml` | IDE config |
