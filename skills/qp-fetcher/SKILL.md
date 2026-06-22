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

### If LLM Web Search Fails (any non-SPPU university)

If the LLM cannot find enough PYQs on the web after reasonable searching, ask the user for:

| What to ask for | Why | What LLM does with it |
|----------------|-----|-----------------------|
| **PDF attachments** | User may have scanned/downloaded papers | LLM reads PDF directly, extracts questions |
| **A directory path** | User may have a local PYQ collection | LLM scans directory for PDFs, reads each one |
| **An internet link** | User may know a repository/portal URL | LLM fetches page, finds and extracts papers |
| **Any other format** | Whatever the user has | LLM adapts and converts to structured markdown |

Then retry the original task with the user-provided material.

### SPPU Internet Sources

These are the **known working sources** for SPPU question papers. LLM should search these in order
until enough papers are found.

> ⚠️ **Links change every exam season.** SPPU creates new folders per exam period on all sites.
> If a URL 404s, try the next source or search for the current exam period's folder.
> **Always update these instructions** when you discover new URLs or find broken ones.

| # | Source | URL Pattern | Best For |
|---|--------|-------------|----------|
| 1 | **SPPU Official Portal ⭐** | `http://collegecirculars.unipune.ac.in/sites/examdocs/{PERIOD}/Forms/AllItems.aspx` | **Only official source.** Merged PDFs per exam season (all branches in one file), End Sem only, 2019 & 2024 pattern |
| 2 | **SPPU Question Papers** | `https://sppuquestionpapers.com/be/{branch}/semester-{N}` | Per-semester papers for all branches |
| 3 | **SPPU QP Mirror** | `https://sppuquestionpaper.page.gd/program/be/` | Direct PDF links, mirror of #2 |
| 4 | **SPPU Study Hub** | `https://www.sppustudyhub.in/` | Notes + question papers |
| 5 | **Last Moment Tuitions** | `https://lastmomenttuitions.com/sppu/question-papers/` | Per-branch, per-year papers |
| 6 | **GitHub (Sppuqp)** | `https://github.com/pinakdhabu/Sppuqp` | Merged PDFs (FE, SE, TE, BE), Google Drive mirror |
| 7 | **KSKA Git (Gitea)** | `https://git.kska.io/sppu-te-comp-content/` | Per-subject organized repos with solved papers |
| 8 | **Filo** | `https://askfilo.com/higher-education/savitribai-phule-pune-university/` | PYQ solutions with answers |
| 9 | **Collegedunia** | `https://collegedunia.com/university/25732-savitribai-phule-pune-university-sppu-pune` | Old exam papers index |

#### Official SPPU Portal — Dynamic URL Discovery

**Don't hardcode folder names.** They change every exam season. Instead, **discover dynamically:**

```
http://collegecirculars.unipune.ac.in/sites/examdocs/
```

**Step 1 — Browse the site structure:**
Fetch the base URL above. The SharePoint sidebar lists all available libraries. Look for:
- `Archive Question Papers` section — these are the QP folders
- `Time Tables {SEASON} {YEAR}` — timetable folders (each exam season gets a new one)
- Each archive folder is named after its exam period (e.g., `APRIL - 2025`, `November - 2024`)

**Step 2 — Derive the folder URL pattern:**
```
http://collegecirculars.unipune.ac.in/sites/examdocs/{FOLDER_NAME}/Forms/AllItems.aspx
```
URL-encode spaces in folder names. Common encoding patterns seen:
- `APRIL - 2025` → `APRIL%20%202025` (double space after month)
- `November - 2024` → `November%20-%202024`
- `April-2024` → `April2024` (no encoding needed)

Try multiple encodings if the first fails. **The site is inconsistent year-to-year.**

**Step 3 — Download PDFs using the known pattern:**
Each period folder contains merged all-branch PDFs named by year level:
```
{PERIOD_URL}/{YEAR_LEVEL} ({PATTERN} PATTERN).pdf
```
- `YEAR_LEVEL` = `F.E`, `S.E`, `T.E`, or `B.E`
- `PATTERN` = `2019 PATTERN` or `2024 PATTERN`

