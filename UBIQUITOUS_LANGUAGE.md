# Ubiquitous Language — Exam Prompt

## Core Concepts

| Term | Definition | Aliases to avoid |
|------|------------|-----------------|
| **Skill** | A self-contained `SKILL.md` file that instructs an AI agent how to perform a specific exam task (answer writing, note generation, PYQ analysis, etc.) | Skill module, agent skill, prompt file |
| **SKILL.md** | The canonical format for a skill — Markdown file with YAML frontmatter containing `name`, `description`, and step-by-step agent instructions | Skill file, agent instructions |
| **Exam Prompt** | The overall system and repository name — a collection of 24 university-agnostic AI skills for exam preparation | N/A |
| **Agent** | Any AI coding assistant (Claude Code, Cursor, ChatGPT, Gemini, etc.) that reads and executes `SKILL.md` instructions | AI agent, LLM, assistant |
| **University Adapter** | The entry-point skill that auto-detects a user's university from PDFs, URLs, or descriptions and routes to the correct universal skill | Adapter, detection skill |

## Skill Architecture

| Term | Definition | Aliases to avoid |
|------|------------|-----------------|
| **Universal Skill** | A skill designed to work with ANY university worldwide, not just SPPU — auto-adapts via syllabus/PYQ input | Global skill, cross-university skill |
| **Skill Registry** | The XML `<available_skills>` block in `AGENTS.md` that lists all skills for agent auto-discovery | Registry, agent manifest |
| **Frontmatter** | YAML metadata block at the top of each `SKILL.md` containing `name`, `description`, and trigger conditions | Metadata, header |
| **Trigger Condition** | The natural language criteria that tell an agent when to load a particular skill | Activation rule, trigger |

## Exam Domain

| Term | Definition | Aliases to avoid |
|------|------------|-----------------|
| **PYQ** | Previous Year Question Paper — past exam papers used for pattern analysis and topic prediction | Past paper, old question paper, previous paper |
| **IMP Topics** | Important topics — high-probability exam topics ranked by likelihood of appearance, calculated from PYQ analysis | Important questions, must-prepare topics, high-weightage topics |
| **Bloom's Level** | A six-level cognitive taxonomy (L1 Remember through L6 Create) that determines answer depth and structure | Bloom's taxonomy, cognitive level, L1–L6 |
| **CO** | Course Outcome — a measurable learning objective for a university subject (e.g., CO1 through CO6) | Course outcome, learning outcome |
| **CO-PO Mapping** | The matrix showing correlation between Course Outcomes and Program Outcomes (3=High, 2=Medium, 1=Low) | CO-PO matrix, outcome mapping |
| **Command Word** | The instruction verb in an exam question (Define, Explain, Compare, Solve, Design, etc.) that determines answer format | Instruction word, directive, question verb |
| **Exam Pattern** | The structural format of a university's question paper — unit distribution, mark allocation, OR pairs, duration | Paper pattern, exam format, university pattern |
| **OR Pair** | A choice in the question paper where students answer one of two questions (common in SPPU and Indian university patterns) | Alternative pair, OR/AE, AE pair |
| **Mark Level** | The number of marks assigned to a question, which determines depth and number of points required | Marks, weightage, point value |

## Students & Learning

| Term | Definition | Aliases to avoid |
|------|------------|-----------------|
| **Active Recall** | A learning method where students actively retrieve information from memory rather than passively rereading | Retrieval practice, testing effect |
| **Spaced Repetition** | A review schedule with increasing intervals (D1 → D2 → D4 → D8 → D16) to optimize long-term retention | SRS, spaced review, Leitner system |
| **SRS** | Spaced Repetition System — metadata embedded in flashcards for optimal review timing | Spaced repetition system |
| **Note Format** | A structured way of organizing notes — Cornell, Outline, Mind Map, Flowchart, Q&A, Rapid Revision, Cheat Sheet, etc. | Note style, study format, revision format |
| **Cram Plan** | An ultra-compressed study plan for emergency timeframes (12h, 6h, 3h, 1h) using rapid memory encoding | Emergency plan, last-minute plan |

## System Components

| Term | Definition | Aliases to avoid |
|------|------------|-----------------|
| **Exam Simulator** | A companion skill that models real exam hall constraints — answer book page limits, writing speed, examiner psychology | Simulator, physical exam model |
| **Gemini Gem** | One-click deployment of a skill as a Google Gemini Gem — no setup, no PROMPT.md paste required | Gem, Gemini deployment |
| **D2 Diagram** | Architecture diagram rendered from `.d2` source files using the `d2` CLI with `elk` layout — auto-rendered via GitHub Actions | D2 source, architecture SVG |
| **Session Profile** | A persistent JSON configuration (`~/.exam-prompt/profile.json`) storing university, subject, exam pattern, and user preferences | Config profile, session config, user profile |
| **Skill Directory** | The `skills/` directory containing all 24 `SKILL.md` files, one per exam task | Skills folder, skill modules |

## Relationships

- A **Skill** is loaded by an **Agent** when a **Trigger Condition** is met
- An **IMP Topic** is generated by the `imp-topics-generator` skill from **PYQ** analysis output
- **PYQs** are analyzed by the `pyq-analyzer` skill to generate **IMP Topics** and exam strategy
- A **Cram Plan** uses rapid memory encoding (memory palace, chunking, peg system, acronym chains)
- **Note Formats** are auto-selected by the `notes-generator` skill based on subject type, exam conditions, and time available
- The **University Adapter** detects the **Exam Pattern** and routes to the correct **Universal Skill**
- A **Session Profile** is shared across all skills to eliminate redundant context detection

## Example dialogue

> **Student:** "I have my DBMS exam in 3 days. Give me IMP topics with a quick plan."
> **Agent:** "Let me first load the **PYQ Analyzer** to scan your past papers for frequency patterns, then I'll use the **IMP Topics Generator** to rank topics by **Bloom's Level** and provide a **Cram Plan**."
> **Student:** "Can you also generate Cornell-format notes for the top topics?"
> **Agent:** "Yes — I'll auto-select the **Cornell format** since you have 3 days (medium timeframe) for a theory-heavy subject. Each topic gets a **Cue Column** for **Active Recall** and a **Spaced Repetition** schedule."

## Flagged ambiguities

- "Skill" was used to mean both a `SKILL.md` file AND the AI's general competency — in this project, **Skill** always refers to the `SKILL.md` file in `skills/<name>/`
- "Pattern" was used interchangeably with "exam format" and "university pattern" — **Exam Pattern** is the canonical term
- "Notes" was used for both the `notes-generator` skill output and general study material — formalize as **Note Format** for the output and "study material" for general content
- "IMP" is used both as an adjective (important) and as a noun (the `imp-topics-generator` skill) — the skill is always referred to as **IMP Topics Generator**
