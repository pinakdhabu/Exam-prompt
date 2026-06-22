# CI/CD & Automation Reference for AI Agents

**Version:** Rolling — update this file whenever you add/change workflows, scripts, or security
rules.

**Purpose:** Single source of truth for AI coding agents. Tells you exactly which files to update,
which workflows will fire, and what security rules to follow. Keep the 7 workflows green and the
repo secure.

---

## CI/CD Status (Live)

> Last checked: 2026-06-22 | All 7 workflows passing ✅

| Workflow            | Latest Run | Notes                                              |
| ------------------- | ---------- | -------------------------------------------------- |
| validate-skills.yml | ✅ Pass    | Validates frontmatter, cross-refs, formatting      |
| format-markdown.yml | ✅ Pass    | Auto-fixes whitespace/formatting                   |
| sync-skills.yml     | ✅ Pass    | Auto-registers new skills                          |
| convert-to-pdf.yml  | ✅ Pass    | Sample papers → PDF                                |
| render-diagrams.yml | ✅ Pass    | Renders Mermaid diagrams                           |
| pages.yml           | ✅ Pass    | Deploys docs to GitHub Pages                       |
| nightly-improve.yml | ✅ Pass    | Midnight self-heal (orphans, deps, website checks) |

**⚠️ If any workflow is failing:** Stop and fix before making further changes. Run
`gh run list --limit 5` or check the Actions tab. The most common failures are YAML parsing errors
(unindented `|` blocks) or stale `skills.json`.

---

## What's Going On in This Repo (AI Agent Orientation)

This is **Exam Prompt** — a universal exam preparation system that works for _any university
worldwide_. Here's the big picture:

### 🎯 Mission

Generate exam-ready study materials (answers, notes, flashcards, question papers, formula sheets,
diagrams, etc.) for students at any university. One repo to prepare for _all_ your exams.

### 🧠 Architecture

```
skills/                  # 30 skills — each is an AI agent "capability"
  └─ {name}/SKILL.md     #   Skill definition with YAML frontmatter
skills/skills.json       # Auto-generated registry (30 skills)
skills/agent-normalizer/ # Detects which AI agent you're running and maps skills

universities/            # University configs (SPPU primary, others welcome)
  └─ {university}/       #   Per-university config, PYQs, notes
  └─ university-registry.json  # Auto-generated registry

scripts/                 # 47 utility scripts (bash + .ps1 for Windows)
  ├── validate-skills.sh       # Frontmatter/cross-ref validator
  ├── generate-agents-md.sh    # Regenerates AGENTS.md + skills.json
  ├── generate-agent-config.sh # Regenerates all agent configs
  ├── detect-agent.js          # Detects which AI agent is running
  ├── detect-university.js     # Detects which university
  ├── fetch-qp.js              # Fetches question papers (fallback)
  └── convert-to-pdf.js        # MD → PDF via Playwright

pyq-index/               # LLM-collected PYQ markdown files (auto-populated)
  └─ {subject}/*.md      #   Structured question papers, one file per exam

docs/                    # Documentation
.github/workflows/       # 7 CI/CD workflows (auto-format, validate, deploy)
AGENTS.md                # Machine-readable skill registry (auto-generated)
deps/manifest.json       # Dependency manifest (auto-generated)
```

### 🤖 Agent Ecosystem

This repo supports **7+ AI coding agents** via the `agent-normalizer` skill:

| Agent             | Config File                          | Auto-detected? |
| ----------------- | ------------------------------------ | -------------- |
| OpenCode          | `.opencode/skills/`                  | Yes            |
| Claude Code       | `CLAUDE.md`, `.claude/settings.json` | Yes            |
| Cursor            | `.cursor/rules/000-global.mdc`       | Yes            |
| Windsurf          | `.windsurfrules`                     | Yes            |
| Cline             | `.clinerules` + `cline_docs/`        | Yes            |
| Aider             | `.aider.conf.yml`                    | Yes            |
| GitHub Copilot    | `.github/copilot-instructions.md`    | Yes            |
| Continue.dev      | `.continue/config.yaml`              | Yes            |
| GitHub Codespaces | `.devcontainer/devcontainer.json`    | —              |

Run `npm run detect:agent` to see which agent is active. The `agent-normalizer` skill transparently
loads the right config for your agent.

### 🏫 University System

