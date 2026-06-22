---
name: universal-formula-sheet-generator
description:
  Generates compact, exam-ready formula sheets for ANY university worldwide. Covers engineering,
  mathematics, physics, chemistry, finance, statistics, and data science. Organized by unit with
  variable definitions, SI units, and quick-reference annotations. Optimized for closed-book recall
  and open-book quick lookup.
---

# Universal Formula Sheet Generator

## Overview

Creates dense, well-organized formula sheets that serve as both study aids and exam-day quick
references. Every formula is presented with its variables clearly defined, applicable conditions
stated, and cross-referenced to related formulas.

## How This Skill Works

1. **User provides**: Subject, course code, university, specific units/topics, exam type
   (open/closed book)
2. **System collects**: All relevant formulas organized by unit and topic
3. **System formats**: In compact, scannable layout with consistent notation
4. **System annotates**: Variable definitions, units, applicability conditions, and common pitfalls

## 1. Formula Entry Format

Each formula is presented as:

```
Formula Name
  f(x) = expression
  WHERE: x = description [unit], f(x) = description [unit]
  WHEN: Applicable conditions or assumptions
  WATCH: Common mistakes or special cases
  SEE ALSO: Related formula #12
```

## 2. Organization Structure

```
Subject Name
  Unit 1 — Topic Name
    F1: Formula name
    F2: Formula name
    ...
  Unit 2 — Topic Name
    ...
  Appendix
    Constants
    Conversion Factors
    Greek Letters Used
    Index (formula name -> F-number)
```

## 3. Formula Categories

| Category                  | Subjects                      | Presentation Style                      |
| ------------------------- | ----------------------------- | --------------------------------------- |
| **Algebraic**             | Mathematics, Physics          | Standard equation, variable definitions |
| **Differential/Integral** | Calculus, Physics             | Standard notation with limits           |
| **Statistical**           | Statistics, ML, Data Science  | Summation/probability notation          |
| **Chemical**              | Chemistry, Biology            | Molecular structure, reaction equations |
| **Electrical**            | E&TC, Electrical, Electronics | Circuit parameters, phasors             |
| **Mechanical**            | Mechanical, Civil, Aerospace  | Force/momentum/energy equations         |
| **Financial**             | Finance, Economics, Business  | Time value of money, ratio formulas     |
| **Algorithmic**           | Computer Science              | Pseudocode, complexity expressions      |
| **Logical**               | Mathematics, CS               | Set notation, logical operators         |

## 4. Sample Formula Sheet

**Subject**: Engineering Mathematics — Calculus (VTU, 1st Semester)

```
UNIT 1: Differential Calculus

F1: Derivative definition
  f'(x) = lim(h->0) [f(x+h) - f(x)] / h
  WHERE: f = function, x = variable, h = infinitesimal increment
  WATCH: Limit must exist for derivative to exist

F2: Product rule
  d/dx [u(x) * v(x)] = u'v + uv'
  WHERE: u, v = differentiable functions of x
  NOTE: "First derivative of second + second derivative of first"

F3: Quotient rule
  d/dx [u(x) / v(x)] = (u'v - uv') / v^2
  WHERE: v(x) != 0
  WATCH: Order matters — numerator is (u'v - uv') not (uv' - u'v)

F4: Chain rule
  dy/dx = dy/du * du/dx
  WHERE: y = f(u), u = g(x)
  NOTE: "Derivative of outer times derivative of inner"

UNIT 2: Integral Calculus

F5: Power rule (integration)
  int x^n dx = x^(n+1)/(n+1) + C, n != -1
  WHERE: n = real number
  WATCH: n = -1 gives int x^(-1) dx = ln|x| + C (special case)

F6: Integration by parts
  int u dv = uv - int v du
  WHERE: u = function to differentiate, dv = function to integrate
  NOTE: Choose u using LIATE (Log, Inverse trig, Algebraic, Trig, Exponential)

... (continues)
```

## Session Config

This skill integrates with the session config system (`deps/session-profile.json`). Before executing, check for an existing session profile:

- If `deps/session-profile.json` exists, read `university`, `subject`, `pattern`, and `exam_type` fields to auto-configure the skill.
- If the file does not exist, fall back to user-provided context or prompt the user to run `setup-exam-prompt` (or `npm run init`) first.
- Session config eliminates redundant context detection — detection happens once and is reused across all skill calls.

---

## 5. Integration with Other Skills

- **universal-notes-generator**: Provides the full context from which formulas are extracted
- **universal-a-plus-answer-writer**: Uses formula sheets for numerical problem solutions
- **universal-last-minute-crammer**: Formula sheets are the primary cram resource
- **universal-mcq-practice-generator**: MCQs can be generated targeting specific formula
  applications
