---
name: sppu-pyq-index
description: >
  Complete index of SPPU Previous Year Question Paper collection (2019–2025) across all Computer
  Engineering subjects. Organized as LLM-collected structured markdown files. Use this skill to find
  PYQ data for any SPPU Computer Engineering subject.
---

# SPPU PYQ Collection Index

## Overview

This index provides Previous Year Question Papers for **SPPU Computer Engineering** (2019–2025)
via two methods:

1. **LLM Web Search → Structured Markdown (PRIMARY)** — AI agent searches the web, extracts
   questions, writes `.md` files to `pyq-index/{subject}/`. No site dependency, clean text, any
   university.
2. **Automated Fetch Script (FALLBACK, SPPU-only)** — `node scripts/fetch-qp.js` downloads PDFs
   to `pyq-downloads/` from sppuquestionpapers.com.

**Coverage:** 2019–2025 | **Patterns:** 2019 & 2024

**PYQ Sources (in priority order):**

| Priority | Type                           | Location                      | Contents                                    |
| -------- | ------------------------------ | ----------------------------- | ------------------------------------------- |
| 1        | **LLM-collected markdown**     | `pyq-index/{subject}/*.md`    | Structured questions (web-scraped by LLM)   |
| 2        | **University PYQ dir**         | `universities/<UNIV>/PYQs/`   | Per-university organized PDFs               |
| 3        | **Project downloads**          | `pyq-downloads/`              | Fetched via automated scripts (SPPU)        |

---

## LLM-Collection: How It Works

When PYQs are needed for a subject, the AI agent:

1. **Searches the web** for question papers using queries like:
   - `"{subject}" "SPPU" "question paper" {year}`
   - `site:sppuquestionpapers.com {subject}`
   - `"{subject}" "Pune University" "previous year"`
   - `"{subject}" "previous year question paper" filetype:pdf`

2. **Finds and reads PDFs** found on the web — uses its browser/pdf-reading capability to extract
   question text directly (no local OCR needed)

3. **Extracts questions** — parses question text, marks, exam type from the PDFs

4. **Writes structured markdown** to `pyq-index/{subject-slug}/`:

```
pyq-index/
├── INDEX.md                            # Master index (this file)
├── database-management-systems/
│   ├── README.md                       # Subject metadata, pattern info
│   ├── end-sem-april-2024.md           # One paper per file
│   ├── end-sem-november-2023.md
│   └── in-sem-october-2024.md
├── theory-of-computation/
│   └── ...
└── machine-learning/
    └── ...
```

**Markdown format for each paper:**

```markdown
# {Subject} — {Exam Type} ({Month} {Year})

**Pattern:** {Pattern} | **Total Marks:** {Marks} | **Time:** {Hours} hrs

## Q.1
a) {Question text} [{Marks}]
b) {Question text} [{Marks}]
**OR**

## Q.2
a) {Question text} [{Marks}]
b) {Question text} [{Marks}]

## Q.3
...
```

**Advantages:**
- No dependency on a specific website staying up
- Works for ANY university, not just SPPU
- Results are clean structured text — no OCR pipeline needed
- LLM can aggregate from multiple web sources
- Once written, files work offline

### SPPU Internet Sources

These are the **known working sources** for SPPU question papers. Search them in order:

| # | Source | URL | Best For |
|---|--------|-----|----------|
| 1 | **SPPU Question Papers** | `https://sppuquestionpapers.com/be/{branch}/semester-{N}` | Per-semester papers |
| 2 | **SPPU QP Mirror** | `https://sppuquestionpaper.page.gd/program/be/` | Direct PDF links |
| 3 | **Official SPPU Portal** | `http://collegecirculars.unipune.ac.in/sites/examdocs/` | Merged official PDFs per exam season |
| 4 | **SPPU Study Hub** | `https://www.sppustudyhub.in/` | Notes + question papers |
| 5 | **Last Moment Tuitions** | `https://lastmomenttuitions.com/sppu/question-papers/` | Per-branch papers |
| 6 | **GitHub (Sppuqp)** | `https://github.com/pinakdhabu/Sppuqp` | Merged PDFs (FE through BE) |
| 7 | **KSKA Git (Gitea)** | `https://git.kska.io/sppu-te-comp-content/` | Per-subject repos + solved papers |
| 8 | **Filo** | `https://askfilo.com/higher-education/savitribai-phule-pune-university/` | PYQ with answer solutions |
| 9 | **Collegedunia** | `https://collegedunia.com/university/25732-savitribai-phule-pune-university-sppu-pune` | Old papers index |

**LLM process:**
1. Pick source from table, search with subject name + exam type
2. Open paper links, read PDFs directly via browser capability
3. Extract question text, marks, exam type from each paper
4. Try next source if a specific paper isn't found
5. Write all collected papers as structured markdown

---

## PYQ Coverage Per Subject

### SE (Second Year) — Sem III

