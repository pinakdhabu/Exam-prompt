---
name: universal-agent-normalizer
description: >
  Universal agent normalizer that detects which AI coding agent is running and maps the Exam Prompt
  skill system to the agent's native configuration format. Supports 20+ coding agents as of June
  2026. Ensures every agent can discover, load, and invoke all 30+ skills regardless of its native
  skill mechanism. Run this skill first whenever you are onboarding a new agent or if skills fail to
  load.
---

# Universal Agent Normalizer

## When to Use This Skill

Activate this skill when:

- **Onboarding** a new AI coding agent to the Exam Prompt project
- **Skills fail to load** — agent doesn't recognize `<available_skills>` or SKILL.md format
- **Running** an agent that wasn't originally targeted (e.g., Cline reading OpenCode skills)
- User asks: "Will this work with [agent name]?"
- User reports: "Skills aren't showing up in my AI assistant"
- **Debugging** why an agent can't find or invoke skills

This skill is the **first line of defense** for agent compatibility.

---

## Part 1: Agent Detection

Detect which agent is running by checking environment variables and config files:

```bash
# Quick detection — prints the primary agent name
bash scripts/detect-agent.sh
node scripts/detect-agent.js

# JSON output with full details
bash scripts/detect-agent.sh --json
node scripts/detect-agent.js --json

# List all detected agents with confidence scores
bash scripts/detect-agent.sh --all
node scripts/detect-agent.js --all
```

### Supported Agents (June 2026)

| #   | Agent                           | Type               | Detection Clues                                  | Config File                          | Skill Mechanism                           |
| --- | ------------------------------- | ------------------ | ------------------------------------------------ | ------------------------------------ | ----------------------------------------- |
| 1   | **Claude Code 2.1**             | Terminal-native    | `CLAUDE.md`, `.claude/` dir, `ANTHROPIC_API_KEY` | `CLAUDE.md`, `.claude/settings.json` | `.claude/settings.json` agents list       |
| 2   | **OpenCode**                    | Terminal-native    | `.opencode/` dir, `OPENCODE_API_KEY`             | `AGENTS.md`                          | `<available_skills>` XML in system prompt |
| 3   | **Codex CLI** (OpenAI)          | Terminal-native    | `.codex/` dir, `OPENAI_API_KEY`, `CODEX_*`       | `.codex/config.yaml`                 | `CODEX.md` instructions                   |
| 4   | **Gemini CLI / Antigravity**    | Terminal-native    | `.antigravity/` dir, `GEMINI_API_KEY`            | `.antigravity/config.yaml`           | `GEMINI.md` instructions                  |
| 5   | **Grok Build** (xAI)            | Terminal-native    | `.grok/` dir, `XAI_API_KEY`, `GROK_*`            | `.grok/config.yaml`                  | `GROK.md` instructions                    |
| 6   | **Aider**                       | Terminal-native    | `.aider.conf.yml`, `AIDER_*` env vars            | `.aider.conf.yml`                    | Read-only files + chat modes              |
| 7   | **Cursor 3.5**                  | IDE-fork           | `.cursor/rules/` dir, `CURSOR_*` env             | `.cursor/rules/*.mdc`                | Rules files with glob patterns            |
| 8   | **Windsurf / Cascade**          | IDE-fork           | `.windsurfrules`, `Windsurf` dir                 | `.windsurfrules`                     | Skill listing in `.windsurfrules`         |
| 9   | **Void AI**                     | IDE-fork           | `.void/` dir, `VOID_*` env                       | `.void/config.json`                  | `.void/rules/` rule files                 |
| 10  | **Kiro**                        | VS Code ext        | `.kiro/` dir, `KIRO_*` env                       | `.kiro/config.json`                  | VS Code extension settings                |
| 11  | **Cline 3.85**                  | VS Code ext / BYOK | `.clinerules`, `cline_docs/` dir                 | `.clinerules`                        | Rules file + memory bank                  |
| 12  | **Roo Code**                    | VS Code ext / BYOK | `.roorules`, `roo_docs/` dir                     | `.roorules`                          | Rules file (Cline fork)                   |
| 13  | **Kilo Code**                   | VS Code ext / BYOK | `.kilorules`, `kilo_docs/` dir                   | `.kilorules`                         | Rules file + no-markup gateway            |
| 14  | **Continue.dev**                | VS Code ext        | `.continue/` dir, `CONTINUE_*` env               | `.continue/config.yaml`              | Context providers + slash commands        |
| 15  | **Goose**                       | BYOK shell         | `.goose/` dir, `GOOSE_*` env                     | `.goose/config.yaml`                 | MCP-based tool discovery                  |
| 16  | **GitHub Copilot** (agent mode) | Cloud / IDE        | `.github/copilot-instructions.md`                | `.github/copilot-instructions.md`    | Instructions + GitHub Issues              |
| 17  | **Codegen**                     | Cloud              | `.codegen/` dir, `CODEGEN_*` env                 | `.codegen/config.yaml`               | Agent orchestration DSL                   |
| 18  | **Devin** (Cognition)           | Cloud              | `DEVIN_*` env, `.devin/` dir                     | `.devin/config.yaml`                 | Cloud IDE + spec-driven                   |
| 19  | **Sourcegraph Amp**             | Cloud              | `.amp/` dir, `AMP_*` env                         | `.amp/config.yaml`                   | Repo-graph context                        |
| 20  | **Fabrik**                      | Cloud              | `.fabrik/` dir, `FABRIK_*` env                   | `.fabrik/config.yaml`                | Agent workflow engine                     |

