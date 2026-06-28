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

### Finance Formulas

#### Time Value of Money (TVM)

```
F1: Present Value
  PV = FV / (1 + r)^n
  WHERE: FV = future value, r = discount rate, n = periods
  NOTE: For annuity: PV = PMT × [1 - (1+r)^(-n)] / r

F2: Future Value
  FV = PV × (1 + r)^n
  WHERE: PV = present value, r = rate, n = periods
  NOTE: For annuity: FV = PMT × [(1+r)^n - 1] / r

F3: Net Present Value
  NPV = Σ(CF_t / (1+r)^t) - Initial Investment
  WHERE: CF_t = cash flow at time t, r = discount rate
  DECISION: NPV > 0 → Accept project

F4: Discounted Cash Flow (DCF)
  DCF = Σ(CF_t / (1+r)^t)
  WHERE: CF_t = projected cash flow at time t, r = discount rate
  NOTE: DCF estimates investment value based on future cash flow projections
  DIFFERENCE: DCF is the sum of discounted cash flows; NPV subtracts initial investment from DCF

F5: Internal Rate of Return
  0 = Σ(CF_t / (1+IRR)^t) - Initial Investment
  NOTE: IRR is the discount rate that makes NPV = 0
  WATCH: May give multiple IRRs for non-conventional cash flows

F5: Capital Asset Pricing Model
  E(R_i) = R_f + β_i × (E(R_m) - R_f)
  WHERE: R_f = risk-free rate, β_i = stock beta, E(R_m) = expected market return
  NOTE: CAPM gives the expected return compensating for systematic risk

F6: Weighted Average Cost of Capital
  WACC = (E/V) × R_e + (D/V) × R_d × (1 - T_c)
  WHERE: E = equity value, D = debt value, V = E+D, R_e = cost of equity, R_d = cost of debt, T_c = tax rate
```

#### Medical Formulas

```
F1: Body Mass Index
  BMI = weight(kg) / height(m)²
  CLASSIFICATION: <18.5 Underweight, 18.5-24.9 Normal, 25-29.9 Overweight, ≥30 Obese

F2: Body Surface Area (Mosteller)
  BSA(m²) = √(height(cm) × weight(kg) / 3600)
  NOTE: Used for chemotherapy dosing, burn assessment

F3: Glomerular Filtration Rate — MDRD
  eGFR = 175 × (S_Cr)^(-1.154) × (Age)^(-0.203) × (0.742 if female) × (1.212 if African American)
  WHERE: S_Cr = serum creatinine in mg/dL
  NOTE: CKD-EPI equation preferred for higher accuracy at GFR > 60

F4: Anion Gap
  AG = Na⁺ - (Cl⁻ + HCO₃⁻)
  NORMAL RANGE: 8-12 mEq/L
  NOTE: Elevated gap → metabolic acidosis (MUD PILES: Methanol, Uremia, DKA, etc.)

F5: Mean Arterial Pressure
  MAP = DBP + 1/3 × (SBP - DBP)
  WHERE: SBP = systolic BP, DBP = diastolic BP
  TARGET: MAP ≥ 65 mmHg for organ perfusion
```

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

## Error Handling

| Situation | Action |
|---|---|
| Formula domain not recognized | Respond: "Unrecognized formula domain. Supported domains: engineering, mathematics, physics, chemistry, finance, statistics, data science." |
| Variable definition missing | Flag undefined variables during generation and request clarification |
| Unit inconsistency | Auto-convert to SI units; warn if conversion may introduce error |
| Circular formula reference | Detect cycles in formula dependencies and break at the simplest formula |

## Quality Gate — Check Before Output

- [ ] Every formula includes variable definitions with units
- [ ] Applicability conditions stated (WHEN clause present)
- [ ] Common mistakes noted (WATCH clause present)
- [ ] Cross-references to related formulas included
- [ ] Consistent notation maintained across all formulas
- [ ] Sample calculation provided for non-trivial formulas
- [ ] Maximum 3 formulas per page for readability in exam conditions

## 5. Integration with Other Skills

| Skill | Integration |
|---|---|
| **universal-session-config** | Reads university/subject/pattern from session profile |
| **universal-notes-generator** | Provides the full context from which formulas are extracted |
| **universal-a-plus-answer-writer** | Uses formula sheets for numerical problem solutions |
| **universal-last-minute-crammer** | Formula sheets are the primary cram resource |
| **universal-mcq-practice-generator** | MCQs can be generated targeting specific formula applications |
