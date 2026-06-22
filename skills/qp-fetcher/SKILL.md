---
name: universal-qp-fetcher
description: >
  Fetches real question papers for ANY university worldwide via AI web search, or generates
  university-style question papers with proper formatting. Uses LLM web search as the primary method
  (no single-site dependency, works for any university). Falls back to automated scripts for SPPU.
  Supports ALL universities, ALL branches, ALL patterns, ALL semesters.
---

# Universal QP Fetcher & Generator

## Overview

This skill provides two capabilities:

1. **Fetch**: Discovers and structures real question papers via LLM web search (primary) or
   automated download scripts (fallback for SPPU)
2. **Generate**: Creates university-style question papers with proper formatting, instructions,
   OR structure, CO mapping, Bloom's levels

Works for ANY university worldwide, ANY branch, ANY semester.

---

## How It Works

### Option A (PRIMARY): LLM Web Search → Structured Markdown

Use the LLM's web search capability to discover question papers for any subject/university. This
is the recommended approach — no single-site dependency, works for any university globally.

**Process:**
1. LLM searches the web for question papers matching: `"{subject}" "{university}" question paper {year}`
2. Also searches university portals, educational sites, and PYQ repositories
3. Extracts actual question text from search results (no PDF downloads needed)
4. Writes structured markdown to the project's PYQ index

**Output format** (`pyq-index/{university-slug}/{subject-slug}.md`):

```markdown
---
subject: Database Management Systems
university: Savitribai Phule Pune University
pattern: 2019
collected: 2026-06-22
sources:
  - type: web
    url: https://example.com/pyq/dbms-2024
  - type: web
    url: https://example.com/pyq/dbms-2023
---

# DBMS — Previous Year Question Papers (SPPU 2019 Pattern)

## End Semester Examination

### April 2024
**Total Marks: 70 | Time: 2.5 hrs**

**Q.1** Explain DBMS architecture with neat diagram. (10M)
**Q.2** a) What is normalization? Explain 3NF and BCNF with examples. (8M)
       b) Write SQL queries for given relational schema. (7M)
...

### November 2023
...

## In Semester Examination

### October 2023
**Total Marks: 30 | Time: 1 hr**

**Q.1** ...
```

**Search strategy per university type:**

| University Type        | Recommended Search Queries                                                              |
|------------------------|-----------------------------------------------------------------------------------------|
| **SPPU / Pune**        | See "SPPU Internet Sources" section below                                                |
| **VTU**                | `"{subject}" "VTU" "question paper"` or `site:vturesults.com {subject}`                |
| **JNTU**               | `"{subject}" "JNTU" "question paper"` or `site:jnturesults.com {subject}`              |
| **Mumbai University**  | `"{subject}" "Mumbai University" "question paper"`                                     |
| **IITs / NITs**        | `"{subject}" "IIT {name}" "exam paper"`                                                |
| **US/UK Universities** | `"{subject}" "past exam papers" "{university}"`                                        |
| **Generic**            | `"{subject}" "previous year question paper" "{year}"` then extract university from page |

### SPPU Internet Sources

These are the **known working sources** for SPPU question papers. LLM should search these in order
until enough papers are found:

| # | Source | URL Pattern | Best For |
|---|--------|-------------|----------|
| 1 | **SPPU Question Papers** | `https://sppuquestionpapers.com/be/{branch}/semester-{N}` | Per-semester papers for all branches |
| 2 | **SPPU QP Mirror** | `https://sppuquestionpaper.page.gd/program/be/` | Direct PDF links, mirror of #1 |
| 3 | **Official SPPU Portal** | `http://collegecirculars.unipune.ac.in/sites/examdocs/` | Official merged PDFs per exam season |
| 4 | **SPPU Study Hub** | `https://www.sppustudyhub.in/` | Notes + question papers |
| 5 | **Last Moment Tuitions** | `https://lastmomenttuitions.com/sppu/question-papers/` | Per-branch, per-year papers |
| 6 | **GitHub (Sppuqp)** | `https://github.com/pinakdhabu/Sppuqp` | Merged PDFs (FE, SE, TE, BE) |
| 7 | **KSKA Git (Gitea)** | `https://git.kska.io/sppu-te-comp-content/` | Per-subject organized repos with solved papers |
| 8 | **Filo** | `https://askfilo.com/higher-education/savitribai-phule-pune-university/` | PYQ solutions with answers |
| 9 | **Collegedunia** | `https://collegedunia.com/university/25732-savitribai-phule-pune-university-sppu-pune` | Old exam papers index |

**LLM process for each source:**
1. Search the URL with the subject name
2. If the page lists individual paper links, open each link and read the PDF directly
3. Extract question text, marks, exam type from the PDF
4. If direct PDF reading fails, search for the same paper on another source
5. Write collected questions as structured markdown

**Branch slug mapping for sppuquestionpapers.com:**
```
computer-engineering, entc, mechanical-engineering, civil-engineering,
electrical-engineering, information-technology
```

**Semester URL pattern:** `https://sppuquestionpapers.com/be/{branch}/semester-{N}` (N = 1-8)

### Option B (FALLBACK): Automated Scripts (SPPU only)

If web search fails or SPPU-specific batch downloads are needed, use the automated fetcher:

```bash
# Fetch all available DBMS question papers
node scripts/fetch-qp.js dbms

# Fetch DBMS papers from 2024 only
node scripts/fetch-qp.js dbms --year 2024

# Fetch all Semester 5 Computer Engineering papers
node scripts/fetch-qp.js --semester 5
```