---

## Part 2: Per-Agent Loading Instructions

### Terminal-Native Agents

#### Claude Code 2.1

Claude Code reads `CLAUDE.md` for project instructions and `.claude/settings.json` for agent
definitions.

```bash
bash scripts/generate-agent-config.sh   # Regenerates all agent configs from skills.json
```

**Verify:** `.claude/settings.json` has `skills.autoLoad: true` and an `agents` array referencing
SKILL.md paths.

**If skills don't load:** Ensure `CLAUDE.md` mentions the skill system. Check
`.claude/settings.json` has correct paths.

#### OpenCode

Skills are loaded from `<available_skills>` XML in `AGENTS.md`.

```bash
bash scripts/generate-agents-md.sh     # Regenerates AGENTS.md
```

**Verify:** `AGENTS.md` has a single `<available_skills>` block with `<skill><name>`,
`<description>`, `<location>` tags for all 30+ skills.

**If skills don't load:** Run `generate-agents-md.sh`. Ensure `AGENTS.md` is at repo root.

#### Codex CLI (OpenAI)

Codex reads `.codex/config.yaml` and a `CODEX.md` instruction file.

**Setup suggestion:**

```bash
# Create Codex config pointing to AGENTS.md
mkdir -p .codex
echo 'instructions: AGENTS.md' > .codex/config.yaml
```

**Verification:** Create `.codex/config.yaml` referencing the skills manifest.

#### Gemini CLI / Antigravity (Google)

Gemini CLI reads `.antigravity/config.yaml` (or `.gemini/config.yaml`).

**Setup suggestion:**

```bash
# Reference the skill manifest
mkdir -p .antigravity
echo 'docs:
  - AGENTS.md
  - CLAUDE.md' > .antigravity/config.yaml
```

#### Grok Build (xAI)

Grok runs as a terminal agent with parallel sub-agents.

**Setup suggestion:**

```bash
# Reference project instructions
mkdir -p .grok
echo 'instructions: skill system in skills/ directory' > .grok/config.yaml
```

#### Aider

Aider reads `.aider.conf.yml` for config. Files in `read` and `read-only` settings are loaded as
context.

```bash
# Aider already configured via generate-agent-config.sh
bash scripts/generate-agent-config.sh
```

**Verify:** `.aider.conf.yml` has `read: [AGENTS.md, CLAUDE.md]` and
`read-only: [skills/**/SKILL.md]`.

---

### IDE-Fork Agents

#### Cursor 3.5

Cursor reads `.cursor/rules/*.mdc` files — regenerated from `skills.json`.

```bash
bash scripts/generate-agent-config.sh   # Regenerates .cursor/rules/000-global.mdc
```