| Subject                                | End Sem Papers                               | In Sem Papers  |
| -------------------------------------- | -------------------------------------------- | -------------- |
| **Computer Graphics**                  | April 22, 23, 24, 25; Nov 22, 23, 24         | Oct 22, 23, 24 |
| **Digital Electronics & Logic Design** | April 22, 23, 24, 25; Nov 22, 23, 24; Oct 23 | Oct 22, 23, 24 |
| **Discrete Mathematics**               | April 22, 23, 24, 25; Nov 22, 23, 24         | Oct 22, 23, 24 |
| **Fundamentals of Data Structures**    | April 22, 23, 24, 25; Nov 22, 23, 24         | Oct 23, 24     |
| **Object Oriented Programming**        | April 22, 23, 24, 25; Nov 22, 23, 24         | Oct 22, 23, 24 |

### SE (Second Year) — Sem IV

| Subject                           | End Sem Papers                       | In Sem Papers  |
| --------------------------------- | ------------------------------------ | -------------- |
| **Data Structures & Algorithms**  | April 22, 23, 24, 25; Nov 22, 23, 24 | Mar 23, 24, 25 |
| **Engineering Mathematics III**   | April 22, 23, 24, 25; Nov 22, 23, 24 | Mar 23, 24, 25 |
| **Microprocessor**                | April 22, 23, 24, 25; Nov 22, 23, 24 | Mar 23, 24, 25 |
| **Principles of Prog. Languages** | April 22, 23, 24, 25; Nov 22, 23, 24 | Mar 23, 24, 25 |
| **Software Engineering**          | April 22, 23, 24, 25; Nov 22, 23, 24 | Mar 23, 24, 25 |

### TE (Third Year) — Sem V

| Subject                             | End Sem Papers                       | In Sem Papers              |
| ----------------------------------- | ------------------------------------ | -------------------------- |
| **Computer Networks & Security**    | April 22, 23, 24, 25; Nov 22, 23, 24 | Oct 22; Sep 24, 25; Aug 25 |
| **Database Management Systems**     | April 22, 23, 24, 25; Nov 22, 23, 24 | Oct 22; Sep 23, 24; Aug 25 |
| **System Prog. & Operating System** | April 22, 23, 24, 25; Nov 22, 23, 24 | Oct 22; Sep 23, 24; Aug 25 |
| **Theory of Computation**           | April 22, 23, 24, 25; Nov 22, 23, 24 | Oct 22; Sep 23, 24; Aug 25 |

### TE (Third Year) — Sem VI

| Subject                               | End Sem Papers                       | In Sem Papers  |
| ------------------------------------- | ------------------------------------ | -------------- |
| **Artificial Intelligence**           | April 22, 23, 24, 25; Nov 22, 23, 24 | Mar 23, 24, 25 |
| **Data Science & Big Data Analytics** | April 22, 23, 24, 25; Nov 22, 23, 24 | Mar 23, 24, 25 |
| **Web Technology**                    | April 22, 23, 24, 25; Nov 22, 23, 24 | Mar 23, 24, 25 |

### BE (Fourth Year) — Sem VII

| Subject                             | End Sem Papers                   | In Sem Papers              |
| ----------------------------------- | -------------------------------- | -------------------------- |
| **Blockchain Technology**           | April 23, 24, 25; Nov 22, 23, 24 | Oct 22; Sep 23, 24; Aug 25 |
| **Design & Analysis of Algorithms** | April 23, 24, 25; Nov 22, 23, 24 | Oct 22; Sep 23, 24; Aug 25 |
| **Machine Learning**                | April 23, 24, 25; Nov 22, 23, 24 | Oct 22; Sep 23, 24; Aug 25 |

### BE (Fourth Year) — Sem VIII

| Subject                        | End Sem Papers               | In Sem Papers  |
| ------------------------------ | ---------------------------- | -------------- |
| **Deep Learning**              | April 23, 24, 25; Nov 23, 24 | Mar 23, 24, 25 |
| **High Performance Computing** | April 23, 24, 25; Nov 23, 24 | Mar 23, 24, 25 |

---

## How to Use This Index

### Step 1: Check LLM-collected Markdown (Fastest)

```bash
# List PYQ markdown files for a subject
ls pyq-index/database-management-systems/ 2>/dev/null

# Read a specific paper directly
cat pyq-index/database-management-systems/end-sem-april-2024.md
```

### Step 2: Collect via LLM Web Search

If no markdown files exist yet, the AI agent searches the web, finds PDFs, reads them, and writes
structured markdown to `pyq-index/{subject}/`. This populates the index for future use.

### Step 3: Fallback to Automated Fetch (SPPU only)

```bash
# Download real question papers to pyq-downloads/
node scripts/fetch-qp.js dbms
```

### Step 4: Analyze

Feed extracted text to `universal-pyq-analyzer` for frequency analysis, Bloom's mapping, trends.

---

## Tips for AI Agents

1. **Prefer markdown over PDFs** — LLM-collected markdown is cleaner, faster, works offline once created
2. **Syllabus-first** — Find and read the official syllabus PDF first (web search) for unit structure and COs
3. **Recent-weighted** — PYQs from 2024-2025 are more predictive than 2019-2020 papers
4. **Collect-as-you-go** — When you search the web for PYQs, write the results to `pyq-index/` for future use
5. **LLM reads PDFs from the web** — the AI agent can open PDF URLs directly; no need for local OCR tools
