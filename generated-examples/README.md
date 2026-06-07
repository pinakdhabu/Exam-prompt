# Generated Examples — Real Question Papers & PDFs

> **48 sample question papers** with solutions covering FE, SE, TE, BE (Computer Engineering). **16
> auto-generated PDFs** via the `convert-to-pdf.js` pipeline (Playwright + marked). Proof that the
> Exam Prompt skill system generates **real, exam-ready materials**.

## 📚 Subject Coverage

| Year      | Pattern      | Subjects        |  QPs   | Solutions |
| --------- | ------------ | --------------- | :----: | :-------: |
| **FE**    | 2019 Pattern | 10              |   10   |    10     |
| **FE**    | 2024 Pattern | 10              |   10   |    10     |
| **SE**    | SEM 3        | 5               |   5    |     5     |
| **SE**    | SEM 4        | 5               |   5    |     5     |
| **TE**    | SEM 5        | 4               |   4    |     4     |
| **TE**    | SEM 6        | 3               |   3    |     3     |
| **TE**    | Electives    | 6               |   6    |     6     |
| **BE**    | SEM 7        | 3               |   3    |     3     |
| **BE**    | SEM 8        | 2               |   2    |     2     |
| **Total** | —            | **48 subjects** | **48** |  **48**   |

## 🖨️ Auto-Generated PDFs

These PDFs were generated from sample papers using:

```bash
node scripts/convert-to-pdf.js <source.md> <output.pdf>
```

The pipeline uses `marked` (Markdown → HTML) + `playwright` (HTML → A4 PDF) with professional
styling (headers, tables, code blocks, syntax highlighting, page numbers).

### FE & SE PDFs

| Subject                                    | QP PDF                                                                | Solution PDF                                          |
| ------------------------------------------ | --------------------------------------------------------------------- | ----------------------------------------------------- |
| FE 2019 — Programming & Problem Solving    | [fe-2019-programming-qp.pdf](pdfs/fe-2019-programming-qp.pdf)         | —                                                     |
| FE 2024 — Engineering Mathematics I        | [fe-2024-maths1-qp.pdf](pdfs/fe-2024-maths1-qp.pdf)                   | —                                                     |
| SE SEM 3 — Fundamentals of Data Structures | [se-sem3-data-structures-qp.pdf](pdfs/se-sem3-data-structures-qp.pdf) | [solution](pdfs/se-sem3-data-structures-solution.pdf) |
| SE SEM 4 — Data Structures & Algorithms    | [se-sem4-dsa-qp.pdf](pdfs/se-sem4-dsa-qp.pdf)                         | —                                                     |

### TE PDFs

| Subject                                      | QP PDF                                                                    | Solution PDF                                            |
| -------------------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------- |
| TE SEM 5 — Computer Networks & Security      | [te-sem5-computer-networks-qp.pdf](pdfs/te-sem5-computer-networks-qp.pdf) | [solution](pdfs/te-sem5-computer-networks-solution.pdf) |
| TE SEM 5 — Database Management Systems       | [te-sem5-dbms-qp.pdf](pdfs/te-sem5-dbms-qp.pdf)                           | [solution](pdfs/te-sem5-dbms-solution.pdf)              |
| TE SEM 6 — Artificial Intelligence           | [te-sem6-ai-qp.pdf](pdfs/te-sem6-ai-qp.pdf)                               | —                                                       |
| TE SEM 6 — Data Science & Big Data Analytics | [te-sem6-ds-qp.pdf](pdfs/te-sem6-ds-qp.pdf)                               | —                                                       |

### BE PDFs

| Subject                                    | QP PDF                                                                  | Solution PDF                                           |
| ------------------------------------------ | ----------------------------------------------------------------------- | ------------------------------------------------------ |
| BE SEM 7 — Machine Learning                | [be-sem7-machine-learning-qp.pdf](pdfs/be-sem7-machine-learning-qp.pdf) | [solution](pdfs/be-sem7-machine-learning-solution.pdf) |
| BE SEM 7 — Design & Analysis of Algorithms | [be-sem7-daa-qp.pdf](pdfs/be-sem7-daa-qp.pdf)                           | —                                                      |
| BE SEM 8 — Deep Learning                   | [be-sem8-deep-learning-qp.pdf](pdfs/be-sem8-deep-learning-qp.pdf)       | [solution](pdfs/be-sem8-deep-learning-solution.pdf)    |

## 📝 Sample Paper Format

Every question paper follows:

1. **University header** — course name, code, semester, max marks, duration
2. **Instructions** — question selection rules, diagram requirements
3. **Unit-based sections** — with OR/AE internal choices
4. **CO & Bloom's level mapping** — built into each question
5. **Per-question mark allocation** — visible in brackets

Solutions include:

- Complete model answers with diagrams (Mermaid)
- Step-by-step derivations and calculations
- Code implementations where applicable
- Tabular comparisons where required

## 🛠️ Regenerate PDFs

```bash
# Install dependencies (one-time)
npm install marked playwright
npx playwright install chromium

# Convert any sample paper to PDF
node scripts/convert-to-pdf.js examples/se/sem-3/fundamentals-of-data-structures/sample-paper-1.md output.pdf

# Batch convert all papers
node scripts/batch-convert-to-pdf.js
```

## 📊 Coverage Map

```
examples/
├── fe/
│   ├── 2019-pattern/     (10 subjects × 2 = 20 files)
│   └── 2024-pattern/     (10 subjects × 2 = 20 files)
├── se/
│   ├── sem-3/            (5 subjects × 2 = 10 files)
│   └── sem-4/            (5 subjects × 2 = 10 files)
├── te/
│   ├── sem-5/            (4 subjects × 2 = 8 files)
│   ├── sem-6/            (3 subjects × 2 = 6 files)
│   └── electives/        (6 subjects × 2 = 12 files)
└── be/
    ├── sem-7/            (3 subjects × 2 = 6 files)
    └── sem-8/            (2 subjects × 2 = 4 files)
```

---

_Generated by the Exam Prompt skill system. See
[skills/exam-paper-generator](../skills/exam-paper-generator/SKILL.md) for exam paper generation
details._
