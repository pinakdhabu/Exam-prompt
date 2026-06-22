---
name: universal-document-generator
description: >
  Converts Markdown study content to print-ready PDF documents with professional formatting. Covers
  full pipeline from source PDFs to clean text to Markdown notes to PDF output. Works for ANY
  university, ANY subject. Trigger on requests to generate PDFs from Markdown, create printable
  study materials, or batch-convert notes to PDF.
---

# Universal Document Generator — Markdown to PDF Pipeline

## Overview

Generates print-ready, professionally formatted PDF documents from Markdown study content. Designed
for creating exam-ready printed materials — unit notes, PYQ solutions, syllabus references, formula
sheets, and master solutions.

Supports **Node.js** (Playwright — primary, renders LaTeX via KaTeX) and **Python** (weasyprint —
fallback, Unicode math only). Includes a **QP (Question Paper) variant** that renders LaTeX
equations via KaTeX and uses Times New Roman for authentic exam-paper formatting.

> **Dependency note:** The core MD→QP-PDF pipeline runs on **Node.js only** (`marked` +
> `playwright`). Python is **optional** — only needed for PDF text extraction (`pdf-extract.py`) or
> the weasyprint fallback. See [`DEPENDENCIES.md`](../../DEPENDENCIES.md) for full install
> instructions.

---

## How This Skill Works

1. **User provides**: Markdown file(s) with study content, or PDF source material to convert through
   the pipeline
2. **System converts**: MD → HTML → PDF using CSS-styled A4 formatting
3. **System outputs**: Print-ready PDF with page numbers, styled tables, syntax-highlighted code,
   and diagrams

---

## The Full Conversion Pipeline

```
Source PDF (syllabus/PYQ)
       │
       ▼  [pdf-extract.py / pdftotext / OCR]
   Plain Text (.txt)
       │
       ▼  [Manual authoring or AI-assisted structuring]
   Markdown Notes (.md)
       │
       ▼  [convert-to-pdf.py or convert-to-pdf.js]
   Print-Ready PDF (.pdf)
```

### Stage 1: PDF → TXT

Use `scripts/pdf-extract.py` or the `universal-document-reader` skill to extract text from source
PDFs.

### Stage 2: TXT → MD

Structure the extracted text into Markdown with proper headings, tables, code blocks, and exam-style
formatting.

### Stage 3: MD → PDF

Use one of the conversion scripts to generate a print-ready PDF.

### Stage 3b: MD → QP-Styled PDF (KaTeX + Times New Roman)

For authentic question-paper formatting with equations rendered via KaTeX:

```bash
# Node.js (recommended — renders LaTeX via KaTeX)
node scripts/convert-qp-to-pdf.js paper.md paper.pdf

# Python (basic — Unicode math fallback)
python3 scripts/convert-qp-to-pdf.py paper.md paper.pdf
```

**Requires (Node):** `npm install marked playwright && npx playwright install chromium` **Requires
(Python):** `pip install markdown weasyprint`

> **Note**: The QP variant uses `@font-face` to load Times New Roman from system fonts and converts
> `[ ... ]` math blocks to `$$ ... $$` KaTeX delimiters. Inline `\mu`, `\alpha`, etc. are rendered
> via CDN-loaded KaTeX auto-render.

#### SPPU Question Paper — Exact Page Properties (from 1225+ PDF analysis)

When generating an SPPU QP PDF, use these exact layout properties extracted from actual SPPU QPs
across FE/SE/TE/BE and 2012/2015/2019/2024 patterns:

| Property              | Main Pattern (2019/2015 SE/TE/BE) | BE 2012               | FE 2024 (normalized)   |
|-----------------------|-----------------------------------|------------------------|------------------------|
| Page size             | A4 (595.3×841.9 pt)               | A4 (595.3×841.9 pt)   | A4 (595.3×841.9 pt)    |
| Left margin           | ~70.8 pt (~1″)                    | ~70.8 pt               | ~70.8 pt               |
| Right margin          | ~48.1 pt                          | ~48.1 pt               | ~48.1 pt               |
| Top margin            | ~56.3 pt                          | ~56.3 pt               | ~56.3 pt               |
| Bottom edge           | ~59–63 pt                         | ~62.9 pt               | ~59–63 pt              |
| Text area             | ~476 × 723 pt                     | ~476 × 723 pt          | ~476 × 723 pt          |
| Paper code            | `PC####` (no hyphen)              | `P####`                | `PC-####` or `PD####` |
| Producer              | Distiller 11.0 + iTextSharp 5.5.9 | iTextSharp 5.5.9      | Distiller 11.0 / cairo |