- **SPPU** (Savitribai Phule Pune University) is the primary reference implementation
- Any university can be added: `npm run scaffold:university`
- University registry auto-synced via `npm run sync:registry`
- Each university has its own config, PYQ directory, and subject mappings

### 📋 Content Pipeline (Two Paths)

**Path A (PRIMARY — LLM Web Search, any university):**

```
LLM searches web for question papers
  → extracts questions directly from search results
  → writes structured markdown to pyq-index/{subject}/*.md
  → universal-pyq-analyzer reads markdown for trend analysis
  → universal-a-plus-answer-writer generates answers
```

**Path B (FALLBACK — Automated, SPPU-specific):**

```
sppuquestionpapers.com
  → fetch-qp.js (Playwright) or fetch-qp.py (urllib/bs4)
  → Downloads PDFs to pyq-downloads/
  → pdf-extract.py (OCR + text extraction)
  → universal-document-reader skill (cleans to markdown)
  → universal-pyq-analyzer skill (trend analysis)
  → universal-a-plus-answer-writer skill (generates answers)
```

### 🔄 CI/CD Pipeline (7 Workflows)

```
Push to main
  ├── validate-skills.yml      → Validates all skills
  ├── format-markdown.yml      → Auto-formats markdown
  ├── sync-skills.yml          → Registers new skills
  ├── convert-to-pdf.yml       → Converts sample papers to PDF
  ├── render-diagrams.yml      → Renders architecture diagrams
  └── pages.yml                → Deploys docs to GitHub Pages

Every midnight:
  └── nightly-improve.yml      → Self-heals: orphans, stale deps, issues
```

### 🧪 For Students

1. Clone the repo
2. Run `npm run setup` to install everything
3. Run `npm run detect:university` to set your university
4. Load a skill (e.g., universal-a-plus-answer-writer) and ask your exam question

All skills are stateless — just describe what you need and the skill handles the rest.

---

## Contributing

This repo is fork-friendly. Two ways to contribute:

1. **Fork and customize** — clone, make changes for your own university/subject/skill system, keep
   it private. All scripts and workflows work out of the box on forks.
2. **Submit a PR** — fix bugs, add new skills/universities, improve docs. 7 CI workflows
   auto-validate PRs.

**PR requirements:**

- Run `npm test` before opening
- Regenerate `skills/skills.json` + `deps/manifest.json` if skills/deps changed
- Fill the PR template checklist
- Do NOT commit `node_modules/`, `.env`, or secrets

---

## Quick-Change Matrix

| You change...                | Files you MUST update                                                                                                                                                                                                                                                                                                                               |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Add a new skill**          | `skills/{name}/SKILL.md` (with YAML frontmatter) → `npm run generate:agents` (regenerates `skills.json` + `AGENTS.md`) → `npm run generate:config` (regenerates agent configs) → `bash deps/resolve.sh` (regenerates `deps/manifest.json`) → verify with `npm run validate:skills`                                                                  |
| **Remove a skill**           | Reverse of above. Run `npm run validate:skills` to check for stale cross-refs in remaining skills.                                                                                                                                                                                                                                                  |
| **Add/rename a script**      | Write `scripts/{name}` → add `.ps1` counterpart for Windows → register in `package.json` scripts → update `deps/manifest.json` scripts section (via `bash deps/resolve.sh`) → update this file's Key Scripts table                                                                                                                                  |
| **Add a new AI agent**       | `scripts/detect-agent.js` + `scripts/detect-agent.sh` (add to detection dict) → `skills/agent-normalizer/SKILL.md` (add to matrix + per-agent section) → create agent config file (`.clinerules`, `.continue/config.yaml`, etc.) → update `deps/manifest.json` agent_configs → update `skills/skills.json` compatible_with → regenerate all configs |
| **Add a university**         | `universities/{dir}/config.json` → `npm run scaffold:university` → `npm run sync:registry` → `bash deps/resolve.sh`                                                                                                                                                                                                                                 |
| **Change npm dependency**    | Edit `package.json` → `bash deps/resolve.sh` → verify with `npm install && npm test`                                                                                                                                                                                                                                                                |
| **Change Python dependency** | Edit `requirements.txt` → `bash deps/resolve.sh`                                                                                                                                                                                                                                                                                                    |
| **Add a workflow (.yml)**    | Create file → validate YAML → add to Workflow Inventory table below → add badge to `README.md` → update Add Workflow checklist                                                                                                                                                                                                                      |
| **Change a schema**          | Edit `schemas/{name}.json` → update `$schema` refs in files → update validation steps                                                                                                                                                                                                                                                               |
| **Add a root config file**   | Create file → update `.gitignore` if needed → update `deps/manifest.json` agent_configs → update this file                                                                                                                                                                                                                                          |

