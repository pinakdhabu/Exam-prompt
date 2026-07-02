# Scripts

Utility scripts for the Exam Prompt system.

| Script | Purpose |
|--------|---------|
| `validate-skills.sh` | Validate all skill directory structures and metadata |
| `generate-agents-md.sh` | Regenerate AGENTS.md from skills directory |
| `generate-skills-manifest.sh` | Regenerate `skills/skills.json` manifest |
| `fetch-qp.js` / `fetch-qp.py` | Download PYQ PDFs for SPPU subjects |
| `convert-to-pdf.js` / `convert-to-pdf.py` | Convert Markdown to print-ready PDF |
| `diagram-gen.js` | Render Mermaid/D2/Graphviz diagrams |
| `detect-agent.js` / `detect-agent.sh` | Detect which AI coding agent is running |
| `detect-university.js` / `detect-university.sh` | Detect university from PDFs or description |
| `create-skill.sh` | Scaffold a new skill directory |
| `quickstart.js` | One-command setup: install deps + generate sample PDF |
| `setup.sh` / `install.sh` | Project setup for Linux/macOS |
| `setup.ps1` / `install.ps1` | Project setup for Windows |
| `gen-pdf-previews.js` | Generate PNG preview thumbnails of PDFs |
| `profile.sh` | Load shell profile with project paths |
| `pyq-index.sh` / `pyq-stats.sh` | Manage PYQ index and statistics |
| `update-registry.sh` | Update AGENT_REGISTRY.json |
| `test-all.js` | Run all tests |
| `process-document.sh` / `process-document.ps1` | PDF extraction pipeline |
| `check-deps.sh` / `check-deps.ps1` | Check dependency health |
| `self-update.sh` | Self-update the repo |
| `batch-convert-to-pdf.js` | Batch convert multiple Markdown files |
| `submit-pyq.sh` | Submit PYQs to the index |
| `notebook-to-pdf.js` | Convert Jupyter notebooks to PDF |

**Note:** `.sh` scripts work on Linux/macOS. `.ps1` scripts work on Windows. `.js` scripts work cross-platform via Node.