Try: `S.E%20(2019%20PATTERN).pdf`, `T.E%20(2019%20PATTERN).pdf`, `B.E%20(2019%20PATTERN).pdf`,
`F.E%20(2019%20PATTERN).pdf`, `F.E%20(2024%20PATTERN).pdf`, etc.

**Step 4 — Timetables (same dynamic approach):**
```
http://collegecirculars.unipune.ac.in/sites/examdocs/Time%20Tables%20{SEASON}%20{YEAR}/Forms/AllItems.aspx
```
Current/known patterns: `APRMAY`, `OCT/NOV`, `MAR/APR` + year. Browse sidebar to find latest.

**Limitations of official portal:**
- Only **End Semester** papers (no In Sem)
- PDFs are **large merged files** (all branches in one PDF — use Ctrl+F to find your subject)
- Requires navigating a SharePoint UI (not always easy to scrape)
- Folder naming is inconsistent (spaces, hyphens, URL encoding vary per year)

#### LLM process for each source:
1. Search the URL with the subject name
2. If the page lists individual paper links, open each link and read the PDF directly
3. Extract question text, marks, exam type from the PDF
4. If direct PDF reading fails, search for the same paper on another source
5. Write collected questions as structured markdown

#### Branch slug mapping for sppuquestionpapers.com:
```
computer-engineering, entc, mechanical-engineering, civil-engineering,
electrical-engineering, information-technology
```

#### Semester URL pattern:
`https://sppuquestionpapers.com/be/{branch}/semester-{N}` (N = 1-8)

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

### SPPU Hyperawareness — All Official Portals

For SPPU, the LLM must be aware of all these portals and use them dynamically. Links change every
exam/syllabus season — always discover dynamically by browsing the base site.

**Base domains:**
- `http://collegecirculars.unipune.ac.in/` — Timetables, exam docs, syllabi, academic calendar
- `http://onlineresults.unipune.ac.in/` — Result checking portals
- `https://unipune.ac.in/` — Main university website
- `https://exam.unipune.ac.in/Pages/PreviousQuestionPapers.html` — Alternative QP official source
- `https://sppuresult.vercel.app/` — Community result viewer (fetches live from SPPU)

**Syllabus archives (dynamic discovery):**
Browse `http://collegecirculars.unipune.ac.in/sites/documents/` sidebar → `Syllabus {YEAR}` folders.
Pattern: `http://collegecirculars.unipune.ac.in/sites/documents/Syllabus%20{YEAR}/Forms/AllItems.aspx`
or `.../Syllabus{YEAR}/Forms/AllItems.aspx` (encoding varies). Available years: 2016–2026.

**What to do when user asks about SPPU:**
1. Check `pyq-index/` for existing markdown first
2. If QPs needed → use dynamic discovery on official portal (`collegecirculars.unipune.ac.in`)
3. If results needed → use `sppuresult.vercel.app` or `onlineresults.unipune.ac.in`
4. If syllabus needed → browse collegecirculars syllabi folders
5. If timetables needed → browse `Time%20Tables%20{SEASON}%20{YEAR}/` on examdocs
6. If revaluation needed → `unipune.ac.in/university_files/Reval_Online_Results_online.htm`
7. If academic calendar needed → `collegecirculars.unipune.ac.in/sites/documents/Academic%20Calender/`
8. If circulars needed → `collegecirculars.unipune.ac.in/SitePages/Home.aspx`
9. If QP alternative needed → `exam.unipune.ac.in/Pages/PreviousQuestionPapers.html`
10. Always write back to `pyq-index/` for future offline use

**⚠️ All URLs above can change.** If a link fails, browse the parent site to find the new location.

### For other universities:
Same approach — LLM dynamically discovers portals by searching:
`"{university}" syllabus`, `"{university}" exam timetable`, `"{university}" result portal`,
`"{university}" question papers`, `"{university}" academic calendar`
If not found → ask user for links/files.

---

### Option B: Generate University-Style Question Paper

When the user says "Generate a question paper for [subject]", the AI generates a question paper
matching the **Real QP Style Reference** section below (PDF analysis of 200+ actual SPPU QPs):