---

## .github/ Directory Structure

| File                                   | Purpose                                                              | Auto-generated? |
| -------------------------------------- | -------------------------------------------------------------------- | --------------- |
| `.github/workflows/*.yml` (7 files)    | CI/CD pipeline definitions                                           | No              |
| `.github/pull_request_template.md`     | PR checklist template for contributors                               | No              |
| `.github/config.yml`                   | Probot config: issue/PR welcome comments, labels, stale management   | No              |
| `.github/copilot-instructions.md`      | GitHub Copilot custom instructions                                   | No              |
| `.github/FUNDING.yml`                  | Funding model — this project is free forever, no funding accepted    | No              |
| `.github/dependabot.yml` (**MISSING**) | Should be added for auto-dependency updates (see Dependabot section) | —               |

---

## Workflow Inventory (7 Files)

### 1. `validate-skills.yml`

| Property          | Value                                                                                           |
| ----------------- | ----------------------------------------------------------------------------------------------- |
| **Triggers**      | `push`, `pull_request` on `skills/**/*.md` or `scripts/validate-skills.sh`; `workflow_dispatch` |
| **Runs on**       | `ubuntu-latest`, `macos-latest` (matrix)                                                        |
| **Permissions**   | `contents: read` (default, no explicit needed)                                                  |
| **Jobs**          | `validate` (matrix), `validate-universities`, `check-website`                                   |
| **Fork behavior** | Runs on forks — validates but doesn't write back                                                |

**Steps (validate job):**

1. `actions/checkout@v4`
2. `bash scripts/validate-skills.sh` — checks frontmatter, kebab-case, cross-refs, formatting,
   orphans, skills.json sync, university registry
3. Cross-platform syntax check — runs `bash -n` on all `.sh` scripts

**Steps (validate-universities job):**

1. `actions/checkout@v4`
2. Python inline check — verifies `universities/university-registry.json` directories exist

**Steps (check-website job):**

1. `actions/checkout@v4`
2. `curl -sI` to `https://sppuquestionpapers.com` — warns if unreachable (offline mode still works)

---

### 2. `nightly-improve.yml`

| Property          | Value                                             |
| ----------------- | ------------------------------------------------- |
| **Triggers**      | `schedule` (daily 00:00 UTC), `workflow_dispatch` |
| **Runs on**       | `ubuntu-latest`                                   |
| **Permissions**   | `contents: write`, `issues: write`                |
| **Jobs**          | `self-improve` (single)                           |
| **Fork behavior** | Runs on schedule on forks only if Actions enabled |

**Steps:**

1. `actions/checkout@v4`
2. Setup Node.js 22 with npm cache
3. `npm install` (continue-on-error)
4. `bash scripts/validate-skills.sh` — record pass/fail
5. Check for orphan skill directories (dir with no SKILL.md)
6. Dry-run `scripts/generate-agents-md.sh` — registers new skills
7. Check `package.json` for stale deps
8. Grep for TODO/FIXME/HACK comments (excludes node_modules, .git, .github)
9. Check QP website availability
10. Collate report into markdown
11. `stefanzweifel/git-auto-commit-action@v5` — auto-commits any fixes
12. If issues found: creates/updates a GitHub issue with `nightly-report` label
13. If all clear: closes any open nightly-report issue

---

### 3. `sync-skills.yml`

| Property          | Value                                                                                                                      |
| ----------------- | -------------------------------------------------------------------------------------------------------------------------- |
| **Triggers**      | Push to `main` on `skills/**/SKILL.md` or `.github/workflows/sync-skills.yml`; `schedule` (02:00 UTC); `workflow_dispatch` |
| **Runs on**       | `ubuntu-latest`                                                                                                            |
| **Permissions**   | `contents: write`                                                                                                          |
| **Jobs**          | `register` (single)                                                                                                        |
| **Fork behavior** | Runs on push to main — writes back to the repo                                                                             |

**Steps:**

1. `actions/checkout@v4`
2. Count skill directories
3. Setup Python 3.11
4. `scripts/generate-skills-manifest.sh` (or fallback to `generate-agents-md.sh`) — regenerates
   AGENTS.md and skills.json