### Option B: Generate University-Style Question Paper

When the user says "Generate a question paper for [subject]", the AI generates a properly formatted
question paper using the official SPPU pattern with:

1. **University Header**: SPPU logo placeholder, subject code, subject name, program, semester,
   pattern
2. **Exam Details**: Time, Max Marks, proper instruction set
3. **Question Structure**: OR pairs with (a)+(b) or (a)+(b)+(c) format
4. **Mark Distribution**: Unit-wise as per SPPU pattern
5. **CO/Bloom Mapping**: Each question tagged with CO and Bloom's level
6. **Proper Typography**: Monospace for code, serif for body, bold for headings

---

## Supported Patterns

| Pattern       | Units                   | OR Pairs | Total Marks | Time    |
| ------------- | ----------------------- | -------- | ----------- | ------- |
| **SPPU 2019** | 6 units (U3-U6 for ESE) | 4 pairs  | 70          | 2.5 hrs |
| **SPPU 2024** | 5 units                 | 5 pairs  | 70          | 2.5 hrs |
| **SPPU 2015** | 8 units                 | 4 pairs  | 70          | 3 hrs   |

---

## Website Structure

The QP fetcher scrapes question papers from `sppuquestionpapers.com`:

```
https://sppuquestionpapers.com/
├── /be/                         # Bachelor of Engineering
│   ├── /computer-engineering/
│   │   ├── /semester-3          # SE Sem III papers
│   │   ├── /semester-4          # SE Sem IV papers
│   │   ├── /semester-5          # TE Sem V papers
│   │   ├── /semester-6          # TE Sem VI papers
│   │   ├── /semester-7          # BE Sem VII papers
│   │   └── /semester-8          # BE Sem VIII papers
│   ├── /entc/
│   ├── /mechanical-engineering/
│   ├── /civil-engineering/
│   ├── /electrical-engineering/
│   └── /information-technology/
├── /me/                         # Master of Engineering
├── /mca/                        # MCA
├── /bsc/                        # B.Sc.
└── /bcom/                       # B.Com.
```

Each page lists subjects with Year, Month, and Download buttons.

---

## Subject Aliases

The fetcher supports fuzzy subject matching:

| Alias         | Full Name                                |
| ------------- | ---------------------------------------- |
| dbms, dms     | Database Management Systems              |
| toc, tc       | Theory of Computation                    |
| spos, sp&os   | Systems Programming and Operating System |
| cns, cn       | Computer Network and Security            |
| ai            | Artificial Intelligence                  |
| dsbda, ds&bda | Data Science and Big Data Analytics      |
| wt            | Web Technology                           |
| daa           | Design and Analysis of Algorithms        |
| ml            | Machine Learning                         |
| dl            | Deep Learning                            |
| hpc           | High Performance Computing               |
| blockchain    | Blockchain Technology                    |
| hci           | Human Computer Interface                 |
| iot, es&iot   | Internet of Things and Embedded Systems  |
| cc            | Cloud Computing                          |
| is            | Information Security                     |
| m3            | Engineering Mathematics III              |
| dsa           | Data Structures and Algorithms           |
| se            | Software Engineering                     |
| mp            | Microprocessor                           |
| ppl           | Principles of Programming Languages      |
| cg            | Computer Graphics                        |
| deld          | Digital Electronics and Logic Design     |
| dm            | Discrete Mathematics                     |
| fds           | Fundamentals of Data Structures          |
| oop           | Object Oriented Programming              |

---

## Question Paper Generation Format

When generating a question paper (not fetching), use this format:

```
╔══════════════════════════════════════════════════════════════╗
║              SAVITRIBAI PHULE PUNE UNIVERSITY               ║
║                                                              ║
║     [Subject Code]: [Subject Name]                           ║
║     B.E. ([Branch]) ([Semester]) ([Pattern])                ║
║                                                              ║
║  Time: [X] Hours                    Max. Marks: [XX]        ║
╚══════════════════════════════════════════════════════════════╝

Instructions:
  1) Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8.
  2) Neat diagrams must be drawn wherever necessary.
  3) Figures to the right indicate full marks.
  4) Assume suitable data, if necessary. (If applicable)
```

Then continue with 8 questions (4 OR pairs) following the SPPU 2019 pattern or 10 questions (5 OR
pairs) for SPPU 2024 pattern.

---

## Session Config

This skill integrates with the session config system (`deps/session-profile.json`). Before
executing, check for an existing session profile:

- If `deps/session-profile.json` exists, read `university`, `subject`, `pattern`, and `exam_type`
  fields to auto-configure the skill.
- If the file does not exist, fall back to user-provided context or prompt the user to run
  `setup-exam-prompt` (or `npm run init`) first.
- Session config eliminates redundant context detection — detection happens once and is reused
  across all skill calls.

---

## Integration with Other Skills

| Skill                              | Integration                                               |
| ---------------------------------- | --------------------------------------------------------- |
| **universal-a-plus-answer-writer** | Use fetched QPs as source material for answer generation  |
| **universal-pyq-analyzer**         | Supply downloaded PYQs for analysis                       |
| **universal-exam-paper-generator** | Use fetched papers as reference for generating new papers |
| **universal-imp-topics-generator** | Analyze fetched PYQs to predict important topics          |

---

## Prerequisites

- Node.js 18+ (primary runtime)
- Playwright + Chromium (`npx playwright install chromium`)
- Internet connection (for fetching)
- Run `bash scripts/setup.sh` to install all dependencies automatically
