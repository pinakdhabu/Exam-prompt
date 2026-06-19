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

Supports **Python** (weasyprint) and **Node.js** (Playwright) conversion backends.  
Includes a **QP (Question Paper) variant** that renders LaTeX equations via KaTeX and uses Times New Roman for authentic exam-paper formatting.

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

**Requires (Node):** `npm install marked playwright && npx playwright install chromium`  
**Requires (Python):** `pip install markdown weasyprint`

> **Note**: The QP variant uses `@font-face` to load Times New Roman from system fonts and converts `[ ... ]` math blocks to `$$ ... $$` KaTeX delimiters. Inline `\mu`, `\alpha`, etc. are rendered via CDN-loaded KaTeX auto-render.

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

## Integration with Other Skills

- **universal-document-reader**: First stage (PDF → TXT)
- **universal-notes-generator**: Produces MD content ready for PDF conversion
- **universal-answer-writer**: Generates answers that can be compiled into PDF
- **universal-formula-sheet-generator**: Outputs MD formula sheets for PDF
- **universal-flashcard-generator**: Flashcard content exportable to printable PDF
- **universal-mind-map-generator**: Mermaid diagrams embeddable in PDF output