5. Generate README badges (skills count, papers count, etc.)
6. `stefanzweifel/git-auto-commit-action@v5` — commits changes

---

### 4. `format-markdown.yml`

| Property          | Value                                                                                       |
| ----------------- | ------------------------------------------------------------------------------------------- |
| **Triggers**      | Push to `main` on `**/*.md` or `.github/workflows/format-markdown.yml`; `workflow_dispatch` |
| **Runs on**       | `ubuntu-latest`                                                                             |
| **Permissions**   | `contents: write`                                                                           |
| **Concurrency**   | Group by ref, cancel in-progress                                                            |
| **Fork behavior** | Runs on push to main only — not on PRs                                                      |

**Steps:**

1. `actions/checkout@v4`
2. Setup Node.js 22
3. `npm install --no-save prettier`
4. `npx prettier --write` on all `**/*.md` (excludes node_modules, .git, AGENTS.md)
5. Check every `skills/*/SKILL.md` starts with `---` frontmatter; auto-fixes missing ones with
   placeholder
6. Remove trailing whitespace from all non-binary files
7. `stefanzweifel/git-auto-commit-action@v5` — commits formatting fixes

---

### 5. `convert-to-pdf.yml`

| Property          | Value                                                                                                                    |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------ |
| **Triggers**      | Push to `main` on `examples/**/*.md` (excludes README.md) or `.github/workflows/convert-to-pdf.yml`; `workflow_dispatch` |
| **Runs on**       | `ubuntu-latest`                                                                                                          |
| **Permissions**   | `contents: write`                                                                                                        |
| **Fork behavior** | Runs on push to main — writes PDFs back                                                                                  |

**Steps:**

1. `actions/checkout@v4`
2. Setup Node.js 22
3. `npm install` + `npx playwright install chromium`
4. Git diff `HEAD~1` to find changed `examples/**/*.md` files
5. On `workflow_dispatch`: convert ALL sample papers (batch, parallel=4)
6. Check for newly generated PDFs
7. `stefanzweifel/git-auto-commit-action@v5` — commits only `examples/**/*.pdf`

---

### 6. `render-diagrams.yml`

| Property          | Value                                                |
| ----------------- | ---------------------------------------------------- |
| **Triggers**      | Push to `architectures/d2/*.d2`; `workflow_dispatch` |
| **Runs on**       | `ubuntu-latest`                                      |
| **Permissions**   | `contents: write`                                    |
| **Fork behavior** | Runs on push — writes SVG/PNGs back                  |

**Steps:**

1. `actions/checkout@v4`
2. Install D2 (`curl -fsSL https://d2lang.com/install.sh | sh`)
3. Create `architectures/exports/` directory
4. Render all `.d2` files to SVG (theme 300)
5. Render all `.d2` files to PNG (theme 300)
6. `stefanzweifel/git-auto-commit-action@v5` — commits `architectures/exports/*`

---

### 7. `pages.yml`

| Property          | Value                                               |
| ----------------- | --------------------------------------------------- |
| **Triggers**      | Push to `main`; `workflow_dispatch`                 |
| **Runs on**       | `ubuntu-latest`                                     |
| **Permissions**   | `contents: read`, `pages: write`, `id-token: write` |
| **Environment**   | `github-pages` with URL output                      |
| **Concurrency**   | Group `pages`, cancel-in-progress = false           |
| **Fork behavior** | Requires Pages to be enabled in fork settings       |

**Steps:**

1. `actions/checkout@v4`
2. `actions/configure-pages@v5`
3. `actions/upload-pages-artifact@v3` with `path: docs`
4. `actions/deploy-pages@v4`

---

## Key Scripts & Their Effects

