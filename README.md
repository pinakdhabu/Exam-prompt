# 🎓 SPPU Exam Prompt — Ultimate Engineering Exam Preparation Kit

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![SPPU 2019 Pattern](https://img.shields.io/badge/SPPU-2019%20Pattern-blue)](https://www.unipune.ac.in)
[![SPPU 2024 Pattern](https://img.shields.io/badge/SPPU-2024%20Pattern-green)](https://www.unipune.ac.in)
[![Subjects](https://img.shields.io/badge/Subjects-50%2B-orange)](skills/)
[![PYQ Papers](https://img.shields.io/badge/PYQ%20Papers-270MB%2B-red)](pyq-index/SKILL.md)
[![Agent Compatible](https://img.shields.io/badge/Agent-Claude%20%7C%20Cursor%20%7C%20Windsurf%20%7C%20Aider-purple)](AGENTS.md)

> **The world's most comprehensive AI-powered exam preparation system for SPPU Engineering students.**
>
> Skills-based architecture. Universal agent compatibility. Zero lecture dependency.

---

## ✨ What Is This?

This is a **universal skill hub** for SPPU (Savitribai Phule Pune University) Undergraduate Engineering exam preparation. It transforms any AI coding agent into a personal SPPU exam tutor that can:

- ✍️ **Write exam-ready theory answers** indistinguishable from official model answer sheets
- 📝 **Compile syllabus-locked revision notes** with perfect examiner alignment
- 📊 **Analyze previous year question papers** to predict high-probability topics
- 🔥 **Generate IMP topics and questions** for targeted preparation
- 📄 **Create full SPPU-style question papers** with CO-Bloom mapping
- 📋 **Write assignment-ready answers** with marking schemes
- 🔗 **Reference 270MB+ of PYQ PDFs** (2019–2025) across all subjects

All powered by a **skills-based architecture** inspired by [Anthropic's Agent Skills](https://github.com/anthropics/skills) specification.

> 📖 **Official SPPU Syllabus Reference:** See [`SYLLABUS.md`](SYLLABUS.md) for complete unit-wise content, Course Outcomes, and CO-PO mapping for all 30+ Computer Engineering subjects — extracted directly from the official SPPU PDFs.

---

## ⚡ Quick Start with Gemini Gems

One-click access to specialized AI agents for SPPU exam prep — no setup required.

| Tool | Link | What It Does |
|---|---|---|
| 📊 Q.P. Analysis Tool | [Open Gemini Gem](https://gemini.google.com/gem/1W8EC9fMchTr3bVl_X4ncnPGWNsEM5heh) | Analyzes PYQs and syllabus to predict exam patterns |
| 📝 Notes Generator | [Open Gemini Gem](https://gemini.google.com/gem/bf5b14582187) | Generates 100% syllabus-locked revision notes |
| 🔥 Important Topics Generator | [Open Gemini Gem](https://gemini.google.com/gem/4266a7e8000e) | Outputs must-prepare IMP topics & questions |
| 🧠 Exam-Style Answer Generator | [Open Gemini Gem](https://gemini.google.com/gem/1PGOZXhIROLOGU88epT7JGgV3bnXDTcJK) | Writes full-marks theory answers |

> 💡 **Pro tip:** Upload your SPPU syllabus PDF + previous year question papers to any Gemini Gem for best results. You can also use the prompts below with ChatGPT/Claude directly.

---

## 🏗️ Architecture

```
exam-prompt/
├── AGENTS.md                    # Universal skill loader (Claude/Cursor/Windsurf/Aider)
├── CLAUDE.md                    # Skill hub entry point
├── README.md                    # You are here
├── LICENSE
│
├── skills/                      # 📦 Loadable skill modules (SKILL.md format)
│   ├── answer-writer/           #    → Master theory answer generator
│   ├── notes-generator/         #    → Revision notes compiler
│   ├── pyq-analyzer/            #    → PYQ pattern & trend analysis
│   ├── imp-topics-generator/    #    → High-probability exam topics
│   ├── assignment-writer/       #    → Assignment-ready answers
│   ├── exam-paper-generator/    #    → Full question paper generator
│   └── subject-prompt-bank/     #    → Pre-optimized sample answers
│
├── pyq-index/
│   └── SKILL.md                 # 📇 Complete PYQ PDF collection index
│
└── archive/                     # Legacy prompt files
```

Each skill is **self-contained** — load only what you need, keep context clean.

---

## 🚀 Quick Start

### For Claude Code

```bash
# The skills are auto-discovered via AGENTS.md
# Just ask Claude to use a specific skill:
"Write an answer for Explain ACID properties [6 marks]"
"Generate notes for Unit 3 of DBMS"
"Analyze these PYQs for TOC"
"What are the IMP topics for OS exam?"
```

### For Cursor / Windsurf / Aider / Codex

These agents read `AGENTS.md` automatically. All skills are loadable via the `<available_skills>` system.

### For ChatGPT / Gemini

Copy the content from any `skills/<name>/SKILL.md` into the chat, then start asking questions.

---

## 🧠 Skills Overview

### 1. 📝 Answer Writer
**`skills/answer-writer/SKILL.md`**

Generates exam answers indistinguishable from official SPPU model answer sheets. Features:
- **Marks-to-structure mapping** — exact points, diagrams, examples per mark value
- **Command word resolution** — Define, Explain, Compare, Justify, Discuss, etc.
- **Bloom's Taxonomy alignment** — L1 through L6 cognitive levels
- **Physical booklet calibration** — lines-per-mark, handwriting profiles
- **Time constraint mode** — 3-min quick answers to 15-min full answers
- **Exam paper format mode** — full QP generation with CO mapping
- **Anti-deduction rules** — patterns that cause mark loss
- **Anti-AI fingerprint guard** — natural exam writing style
- **Subject intelligence** — keyword clusters for 30+ subjects (FE→BE)

### 2. 📓 Notes Generator
**`skills/notes-generator/SKILL.md`**

Compiles 100% syllabus-locked revision notes:
- Per-topic structure: Heading → Definition → Core Points → Diagrams → Examples
- Auto-generates ASCII diagrams for structural/architectural topics
- CO-Bloom intelligence silently embedded
- Quality self-validation before output

### 3. 📊 PYQ Analyzer
**`skills/pyq-analyzer/SKILL.md`**

Analyzes previous year question papers for exam intelligence:
- Question frequency extraction (Very High / Medium / Low probability)
- Marks-weight pattern analysis
- Bloom's Taxonomy distribution mapping
- Examiner psychology extraction
- Strategic topic prioritization

### 4. 🔥 IMP Topics Generator
**`skills/imp-topics-generator/SKILL.md`**

Generates high-probability exam topics:
- Section A: Must-Prepare (guarantee passing)
- Section B: Selective (prepare if time permits)
- Section C: Safe-to-Skim (read once)
- Section D: IMP Questions (grouped by marks & unit)
- Section E: Smart Student Strategy

### 5. 📋 Assignment Writer
**`skills/assignment-writer/SKILL.md`**

Produces assignment-ready theory answers with marking schemes. Optimized for 5–7 mark evaluation depth.

### 6. 📄 Exam Paper Generator
**`skills/exam-paper-generator/SKILL.md`**

Generates complete SPPU-style question papers with proper header, OR structure, CO mapping, and mandatory question types.

### 7. 💡 Subject Prompt Bank
**`skills/subject-prompt-bank/SKILL.md`**

Pre-optimized sample answers for DBMS, OS, CN, DAA with time budgets and marking schemes — showing the exact structure for 2/4/6-mark questions.

### 8. 📇 PYQ Index
**`pyq-index/SKILL.md`**

Complete index of 270MB+ PYQ collection with per-subject, per-semester paper listings. References local PDFs at `/home/pinak/Documents/SPPU Engineering PYQ Papers/`.

---

## 📚 Covered Subjects

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

## 🔬 Key Features

| Feature | Detail |
|---|---|
| **Pattern Support** | 2019 Pattern & 2024 Pattern (dual compatibility) |
| **PYQ Coverage** | 2019–2025, 270MB+, all semesters |
| **Marks Precision** | 2-mark → 18-mark, with lines-per-page calibration |
| **Bloom's Taxonomy** | L1 (Remember) → L6 (Create) |
| **CO-PO Alignment** | Course Outcomes + Program Outcomes (silent) |
| **Time Budgeting** | 3-min → 15-min answer modes |
| **Handwriting Calibration** | Small/Medium/Large handwriting profiles |
| **Examiner Psychology** | Keyword scoring, anti-deduction, fast-checking patterns |
| **Multi-Agent** | Claude Code, Cursor, Windsurf, Aider, Codex |
| **Diagram Engine** | Auto-generated ASCII architecture diagrams |

---

## 📖 How to Use

### 1. For Answer Writing
```
User: "Explain ACID properties with example [6 marks]"
Agent: Loads skills/answer-writer/SKILL.md
       → Produces structured answer with definition, 6 points, example, diagram, closing
       → Includes marking scheme
```

### 2. For Notes Generation
```
User: "Generate notes for Unit 3 - Normalization"
Agent: Loads skills/notes-generator/SKILL.md
       → Topic heading → Definition → Core points → Diagrams → Table → Example
```

### 3. For PYQ Analysis
```
User: "Analyze these PYQs for DBMS and tell me what's important"
Agent: Loads skills/pyq-analyzer/SKILL.md
       → Frequency analysis → Marks pattern → Bloom's mapping → Strategy
```

### 4. For IMP Topics
```
User: "Give me IMP topics for OS end sem exam"
Agent: Loads skills/imp-topics-generator/SKILL.md
       → Must-Prepare → Selective → Safe-to-Skim → IMP Questions → Strategy
```

---

## 🛠️ For Developers

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

## 📦 PYQ Collection

A comprehensive collection of **SPPU Previous Year Question Papers (2019–2025)** is available at:

```
/home/pinak/Documents/SPPU Engineering PYQ Papers/
```

- **Size:** 270MB+
- **Coverage:** 2019–2025, all semesters
- **Patterns:** 2019 & 2024
- **Scope:** Computer Engineering (SE/TE/BE), FE (all branches), Honors, Electives
- **Paper types:** End Sem + In Sem

See [`pyq-index/SKILL.md`](pyq-index/SKILL.md) for the complete index.

---

## 📜 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- [Anthropic Skills](https://github.com/anthropics/skills) — Agent Skills specification and architecture
- [OpenSkills](https://github.com/numman-ali/openskills) — Universal skill loader inspiration
- SPPU — For the comprehensive engineering curriculum

---

<div align="center">
  
**Made for SPPU Engineering students, by students.**  
*Zero guidebook dependency. Maximum exam readiness.*

</div>
