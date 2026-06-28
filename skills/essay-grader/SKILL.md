---
name: universal-essay-grader
description:
  Scores and evaluates student answers against university-specific rubrics for ANY university
  worldwide. Covers ALL question types, ALL mark ranges (1-100+), ALL Bloom's levels. Provides
  detailed feedback per evaluation criterion with improvement suggestions and model answer
  comparison.
---

# Universal Essay Grader / Answer Evaluator

## Overview

Evaluates student answers against the expected standard for any university exam. Provides a detailed
score breakdown across multiple criteria, identifies strengths and weaknesses, and gives actionable
improvement suggestions. Helps students understand exactly how examiners will assess their answers.

## How This Skill Works

1. **User provides**: Question, student's answer, university, subject, marks allocated, question
   type, Bloom's level
2. **System evaluates**: Against expected answer framework using multiple criteria
3. **System scores**: Per-criterion breakdown with commentary
4. **System recommends**: Specific improvements with model answer comparison

## 1. Evaluation Criteria

### For Theory / Descriptive Answers (3-20 marks)

| Criterion                    | Weight | What We Assess                                       |
| ---------------------------- | ------ | ---------------------------------------------------- |
| **Content Accuracy**         | 30%    | Are facts, definitions, and concepts correct?        |
| **Coverage**                 | 25%    | Are all required points/dimensions addressed?        |
| **Structure & Organization** | 15%    | Logical flow, sectioning, paragraphing               |
| **Depth of Explanation**     | 10%    | Are mechanisms explained? "Why" and "How" covered?   |
| **Examples / Application**   | 10%    | Relevant examples, diagrams, or applications         |
| **Language & Clarity**       | 5%     | Technical vocabulary, sentence clarity               |
| **Concision**                | 5%     | Answer within expected length, no irrelevant content |

### For Numerical / Problem Answers

| Criterion                | Weight | What We Assess                                     |
| ------------------------ | ------ | -------------------------------------------------- |
| **Formula Selection**    | 20%    | Correct formula chosen                             |
| **Step-by-step Method**  | 30%    | Clear logical progression                          |
| **Calculation Accuracy** | 25%    | Arithmetic and algebraic correctness               |
| **Units & Notation**     | 10%    | Correct units throughout                           |
| **Final Answer**         | 15%    | Correctness of final result with proper formatting |

### For Essay / Long-Form Answers (20-100+ marks)

| Criterion                 | Weight | What We Assess                                |
| ------------------------- | ------ | --------------------------------------------- |
| **Introduction & Thesis** | 10%    | Clear opening, strong thesis statement        |
| **Argument Quality**      | 25%    | Logical reasoning, evidence support           |
| **Content Knowledge**     | 25%    | Depth and breadth of subject understanding    |
| **Critical Analysis**     | 15%    | Evaluation, comparison, multiple perspectives |
| **Structure**             | 10%    | Coherent paragraphing, transitions            |
| **Conclusion**            | 10%    | Summary, implications, closure                |
| **Referencing**           | 5%     | Citations where applicable                    |

## 2. Score Interpretation

| Score % | Grade  | Meaning                   | Action                         |
| ------- | ------ | ------------------------- | ------------------------------ |
| 90-100  | A+ / O | Outstanding, exam-ready   | Maintain, review edge cases    |
| 75-89   | A / A- | Very good, minor gaps     | Address specific weak criteria |
| 60-74   | B+ / B | Competent, moderate gaps  | Focus on coverage and depth    |
| 45-59   | C+ / C | Passing, significant gaps | Systematic revision needed     |
| 30-44   | D      | Below expectations        | Restructure study approach     |
| 0-29    | F      | Fail, major deficiencies  | Re-learn from fundamentals     |

## 3. Feedback Format

Each evaluation provides:

```
Question: [The question]
Marks: [X]
Your Score: [Y/Z] ([Y/Z*100]%)

CRITERION BREAKDOWN:
1. Content Accuracy (X%) — Score: Y/Z
   + Correctly stated: [list of correct points]
   - Missing/incorrect: [list of errors/gaps]
   Tip: [Specific improvement advice]

2. Coverage (X%) — Score: Y/Z
   + Points covered: [list]
   - Missing points: [list]
   Tip: [Specific improvement advice]

...

STRENGTHS:
- [Key strength 1]
- [Key strength 2]

WEAKNESSES:
- [Key weakness 1]
- [Key weakness 2]

IMPROVEMENT PRIORITY:
1. [Highest priority change]
2. [Next priority]
3. [Next priority]

MODEL ANSWER COMPARISON:
[Excerpt from model answer showing what a top-scoring answer includes]
```

