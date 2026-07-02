# Exam Prompt — Architecture

## System Overview

```
User Query → Skill Discovery → Skill Loading → Execution → Output → Validation
                  │                 │               │           │
                  ▼                 ▼               ▼           ▼
           AGENTS.md           skills/<n>/    SKILL.md      output-validator.js
           (XML registry)      SKILL.md       instructions  (AJV schema check)
                              (30 skills)
```

## Layer Architecture

### Layer 1: Agent Configuration (repo root)

Files that tell AI agents how to work here:

| File | Purpose | Consumed By |
|------|---------|-------------|
| `AGENTS.md` | XML skill registry (30 skills with descriptions) | All agents (auto-discovery) |
| `llms.txt` | Concise project map | All agents / LLMs |
| `CLAUDE.md` | Skill reference table + commands | Claude Code |
| `AGENT-GUIDE.md` | Full onboarding (discovery, workflows, platform configs) | All agents |
| `.cursorrules` + `.cursor/rules/*.mdc` | Modular project rules | Cursor |
| `.windsurfrules` | Project rules | Windsurf |
| `.clinerules` + `cline_docs/` | Project rules + memory bank | Cline |
| `.aider.conf.yml` | CLI settings | Aider |
| `.github/copilot-instructions.md` | IDE context | GitHub Copilot |
| `.continue/config.yaml` | Slash commands + context | Continue.dev |
| `.opencode.jsonc` | Agent instructions | OpenCode |

### Layer 2: Skills (skills/)

30 standalone skill modules. Each is a `SKILL.md` with YAML frontmatter + step-by-step agent instructions:

```
skills/
├── answer-writer/SKILL.md           # A+ exam answers
├── notes-generator/SKILL.md         # 12+ note formats
├── pyq-analyzer/SKILL.md            # PYQ statistics
├── imp-topics-generator/SKILL.md    # Important topics
├── assignment-writer/SKILL.md       # Assignments
├── exam-paper-generator/SKILL.md    # Question papers
├── flashcard-generator/SKILL.md     # Anki/Quizlet
├── study-planner/SKILL.md           # Schedules
├── mcq-practice-generator/SKILL.md  # MCQs
├── formula-sheet-generator/SKILL.md # Formula sheets
├── mind-map-generator/SKILL.md      # Mind maps
├── case-study-solver/SKILL.md       # Case studies
├── essay-grader/SKILL.md            # Answer grading
├── last-minute-crammer/SKILL.md     # Emergency prep
├── viva-oral-exam-prep/SKILL.md     # Viva prep
├── lab-report-writer/SKILL.md       # Lab reports
├── cross-subject-mapper/SKILL.md    # Subject connections
├── subject-prompt-bank/SKILL.md     # Sample answers
├── sppu-exam-simulator/SKILL.md     # Exam simulation
├── diagram-generator/SKILL.md       # Mermaid/D2 diagrams
├── code-solution-generator/SKILL.md # Code solutions
├── cheat-sheet-generator/SKILL.md   # Micro notes
├── thesis-generator/SKILL.md        # Thesis/dissertation
├── session-config/SKILL.md          # User profile
├── qp-fetcher/SKILL.md              # PYQ auto-download
├── universal-document-reader/SKILL.md      # PDF→text
├── document-generator/SKILL.md             # MD→PDF
├── universal-university-adapter/SKILL.md   # University detection
└── setup-exam-prompt/SKILL.md             # First-time setup
```

Dependency relationships between skills are in `skills-dependency-graph.json`.

### Layer 3: Infrastructure (infrastructure/)

Runtime tools used by agents during execution:

| Tool | File | Purpose |
|------|------|---------|
| Skill Router | `skill-router.js` | Auto-detects needed skill from user query (semantic + keyword matching, confidence scoring) |
| Output Validator | `output-validator.js` | Validates agent output against 5 skill schemas (answer, notes, PYQ, assignment, exam paper) using AJV |
| Session Context | `session-context.js` | Persists user profile, university, subject across sessions (`~/.exam-prompt/session.json`) |
| Cache Manager | `cache-manager.js` | TTL-based caching for PYQ analysis, university detection, OCR results (`~/.exam-prompt/cache/`) |

### Layer 4: Content (examples/)

Sample papers and solutions organized by year/semester/subject for 48 SPPU Computer Engineering subjects.

### Layer 5: University Configs (universities/)

Per-university configuration (exam patterns, branches, subjects, syllabus). 10 universities supported.

## Data Flow

```
User: "Explain ACID properties [6 marks]"

1. Agent receives query
2. Agent reads AGENTS.md → matches "answer-writer" skill
3. Agent reads skills/answer-writer/SKILL.md → gets 15-phase pipeline
4. Agent generates answer with bolded terms, numbered points, table, diagram
5. Agent can run: node -e "require('./infrastructure/output-validator')" to self-validate
6. Agent outputs structured Markdown answer
```

## Key Design Decisions

1. **Skills as Markdown** — SKILL.md is pure Markdown with YAML frontmatter. No proprietary format. Every agent can read it.
2. **University detection via adapter** — Never hardcode patterns. The adapter skill detects from PDFs.
3. **Default fallback** — If no university specified: 5 units, 100 marks, 3 hours.
4. **100% free** — No paid tiers, no premium features, no API keys needed.
5. **Agent-first** — Every file is designed to be consumed by AI agents first, humans second.
