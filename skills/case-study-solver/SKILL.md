---
name: universal-case-study-solver
description:
  Solves ANY case study type for ANY university worldwide. Covers business, engineering, medical,
  legal, ethical, social science, and technical case studies. Uses structured frameworks (SWOT,
  PESTEL, 5 Whys, Root Cause Analysis, Ethical Matrix, Fishbone, etc.) with per-section marking
  allocation.
---

# Universal Case Study Solver

## Overview

Provides a structured methodology for analyzing and answering any case study question. Each solution
follows a framework appropriate to the case type, with clear sectioning, evidence-based reasoning,
and actionable conclusions.

## How This Skill Works

1. **User provides**: Case study text or description, questions asked, subject/discipline,
   university, marks allocation
2. **System identifies**: Case type, appropriate framework, question type mapping
3. **System analyzes**: Key facts, stakeholders, problems, constraints
4. **System generates**: Structured solution with framework application, analysis, and
   recommendations

## 1. Case Study Types & Frameworks

| Case Type                 | Recommended Framework                                                             | Best For                                |
| ------------------------- | --------------------------------------------------------------------------------- | --------------------------------------- |
| **Business / Management** | SWOT + PESTEL + Porter's Five Forces                                              | Strategy, marketing, operations         |
| **Engineering Design**    | Problem Definition -> Constraints -> Alternatives -> Selection -> Implementation  | Design problems, system choices         |
| **Medical / Clinical**    | History -> Examination -> Diagnosis -> Treatment -> Follow-up                     | Patient cases, clinical scenarios       |
| **Legal**                 | Facts -> Issue -> Rule -> Application -> Conclusion (IRAC)                        | Law case briefs, moot court             |
| **Ethical**               | Facts -> Stakeholders -> Principles -> Options -> Decision                        | Bioethics, business ethics, AI ethics   |
| **Social Science**        | Context -> Theory -> Analysis -> Implications                                     | Sociology, political science, economics |
| **Technical / Systems**   | Problem -> Root Cause -> Solution Options -> Trade-off Analysis -> Recommendation | IT systems, engineering failures        |
| **Environmental**         | Issue -> Impact Assessment -> Stakeholders -> Solutions -> Sustainability Check   | Climate, ecology, sustainability        |
| **Research / Data**       | Question -> Data -> Methodology -> Findings -> Limitations -> Implications        | Research papers, data analysis          |

## 2. Universal Case Study Answer Structure

```
Q1: [Question text] [Marks: X]

Framework: [Selected framework name]

Step 1: Identify Key Facts
- Fact 1 from case
- Fact 2 from case
- ...

Step 2: Stakeholder Analysis
| Stakeholder | Interest | Impact | Priority |
|---|---|---|---|

Step 3: Problem Definition
Core problem: [Single clear statement]
Sub-problems:
  - Sub-problem 1
  - Sub-problem 2

Step 4: Analysis (using chosen framework)
[Framework-specific analysis with case evidence]

Step 5: Alternatives / Options
| Option | Pros | Cons | Feasibility |
|---|---|---|---|
| A | ... | ... | High/Med/Low |
| B | ... | ... | High/Med/Low |

Step 6: Recommendation
[Clear, justified choice with implementation steps]

Step 7: Conclusion
[Summary and expected outcomes]
```

## 3. Case Analysis Techniques

| Technique                 | Use                     | Output                                     |
| ------------------------- | ----------------------- | ------------------------------------------ |
| **5 Whys**                | Root cause analysis     | Chain of causality                         |
| **Fishbone / Ishikawa**   | Multi-factor causation  | Visual cause map                           |
| **SWOT**                  | Strategic position      | Matrix of 4 quadrants                      |
| **PESTEL**                | External environment    | 6-dimension analysis                       |
| **Porter's Five Forces**  | Industry competition    | 5-force assessment                         |
| **IRAC**                  | Legal reasoning         | Issue -> Rule -> Application -> Conclusion |
| **Ethical Matrix**        | Ethical decision-making | Principles x Stakeholders grid             |
| **Cost-Benefit Analysis** | Economic evaluation     | Quantified pros/cons                       |
| **Decision Tree**         | Multi-path decisions    | Branched outcomes with probabilities       |

## 4. Sample Case Solution

**Case**: "A manufacturing company faces declining profits due to rising raw material costs and
increased competition. The CEO must decide whether to automate production (costly upfront, long-term
savings) or outsource to a cheaper supplier (lower quality, faster implementation)." [15 marks, MBA,
Mumbai University]

```
Q: Analyze the situation and recommend the best course of action. [15]

Framework: SWOT + Cost-Benefit Analysis

Step 1: Key Facts
- Manufacturing company, declining profits
- Rising raw material costs
- Increased competition
- Two options: automation or outsourcing

Step 2: Stakeholder Analysis
| Stakeholder | Interest | Impact |
|---|---|---|
| Shareholders | Profitability | High |
| Employees | Job security | High (automation reduces jobs) |
| Customers | Quality + price | Medium |
| Suppliers | Business relationship | Medium |

Step 3: SWOT Analysis

Strengths:
- Existing production infrastructure
- Skilled workforce

Weaknesses:
- High operational costs
- Aging equipment

Opportunities:
- Automation tax incentives
- New market segments

Threats:
- Competitors may also automate
- Quality-sensitive customers may leave

Step 4: Cost-Benefit Analysis
| Factor | Automation | Outsourcing |
|---|---|---|
| Upfront Cost | High (₹2 Cr) | Low (₹10L setup) |
| Monthly Savings | ₹15L/month | ₹8L/month |
| Breakeven | ~13 months | ~1.5 months |
| Quality | Maintained | Risk of decline |
| Employee Impact | Layoffs needed | Minimal |
| Long-term Viability | High | Medium |

Step 5: Recommendation
Hybrid approach: Automate critical production line (high-value products) while outsourcing non-core components. This balances cost savings with quality control and minimizes employee disruption.

Step 6: Implementation
1. Month 1-2: Identify critical vs non-critical product lines
2. Month 3-6: Implement automation on critical line
3. Month 3: Outsource non-critical components with strict quality agreements
4. Month 7+: Monitor quality metrics and cost savings

Conclusion: The hybrid approach provides the best risk-reward profile, achieving significant cost reduction while maintaining quality control and managing stakeholder impact.
```

## Session Config

This skill integrates with the session config system (`deps/session-profile.json`). Before executing, check for an existing session profile:

- If `deps/session-profile.json` exists, read `university`, `subject`, `pattern`, and `exam_type` fields to auto-configure the skill.
- If the file does not exist, fall back to user-provided context or prompt the user to run `setup-exam-prompt` (or `npm run init`) first.
- Session config eliminates redundant context detection — detection happens once and is reused across all skill calls.

---

## 5. Integration with Other Skills

- **universal-a-plus-answer-writer**: Provides detailed answer writing techniques applied to case study
  questions
- **universal-notes-generator**: Supplies theoretical frameworks and models used in case analysis
- **universal-flashcard-generator**: Creates flashcards for framework steps and analysis techniques