**Verify:** `.cursor/rules/000-global.mdc` has the skill directory tree with descriptions.

#### Windsurf / Cascade (Codeium → Google)

Windsurf reads `.windsurfrules` for available skills.

```bash
bash scripts/generate-agent-config.sh   # Regenerates .windsurfrules
```

**Verify:** `.windsurfrules` has a numbered skill list.

#### Void AI

Void reads `.void/rules/` for rule files (similar to Cursor's `.mdc` format).

**Setup suggestion:** Symlink or copy rules from `.cursor/rules/` or generate a `VOID.md`
instruction file.

---

### VS Code Extension / BYOK Agents

#### Cline 3.85

Cline reads `.clinerules` for project rules and `cline_docs/` for memory bank.

```bash
bash scripts/generate-agent-config.sh   # Regenerates .clinerules
```

**Verify:** `.clinerules` references key skill directories and `cline_docs/` has project context.

#### Roo Code

Roo Code (Cline fork) reads `.roorules` and `roo_docs/`.

**Setup suggestion:** Create `.roorules` pointing to the Exam Prompt skill system, or symlink from
`.clinerules`.

#### Kilo Code

Kilo Code reads `.kilorules` and `kilo_docs/`.

**Setup suggestion:** Create `.kilorules` referencing the skills directory:

```
Always refer to skills/ directory for available skills. Load SKILL.md from the relevant skill directory when the user asks a question that matches a skill description.
```

#### Continue.dev

Continue.dev reads `.continue/config.yaml` for context providers and slash commands.

```bash
# Already configured — uses AGENTS.md as custom instructions
```

**Verify:** `.continue/config.yaml` has correct `customInstructions` path.

#### Goose

Goose is MCP-native — it discovers tools through MCP servers.

**Setup suggestion:** No config needed — invoke skills by name when loaded in context.

---

### Cloud / Platform Agents

#### GitHub Copilot (agent mode)

Copilot reads `.github/copilot-instructions.md` for project knowledge — loaded automatically.

**Verify:** `.github/copilot-instructions.md` references the skill system architecture.

#### Codegen

Codegen uses a DSL for agent orchestration.

**Setup suggestion:** Create `.codegen/config.yaml` referencing skill manifests.

#### Devin (Cognition)

Devin uses a cloud IDE with spec-driven development.

**Setup suggestion:** Upload relevant SKILL.md files or reference the repo — Devin reads the
codebase automatically.

#### Sourcegraph Amp

Amp indexes the full repo graph.

**Setup suggestion:** No config needed — Amp reads the entire codebase context.

#### Fabrik

Fabrik is an agent workflow engine.

**Setup suggestion:** Create `.fabrik/config.yaml` pointing to skill definitions.

---

## Part 3: Universal Workflow (Agent-Agnostic)

Regardless of which agent is running, the Exam Prompt workflow is the same:

### Step 1: Detect & Setup

```bash
# Auto-detect agent + install deps + create session profile
bash scripts/init-project.sh

# Or manually
node scripts/detect-agent.js        # See which agent you're running
npm install                          # Install Node dependencies
pip install -r requirements.txt      # Install Python dependencies
```

### Step 2: Configure Session

The session profile (`deps/session-profile.json`) stores your university, subject, and preferences:

```bash
bash scripts/init-project.sh          # Interactive setup
# OR
node scripts/detect-university.js --active  # See active university config
```

All 30+ skills read from the session config automatically.

### Step 3: Load Skills

For the detected agent, skills are loaded through the agent's native mechanism. If the agent falls
back to generic instruction files, it reads `AGENTS.md` — the universal skill registry.

### Step 4: Invoke Skills

Once loaded, invoke skills by name:

> "Write an A+ answer about [topic]" → `universal-a-plus-answer-writer` "Generate notes on
> [subject]" → `universal-notes-generator` "Analyze these PYQs" → `universal-pyq-analyzer` "Find
> important topics" → `universal-imp-topics-generator` "Solve this assignment" →
> `universal-assignment-writer` "Generate a question paper" → `universal-exam-paper-generator`

If the agent doesn't recognize the skill name, explicitly reference the SKILL.md file:

> "Read skills/answer-writer/SKILL.md, then write an A+ answer about process synchronization."

---

## Part 4: Dependency Management

Dependencies are managed through `deps/manifest.json`, auto-generated by `deps/resolve.sh`.

```bash
# Check all dependencies
bash deps/resolve.sh

# Install missing dependencies
bash deps/resolve.sh --install

# JSON output for agent consumption
bash deps/resolve.sh --json
```

Works cross-platform (Linux, macOS, Windows) — detects system tools, Node packages, and Python
packages.

---

## Part 5: Cross-References to Other Skills

| Skill                              | Integration                                                     |
| ---------------------------------- | --------------------------------------------------------------- |
| **universal-university-adapter**   | Entry point for university detection — routes to correct skills |
| **universal-session-config**       | Stores the persistent session profile read by all skills        |
| **setup-exam-prompt**              | First-time setup — creates session profile and validates deps   |
| **universal-qp-fetcher**           | Downloads question papers — works with any agent's fetch tools  |
| **universal-document-reader**      | Document → text conversion — first step in any skill pipeline   |
| **universal-a-plus-answer-writer** | Generates exam-ready answers — the most frequently used skill   |

---

## Part 6: Troubleshooting

### Symptom: "I don't see any skills in my agent"

1. Run `bash scripts/detect-agent.sh` to confirm which agent is detected
2. Run `bash scripts/generate-agent-config.sh` to regenerate configs
3. Check that the agent-specific config file exists (see detection matrix above)
4. Restart the agent (skills are loaded at startup)

### Symptom: "Skills load but don't execute correctly"

1. Ensure `deps/session-profile.json` exists (run `bash scripts/init-project.sh`)
2. Some skills need session config to detect university/subject context
3. Verify `deps/manifest.json` is up to date (`bash deps/resolve.sh`)

### Symptom: "Scripts fail on Windows/macOS"

1. Use the Node.js versions where available (`node scripts/detect-agent.js` instead of `.sh`)
2. On Windows, use Git Bash, WSL, or the PowerShell equivalents (`.ps1` scripts)
3. Run `bash deps/resolve.sh --platform windows` for Windows-specific install commands

### Symptom: "My agent isn't in the supported list"

1. Create the agent's config file following `_TEMPLATE_` conventions
2. Add the agent to `deps/manifest.json` `agent_configs` array
3. Add detection logic to `scripts/detect-agent.sh` and `scripts/detect-agent.js`
4. Add a row in this skill's agent matrix table
5. Run `bash scripts/generate-agent-config.sh` to regenerate
6. Submit a PR to add your agent!

---

## Error Handling

| Situation                 | Action                                                                                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| Unknown agent detected    | Run `bash scripts/detect-agent.sh --all` to list all detected agents with confidence scores; check environment variables for agent-specific keys |
| Config write failure      | Verify write permissions on target config file; run `bash scripts/generate-agent-config.sh` to regenerate and retry                              |
| Config file parse error   | Check config file syntax for YAML/JSON errors; regenerate with `bash scripts/generate-agent-config.sh`                                           |
| Unsupported agent version | Add detection logic to `scripts/detect-agent.sh` and submit a PR; as workaround, manually create agent config following `_TEMPLATE_` conventions |

## Quality Gate — Check Before Output

- [ ] Config loads correctly in target agent — restart agent and verify skill discovery
- [ ] All skill references (`<available_skills>`, agent rules, etc.) point to existing SKILL.md
      files
- [ ] All file paths in generated config resolve to valid locations within the repo

## Trigger Conditions

| Condition                              | Action                                                            |
| -------------------------------------- | ----------------------------------------------------------------- |
| **New agent onboarding**               | Auto-run — run Parts 1-3 (detect, generate config, verify)        |
| **Skills fail to load**                | Auto-run — run Part 2 regeneration + Part 6 troubleshooting       |
| **User asks "Will this work with X?"** | Auto-run — run Part 1 detection, then check Part 2 for that agent |
| **Routine Exam Prompt usage**          | Do NOT run — only invoke on symptom or explicit request           |
