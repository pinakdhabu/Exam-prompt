# AI Agent Guide — Exam-Prompt Universal Skill Hub

> **Purpose**: This document tells **any AI coding agent** (Claude Code, Cursor, Windsurf, Aider,
> Cline, GitHub Copilot, OpenCode, Codex, Continue.dev, Cline, etc.) exactly how to discover, load,
> and use the 24 universal exam preparation skills in this repository.

---

## Table of Contents

1. [Quick Start](#quick-start)
2. [Architecture Overview](#architecture-overview)
3. [Skill Discovery](#skill-discovery)
4. [Loading a Skill](#loading-a-skill)
5. [Available Skills](#available-skills)
6. [Conversation Starters](#conversation-starters)
7. [Multi-Step Workflows](#multi-step-workflows)
8. [Agent-Specific Configurations](#agent-specific-configurations)
9. [Constraints & Rules](#constraints--rules)

---

## Quick Start

When a user asks any exam-related question, follow this flow:

```
1. User asks: "Explain ACID properties [6 marks]"
2. Agent reads: skills/answer-writer/SKILL.md
3. Agent follows: 15-phase answer pipeline
4. Agent outputs: Structured A+ answer with bolded keywords, diagram, example
```

The user does NOT need to know which skill to load. The agent should auto-discover the correct skill
from the user's question.

---

## Architecture Overview

```
exam-prompt/
│
├── AGENTS.md                   # XML registry: ALL skills listed here (agent auto-discovery)
├── AGENT-GUIDE.md              # ← You are here
├── CLAUDE.md                   # Claude Code hub
├── .cursorrules / .cursor/     # Cursor configuration
├── .windsurfrules              # Windsurf configuration
├── .aider.conf.yml             # Aider configuration
├── .clinerules / cline_docs/   # Cline configuration + memory bank
├── .github/copilot-instructions.md  # GitHub Copilot configuration
├── .continue/config.yaml       # Continue.dev configuration
│
├── skills/                     # 24 skill modules (THE BRAIN)
│   ├── answer-writer/SKILL.md
│   ├── notes-generator/SKILL.md
│   ├── pyq-analyzer/SKILL.md
│   └── ... (24 total)
│
├── examples/                   # Sample papers + solutions
├── scripts/                    # Utility scripts
├── docs/                       # GitHub Pages website
└── USE-CASES.md               # 33 documented workflow examples
```

---

## Skill Discovery

### Method 1: Read AGENTS.md (Recommended)

`AGENTS.md` contains an XML `<available_skills>` block with ALL 24 skills listed. Each entry has:

```xml
<skill>
<name>universal-a-plus-answer-writer</name>
<description> Generates exam-ready A+ answers for ANY university worldwide...</description>
<location>project</location>
</skill>
```

The agent should parse this XML to find the right skill for the user's request.

### Method 2: Read CLAUDE.md

`CLAUDE.md` contains a quick-reference table of all skills with emoji icons and one-line
descriptions.

### Method 3: Read AGENT-GUIDE.md

You're reading it. The section below lists all 24 skills.

---

## Loading a Skill

Once you've identified the correct skill, read its `SKILL.md` file:

```
skills/<skill-name>/SKILL.md
```

For example:

- `skills/answer-writer/SKILL.md`
- `skills/notes-generator/SKILL.md`
- `skills/pyq-analyzer/SKILL.md`

The SKILL.md contains:

1. **YAML frontmatter** — name, description, trigger conditions
2. **Phase-by-phase instructions** — step-by-step guide for the AI agent
3. **Reference tables** — marks-to-depth mapping, command word resolution, university patterns
4. **Integration notes** — how this skill connects to other skills

**Important**: Read the ENTIRE SKILL.md before generating output. The skill's instructions take
precedence over general knowledge.

---

## Available Skills

| #   | Skill                       | When to Load                                                            | Location                                       |
| --- | --------------------------- | ----------------------------------------------------------------------- | ---------------------------------------------- |
| 1   | **Answer Writer**           | User asks for exam answers, question solutions, numericals, derivations | `skills/answer-writer/SKILL.md`                |
| 2   | **Notes Generator**         | User asks for study notes, revision material, summaries                 | `skills/notes-generator/SKILL.md`              |
| 3   | **PYQ Analyzer**            | User provides past papers and wants analysis                            | `skills/pyq-analyzer/SKILL.md`                 |
| 4   | **IMP Topics Generator**    | User asks "what's important?", "IMP topics", "what to study"            | `skills/imp-topics-generator/SKILL.md`         |
| 5   | **Assignment Writer**       | User asks for assignment content with marking scheme                    | `skills/assignment-writer/SKILL.md`            |
| 6   | **Exam Paper Generator**    | User asks for practice papers, mock tests, question papers              | `skills/exam-paper-generator/SKILL.md`         |
| 7   | **Subject Prompt Bank**     | User asks for sample answers at specific mark levels                    | `skills/subject-prompt-bank/SKILL.md`          |
| 8   | **Document Reader**         | User uploads PDF/DOCX and needs text extracted                          | `skills/universal-document-reader/SKILL.md`    |
| 9   | **Document Generator**      | User wants Markdown converted to PDF                                    | `skills/document-generator/SKILL.md`           |
| 10  | **University Adapter**      | User mentions a non-SPPU university                                     | `skills/universal-university-adapter/SKILL.md` |
| 11  | **Flashcard Generator**     | User asks for Anki/Quizlet flashcards                                   | `skills/flashcard-generator/SKILL.md`          |
| 12  | **Study Planner**           | User asks for study schedule, timetable, plan                           | `skills/study-planner/SKILL.md`                |
| 13  | **MCQ Practice Generator**  | User asks for practice questions, MCQs, quizzes                         | `skills/mcq-practice-generator/SKILL.md`       |
| 14  | **Viva / Oral Prep**        | User asks for viva, oral exam, interview prep                           | `skills/viva-oral-exam-prep/SKILL.md`          |
| 15  | **Last-Minute Crammer**     | User is short on time (12h/6h/3h/1h before exam)                        | `skills/last-minute-crammer/SKILL.md`          |
| 16  | **Lab Report Writer**       | User asks for lab report, practical write-up                            | `skills/lab-report-writer/SKILL.md`            |
| 17  | **Formula Sheet Generator** | User asks for formula sheet, equation reference                         | `skills/formula-sheet-generator/SKILL.md`      |
| 18  | **Mind Map Generator**      | User asks for mind map, concept map, visual overview                    | `skills/mind-map-generator/SKILL.md`           |
| 19  | **Case Study Solver**       | User provides a case study scenario                                     | `skills/case-study-solver/SKILL.md`            |
| 20  | **Essay Grader**            | User asks "grade my answer", "how many marks?"                          | `skills/essay-grader/SKILL.md`                 |
| 21  | **Cross-Subject Mapper**    | User asks how subjects connect, interdisciplinary links                 | `skills/cross-subject-mapper/SKILL.md`         |
| 22  | **Exam Simulator**          | User wants a full SPPU exam simulation                                  | `skills/sppu-exam-simulator/SKILL.md`          |
| 23  | **Session Config**          | User sets up their profile for persistent preferences                   | `skills/session-config/SKILL.md`               |
| 24  | **QP Fetcher**              | User wants to download PYQs from websites                               | `skills/qp-fetcher/SKILL.md`                   |

---

## Conversation Starters

Try these prompts after loading the relevant skill:

| Scenario             | Prompt                                                                         |
| -------------------- | ------------------------------------------------------------------------------ |
| **Answer writing**   | "Explain ACID properties with example [6 marks] — SPPU 2019 pattern"           |
| **Short note**       | "Write a short note on B+ Tree indexing [4 marks]"                             |
| **Numerical**        | "Solve: Given schedule S, check if it's conflict serializable [6 marks]"       |
| **Comparison**       | "Compare TCP and UDP [6 marks] in table format"                                |
| **Derivation**       | "Derive the time complexity of Merge Sort [5 marks]"                           |
| **Diagram question** | "Draw and explain ER diagram for Hospital Management System [8 marks]"         |
| **Design question**  | "Design a DFA for strings ending with '01' [6 marks]"                          |
| **Case study**       | "Solve this case study: A company wants to migrate from SQL to NoSQL"          |
| **Notes**            | "Generate Cornell notes for Unit 3 of DBMS — Normalization"                    |
| **PYQ analysis**     | "These are my PYQs (paste PDFs). What topics should I focus on?"               |
| **IMP topics**       | "I have 3 days to prepare for TOC. Give me IMP topics with a plan."            |
| **MCQ practice**     | "Generate 10 MCQs on Normalization with varying difficulty"                    |
| **Flashcards**       | "Create Anki flashcards from these Machine Learning notes"                     |
| **Viva prep**        | "Prepare me for a viva on Database Management Systems"                         |
| **Lab report**       | "Write a lab report for: Implementation of Stack using Arrays"                 |
| **Cram mode**        | "I have 6 hours before my OS exam. HELP!"                                      |
| **Assignment**       | "Write an assignment on Cloud Computing service models with marking scheme"    |
| **Exam paper**       | "Generate a full question paper for DBMS — SPPU 2019 pattern"                  |
| **Any university**   | "I'm at VTU Mechanical Engineering. Generate notes for Fluid Mechanics Unit 2" |
| **Multi-subject**    | "Map connections between DBMS, DSA, and Operating Systems"                     |
| **Fetch PYQs**       | "Fetch PYQs for BE Computer Engineering Semester 8"                            |

---

## Multi-Step Workflows

For complex tasks, load multiple skills sequentially:

**Complete semester preparation:**

```
Step 1: Load skills/pyq-analyzer/SKILL.md → Analyze PYQs
Step 2: Load skills/imp-topics-generator/SKILL.md → IMP topics + plan
Step 3: Load skills/notes-generator/SKILL.md → Notes for top topics
Step 4: Load skills/mcq-practice-generator/SKILL.md → Practice MCQs
Step 5: Load skills/flashcard-generator/SKILL.md → Anki flashcards
```

**Assignment pipeline:**

```
Step 1: Load skills/universal-document-reader/SKILL.md → Extract assignment PDF
Step 2: Load skills/assignment-writer/SKILL.md → Write complete assignment
Step 3: Load skills/document-generator/SKILL.md → Convert to PDF
```

**Emergency exam prep:**

```
Step 1: Load skills/last-minute-crammer/SKILL.md → Cram plan
Step 2: Load skills/formula-sheet-generator/SKILL.md → Formula reference
Step 3: Load skills/mind-map-generator/SKILL.md → Rapid revision mind map
```

---

## Agent-Specific Configurations

Each AI coding platform has its own configuration file in this repo:

| Platform           | Config File                            | Purpose                           |
| ------------------ | -------------------------------------- | --------------------------------- |
| **Claude Code**    | `CLAUDE.md` + `.claude/settings.json`  | Skill hub entry point, MCP config |
| **Cursor**         | `.cursorrules` + `.cursor/rules/*.mdc` | Global + modular project rules    |
| **Windsurf**       | `.windsurfrules`                       | Project rules                     |
| **Aider**          | `.aider.conf.yml`                      | CLI settings, read-only files     |
| **Cline**          | `.clinerules` + `cline_docs/`          | Project rules + memory bank       |
| **GitHub Copilot** | `.github/copilot-instructions.md`      | IDE context                       |
| **Continue.dev**   | `.continue/config.yaml`                | Slash commands, models            |
| **OpenCode**       | Auto-reads `AGENTS.md`                 | XML registry                      |

---

## Constraints & Rules

1. **Always read the SKILL.md first** — Never generate exam content without loading the relevant
   skill. The skill's instructions are more authoritative than your general training.

2. **Never invent university patterns** — Use `skills/universal-university-adapter/SKILL.md` to
   detect the correct pattern from user-provided PDFs or descriptions.

3. **Default university pattern** — If no university is specified, default to:
   - 5 units/modules, 100 marks, 3 hours
   - OR within each unit
   - Generic question structure

4. **Default for SPPU** — If the user mentions SPPU but no pattern year, default to **SPPU 2019
   Pattern** (6 units, 4 OR pairs, 70 marks, 2.5 hrs).

5. **Don't modify SKILL.md** — Never edit a `skills/<name>/SKILL.md` file unless explicitly asked by
   the user.

6. **Direct answers, no preamble** — The answer-writer skill specifically forbids "Here is your
   answer", "In conclusion", "Firstly/Secondly", and similar filler. Other skills have their own
   style rules.

7. **Bold technical terms** — In exam answers, bold every technical term on first use. This helps
   examiners spot keywords.

8. **This repo is 100% free** — Never suggest paid features, pro tiers, or premium access.

---

## Quick Reference: Marks-to-Depth

For answer writing (from `skills/answer-writer/SKILL.md`):

| Marks | Lines | Components                                                   |
| ----- | ----- | ------------------------------------------------------------ |
| 1     | 2-3   | 1 definition or fact                                         |
| 2     | 5-6   | 2-3 facts or definition + 1 point                            |
| 3     | 8-10  | Definition + 2-3 points                                      |
| 4     | 12-14 | Definition + 3-4 points + closing                            |
| 5     | 15-18 | Definition + 4-5 points + optional diagram                   |
| 6     | 18-22 | Definition + 5-6 points + diagram + closing                  |
| 8     | 24-30 | Definition + 6-8 points + diagram + example + closing        |
| 10    | 30-38 | Definition + 8-10 points + diagram(s) + example(s) + closing |

## Quick Reference: Command Words

| Command               | Action                                                  |
| --------------------- | ------------------------------------------------------- |
| Define/State          | 1-2 lines, precise definition, no elaboration           |
| List/Enumerate        | Numbered items, one phrase per item                     |
| Explain/Describe      | Definition + 3-6 points + closing                       |
| Compare/Differentiate | Table (Basis \| X \| Y) min 3 rows + closing            |
| Derive/Prove          | Step-by-step, name each formula, box final              |
| Solve/Calculate       | Given → formula → stepwise → boxed answer               |
| Design/Develop        | Requirements + decisions + architecture + justification |
| Justify/Argue         | Claim + 3-5 reasons + evidence + judgment               |
| Diagram               | Mermaid syntax, all nodes labelled                      |

---

_Last updated: 2026_
