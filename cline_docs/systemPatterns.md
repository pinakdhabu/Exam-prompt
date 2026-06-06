# System Patterns — Exam-Prompt Skills Architecture

## The Skills Architecture
Every skill follows the Anthropic Skills specification:
- A directory with `SKILL.md` at its root
- YAML frontmatter with `name` and `description`
- Natural language instructions for the AI agent
- Additional files (scripts, templates) optional

## Skill Discovery Flow
```
Agent starts → Reads AGENTS.md (XML registry)
            → Reads CLAUDE.md (skill hub)
            → User asks a question
            → Agent selects relevant skill from <available_skills>
            → Agent reads skills/<name>/SKILL.md
            → Agent follows instructions → Generates output
```

## Skill Naming Convention
`universal-<function-name>` — all lowercase, hyphenated
Examples: `universal-a-plus-answer-writer`, `universal-notes-generator`

## Answer Writer Pipeline (Most Complex Skill)
The answer-writer follows a 15-phase pipeline:
1. Context Detection (university, question type, marks, condition, Bloom's)
2. Marks-to-Structure Mapping
3. Keyword Anchoring
4. Exam Conditions Mode
5. Multiple University Formats
6. Error Handling
7. Subject Intelligence Framework
8. Deep Learning Through Answers

## University Adaptation Pattern
When a user provides a non-SPPU university:
1. Load `universal-university-adapter` skill
2. Detect university from PDFs, description, or URL
3. Build pattern profile (units, marks, duration, question structure)
4. Route to the correct universal skill with context payload
5. Generate output in the detected university's format

## Agent Configuration Pattern
Each AI coding platform gets its own config file:
- The file tells the agent how to use this repo
- References AGENTS.md for skill discovery
- Provides quick-start prompts for common tasks
- Lists constraints (don't edit SKILL.md, don't invent patterns)

## CI/CD Pipeline
```
Push → validate-skills.yml (validate SKILL.md frontmatter)
     → format-markdown.yml (prettier + whitespace)
     → sync-skills.yml (register in AGENTS.md)
     → render-diagrams.yml (D2 → SVG)
     → convert-to-pdf.yml (MD → PDF for sample papers)
Nightly → nightly-improve.yml (health checks + auto-fix)
Pages → pages.yml (GitHub Pages deploy)
```