## 4. Sample Evaluation

**Question**: Explain the concept of virtual memory and its benefits. [10 marks, SPPU TE Comp]

**Student Answer**: "Virtual memory is a memory management technique where the computer uses hard
disk space as if it were RAM. It allows programs to be larger than physical memory. The benefits are
that we can run more programs and the OS handles it automatically."

```
Your Score: 7/10 (70%)

CRITERION BREAKDOWN:
1. Content Accuracy (30%) — Score: 8/10
   + "Virtual memory uses disk space as extension of RAM" — Correct
   + "Allows programs larger than physical memory" — Correct
   - Missing: demand paging, page faults, MMU role
   Tip: Mention that virtual memory maps virtual addresses to physical frames using page tables

2. Coverage (25%) — Score: 6/10
   + Benefits mentioned (run more programs)
   - Missing: memory isolation between processes, simplified programming, efficient memory sharing
   - Missing: mechanism details (page/frame, page fault, swap in/out)
   Tip: Cover at least 4 benefits and the basic mechanism

3. Structure & Organization (15%) — Score: 7/10
   + Logical flow: definition -> benefits
   - Very short, no paragraph breaks
   Tip: Use two paragraphs: Mechanism + Benefits

4. Depth (10%) — Score: 5/10
   - No explanation of HOW virtual memory works
   Tip: Add 2-3 sentences on page table mechanism

5. Examples (10%) — Score: 6/10
   - No concrete example
   Tip: Example: "A 4GB program can run on 2GB RAM by swapping pages on demand"

6. Language (5%) — Score: 8/10
   + Clear and technically appropriate

7. Concision (5%) — Score: 9/10
   + Appropriate length for 10-mark question

STRENGTHS:
- Core concept correctly identified
- Clear, straightforward language

WEAKNESSES:
- Missing mechanism details (page tables, page faults)
- Benefits too brief and incomplete

IMPROVEMENT PRIORITY:
1. Add mechanism explanation (page tables, demand paging)
2. Expand benefits to 4-5 points with brief explanation each
3. Add a concrete example

MODEL ANSWER (excerpt):
"Virtual memory is a memory management technique that creates an abstraction of a larger address space than physically available. It maps virtual addresses used by processes to physical frames through page tables managed by the MMU. When a process accesses a page not in physical memory, a page fault occurs, and the OS swaps the required page from disk into a free frame. Benefits include: (1) running programs larger than physical RAM, (2) process isolation — each process has its own virtual address space, (3) simplified memory management for programmers, (4) efficient memory utilization through sharing of common pages, and (5) support for sparse address spaces."
```

## Error Handling

| Situation | Action |
|---|---|
| No rubric provided | Construct rubric dynamically using question type, marks, Bloom's level, and subject area defaults |
| Answer too short | Grade what is present; flag insufficient length in feedback as a limitation |
| Missing criteria weights | Use default weights (Content Accuracy 30%, Coverage 25%, Structure 15%, Depth 10%, Examples 10%, Language 5%, Concision 5%) |
| Ambiguous scoring scale | Clarify with user or default to percentage-based scoring (0-100%) mapped to letter grades |

## Quality Gate — Check Before Output

- [ ] All evaluation criteria scored with clear justification
- [ ] Feedback is specific and actionable (not generic praise/criticism)
- [ ] Model answer referenced where student answer falls short
- [ ] Score range validated — total does not exceed allocated marks
- [ ] Bloom's level of question matched to evaluation depth
- [ ] Improvement priority list ordered by impact on score

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

## 5. Integration with Other Skills

- **universal-session-config**: Reads grading preferences, university, and subject from session profile
- **universal-a-plus-answer-writer**: Provides the model answer standards against which answers are
  graded
- **universal-pyq-analyzer**: Identifies which question types and Bloom's levels are most frequently
  tested
- **universal-subject-prompt-bank**: Supplies subject-specific answer standards and exemplars
- **universal-mcq-practice-generator**: Can generate targeted MCQs based on identified weak areas
- **universal-flashcard-generator**: Creates flashcards for concepts where the student scored low