| Script                                | Generates/Modifies                                                                                          | Called By                                                               |
| ------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `scripts/validate-skills.sh`          | (read-only) Reports frontmatter errors, orphan dirs, cross-refs, skills.json sync                           | `validate-skills.yml`, `nightly-improve.yml`, `npm run validate:skills` |
| `scripts/generate-agents-md.sh`       | Regenerates `AGENTS.md` `<available_skills>` block **and** `skills/skills.json`                             | `sync-skills.yml`, `npm run generate:agents`                            |
| `scripts/generate-agent-config.sh`    | Regenerates `.cursorrules`, `.windsurfrules`, `.cursor/rules/000-global.mdc`, calls `generate-agents-md.sh` | `npm run generate:config`                                               |
| `scripts/generate-skills-manifest.sh` | Alternative entry point for skills manifest generation                                                      | `sync-skills.yml` (primary)                                             |
| `deps/resolve.sh`                     | Regenerates `deps/manifest.json` — scans `package.json` + `requirements.txt` + system PATH for deps         | `npm test`, CI setup, manual                                            |
| `scripts/update-registry.sh`          | Regenerates `universities/university-registry.json` from `universities/*/config.json`                       | `npm run sync:registry`                                                 |
| `scripts/setup.sh`                    | Installs all deps (npm + pip + system tools), sets up the project                                           | First-time setup, CI                                                    |
| `scripts/convert-to-pdf.js`           | Converts a single sample paper MD to PDF (via Playwright)                                                   | `convert-to-pdf.yml`, `npm run convert:pdf`                             |
| `scripts/batch-convert-to-pdf.js`     | Batch converts all sample papers to PDF (parallel)                                                          | `convert-to-pdf.yml` (manual trigger)                                   |

### Cross-Platform Script Pairs

Any script in `scripts/` should have a `.ps1` counterpart if it's used in CI or by Windows users:

| Bash script                       | PowerShell counterpart             | Purpose                |
| --------------------------------- | ---------------------------------- | ---------------------- |
| `validate-skills.sh`              | `validate-skills.ps1`              | Skill validation       |
| `check-deps.sh`                   | `check-deps.ps1`                   | Dependency check       |
| `setup.sh`                        | `setup.ps1`                        | Project setup          |
| `install.sh`                      | `install.ps1`                      | Skill installation     |
| `process-document.sh`             | `process-document.ps1`             | Document processing    |
| `generate-agents-md.sh`           | `generate-agents-md.ps1`           | AGENTS.md generation   |
| `create-skill.sh`                 | `create-skill.ps1`                 | Skill scaffolding      |
| `generate-university-scaffold.sh` | `generate-university-scaffold.ps1` | University scaffolding |

---

## Security Rules

### PR Security Model

| Risk Level | Workflow              | Trigger Type                      | Why                                                          |
| ---------- | --------------------- | --------------------------------- | ------------------------------------------------------------ |
| Low        | `validate-skills.yml` | `pull_request` (safe)             | Read-only validation, no token exposure                      |
| Low        | `pages.yml`           | Push to `main` only               | Deploy-only, requires Pages approval                         |
| Medium     | `format-markdown.yml` | Push to `main` only (not PR)      | Writes to repo — untrusted PR code could inject via markdown |
| High       | `nightly-improve.yml` | `schedule` only (never PR)        | Writes + opens issues — dangerous on untrusted forks         |
| High       | `sync-skills.yml`     | Push to `main` or `schedule` only | Auto-commits — malicious skill registrations                 |

**Golden rule:** NEVER use `pull_request_target` unless you absolutely need the PR's secret token to
write back to the base branch. If you do use it, checkout PR code explicitly with
`ref: ${{ github.event.pull_request.head.sha }}` (default checks out base branch, which is
dangerous).

### Token Permissions

Always set **minimum** permissions at the top of each workflow:

```yaml
# GOOD — read-only
permissions:
  contents: read

# GOOD — write only what's needed
permissions:
  contents: write

# BAD — broad and unnecessary
permissions: write-all
```

### Script Injection Prevention

```yaml
# BAD — PR author can inject via branch name
run: echo "Branch: ${{ github.head_ref }}"

# SAFE — use env var
env:
  BRANCH: ${{ github.head_ref }}
run: echo "Branch: $BRANCH"
```

Never interpolate `${{ github.event.pull_request.title }}`, `${{ github.head_ref }}`,
`${{ github.event.issue.title }}`, or any user-controllable context directly into `run:` commands.

### Third-Party Action Pinning

```yaml
# BEST — pinned to full commit SHA
uses: actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683  # v4.2.2

# ACCEPTABLE (for actions/ org — maintained by GitHub)
uses: actions/checkout@v4
```

Why pinning matters: a tag like `@v5` can be moved to point to a malicious commit. A SHA is
immutable.

### Secrets Handling

- Never `echo ${{ secrets.* }}` — GitHub Actions masks secrets in logs, but don't rely on it
- Never pass secrets to workflows running on PRs from forks (use `pull_request`, not
  `pull_request_target`)
