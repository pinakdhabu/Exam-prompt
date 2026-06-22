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
via these methods, in priority order:

1. **LLM Web Search → Structured Markdown (PRIMARY)** — AI agent searches the web, extracts
   questions, writes `.md` files to `pyq-index/{subject}/`. Works for ANY university.
2. **User-provided material (FALLBACK)** — If LLM cannot find PYQs on the web, ask user for:
   attachments (PDFs/docs), a directory path, or an internet link.
3. **Automated Fetch Script (SPPU-only)** — `node scripts/fetch-qp.js` downloads PDFs
   to `pyq-downloads/` from sppuquestionpapers.com.

**Coverage:** 2019–2025 (SPPU) | **Patterns:** 2019 & 2024

**PYQ Sources (in priority order):**

| Priority | Type                           | Location                      | Contents                                    |
| -------- | ------------------------------ | ----------------------------- | ------------------------------------------- |
| 1        | **LLM-collected markdown**     | `pyq-index/{subject}/*.md`    | Structured questions (web-scraped by LLM)   |
| 2        | **User-provided material**     | Any path/URL/user attachment  | PDFs, docs, links user shares               |
| 3        | **University PYQ dir**         | `universities/<UNIV>/PYQs/`   | Per-university organized PDFs               |
| 4        | **Project downloads**          | `pyq-downloads/`              | Fetched via automated scripts (SPPU)        |

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

These are the **known working sources** for SPPU question papers. Search them in order.

> ⚠️ **Links change every exam season.** SPPU creates new folders per exam period on all sites.
> If a URL 404s, try the next source or search for the current exam period's folder.
> **Always update these instructions** when you discover new URLs or find broken ones.

| # | Source | URL | Best For |
|---|--------|-----|----------|
| 1 | **SPPU Official Portal ⭐** | `http://collegecirculars.unipune.ac.in/sites/examdocs/{PERIOD}/` | **Only official source.** Merged all-branch PDFs, End Sem only, 2019 & 2024 pattern |
| 2 | **SPPU Question Papers** | `https://sppuquestionpapers.com/be/{branch}/semester-{N}` | Per-semester papers |
| 3 | **SPPU QP Mirror** | `https://sppuquestionpaper.page.gd/program/be/` | Direct PDF links |
| 4 | **SPPU Study Hub** | `https://www.sppustudyhub.in/` | Notes + question papers |
| 5 | **Last Moment Tuitions** | `https://lastmomenttuitions.com/sppu/question-papers/` | Per-branch papers |
| 6 | **GitHub (Sppuqp)** | `https://github.com/pinakdhabu/Sppuqp` | Merged PDFs (FE through BE), Google Drive mirror |
| 7 | **KSKA Git (Gitea)** | `https://git.kska.io/sppu-te-comp-content/` | Per-subject repos + solved papers |
| 8 | **Filo** | `https://askfilo.com/higher-education/savitribai-phule-pune-university/` | PYQ with answer solutions |
| 9 | **Collegedunia** | `https://collegedunia.com/university/25732-savitribai-phule-pune-university-sppu-pune` | Old papers index |

#### Official SPPU Portal — Dynamic URL Discovery

**Don't hardcode folder names.** They change every exam season. Instead, **discover dynamically:**

```
http://collegecirculars.unipune.ac.in/sites/examdocs/
```

**Step 1** — Fetch the base URL. The SharePoint sidebar lists all available libraries. Look for:
- `Archive Question Papers` section — QP folders for every exam period (2015 through present)
- `Time Tables {SEASON} {YEAR}` — timetable folders (one per exam season)

**Step 2** — Navigate to a folder URL using pattern:
```
{base_url}/{FOLDER_NAME}/Forms/AllItems.aspx
```
URL-encode spaces. Try multiple encodings. Folder naming is inconsistent year-to-year.

**Step 3** — Download merged PDFs per year level:
```
{PERIOD_URL}/{YEAR_LEVEL} ({PATTERN} PATTERN).pdf
```
Try all combos of `F.E`/`S.E`/`T.E`/`B.E` × `2019 PATTERN`/`2024 PATTERN`.

**Step 4** — Timetables at:
```
{base_url}/Time%20Tables%20{SEASON}%20{YEAR}/Forms/AllItems.aspx
```
Browse sidebar to find latest season name.

**Limitations of official portal:**
- Only **End Semester** papers (no In Sem papers)
- PDFs are **large merged files** (all branches in one PDF — open and Ctrl+F for your subject)
- SharePoint UI is not easy to scrape; prefer direct PDF link patterns
- Folder naming is inconsistent year-to-year

#### LLM process:
1. Pick source from table, search with subject name + exam type
2. Open paper links, read PDFs directly via browser capability
3. Extract question text, marks, exam type from each paper
4. Try next source if a specific paper isn't found
5. Write all collected papers as structured markdown

### SPPU Hyperawareness — All Official Portals

LLM must be aware of ALL SPPU portals, not just PYQs. Links change every season — discover
dynamically by browsing base sites.

**Base domains:**
| Domain | What's There |
|--------|-------------|
| `collegecirculars.unipune.ac.in` | Timetables, exam docs, syllabi (2016-2026), academic calendar, circulars |
| `onlineresults.unipune.ac.in` | Result checking portals |
| `unipune.ac.in` | Main site, revaluation, circular search |
| `exam.unipune.ac.in/Pages/PreviousQuestionPapers.html` | Alternative official QP source |
| `sppuresult.vercel.app` | Community result viewer (live from SPPU) |

**Syllabus:** Browse `.../sites/documents/` → `Syllabus {YEAR}` folders (2016–2026).

**When user asks about SPPU, route to the right portal:**
| User wants | Where to look |
|------------|--------------|
| PYQs | Official portal dynamic discovery (above) |
| Results | `sppuresult.vercel.app` or `onlineresults.unipune.ac.in` |
| Syllabus | `collegecirculars.unipune.ac.in/sites/documents/` |
| Timetable | `Time%20Tables%20{SEASON}%20{YEAR}/` on examdocs |
| Revaluation | `unipune.ac.in/university_files/Reval_Online_Results_online.htm` |
| Academic calendar | `.../sites/documents/Academic%20Calender/` |
| Circulars | `collegecirculars.unipune.ac.in/SitePages/Home.aspx` |
| Alt QP source | `exam.unipune.ac.in/Pages/PreviousQuestionPapers.html` |

**For other universities:** Same approach — LLM dynamically discovers portals by searching
`"{university}" {resource}`. If not found → ask user for links/files.

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

**For SPPU:** Use the dynamic discovery process above. All exam periods from 2015 through current
are available on the official portal.

**For other universities:** LLM scrapes the web using generic queries
(`"{subject}" "{university}" question paper`). If the LLM cannot find PYQs after reasonable
searching, it should ask the user for:
- Attached PYQ PDF files or documents
- A local directory path where PYQs are stored
- An internet link to a PYQ repository or download page
Whatever the user provides, the LLM converts it to structured markdown.

### Step 3: User-Provided Material

If web search fails to yield enough papers, ask the user for:
- **PDF/DOCX attachments** — read them directly, extract questions
- **A directory path** — scan for PDFs, extract text from each
- **An internet URL** — fetch the page, find and download papers
LLM reads and converts whatever is provided into structured markdown.

### Step 4: Fallback to Automated Fetch (SPPU only)

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
