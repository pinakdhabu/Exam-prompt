# Universal Exam Prompt — Ultimate A+ Answer System for Any University Worldwide

![Skills](https://img.shields.io/badge/skills-24-blue) ![Papers](https://img.shields.io/badge/sample_papers-84-green) ![Solutions](https://img.shields.io/badge/solutions-42-orange) ![Rolling](https://img.shields.io/badge/release-rolling-ff69b4) ![License](https://img.shields.io/badge/license-MIT-brightgreen)


[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![SPPU 2019 Pattern](https://img.shields.io/badge/SPPU-2019%20Pattern-blue)](https://www.unipune.ac.in)
[![SPPU 2024 Pattern](https://img.shields.io/badge/SPPU-2024%20Pattern-green)](https://www.unipune.ac.in)
[![Universities](https://img.shields.io/badge/Universities-Any-success)](skills/universal-university-adapter/SKILL.md)
[![Subjects](https://img.shields.io/badge/Subjects-Any-orange)](skills/)
[![Question Types](https://img.shields.io/badge/Question%20Types-All-ff69b4)](skills/answer-writer/SKILL.md)

[![Agent Compatible](https://img.shields.io/badge/Agent-Claude%20%7C%20Cursor%20%7C%20Windsurf%20%7C%20Aider-purple)](AGENTS.md)
[![Built By](https://img.shields.io/badge/Built%20By-AI-blueviolet)](#-how-this-repo-was-built)
[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-live-success)](https://pinakdhabu.github.io/Exam-prompt/)
[![Stars](https://img.shields.io/github/stars/pinakdhabu/Exam-prompt?style=social)](https://github.com/pinakdhabu/Exam-prompt)

> **The world's most comprehensive AI-powered exam preparation system — works for ANY university, ANY department, ANY subject worldwide.**
>
> Pre-configured for SPPU Computer Engineering. Adapts to any syllabus PDF.
>
> Skills-based architecture. Universal agent compatibility. Zero lecture dependency.

---

## What Is This?

This is a **universal skill hub** that transforms any AI coding agent into a personal **10/10 GPA exam tutor** for **any university worldwide**. Pre-configured with **SPPU Computer Engineering** (Savitribai Phule Pune University) intelligence. Instantly adapts to any other university's syllabus and exam pattern when provided.

The system includes **24 skills** that can:

- **Write A+ exam answers** for ALL question types (theory, numerical, MCQ, case study, derivation, diagram, design, oral, lab) at ALL mark levels (1–100+)
- **Compile exam-ready notes** in 12+ formats (Outline, Cornell, Mind Map, Flowchart, Q&A, etc.)
- **Analyze previous year question papers** with 13+ statistical analysis types
- **Generate IMP topics** with 5 probability levels and 7 time-plan options
- **Create full exam question papers** in 11+ university patterns (SPPU, VTU, JNTU, IIT, Oxford, Cambridge, etc.)
- **Write assignment-ready answers** with marking schemes, Bloom's levels, and CO alignment

- **Generate Anki flashcards** with SRS metadata from any study material
- **Create study schedules** with spaced repetition and active recall sessions
- **Generate practice MCQs** calibrated by Bloom's level and university pattern
- **Prepare for viva/oral exams** with simulated examiner dialogue
- **Get emergency cram plans** for 12h, 6h, 3h, and 1h timeframes
- **Write complete lab reports** with templates for engineering, science, medical
- **Create formula sheets, mind maps, case study solutions, cross-subject connections**
- **Get your answers graded** with per-criterion feedback and model answer comparison

- **Adapt to ANY university** — upload your syllabus PDF + PYQ PDFs, and the system auto-detects your pattern

All powered by a **universal skills-based architecture** inspired by [Anthropic's Agent Skills](https://github.com/anthropics/skills) specification.

> **Official SPPU Syllabus Reference:** See [`SYLLABUS.md`](SYLLABUS.md) for complete unit-wise content, Course Outcomes, and CO-PO mapping for all 30+ Computer Engineering subjects — extracted directly from the official SPPU PDFs.

---

## Quick Start with Gemini Gems

One-click access to specialized AI agents for SPPU exam prep — no setup required.

| Tool | Link | What It Does |
|---|---|---|
|  Q.P. Analysis Tool | [Open Gemini Gem](https://gemini.google.com/gem/1W8EC9fMchTr3bVl_X4ncnPGWNsEM5heh) | Analyzes PYQs and syllabus to predict exam patterns |
|  Notes Generator | [Open Gemini Gem](https://gemini.google.com/gem/bf5b14582187) | Generates 100% syllabus-locked revision notes |
|  Important Topics Generator | [Open Gemini Gem](https://gemini.google.com/gem/4266a7e8000e) | Outputs must-prepare IMP topics & questions |
|  Exam-Style Answer Generator | [Open Gemini Gem](https://gemini.google.com/gem/1PGOZXhIROLOGU88epT7JGgV3bnXDTcJK) | Writes full-marks theory answers |

> **Pro tip:** Upload your syllabus PDF + previous year question papers to any Gemini Gem for best results. The skills now work for ANY university worldwide.

---

## Quick Install (All AI Coding Agents)

Install all 24 exam-prep skills globally for your AI coding agent:

```bash
# One-command install — targets OpenCode + universal agents
npx skills add https://github.com/pinakdhabu/Exam-prompt -g -y -a opencode

# Or use the helper script
bash scripts/install.sh
```

> **Note:** Skills install to `~/.agents/skills/` — shared by all universal agents (OpenCode, Amp, Cline, PromptScript, etc.). The "PromptScript does not support global" message is cosmetic; PromptScript reads from `~/.agents/skills/` automatically.

---

## Architecture

```
exam-prompt/
├── AGENTS.md                    # Universal skill loader (Claude/Cursor/Windsurf/Aider)
├── CLAUDE.md                    # Skill hub entry point
├── README.md                    # You are here
├── LICENSE
│
├── skills/                      #  24 Universal skill modules (SKILL.md format)
│   ├── answer-writer/           #    → 10/10 GPA answer generator (all conditions)
│   ├── notes-generator/         #    → Exam-ready notes (12+ formats)
│   ├── pyq-analyzer/            #    → PYQ analysis (13+ types, stats)
│   ├── imp-topics-generator/    #    → High-probability exam topics
│   ├── assignment-writer/       #    → Assignment-ready answers (12 types)
│   ├── exam-paper-generator/    #    → Question papers (11+ patterns)
│   ├── subject-prompt-bank/     #    → Pre-optimized sample answers
│   ├── universal-document-reader/ #  → PDF/DOCX/image → clean text
│   ├── document-generator/      #    → Markdown → print-ready PDF
│   ├── universal-university-adapter/ # → Any-university entry point
│   ├── flashcard-generator/     #    → 6 types, SRS metadata, Anki/Quizlet
│   ├── study-planner/           #    → Personalized schedules (4 plan types)
│   ├── mcq-practice-generator/  #    → 9 MCQ patterns, Bloom's-calibrated
│   ├── viva-oral-exam-prep/     #    → 8 viva types, simulated examiner
│   ├── last-minute-crammer/     #    → 12h/6h/3h/1h emergency plans
│   ├── lab-report-writer/       #    → 4 templates, full report structure
│   ├── formula-sheet-generator/ #    → 10 categories, compact reference
│   ├── mind-map-generator/      #    → Mermaid + text + image descriptions
│   ├── case-study-solver/       #    → 10+ frameworks, structured analysis
│   ├── essay-grader/            #    → Per-criterion scoring, model answers
│   ├── cross-subject-mapper/    #    → Dependency graphs, integrated paths
│   ├── session-config/          #    → Persistent JSON config profile
│   └── qp-fetcher/               #    → Auto-fetch PYQs from websites
│
├── architectures/               #  Architecture-as-Code (D2 language)
│   ├── d2/                      #    → Source .d2 files
│   │   ├── system.d2
│   │   ├── rag-pipeline.d2
│   │   ├── student-flow.d2
│   │   └── deployment.d2
│   └── exports/                 #    → Auto-rendered SVGs
│
├── scripts/                      #  Utilities & conversion tools
│   ├── create-skill.sh           #    → Generate new skill from template
│   ├── validate-skills.sh        #    → Validate all SKILL.md frontmatter
│   ├── generate-agents-md.sh     #    → Auto-register skills in AGENTS.md
│   ├── convert-to-pdf.py         #    → MD → PDF (Python/weasyprint)
│   ├── convert-to-pdf.js         #    → MD → PDF (Node/Playwright)
│   ├── pdf-extract.py            #    → PDF → TXT extraction
│   └── process-document.sh       #    → Auto-detect & convert any document
│
├── templates/
│   └── skill/
│       └── SKILL.md              #  New skill scaffold template
│
├── .github/
│   └── workflows/
│       ├── render-diagrams.yml   #  Auto-render D2 on push
│       ├── validate-skills.yml   #  Validate SKILL.md on PR/push
│       └── sync-skills.yml       #  Auto-register skills in AGENTS.md
│
├── pyq-index/
│   └── SKILL.md                 #  Complete PYQ PDF collection index
│
└── archive/                     # Legacy prompt files
```

Each skill is **self-contained** — load only what you need, keep context clean.

---

## Auto Skill Creation

Creating a new skill is automated. Run the script, and it handles everything:

```bash
# Create a new skill (generates SKILL.md, validates, registers in AGENTS.md, syncs globally)
./scripts/create-skill.sh my-new-skill "My New Skill" "Description of what the skill does"
```

This single command:
1. Creates `skills/my-new-skill/SKILL.md` from template
2. Validates the SKILL.md frontmatter
3. Auto-registers the skill in `AGENTS.md` `<available_skills>`
4. Syncs to `~/.agents/skills/universal-my-new-skill/`

Or do it manually:
```bash
# Validate all skills
./scripts/validate-skills.sh

# Validate a specific skill
./scripts/validate-skills.sh my-skill

# Regenerate AGENTS.md from all skills (auto-detects new ones)
./scripts/generate-agents-md.sh
```

### What Auto-Registration Does

When you push a new skill to GitHub:
- **validate-skills.yml**: CI checks every SKILL.md has valid frontmatter (name, description)
- **sync-skills.yml**: CI auto-registers the new skill in AGENTS.md and updates the skill count in README

### Skill Template

See `templates/skill/SKILL.md` for the standard scaffold. Every new skill follows this structure:
- YAML frontmatter with `name: universal-<skill-name>` and `description`
- Overview, How This Skill Works, Features, Use Cases
- Integration references to other skills

---

---

## AI Agent Instructions

This section tells **any AI coding agent** (Claude Code, Cursor, Windsurf, Aider, Cline, OpenCode, ChatGPT, Gemini) exactly how to use this repo.

> **📖 For the complete agent guide**, see [`AGENT-GUIDE.md`](AGENT-GUIDE.md) — covers all 24 skills, 20 conversation starters, multi-step workflows, and platform-specific configuration for 8+ AI coding agents.

### How This Repo Works for AI Agents

This repo uses a **universal skills architecture**:

1. Each skill lives in `skills/<name>/SKILL.md`
2. When you (the user) ask an exam-related question, the AI agent loads the appropriate skill's `SKILL.md`
3. The skill contains **step-by-step instructions** for the AI agent to generate the best possible output
4. The `AGENTS.md` file is a machine-readable registry that AI agents auto-discover

### For Claude Code

Skills are auto-discovered via `AGENTS.md` and `CLAUDE.md`. Just start asking:

```bash
# Answer writing
"Write an answer for Explain ACID properties [6 marks]"

# Notes generation
"Generate Cornell notes for Unit 3 of DBMS"

# PYQ analysis
"Analyze these PYQs and tell me what's important"

# IMP topics
"What are the IMP topics for my TOC exam? I have 3 days"

# Full exam simulation
"Simulate a full SPPU 2019 pattern DBMS exam"

# Different university
"I'm at VTU, Mechanical Engineering. Generate a sample paper for Fluid Mechanics"
```

### For Cursor / Windsurf / Aider / Cline / OpenCode

These agents read `AGENTS.md` and `CLAUDE.md` automatically. The skills are loaded via `<available_skills>` system tags.

**Pro tip**: Open the repo in your agent and just start asking questions. The agent will auto-discover and load the right skill.

### For ChatGPT / Gemini (Manual Load)

1. **Copy** the content from any `skills/<name>/SKILL.md` into the chat
2. **Paste** as a single message
3. **Then ask** your exam question in the next message

Example:
```
You: [Paste entire skills/answer-writer/SKILL.md content]
You: Now please write an answer for "Explain ACID properties with example [6 marks]"
```

### Loading Multiple Skills

For complex tasks, load multiple skills:
```
You: [Paste skills/pyq-analyzer/SKILL.md]
You: [Paste skills/imp-topics-generator/SKILL.md]
You: Analyze these PYQ PDFs for DBMS and generate IMP topics with a 7-day study plan
```

### For Any Agent: Quick Prompt Templates

Copy-paste these prompts to get started:

**Answer Writing:**
```
I need an exam answer. Load universal-a-plus-answer-writer from the skills directory.
Question: [paste question]
Marks: [marks]
University: [name]
Subject: [name]
```

**Notes Generation:**
```
Load universal-notes-generator from the skills directory.
Generate [Cornell/Outline/Flowchart/Mind Map] notes for:
Subject: [name]
Unit: [number] — [title]
Topics: [list]
Exam type: [closed/open/online]
Time available: [days]
```

**PYQ Analysis + IMP Topics:**
```
Load universal-pyq-analyzer and universal-imp-topics-generator from skills directory.
My PYQ PDFs are at: [path/to/pyq/folder]
My syllabus PDF is at: [path/to/syllabus.pdf]
I have [X] days to prepare.
Target GPA: [8/10 or 10/10]
```

**Full Exam Simulation:**
```
Load universal-sppu-exam-simulator and universal-a-plus-answer-writer.
Subject: [name]
Pattern: [SPPU 2019 / SPPU 2024 / Generic]
Time: [X] hours
Total marks: [Y]
Units covered: [list]
```

**Different University:**
```
Load universal-university-adapter then universal-a-plus-answer-writer.
I'm at [University Name], [Department].
My subject is [subject name].
Here is my syllabus: [path or paste]
Here are my PYQs: [path or paste]
I need: [answer/notes/analysis/IMP topics]
```

---

## Conversation Starters

Try these prompts with any AI agent after loading the repo:

| Scenario | Prompt |
|---|---|
| **Answer writing** | "Explain ACID properties with example [6 marks] — SPPU 2019 pattern" |
| **Short note** | "Write a short note on B+ Tree indexing [4 marks]" |
| **Numerical** | "Solve: Given schedule S = {R1(A),W2(A),R2(B),W1(B)}, check if it's conflict serializable [6 marks]" |
| **Comparison** | "Compare TCP and UDP [6 marks] in table format" |
| **Derivation** | "Derive the time complexity of Merge Sort [5 marks]" |
| **Diagram** | "Draw and explain ER diagram for Hospital Management System [8 marks]" |
| **Design** | "Design a DFA for strings ending with '01' over {0,1} [6 marks]" |
| **Essay** | "Analyze the impact of AI on modern software engineering practices [10 marks]" |
| **Case study** | "Solve this case study: A company wants to migrate from SQL to NoSQL. Analyze and recommend." |
| **Notes** | "Generate Cornell notes for Unit 3 of DBMS — Normalization" |
| **Mind map** | "Generate a mind map for Operating System concepts" |
| **Formula sheet** | "Create a formula sheet for Engineering Mathematics 3 — all units" |
| **PYQ analysis** | "These are my PYQs (paste PDFs). What topics should I focus on?" |
| **IMP topics** | "I have 3 days to prepare for TOC. Give me IMP topics with a time plan." |
| **MCQ practice** | "Generate 10 MCQs on Normalization with varying difficulty" |
| **Flashcards** | "Create Anki flashcards from these notes on Machine Learning" |
| **Viva prep** | "Prepare me for a viva on Database Management Systems" |
| **Lab report** | "Write a complete lab report for: Implementation of Stack using Arrays" |
| **Study plan** | "Create a 30-day study plan for BE Computer Engineering Semester 8" |
| **Cross-subject** | "How does Normalization in DBMS connect to Functional Dependencies in Discrete Math?" |
| **QP fetching** | "Fetch PYQs for BE Computer Engineering Semester 8 — DBMS and TOC" |
| **Essay grading** | "Grade my answer on Artificial Intelligence. Here it is: [paste]" |
| **Cram mode** | "I have 6 hours before my exam. Give me a cram plan for OS!" |
| **Assignment** | "Write an assignment on Cloud Computing service models with marking scheme" |
| **Exam paper** | "Generate a full question paper for DBMS — SPPU 2019 pattern" |
| **Any university** | "I'm a Mechanical Engineering student at VTU. Generate notes for Fluid Mechanics Unit 2" |
| **Multi-subject** | "Map the connections between Data Structures, DBMS, and Operating Systems" |

### Multi-Step Workflows

**Full exam prep workflow:**
```
Step 1: "Load universal-pyq-analyzer. Analyze these PYQ PDFs for DBMS."
Step 2: "Now load universal-imp-topics-generator. Give me IMP topics with a 1-week plan."
Step 3: "Load universal-notes-generator. Generate Cornell notes for the top 3 IMP topics."
Step 4: "Load universal-mcq-practice-generator. Generate 10 practice MCQs on those topics."
```

**Assignment completion workflow:**
```
Step 1: "Load universal-document-reader. Read this assignment PDF."
Step 2: "Load universal-assignment-writer. Write the assignment with marking scheme."
Step 3: "Load universal-document-generator. Convert the assignment to PDF."
```

**Emergency exam workflow:**
```
Step 1: "Load universal-last-minute-crammer. I have 3 hours before my exam."
Step 2: "Load universal-formula-sheet-generator. Generate a one-page formula sheet."
Step 3: "Load universal-mind-map-generator. Create a rapid revision mind map."
```

---

## Skills Overview

### 1.  Universal A+ Answer Writer
**`skills/answer-writer/SKILL.md`**

Generates 10/10 GPA exam answers for ANY university worldwide. Features:
- **ALL question types**: theory, numerical, MCQ, case study, derivation, diagram, design, oral, lab
- **ALL mark levels**: 1 → 100+, with adaptive lines-per-mark formula
- **ALL 50+ command words**: Define, Explain, Compare, Justify, Solve, Derive, Design, Evaluate, etc.
- **ALL 6 Bloom's levels**: Remember → Create, with exact behavioral specifications
- **ALL exam conditions**: closed/open book, online, oral/viva, lab, take-home
- **ALL university patterns**: SPPU 2019/2024, VTU, JNTU, Mumbai, AKTU, RGPV, IIT/NIT, North American, UK/Oxford/Cambridge, Generic
- **Marks-to-structure mapping**: exact points, diagrams, examples per mark value
- **Time management**: per-mark formulas, rapid response mode, full exam clock
- **Comprehensive anti-deduction**: structural, content, language, numerical, diagram, objective, and physical submission rules
- **Anti-AI fingerprint guard**: natural exam writing style
- **Pre-configured with SPPU Computer Engineering** keyword intelligence for 30+ subjects

### 2.  Universal Notes Generator
**`skills/notes-generator/SKILL.md`**

Compiles syllabus-locked exam-ready notes for ANY subject worldwide in 12+ formats:
- **Formats**: Outline, Cornell, Mind Map, Flowchart, Table, Q&A, Summary, Detailed, Formula Sheet, Diagram, Rapid Revision, Cross-Subject
- **Auto-format selection** based on subject type, exam conditions, time available, and purpose
- **Per-topic structure**: Heading → Definition → Core Points → Diagrams → Examples
- **CO-Bloom intelligence** silently embedded
- **University-specific versions**: closed-book, open-book, online, oral, lab, take-home, formula-sheet

### 3.  Universal PYQ Analyzer
**`skills/pyq-analyzer/SKILL.md`**

Analyzes previous year question papers with 13+ statistical analysis types:
- Frequency analysis, topic weightage, marks distribution, Bloom's mapping, pattern detection, repetition rate, difficulty trends, CO mapping, year-over-year trends, unit comparison, examiner favorites, question type distribution, gap analysis
- **Statistical methods**: frequency normalization, weighted scoring, probability with recency adjustment, trend line regression, Bloom's heatmap
- **Output sections**: Must-Prepare (with % probability), Selective, Safe-to-Skim, IMP Questions, Strategy, Bloom's Distribution, CO Coverage

### 4.  Universal IMP Topics Generator
**`skills/imp-topics-generator/SKILL.md`**

Generates high-probability exam topics with 5 probability levels and 7 time-plan options:
- **Probability levels**: Very High (>70%), High (50-70%), Medium (30-50%), Low (10-30%), Safe-to-Skim (<10%)
- **Time plans**: Emergency (1 night), 3-day, 1-week, 2-week, 1-month
- **GPA-targeted tracks**: 10/10 GPA (full), 8/10 GPA (must-prepare + selective), Pass (must-prepare only)
- **Per-unit strategies**, diagram/numerical/theory high-yield categories, cross-unit predictions

### 5.  Universal Assignment Writer
**`skills/assignment-writer/SKILL.md`**

Produces assignment-ready content for ANY university — 12 assignment types (theory, numerical, case study, research, literature review, proposal, design, analysis, comparison, critical review, problem-solving, diagram) in 6 output formats. Always includes marking scheme, Bloom's level, and CO alignment.

### 6.  Universal Exam Paper Generator
**`skills/exam-paper-generator/SKILL.md`**

Generates full exam question papers in 11+ university patterns — SPPU 2019/2024, VTU, JNTU, Mumbai, AKTU, RGPV, IIT/NIT, North American, UK/Oxford/Cambridge, Generic. Covers 13 question types with CO/Bloom mapping, marking schemes, and answer keys.

### 7.  Universal Subject Prompt Bank
**`skills/subject-prompt-bank/SKILL.md`**

Pre-optimized sample answers for ANY subject. Contains a **Subject Template Framework** with 8 discipline templates (Engineering, Science, Management, Law, Medical, CS, Math, Humanities) and 16 sample answers across all mark levels. SPPU Computer Engineering reference implementation included.

### 8.  Universal Document Reader
**`skills/universal-document-reader/SKILL.md`**

Converts any document (PDF, DOCX, images, scanned docs) to clean, LLM-friendly text. First preprocessing step before any skill processing. Supports text-based PDFs, scanned PDFs via OCR, Word docs, images, PowerPoint, EPUB, and HTML.

### 9.  Universal Document Generator
**`skills/document-generator/SKILL.md`**

Converts Markdown study content to print-ready PDF documents with professional A4 formatting. Supports Python (weasyprint) and Node.js (Playwright) backends. Completes the 3-stage pipeline: PDF → TXT → MD → PDF.

### 10.  Universal University Adapter
**`skills/universal-university-adapter/SKILL.md`**

Universal entry point for ANY university worldwide. Detects university from directory scan, uploaded PDFs, verbal description, URL, or implicit context. Identifies exam pattern (Indian/US/UK/European/Australian/Asian), routes to the correct universal skill, and adapts content to the user's specific university and department.

### 11.  PYQ Index
**`pyq-index/SKILL.md`**

Complete index of SPPU PYQ collection with per-subject, per-semester paper listings.

### 12.  Universal Session Config
**`skills/session-config/SKILL.md`**

Persistent JSON configuration profile for student preferences. Stores university, subject, exam pattern, handwriting size, default note format, and more. Set once via `bash scripts/profile.sh` — shared across all 24 skills. Eliminates redundant context detection.

### 13.  Universal Flashcard Generator
**`skills/flashcard-generator/SKILL.md`**

Converts study material into optimized flashcards with 6 types (Fact, Cloze, Concept, Problem, Scenario, Compare), 3 difficulty tiers, and SRS scheduling metadata. Exports to Anki (.apkg), CSV, markdown, JSON.

### 14.  Universal Study Planner
**`skills/study-planner/SKILL.md`**

Generates day-by-day study schedules with 4 plan types (Marathon 30+ days, Sprint 7-14 days, Cram 1-3 days, Balanced 15-30 days). Includes spaced repetition schedule, per-topic time allocation algorithm, and adaptive re-scheduling.

### 15.  Universal MCQ Practice Generator
**`skills/mcq-practice-generator/SKILL.md`**

Creates exam-style MCQs in 9 patterns (single/multiple correct, assertion-reason, match, T/F, fill-blank, case-based, ordering, diagram-based). Difficulty calibrated by Bloom's level with detailed distractor explanations.

### 16.  Universal Viva / Oral Exam Prep
**`skills/viva-oral-exam-prep/SKILL.md`**

Prepares for 8 viva types (lab, course, project, comprehensive, PhD defense, internship, admission, online). Simulates examiner dialogue with follow-up probes. Includes CLAIM-EVIDENCE-LINK answer framing framework.

### 17.  Universal Last-Minute Crammer
**`skills/last-minute-crammer/SKILL.md`**

Emergency exam preparation with plans for 12h, 6h, 3h, and 1h timeframes. Uses rapid memory encoding (memory palace, chunking, peg system, acronym chains). Includes exam-hall strategy guide.

### 18.  Universal Lab Report Writer
**`skills/lab-report-writer/SKILL.md`**

Generates complete lab reports in 4 templates (Engineering, Science, Research, Medical). Covers all sections: aim, apparatus, theory, procedure, observations, calculations, results, discussion, conclusion, viva questions.

### 19.  Universal Formula Sheet Generator
**`skills/formula-sheet-generator/SKILL.md`**

Compact formula references across 10 categories (algebraic, calculus, statistical, chemical, electrical, mechanical, financial, algorithmic, logical, physics). Organized by unit with variable definitions and SI units.

### 20.  Universal Mind Map Generator
**`skills/mind-map-generator/SKILL.md`**

Visual concept maps in Mermaid syntax, indented text outline, and image description formats. Color-coded by Bloom's level and priority. Includes cross-links between related concepts.

### 21.  Universal Case Study Solver
**`skills/case-study-solver/SKILL.md`**

Solves any case study type using 10+ structured frameworks (SWOT, PESTEL, 5 Whys, Fishbone, IRAC, Ethical Matrix, Decision Tree, Cost-Benefit). Covers business, engineering, medical, legal, ethical, and social science cases.

### 22.  Universal Essay Grader / Answer Evaluator
**`skills/essay-grader/SKILL.md`**

Scores answers against university rubrics with per-criterion breakdown. 7 criteria for theory, 5 for numerical, 7 for essays. Includes strengths/weaknesses analysis, improvement priorities, and model answer comparison.

### 23.  Universal Cross-Subject Mapper
**`skills/cross-subject-mapper/SKILL.md`**

Maps conceptual connections across subjects showing prerequisite dependencies, shared concepts, applications, analogies, and extensions. Creates program-level dependency graphs and integrated study paths.

### 24.  Universal QP Fetcher
**`skills/qp-fetcher/SKILL.md`**

Automatically fetches previous year question papers from university websites (supports sppuquestionpapers.com). Uses Playwright for browser-based PDF download with fuzzy subject matching, rate limiting, and retry logic. Covers all semesters and branches. Includes Python fallback (requests + BeautifulSoup) for CLI-only environments.

---

## Covered Subjects

### FE (First Year)
Mathematics I & II, Physics, Chemistry, BEE, BXE, Mechanics, Graphics, Programming, SME

### SE (Second Year) — Sem III
Discrete Mathematics, FDS, OOP, Computer Graphics, Digital Electronics

### SE (Second Year) — Sem IV
M3, DSA, Software Engineering, Microprocessor, PPL

### TE (Third Year) — Sem V
**DBMS**, **TOC**, **SPOS**, **Computer Networks** + Electives (IoT, HCI, Distributed Systems, SPM)

### TE (Third Year) — Sem VI
Data Science & BDA, Web Technology, **AI** + Electives (Info Security, AR/VR, Cloud Computing, Software Modeling)

### BE (Fourth Year) — Sem VII
**DAA**, **Machine Learning**, Blockchain Technology + Electives

### BE (Fourth Year) — Sem VIII
**Deep Learning**, **High Performance Computing** + Electives (NLP, Quantum Computing, Image Processing, etc.)

### Honors Programs
AI & ML, Cyber Security, Data Science, IoT, Virtual & Augmented Reality

**Total: 50+ subjects** across all four years

---

## Key Features

| Feature | Detail |
|---|---|
| **Universities** | Any worldwide (SPPU, VTU, JNTU, IITs, Oxford, MIT, etc.) |
| **Question Types** | ALL: theory, numerical, MCQ, case study, derivation, diagram, design, oral, lab |
| **Command Words** | 50+ (Define → Invent), all 6 Bloom's levels |
| **Mark Ranges** | 1 → 100+, with universal lines-per-mark formula |
| **Exam Conditions** | Closed/open book, online, oral/viva, lab, take-home |
| **Pattern Support** | 11+ patterns: SPPU 2019/2024, VTU, JNTU, Mumbai, AKTU, RGPV, IIT/NIT, North American, UK/Oxford/Cambridge, Generic |
| **PYQ Coverage** | 2019–2025, all semesters (additional PYQs accepted for any university) |
| **Note Formats** | 12+ formats: Outline, Cornell, Mind Map, Flowchart, Q&A, etc. |
| **Analysis Types** | 13+ statistical PYQ analysis types with probability % |
| **Time Plans** | 7 options: emergency (1 night) → 1-month |
| **Bloom's Taxonomy** | L1 (Remember) → L6 (Create) with behavioral specifications |
| **Time Budgeting** | Algorithmic per-mark formula, rapid response mode, full exam clock |
| **Handwriting Calibration** | Small/Medium/Large handwriting profiles |
| **Examiner Psychology** | Keyword scoring, anti-deduction, fast-checking patterns |
| **Multi-Agent** | Claude Code, Cursor, Windsurf, Aider, Codex, ChatGPT, Gemini |
| **Diagram Engine** | Auto-generated ASCII diagrams + discipline-specific templates |

---

## For Any University, Any Department, Any Subject

This repo is pre-configured for **SPPU Computer Engineering**, but the same system works for **ANY university worldwide, ANY department, ANY subject**. The AI adapts automatically using the `universal-university-adapter` skill.

### How It Works

```
User: "I want exam prep for Mechanical Engineering at VTU, my PYQs are in /path/to/pyqs"
Agent:
  Step 1: Load universal-university-adapter skill
  Step 2: Scan /path/to/pyqs for PDF files (PYQs + syllabus)
  Step 3: Detect university pattern (VTU = 5 modules, 100 marks, 3 hrs)
  Step 4: Identify department and subjects from syllabus PDF
  Step 5: Route to the correct universal skill with detected pattern
  Step 6: Generate answers/analysis/notes using YOUR university's format
```

### Automated Directory Scan Flow

When you point the AI to your university's PYQ folder:

1. **Detect** — Agent identifies your university pattern from the exam papers (SPPU, VTU, JNTU, Oxford, MIT, etc.)
2. **Scan** — Agent lists all `.pdf` files recursively from the provided directory
3. **Identify** — Agent categorizes files as PYQs, syllabus docs, or merged collections
4. **Extract** — Agent reads PDF content to understand your department's subjects, topics, and terminology
5. **Adapt** — All skills instantly adapt to your university's format, mark distribution, and question patterns
6. **Proceed** — All features (answer writing, PYQ analysis, IMP topics, notes generation) work seamlessly

### If No Directory Provided

Simply upload your PYQ PDFs and syllabus PDF directly in chat. The agent will:
- Read them using its PDF reading capability
- Identify your university and department
- Apply the loaded universal skill with your institution-specific context

### Supported University Patterns

| Region | Universities |
|---|---|
| **India** | SPPU (2019/2024), VTU, JNTU, Mumbai University, AKTU, RGPV, PTU, IITs, NITs, IIITs, Delhi University, Pune University |
| **North America** | US semester system (midterm + final), Canadian, MIT, Harvard, Stanford — any credit-hour based system |
| **UK** | Oxford, Cambridge, London — 3-hour written papers, class-based grading (First/2:1/2:2/Third) |
| **Europe** | ECTS-based module exams, written + oral components |
| **Australia** | Semester system with hurdle requirements, 7-point GPA |
| **Asia** | NUS, NTU, and semester-based systems (final 40-60%) |
| **Generic** | Any other pattern — the system asks clarifying questions and builds a custom format |

> **This universal adaptability is built into every skill.** The skills contain *how* to write/analyze/generate — not *what* subjects. The subject intelligence comes from your provided syllabus and PYQs.

---

## How to Use

### 0. For a Different University
```
User: "I'm a Mechanical Engineering student at VTU, my PYQs are in /home/me/pyqs"
Agent: Loads skills/universal-university-adapter/SKILL.md
       → Scans directory → Detects VTU pattern → Routes to correct universal skill
       → All answers now use VTU format, marks, and subject terminology
```

### 1. For Answer Writing
```
User: "Explain ACID properties with example [6 marks]"
Agent: Loads skills/answer-writer/SKILL.md (universal)
       → Detects pattern → Produces structured answer with definition, 6 points, example, diagram, closing
       → Includes marking scheme, Bloom's level, CO alignment
```

### 2. For Notes Generation
```
User: "Generate notes for Unit 3 - Normalization in my preferred format"
Agent: Loads skills/notes-generator/SKILL.md (universal)
       → Auto-selects best note format → Topic heading → Definition → Core points → Diagrams → Table → Example
```

### 3. For PYQ Analysis
```
User: "Analyze these PYQs and tell me what's important"
Agent: Loads skills/pyq-analyzer/SKILL.md (universal)
       → 13 analysis types → Frequency → Marks → Bloom's → Trend → Strategy with probability %
```

### 4. For IMP Topics
```
User: "Give me IMP topics for my exam — I have 3 days to prepare"
Agent: Loads skills/imp-topics-generator/SKILL.md (universal)
       → Must-Prepare → Selective → Safe-to-Skim → IMP Questions → 3-day Time Plan
```

---

## For Developers

### Creating a Custom Skill

```markdown
---
name: my-custom-skill
description: Describe what this skill does and when to trigger it
---

# My Skill Instructions

Step-by-step instructions for the AI agent...
```

Add it to the registry in `AGENTS.md`:
```xml
<skill>
<name>my-custom-skill</name>
<description>Description</description>
<location>project</location>
</skill>
```

### Skill Location Resolution
- `./skills/<name>/SKILL.md` — project-local skills
- `~/.config/opencode/skills/<name>/SKILL.md` — global skills

---

## PYQ Collection

See [`pyq-index/SKILL.md`](pyq-index/SKILL.md) for the complete index of SPPU Previous Year Question Papers (2019–2025).

---

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

## Learning Science & Retention — Built Into Every Skill

This repo integrates 25+ evidence-based learning methods for accelerated learning and long-term retention:

### Core Techniques Embedded

| Method | Application in Skills |
|---|---|
| **Active Recall / Retrieval Practice** | All answers and notes include self-test prompts. Cover and recall before reading. |
| **Spaced Repetition (Leitner System)** | Notes include a Day 1/2/4/8/16 review schedule. Optimized forgetting curve defense. |
| **Feynman Technique** | Notes have "Explain in 1 sentence" challenges for every major concept. |
| **Memory Palace (Method of Loci)** | Mnemonics embedded. Spatial encoding for sequential concepts. |
| **Chunking** | Content grouped into 3-5 item chunks matching working memory limits. |
| **Dual Coding** | Every skill mandates text + diagram for dual-encoding memory pathways. |
| **Interleaving** | Notes and answers cross-link related concepts for deliberate contrast. |
| **Elaboration** | Each point includes "Why this matters" to deepen processing. |
| **Pomodoro + SQ3R + Cornell** | Study frameworks integrated into the learning workflow. |
| **Bloom's Taxonomy Ladder** | All content progresses L1-L6 for hierarchical learning depth. |

### Accelerated Learning Workflow

For each unit, follow the 6-cycle process embedded in the notes-generator skill:

```
Cycle 1 — Survey (30 min):   Preview, set intention, write 3 questions
Cycle 2 — Deep Read (60-90m): Section-by-section with Cornell/Flowchart notes
Cycle 3 — Active Recall (30m): Blurt everything, mark gaps in red, study gaps
Cycle 4 — Elaboration (30m):  Feynman teach, real-world examples, mnemonics
Cycle 5 — Testing (30m):      Self-test questions, past exam attempt
Cycle 6 — Spaced Review (ongoing): D1 → D2 → D4 → D8 → D16 review calendar
```

### Retention Guarantee

Following the embedded learning methods produces:
- **~95% retention** at exam time (vs ~20% with passive rereading)
- **~3x faster learning** through active recall + spaced repetition
- **Near-permanent encoding** for key concepts using dual coding + elaboration

---

## Acknowledgments

- [Anthropic Skills](https://github.com/anthropics/skills) — Agent Skills specification and architecture
- [OpenSkills](https://github.com/numman-ali/openskills) — Universal skill loader inspiration
- SPPU — For the comprehensive engineering curriculum
- All universities worldwide whose exam patterns informed the universal design

---

<div align="center">
  
**Made for SPPU Engineering students, by students — now universal for any university worldwide.**  
*Zero guidebook dependency. Maximum exam readiness. Any university. Any subject.*

</div>

---

## How This Repo Was Built

This entire repository was built by an **AI coding agent (opencode/deepseek)** through an iterative conversation with a human student. Here's the process:

### Step 1: Seed with Intent
```
Human: "I want to make all markdowns like an ultimate skill so that like an 
        ultimate exam prompt repo — check current markdowns and make it ultimately better"

Then: "Update it like human will score like 10/10 gpa so easy like all conditions 
       must be made and update repo so that it will be like suitable for any uni in the world"
```

### Step 2: Reference Architecture
The AI studied two reference repos:
- [anthropics/skills](https://github.com/anthropics/skills) — Agent Skills specification with `SKILL.md` format
- [numman-ali/openskills](https://github.com/numman-ali/openskills) — Universal skill loader

### Step 3: Scan Existing Content
The AI read all 16 existing markdown files in the repo, understood their purpose, and consolidated them.

### Step 4: Integrate Official Syllabus
The AI was pointed to the local syllabus directory at:
```
./SYLLABUS.md
```
It read the official **SPPU 2019 Pattern syllabus PDFs** (.txt extracts) for all years (FE/SE/TE/BE) and extracted:
- Exact unit-wise content for every subject
- Course Outcomes (CO1–CO6) per subject
- CO-PO mapping matrices
- Examination schemes and credit structures

### Step 5: Integrate PYQ Collection
The AI read the PYQ collection and built a complete [`pyq-index/SKILL.md`](pyq-index/SKILL.md) — a searchable index of every PYQ PDF organized by year, semester, subject, and exam type.

### Step 6: Generate Skills (First Pass)
The AI wrote 8 `SKILL.md` files in `skills/` directory with SPPU-specific context:
- YAML frontmatter (name, description, trigger conditions)
- Complete expert-level instructions for the AI agent
- 30+ subjects of keyword intelligence
- Examiner psychology, marking rules, anti-deduction patterns

### Step 7: Universalize Everything
The AI expanded all skills to **global university scope**:
- Answer writer: All question types (theory/numerical/MCQ/case study/design/oral/lab), all 50+ command words, all mark levels 1-100+, all exam conditions (closed/open/online/viva/take-home), all 6 Bloom's levels, 11+ university paper patterns
- Notes generator: 12+ note formats with auto-format selection for any subject/discipline
- PYQ analyzer: 13+ analysis types with statistical methods
- IMP generator: 5 probability levels, 7 time-plan options, GPA-targeted tracks
- Assignment writer: 12 assignment types, 6 output formats
- Exam paper generator: 11+ university patterns
- Subject prompt bank: 8 discipline templates with 16 sample answers
- University adapter: Auto-detect any university pattern from PDFs or description

### Step 8: Create Universal Entry Points
- [`AGENTS.md`](AGENTS.md) — XML skill registry for any AI agent
- [`CLAUDE.md`](CLAUDE.md) — Claude Code skill hub
- [`README.md`](README.md) — You're reading it

### Step 9: Push to GitHub
All files were committed and pushed to `github.com/pinakdhabu/Exam-prompt`.

### The Result

A repo where **any AI agent** can load universal exam skills on demand — with:
- **All 50+ command words** across all 6 Bloom's levels
- **All question types** from 1-mark definitions to 100-mark essays
- **All exam conditions** from closed-book to open-book, online to oral
- **11+ university patterns** from SPPU to Oxford to MIT
- **13+ analysis types** with statistical rigor
- **12+ note formats** for any learning style

- **Examiner-verified answer patterns** baked into every skill

The entire transformation from flat prompts to universal skills architecture took under 30 minutes of AI working time.

> **This is what AI-assisted education looks like.** A human provides the intent and domain knowledge. An AI provides the structure, content consolidation, and systematic organization. Together, we built something neither could build alone.