- Use `env:` to pass secrets, never inline in `run:` commands
- Don't store secrets in workflow files — use GitHub Secrets or OIDC

---

## YAML Pitfalls

### Python in `run:` Blocks (THE MOST COMMON BUG)

```yaml
# BROKEN — `import json` at column 0 ends the YAML block
run: |
  python3 -c "
import json
print('ok')
"

# FIXED — compact one-liner
run: |
  python3 -c "import json; print('ok')"

# FIXED — heredoc (safe for multi-line)
run: |
  python3 << 'EOF'
  import json
  print('ok')
  EOF
```

**Rule:** Every line after `|` must be indented more than the `run:` key. Column-0 text ends the
block.

### YAML Truthy Values

YAML treats `on`, `yes`, `true`, `1` as truthy and `off`, `no`, `false`, `0` as falsy. Quote strings
that look like booleans:

```yaml
# BAD — YAML parses 'no' as boolean false
run: echo "The answer is no"

# FIXED
run: echo "The answer is 'no'"
```

### Multi-line Strings

```yaml
# Literal block (preserves newlines, no escapes)
description: |
  Line 1
  Line 2

# Folded block (wraps lines into spaces)
summary: >
  This is a long string that will be folded into one line.
```

---

## Adding a New Workflow: Checklist

- [ ] File named `{purpose}.yml` in `.github/workflows/`
- [ ] YAML validates:
      `python3 -c "import yaml; yaml.safe_load(open('.github/workflows/{name}.yml')); print('VALID')"`
- [ ] Trigger events correctly configured (`on:` with `paths:` if applicable)
- [ ] Minimal `permissions:` declared at top level
- [ ] All third-party actions pinned to SHA (or actions/\* tag reviewed)
- [ ] No secrets in `run:` commands
- [ ] No user-controllable context in `run:` commands (use `env:`)
- [ ] If auto-committing: only on push to `main` or `schedule`, never on PR from fork
- [ ] If deploying: proper environment with protection rules
- [ ] Concurrency group set (if applicable) with `cancel-in-progress: true/false`
- [ ] `continue-on-error: true` on non-critical steps so partial failures don't block
- [ ] Add badge to `README.md`
- [ ] Update this file's Workflow Inventory and Workflow Dependencies sections

---

## Debugging

### Local YAML Validation

```bash
python3 -c "import yaml; yaml.safe_load(open('.github/workflows/{name}.yml')); print('VALID')"
```

### CLI Debugging

```bash
# List recent workflow runs
gh run list --limit 10 --json conclusion,displayTitle,workflowName,createdAt,url

# View failed logs
gh run view <run-id> --log-failed

# Re-run a failed run
gh run rerun <run-id>

# Trigger a workflow manually
gh workflow run "Workflow Name"

# View runner logs in real-time
gh run watch <run-id>
```

### Common Failure Patterns

| Error                                             | Likely Cause                        | Fix                                                       |
| ------------------------------------------------- | ----------------------------------- | --------------------------------------------------------- | ---------------------------------------------------- |
| `could not find expected ':'`                     | YAML indentation in `run:` block    | Check `                                                   | ` block alignment; use heredoc for multi-line Python |
| `Log not found`                                   | Workflow never ran (parsing failed) | Validate YAML locally first                               |
| `Resource not accessible by integration`          | Permissions too restricted          | Add `contents: write` or appropriate permission           |
| `The workflow is not valid`                       | Trigger event misconfigured         | Check `on:` syntax, path filters, branch restrictions     |
| `HttpError: not found`                            | Token insufficient                  | Use `${{ secrets.GITHUB_TOKEN }}` or a PAT                |
| `Failed to download action`                       | SHA not found in action repo        | Update pinned SHA to current commit HEAD                  |
| `stefanzweifel/git-auto-commit-action@v5` fails   | No changes to commit, or dirty tree | Check `git status`; verify `add_options`                  |
| `actions/github-script@v7` fails with `TypeError` | API response shape changed          | Check GitHub API docs for breaking changes                |
| `No uploaded artifact was found`                  | `upload-pages-artifact` path wrong  | Verify `path:` points to directory with `index.html`      |
| npm install fails                                 | package-lock.json mismatch          | Delete `node_modules/` and `package-lock.json`, reinstall |
| `curl: (6) Could not resolve host`                | Network issue or URL changed        | Verify URL; add `continue-on-error: true`                 |

### Emergency Rollback

