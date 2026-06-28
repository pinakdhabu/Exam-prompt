---
name: universal-cheat-sheet-generator
description: >
  Generates compact, exam-ready cheat sheets (micro notes) for ANY university worldwide. Produces
  single-page dense reference sheets matching the official SPPU Micro format — Letter portrait,
  3-column layout, continuous definition text, unit-wise organization. Supports ALL subjects, ALL
  patterns, ALL exam types.
---

# Universal Cheat Sheet Generator

Generates ultra-compact exam cheat sheets (micro notes) in the official SPPU merge-micro format.

## Output Format

| Property              | Specification                               |
| --------------------- | ------------------------------------------- |
| **Page size**         | Letter portrait (612×792 pt)                |
| **Columns**           | 3, each ~169pt wide with ~18pt gap          |
| **Left margin**       | ~9pt                                        |
| **Right margin**      | ~60pt                                       |
| **Top/bottom margin** | ~12pt                                       |
| **Font size**         | ~5.3pt body, ~5.8pt unit headers            |
| **Content flow**      | Unit-wise, left→right across columns        |
| **Format**            | Continuous definition text, numbered points |

## Structure

1. **Unit header**: Bold, centered, underlined — `UNIT N — Topic Name`
2. **Definition text**: Compact, justified, with bold key terms
3. **Numbered points**: For lists of rules, types, components
4. **No code blocks**: Pure prose, syntax inline with backticks

## Usage

Trigger when user asks for:

- "Micro notes for..."
- "Cheat sheet for..."
- "One page summary..."
- "Quick reference..."
- "Last minute revision..."
- "Chit for..."

## Supported Subjects

ALL academic subjects across engineering, science, management, arts, and humanities.

---

## Alternative Layout Formats

While the default SPPU Letter 3-column format is the primary output, these variants broaden portability:

| Format                       | Dimensions            | Best For                                   |
| ---------------------------- | --------------------- | ------------------------------------------ |
| **A4 3-column**              | 595×842 pt            | International students, European unis      |
| **A4 landscape 2-column**    | 842×595 pt            | Wider diagrams, more horizontal space      |
| **Half-letter (5.5×8.5")**   | 396×612 pt            | Pocket-sized revision, index cards         |
| **Index card (3×5")**        | 216×360 pt            | Quick recall, flashcard-format micro notes |
| **One-column (full width)**  | Full page width       | Formula-heavy subjects, mathematical text  |
| **Two-column (A4)**          | 595×842 pt / 2 cols   | Diagram + text side-by-side, hybrid layout |

When user specifies a format, adjust column count, font size, and margin widths proportionally. Fallback to Letter 3-column if unspecified.

## LaTeX & Mathematical Notation Convention

For mathematical or formula-heavy cheat sheets, inline LaTeX within Markdown is required:

| Symbol          | LaTeX                     | Rendered       |
| --------------- | ------------------------- | -------------- |
| Integral        | `$\int_a^b f(x)dx$`       | ∫ₐᵇ f(x)dx     |
| Summation       | `$\sum_{i=1}^n x_i$`      | Σᵢ₌₁ⁿ xᵢ      |
| Derivative      | `$\frac{dy}{dx}$`         | dy/dx          |
| Big O notation  | `$O(n \log n)$`           | O(n log n)     |
| Set notation    | `$\{x \in \mathbb{R} \mid x > 0\}$` | {x ∈ ℝ | x > 0} |

Rules:
- Use `$...$` for inline math, `$$...$$` for display equations.
- Write formulas in their standard notation; avoid diagram-dependence for formulas.
- For multi-line derivations: use `\begin{aligned} ... \end{aligned}` within `$$`.

## Completed Sample (Quick Reference — Unit 1 of DBMS)

A one-page micro note sample using Letter 3-column format:

```
UNIT 1 — Database System Architecture

DBMS: A software system that enables users to define, create, maintain, and control access to databases.
Key goal: Provide efficient, secure, concurrent access to large volumes of persistent data.

Three-level architecture (ANSI/SPARC):
1. External level — user views (subschema). Multiple views per database.
2. Conceptual level — logical structure of entire database (schema). Hides storage details.
3. Internal level — physical storage structures (indexes, blocks, access paths).

Data independence:
- Logical: Change conceptual schema without altering external views.
- Physical: Change internal schema without affecting conceptual schema.

DBMS vs File System:
| Property          | DBMS               | File System         |
| ----------------- | ------------------ | ------------------- |
| Data redundancy   | Controlled         | High                |
| Data consistency  | Enforced           | Manual              |
| Concurrent access | ACID transactions  | No built-in control |
| Security          | Role-based access  | OS-level only       |
| Query capability  | SQL / declarative  | Programmatic only   |

DBMS types: Hierarchical, Network, Relational, Object-oriented, NoSQL, NewSQL.
Popular DBMS: Oracle (relational, commercial), MySQL (relational, open-source), MongoDB (document NoSQL), Redis (key-value).

Mnemonic: "Every Student Can Learn Databases" (External → Conceptual → Logical → Internal)
```

When generating, replace the sample content with the requested subject's actual material. The density, column layout, and formatting style shown above serve as the baseline.