1. **Page Layout**: A4, margins ~70pt left/right, ~56pt top, ~60pt bottom (matching real QPs)
2. **Header**: Paper code + SEAT No. + pages on first line, centered paper number/program/subject
3. **Exam Details**: Time on left, Max Marks on right, proper instruction set as seen in real QPs
4. **Question Structure**: OR pairs with (a)+(b)+(c) format, marks in brackets
5. **Mark Distribution**: Unit-wise as per SPPU pattern
6. **CO/Bloom Mapping**: Each question tagged with CO and Bloom's level
7. **Typography**: ALL CAPS for subject, brackets for marks, bold for headings

---

## Supported Patterns

| Pattern            | Level     | Units                   | OR Pairs          | Total Marks | Time    |
| ------------------ | --------- | ----------------------- | ----------------- | ----------- | ------- |
| **SPPU 2019**      | SE/TE/BE  | 6 units (U3-U6 for ESE) | 4 pairs           | 70          | 2.5 hrs |
| **SPPU 2024**      | FE        | 5 units                 | 5 pairs (M1/M2)   | 70          | 2.5 hrs |
| **SPPU 2024**      | FE        | 5 units                 | 5 pairs (no comp) | 70          | 2.5 hrs |
| **SPPU 2015**      | SE/TE/BE  | 8 units                 | 4 pairs           | 70          | 3 hrs   |
| **SPPU 2012**      | SE/TE/BE  | 8 units                 | 4 pairs           | 70          | 2.5 hrs |

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

When generating a question paper (not fetching), replicate the **exact visual style** of real SPPU
question papers. The generated markdown should be structured so that when rendered to PDF, it matches
the official layout properties documented below.

### Real QP Style Reference (from 200+ VL + FE Computer Engineering PDFs)

These properties were extracted via `pdfminer`/`pdf2txt.py` + `pdftotext` analysis of representative
samples across FE/SE/TE/BE and 2012/2015/2019/2024 patterns. Use this as the authoritative style
guide.

**Page Properties:**

| Property              | FE/SE/TE/BE 2019 & 2015 Pattern   | BE 2012 Pattern          | SE 2012 Pattern           | FE 2024 Pattern (normalized) |
|-----------------------|------------------------------------|--------------------------|---------------------------|------------------------------|
| Page size             | A4 (595.3×841.9 pt / 8.27×11.69″) | A4 (595.3×841.9 pt)     | Letter (612×792 pt)       | A4 (595.3×841.9 pt)          |
| Left margin           | ~70.8 pt (~1″)                     | ~70.8 pt                 | ~86.5 pt                  | ~70.8 pt                     |
| Right margin          | ~48.1 pt                           | ~48.1 pt                 | varies                    | ~48.1 pt                     |
| Top margin            | ~56.3 pt                           | ~56.3 pt                 | ~114.6 pt                 | ~56.3 pt                     |
| Bottom edge           | ~59–63 pt                          | ~62.9 pt                 | ~194.5 pt                 | ~59–63 pt                    |
| Text area             | ~476 × 723 pt                      | ~476 × 723 pt            | varies                    | ~476 × 723 pt                |
| Paper code format     | `PC####` (no hyphen, e.g. PC1675)  | `P####` (e.g. P3220)    | —                         | `PC-####` or `PD####`        |
| Paper number format   | `[XXXX]-XXX` (e.g. [6352]-35)      | `[XXXX]-XXX`            | —                         | `[XXXX]-XXX` or `[XXXX]-XXXX` |
| Creator               | Adobe PageMaker 7.0                | — (Microsoft Print)     | PDFCreator 1.7.1          | Adobe PageMaker 7.0 / cairo 1.18.4 |
| Producer              | Acrobat Distiller 11.0 + iTextSharp 5.5.9 | iTextSharp 5.5.9 | GPL Ghostscript 9.07 + iTextSharp 5.2.1 | Acrobat Distiller 11.0 / cairo 1.18.4 |