If a workflow deployment breaks the repo:

```bash
# 1. Revert the last commit
git revert HEAD --no-edit
git push origin main

# 2. Or force-push to a known-good state (if you have permission)
git reset --hard <last-known-good-sha>
git push --force-with-lease origin main

# 3. Disable a misconfigured workflow via GitHub UI:
#    Settings → Actions → General → Disallow [workflow name]
```

---

## Dependabot

**Current status:** No `.github/dependabot.yml` configured.

Without Dependabot, npm/pip dependencies can go stale silently. To add it:

```yaml
# .github/dependabot.yml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "monday"
    open-pull-requests-limit: 10
    labels:
      - "dependencies"
      - "auto-generated"

  - package-ecosystem: "pip"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "monday"
    open-pull-requests-limit: 5
    labels:
      - "dependencies"
      - "auto-generated"

  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "monday"
    labels:
      - "ci/cd"
      - "auto-generated"
```

---

## Verify After Any Change

```bash
npm test                          # validate skills + registry
npm run generate:agents           # sync AGENTS.md + skills.json
npm run sync:configs              # check agent configs are in sync
bash deps/resolve.sh              # regenerate dep manifest
```

Before pushing to `main`, always run:

```bash
npm test && npm run generate:agents && bash deps/resolve.sh
```

---

## Website Status (docs/)

### Architecture Diagrams (index.html)

The site renders architecture diagrams in an "Architecture" section from D2 source → SVG exports:

| File on disk (`docs/architectures/exports/`) | Referenced in HTML?                         | Status              |
| -------------------------------------------- | ------------------------------------------- | ------------------- |
| `system.svg`                                 | ✅ `architectures/exports/system.svg`       | Visible             |
| `rag-pipeline.svg`                           | ✅ `architectures/exports/rag-pipeline.svg` | Visible             |
| `deployment.svg`                             | ✅ `architectures/exports/deployment.svg`   | Visible             |
| `student-flow.svg`                           | ❌ Not referenced in index.html             | Exists but unused   |
| `user-journey.svg`                           | ❌ Does not exist (was removed 2026-06-22)  | Broken link removed |
| `skills-ecosystem.svg`                       | ❌ Does not exist (was removed 2026-06-22)  | Broken link removed |

**PDF preview images** (`docs/images/pdf-previews/`, 16 PNGs): Exist on disk but **not referenced**
in any HTML. If the site needs a gallery section, these are ready to use.

### Skill Count Discrepancies (docs/)

The website HTML files hardcode skill counts that may drift from the actual 30 skills:

| File               | What to check                                                                                                                                                                         |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `docs/index.html`  | Meta description ✅, OG description ✅, heading ✅, "view all" link ✅ — all `27→30` and `26→30` fixed                                                                                |
| `docs/index.html`  | Skills section cards — ensure all 30 skills have a card (still missing 6: agent-normalizer, diagram-generator, setup-exam-prompt, study-planner, session-config, flastcard-generator) |
| `docs/skills.html` | Directory listing — 3 missing (agent-normalizer, diagram-generator, setup-exam-prompt)                                                                                                |
| `docs/app.html`    | Dropdown + JS SKILLS object — same 3 missing                                                                                                                                          |
|---|---|
| `docs/index.html` | Meta description ✅, OG description ✅, heading ✅, "view all" link ✅ — all `27→30` and `26→30` fixed |
| `docs/index.html` | Skills section cards — ensure all 30 skills have a card (still missing 6: agent-normalizer, diagram-generator, setup-exam-prompt, study-planner, session-config, flastcard-generator) |
| `docs/skills.html` | Directory listing — 3 missing (agent-normalizer, diagram-generator, setup-exam-prompt) |
| `docs/app.html` | Dropdown + JS SKILLS object — same 3 missing |

---

## Rolling Release Model

This repo follows a rolling release model (like Arch Linux):

- **No version numbers** — `main` branch is always latest
- **Every push is a release** — no release cycles, no tagging
- **CI/CD handles everything** — auto-formatting, PDF generation, diagram rendering
- **Users just `git pull`** — the `self-update.sh` script handles the rest

From `.github/config.yml`:

```yaml
labels:
  - name: rolling-release # Part of rolling release cycle
  - name: nightly-report # Auto-generated nightly report
  - name: auto-generated # Created by CI/CD
```

Stale issues/PRs are auto-closed after 90 days of inactivity + 14 day warning.