**Layout structure:**
```
Total No. of Questions : N]                     SEAT No. : [number]
[Paper Code]                                    [Total No. of Pages : N]

           [Paper Number] e.g., [6352]-35
           [Program Name]
           [SUBJECT NAME IN ALL CAPS]
           (Pattern) (Semester) (Subject Code)

Time : [X] Hours]                               [Max. Marks : XX]

Instructions to the candidates:
  1) [Instruction 1]
  2) [Instruction 2]
  ```

**Typographic Rules:**
- Paper number — **bold**, centered, larger than body
- Subject name — **ALL CAPS**, bold
- Time/marks — **bold**, left/right justified on same line
- Instructions — numbered with `)`, indent 3 spaces
- Question numbers — **bold** like `**Q1)**`
- Sub-questions — lowercase `a)` `b)` `c)`, bold, indent
- Marks — `[N]` brackets, right-aligned
- OR separator — `**OR**` centered on its own line

---

## Conversion Backends

### Option A: Python (weasyprint)

```bash
# Notes/study material
python3 scripts/convert-to-pdf.py notes.md

# Question paper (with QP formatting)
python3 scripts/convert-qp-to-pdf.py paper.md paper.pdf

# Batch: wrap in a loop
for f in *.md; do python3 scripts/convert-to-pdf.py "$f"; done
```

**Requires:** `pip install markdown weasyprint`

### Option B: Node.js (Playwright)

```bash
# Notes/study material
node scripts/convert-to-pdf.js notes.md

# Question paper (with KaTeX math + Times New Roman)
node scripts/convert-qp-to-pdf.js paper.md paper.pdf
```

**Requires:** `npm install marked playwright && npx playwright install chromium`

---

## PDF Output Features

| Feature          | Detail                                          |
| ---------------- | ----------------------------------------------- |
| **Page Size**    | A4 with 2cm margins                             |
| **Headers**      | Styled h1/h2/h3/h4 with distinct colors         |
| **Tables**       | Professional styling, alternating row colors    |
| **Code Blocks**  | Dark theme (GitHub Dark style), monospace font  |
| **Inline Code**  | Light gray background with accent color         |
| **Page Numbers** | Centered at bottom                              |
| **Blockquotes**  | Left-accented blue border                       |
| **Page Breaks**  | Avoided inside tables, code blocks, blockquotes |
| **Diagrams**     | Mermaid or image support via HTML               |

---

## Use Cases

| Scenario                     | Description                                              |
| ---------------------------- | -------------------------------------------------------- |
| **Unit Notes → PDF**         | Convert subject unit notes to printable study sheets     |
| **PYQ Solutions → PDF**      | Generate print-friendly previous year question solutions |
| **Formula Sheets → PDF**     | Create compact formula reference PDFs                    |
| **Syllabus Reference → PDF** | Print official syllabus with CO-PO mapping               |
| **Master Solutions → PDF**   | Compile full subject solutions into one document         |
| **Flashcards → PDF**         | Generate printable flashcard sheets                      |

---

## Style Customization

The CSS template can be customized by editing the script:

- **Colors**: `--primary: #0d3b66`, `--accent: #1b5a8c`, `--code-bg: #0d1117`
- **Fonts**: Segoe UI, Calibri, DejaVu Sans (Python) / system fonts (JS)
- **Spacing**: Line height, margins, padding per element type
- **Page**: Size, margins, header/footer content

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

- **universal-document-reader**: First stage (PDF → TXT)
- **universal-notes-generator**: Produces MD content ready for PDF conversion
- **universal-a-plus-answer-writer**: Generates answers that can be compiled into PDF
- **universal-formula-sheet-generator**: Outputs MD formula sheets for PDF
- **universal-flashcard-generator**: Flashcard content exportable to printable PDF
- **universal-mind-map-generator**: Mermaid diagrams embeddable in PDF output