**Note on FE 2024 Pattern:** Normalized to **A4** (same layout as 2019 SE/TE/BE pattern) for
generation. Original source PDFs used Letter (PageMaker) or non-standard 560×792 pt (cairo), but A4
production is the target. Paper code format varies: `PC-####` / `[6351]-XXX` (PageMaker variant, Nov
2024) or `PD####` / `[6401]-XXXX` (cairo variant, April 2025).

**Common Layout Elements (all patterns):**
```
[Left-aligned header]                           [Right-aligned header]
Total No. of Questions : N]                     SEAT No. : [number]
[Paper Code]                                    [Total No. of Pages : N]

           [Paper Number] e.g., [6352]-35
           [Program Name] e.g., S.E. (Computer Engineering)
           [SUBJECT NAME IN ALL CAPS]
           (Pattern) (Semester) (Subject Code)

Time : [X] Hours]                               [Max. Marks : XX]

Instructions to the candidates:
  1) [Instruction 1]
  2) [Instruction 2]
  ...

[Question body with marks in brackets]
```

**Typographic Rules:**
- Paper number like `[6352]-35` — **bold**, centered, larger than body
- Subject name — **ALL CAPS**, bold
- Pattern/semester info — in **parentheses**, regular weight
- Time and marks — **bold**, same line, left/right justified
- Instructions — numbered with `)`, indent 3 spaces
- Question numbers — **bold** like `**Q1)**` or `**Q.1**`
- Sub-question labels — lowercase `a)` `b)` `c)`, bold, indent
- Marks — in `[N]` brackets after question text, right-aligned or inline
- OR separator — `**OR**` centered on its own line

**Mark Structure (SPPU 2019 Pattern):**
- End Sem: 70 marks, 2.5 hrs, 8 questions (4 OR pairs), single compulsory at Q.1
- In Sem: 30 marks, 1 hr, 3 questions (all compulsory)
- Each question: 2–3 sub-questions with marks [2]–[8] each

**Question body format:**
```
**Q1)** State the following with justification.                      [6]
    a) [statement]                                                   [2]
    b) [statement]                                                   [2]
    c) [statement]                                                   [2]

**OR**

**Q2)** a) [question text]                                            [6]
        b) [question text]                                            [6]
        c) [question text]                                            [6]
```

### Generation Templates

Use the following markdown templates when generating question papers. The template aligns with the
official PDF layout above.

**Outer box header** (for visual rendering or markdown-to-PDF conversion):
```markdown
╔══════════════════════════════════════════════════════════════╗
║              SAVITRIBAI PHULE PUNE UNIVERSITY               ║
║                                                              ║
║     [Subject Code]: [Subject Name]                           ║
║     [Program] ([Pattern]) ([Semester])                      ║
║                                                              ║
║  Time: [X] Hours                  Total Marks: [XX]         ║
╚══════════════════════════════════════════════════════════════╝
```

**Inner header** (for inclusion in a larger document):
```markdown
Total No. of Questions : [N]                  SEAT No. :

         **[Paper Number]**
         **[Program Name]**
         **[SUBJECT NAME]**
         ([Pattern]) ([Semester]) ([Subject Code])

Time : [X] Hours]                             [Max. Marks : XX]

**Instructions to the candidates:**
  1) [instruction]
  2) [instruction]
```

**Question body (8 questions, 4 OR pairs — 2019 pattern):**
```markdown
**Q1)** [Question text]                                              [M]
    a) [sub-question]                                                [m]
    b) [sub-question]                                                [m]
    c) [sub-question]                                                [m]

**OR**

**Q2)** a) [sub-question]                                             [m]
        b) [sub-question]                                             [m]
        c) [sub-question]                                             [m]

**Q3)** ... (same pattern)

...through Q8.
```

**Question body (10 questions, 5 OR pairs — 2024 pattern):**
Same as above but 5 OR pairs (Q1/Q2, Q3/Q4, Q5/Q6, Q7/Q8, Q9/Q10).

**Question body (10 questions, 5 OR pairs — 2015 pattern):**
10 questions, 5 OR pairs, 3 hrs duration. Same format.

**Question body (8 questions, 4 OR pairs — 2012 pattern):**
8 questions, 4 OR pairs, 2.5 hrs. Note: SE 2012 may have different formatting; verify against
actual PDFs if available.

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
