# Use Cases & Real-World Workflows

This document covers **every possible use case** for the Exam Prompt system.
Each use case follows a complete workflow from start to finish.

---

## Table of Contents

- [Answer Writing](#-answer-writing)
- [Notes Generation](#-notes-generation)
- [PYQ Analysis](#-pyq-analysis)
- [IMP Topics & Study Planning](#-imp-topics--study-planning)
- [Assignment Writing](#-assignment-writing)
- [Exam Paper Generation](#-exam-paper-generation)
- [Flashcard Generation](#-flashcard-generation)
- [MCQ Practice](#-mcq-practice)
- [Viva / Oral Exam Prep](#-viva--oral-exam-prep)
- [Lab Report Writing](#-lab-report-writing)
- [Formula Sheets & Mind Maps](#-formula-sheets--mind-maps)
- [Essay Grading](#-essay-grading)
- [Cross-Subject Mapping](#-cross-subject-mapping)
- [Emergency Cramming](#-emergency-cramming)
- [Case Study Solving](#-case-study-solving)
- [Different University Adaptation](#-different-university-adaptation)
- [Full Exam Simulation](#-full-exam-simulation)
- [Multi-Step Workflows](#-multi-step-workflows)

---

## ✍️ Answer Writing

### UC-01: Standard Theory Answer

**Scenario:** Student needs a 6-mark answer on a DBMS topic.

```bash
Prompt: "Explain ACID properties with example [6 marks] — SPPU 2019 pattern"
```

**Workflow:**
1. Agent loads `skills/answer-writer/SKILL.md`
2. Detects: SPPU 2019 pattern, Theory-Explanation type, 6 marks, L2 Understand
3. Generates: Definition → 6 points → Example → Diagram → Closing
4. Includes: Bolded keywords, CO mapping, Bloom's level, time budget

**Output:** Structured answer with `**Atomicity**`, `**Consistency**`, `**Isolation**`, `**Durability**`, a transaction example, and a mnemonic ("All Cars In Drive").

---

### UC-02: Numerical Problem Solving

**Scenario:** Student needs step-by-step numerical solution.

```bash
Prompt: "Solve: Given schedule S = {R1(A),W2(A),R2(B),W1(B)}, check if it's conflict serializable [6 marks]"
```

**Workflow:**
1. Agent loads `skills/answer-writer/SKILL.md`
2. Detects: Numerical type, 6 marks, L3 Apply
3. Generates: Given data → Precedence graph → Check cycles → Conclusion
4. Boxes the final answer, shows all intermediate steps

**Output:** Precedence graph with explanation, "Not conflict serializable (cycle detected)".

---

### UC-03: Comparison Answer (Table Format)

**Scenario:** Student needs a comparative answer.

```bash
Prompt: "Compare TCP and UDP [6 marks] — in table format"
```

**Workflow:**
1. Agent detects: Comparison type, table format requested
2. Generates: Definition of both → 6-row comparison table → When to use each → Closing
3. Bold: Connection-oriented, Connectionless, Reliable, Unreliable, etc.

**Output:** Table with 6 comparison dimensions.

---

### UC-04: Diagram-Based Answer

**Scenario:** Question requires a diagram.

```bash
Prompt: "Draw and explain the architecture of 8051 Microcontroller [8 marks]"
```

**Workflow:**
1. Agent loads answer-writer, activates diagram mode for 8 marks
2. Generates: Mermaid diagram of 8051 architecture → Component descriptions → Bus structure → Closing
3. Bold: ALU, Accumulator, Program Counter, Stack Pointer, etc.

**Output:** Mermaid diagram + 8 explained components.

---

### UC-05: Multi-Part Question

**Scenario:** One question with multiple sub-parts.

```bash
Prompt: "a) Define Normalization [2 marks]  b) Explain 1NF, 2NF, 3NF with examples [9 marks]  c) Differentiate BCNF and 3NF [4 marks]"
```

**Workflow:**
1. Agent treats each sub-part independently with correct mark allocation
2. Part (a): 1-sentence definition (2 marks)
3. Part (b): 9 points with 3 examples and diagrams
4. Part (c): Comparison table (4 marks)

**Output:** Three distinct answer blocks with proportional depth.

---

## 📝 Notes Generation

### UC-06: Cornell Notes

**Scenario:** Student preparing for closed-book exam.

```bash
Prompt: "Generate Cornell notes for Unit 3 of DBMS — Normalization. Exam type: closed book. Time: 5 days."
```

**Workflow:**
1. Agent loads `skills/notes-generator/SKILL.md`
2. Auto-selects: Cornell format (best for closed-book + 5 days)
3. Generates: Cue column (questions) + Notes column (content) + Summary
4. Includes: Spaced repetition schedule, mnemonics, Feynman challenge

**Output:** Full Cornell notes for all normalization topics (1NF → BCNF).

---

### UC-07: Rapid Revision Notes

**Scenario:** Student needs last-minute revision material.

```bash
Prompt: "Generate Rapid Revision notes for Operating Systems — all units. Exam in 1 day."
```

**Workflow:**
1. Agent auto-selects: Rapid Revision format (for < 1 day)
2. Each unit → 5 definitions + 5 key points + 1 comparison + 1 mnemonic
3. One page per unit, maximum density

**Output:** 6 one-page summaries (one per OS unit).

---

### UC-08: Flowchart Notes (Process-Oriented Subject)

**Scenario:** Student needs process flow for algorithms.

```bash
Prompt: "Generate flowchart notes for Sorting Algorithms in DSA"
```

**Workflow:**
1. Agent auto-selects: Flowchart format (for algorithms/procedures)
2. Each algorithm → Flowchart + step list + complexity table + code snippet

**Output:** Flowcharts for Bubble, Selection, Insertion, Merge, Quick sort.

---

## 📊 PYQ Analysis

### UC-09: Full PYQ Analysis

**Scenario:** Student has PDFs of previous year papers.

```bash
Prompt: "I have 5 years of DBMS PYQ PDFs at /home/student/pyqs/dbms/. Analyze them."
```

**Workflow:**
1. Agent loads `skills/pyq-analyzer/SKILL.md`
2. Also loads `skills/universal-document-reader/SKILL.md` if PDFs need extraction
3. Runs 13+ analysis types: Frequency, Weightage, Bloom's, Trends, Gap Analysis
4. Generates: Must-Prepare topics (with %), Selective topics, Safe-to-Skim, Strategy

**Output:** Complete analysis with probability percentages and unit-wise weightage.

---

### UC-10: Quick PYQ Scan

**Scenario:** Student just uploaded PDFs in chat (no directory).

```bash
Prompt: "I'm uploading my PYQs for TOC. Tell me what's important."
```

**Workflow:**
1. Agent reads PDFs from chat attachments
2. Runs frequency + weightage analysis only (faster, fewer PYQs)
3. Generates: Top 10 topics, likely question types, mark distribution

**Output:** Compact 2-page analysis report.

---

## 🎯 IMP Topics & Study Planning

### UC-11: IMP Topics with Study Plan

**Scenario:** Student has specific preparation time.

```bash
Prompt: "Give me IMP topics for SPOS exam. I have 7 days to prepare. Target GPA: 10/10."
```

**Workflow:**
1. Agent loads `skills/imp-topics-generator/SKILL.md`
2. Loads PYQ data (from user or built-in index)
3. Generates: Must-Prepare (L1→L2), Selective (L3→L4), Safe-to-Skim (L5→L6)
4. Creates: 7-day time plan with daily goals, per-unit strategy
5. GPA target: 10/10 = cover all categories

**Output:** Full study plan with daily breakdown and topic-wise IMP probability.

---

### UC-12: Emergency 3-Day Plan

**Scenario:** Student has very limited time.

```bash
Prompt: "I have 3 days for DBMS. Give me a minimal prep plan to pass."
```

**Workflow:**
1. Agent generates: GPA-targeted plan for "Pass" (must-prepare only)
2. Prioritizes: High-weightage units, frequently asked topics
3. Day 1-2: Theory topics, Day 3: Numerical + Diagram practice

**Output:** 3-day compact plan with ~40% syllabus coverage (enough to pass).

---

## 📄 Assignment Writing

### UC-13: Theory Assignment

**Scenario:** Student needs a complete assignment submission.

```bash
Prompt: "Write an assignment on Cloud Computing service models (IaaS, PaaS, SaaS). Include introduction, detailed explanation, comparison table, advantages, disadvantages, conclusion. 15 marks."
```

**Workflow:**
1. Agent loads `skills/assignment-writer/SKILL.md`
2. Generates: Full assignment with structure, marking scheme, Bloom's levels, CO alignment
3. Includes: Comparison table, real-world examples (AWS, Azure, GCP)
4. Output format: Markdown (can be converted to PDF)

**Output:** Ready-to-submit assignment with 6 sections + references.

---

### UC-14: Numerical Assignment

**Scenario:** Assignment with calculations.

```bash
Prompt: "Write a numerical assignment on Time Complexity Analysis — solve 5 problems with step-by-step working."
```

**Workflow:**
1. Agent loads assignment-writer, detects numerical type
2. 5 problems of increasing difficulty
3. Each: Problem → Given → Formula → Working → Answer (boxed)

**Output:** Assignment with 5 fully solved numerical problems.

---

## 📝 Exam Paper Generation

### UC-15: Full Question Paper

**Scenario:** Faculty/student needs a practice paper.

```bash
Prompt: "Generate a full question paper for DBMS — SPPU 2019 pattern. Include all 8 questions with CO/Bloom mapping."
```

**Workflow:**
1. Agent loads `skills/exam-paper-generator/SKILL.md`
2. Generates: 4 OR pairs (Q1-Q8) with exact SPPU 2019 format
3. Each question: Sub-parts (a) theory + (b) numerical/diagram
4. Includes: Instructions, marking scheme, CO-Bloom matrix, answer key

**Output:** Complete question paper in SPPU format + answer key.

---

### UC-16: Generic Pattern Paper

**Scenario:** Non-SPPU university.

```bash
Prompt: "Generate a practice paper for Computer Networks — 50 marks, 2 hours, 4 units, no OR pairs, Part A + Part B format."
```

**Workflow:**
1. Agent detects: Generic pattern with custom parameters
2. Generates: Part A (short/compulsory) + Part B (long/choice)
3. Follows: Detailed mark allocation as specified

**Output:** Custom formatted question paper.

---

## 🃏 Flashcard Generation

### UC-17: Flashcards from Notes

**Scenario:** Student has notes they want to memorize via Anki.

```bash
Prompt: "Create Anki flashcards from these DBMS notes. 3 difficulty tiers."
```

**Workflow:**
1. Agent loads `skills/flashcard-generator/SKILL.md`
2. Extracts: Key concepts → Fact cards (easy), Cloze cards (medium), Problem cards (hard)
3. Adds: SRS metadata (D1, D2, D4, D8, D16 intervals)
4. Exports: Anki CSV format

**Output:** 30+ flashcards in CSV format ready for Anki import.

---

## ❓ MCQ Practice

### UC-18: Bloom's-Calibrated MCQs

**Scenario:** Student wants practice questions at varying difficulty.

```bash
Prompt: "Generate 10 MCQs on Normalization in DBMS — mix of L1, L2, L3 difficulty."
```

**Workflow:**
1. Agent loads `skills/mcq-practice-generator/SKILL.md`
2. 3 easy (L1): Basic definitions
3. 4 medium (L2): Apply normalization rules
4. 3 hard (L3): Identify normal forms, decompose relations
5. Each: Question + 4 options + correct answer + explanation

**Output:** 10 MCQs with answer key and explanations.

---

## 🎤 Viva / Oral Exam Prep

### UC-19: Lab Viva Preparation

**Scenario:** Student has a lab viva coming up.

```bash
Prompt: "Prepare me for a DBMS lab viva. I've done SQL queries, PL/SQL, and triggers."
```

**Workflow:**
1. Agent loads `skills/viva-oral-exam-prep/SKILL.md`
2. Generates: 15 likely questions with CLAIM-EVIDENCE-LINK answers
3. Includes: Follow-up question predictions, common traps
4. Marks: [Draw diagram here] at appropriate points

**Output:** Viva preparation sheet with examiner dialogue simulation.

---

## 🔬 Lab Report Writing

### UC-20: Engineering Lab Report

**Scenario:** Student needs a complete lab report.

```bash
Prompt: "Write a complete lab report for: Implementation of Stack using Arrays in C."
```

**Workflow:**
1. Agent loads `skills/lab-report-writer/SKILL.md`
2. Generates: Aim → Apparatus → Theory → Procedure → Code → Observations → Result → Conclusion → Viva questions
3. Includes: Sample input/output, time complexity analysis

**Output:** Complete lab report ready for submission.

---

## 📐 Formula Sheets & Mind Maps

### UC-21: Formula Sheet

**Scenario:** Student needs a compact reference.

```bash
Prompt: "Create a formula sheet for Engineering Mathematics 3 — all units."
```

**Workflow:**
1. Agent loads `skills/formula-sheet-generator/SKILL.md`
2. Per unit: Key formulas with variable definitions and SI units
3. Compact A4 design, exam-ready

**Output:** One-page formula sheet per unit.

---

### UC-22: Mind Map

**Scenario:** Student wants visual overview.

```bash
Prompt: "Generate a mind map for Operating System concepts — all 6 units."
```

**Workflow:**
1. Agent loads `skills/mind-map-generator/SKILL.md`
2. Root: Operating Systems
3. Branches: Process Management, Memory Management, File Systems, I/O, Security, Case Studies
4. Leaves: Key concepts per branch
5. Includes: Mermaid syntax + text description

**Output:** Mermaid mind map + text outline.

---

## 🏆 Essay Grading

### UC-23: Auto-Grade Student Answer

**Scenario:** Student wants their practice answer scored.

```bash
Prompt: "Grade my answer: [paste answer]. Question: Explain ACID properties [6 marks]. SPPU 2019 pattern."
```

**Workflow:**
1. Agent loads `skills/essay-grader/SKILL.md`
2. Scores: 7 criteria (definition quality, points coverage, examples, structure, keywords, etc.)
3. Generates: Score per criterion, strengths list, improvement priorities, model answer comparison

**Output:** Grading breakdown with actionable feedback.

---

## 🔗 Cross-Subject Mapping

### UC-24: Subject Connections

**Scenario:** Student wants to understand how subjects connect.

```bash
Prompt: "Map connections between DBMS, DSA, and Operating Systems for Computer Engineering."
```

**Workflow:**
1. Agent loads `skills/cross-subject-mapper/SKILL.md`
2. Maps: DBMS indexing ↔ B-Tree (DSA) ↔ File Systems (OS)
3. Creates: Dependency graph, shared concepts, learning path

**Output:** Visual connection map with prerequisite chains.

---

## 🚨 Emergency Cramming

### UC-25: 3-Hour Cram

**Scenario:** Exam is in 3 hours.

```bash
Prompt: "My TOC exam is in 3 hours! Give me a cram plan!"
```

**Workflow:**
1. Agent loads `skills/last-minute-crammer/SKILL.md`
2. Detects: 3-hour timeframe → Ultra-high-density mode
3. Generates: Memory palace for key concepts, acronym chains for definitions
4. Prioritizes: Only 3-4 highest-probability topics
5. Includes: Exam hall strategy guide

**Output:** 3-hour cram plan with memory aids.

---

## 🩺 Case Study Solving

### UC-26: Business Case Study

**Scenario:** Student needs to solve a management case study.

```bash
Prompt: "Solve this case study: A startup wants to choose between MongoDB and PostgreSQL. Analyze using SWOT framework. 10 marks."
```

**Workflow:**
1. Agent loads `skills/case-study-solver/SKILL.md`
2. Applies: SWOT framework
3. Generates: Problem ID → Analysis (SWOT) → Recommendation → Justification

**Output:** Structured case study solution with framework application.

---

## 🌍 Different University Adaptation

### UC-27: VTU Mechanical Engineering

**Scenario:** Student from a different university.

```bash
Prompt: "I'm a Mechanical Engineering student at VTU. My PYQs are at /home/student/pyqs/vtu/mech/. Generate sample papers for Fluid Mechanics."
```

**Workflow:**
1. Agent loads `skills/universal-university-adapter/SKILL.md`
2. Detects: VTU = 5 modules, 100 marks, 3 hours, OR within module
3. Routes to: `skills/exam-paper-generator/SKILL.md` with VTU context
4. Generates: VTU-formatted question paper with correct terminology

**Output:** VTU-style question paper with module-wise structure.

---

### UC-28: Oxford University Essay

**Scenario:** Humanities student from UK.

```bash
Prompt: "I'm studying History at Oxford. I need to write an essay on 'Causes of World War I'. 3-hour paper."
```

**Workflow:**
1. Agent loads university-adapter, detects Oxford pattern (essay-based, 3 hours)
2. Routes to answer-writer with Oxford context
3. Generates: Full essay with thesis, arguments, evidence, counterarguments, conclusion

**Output:** Oxford-style essay with proper academic structure.

---

### UC-29: US University Midterm

**Scenario:** US college student.

```bash
Prompt: "I have a midterm in CS 101 at my university. 50 minutes, mix of MCQs and short answers. Help me prepare."
```

**Workflow:**
1. Agent detects: US pattern (midterm format, MCQs + short answer, partial credit)
2. Generates: Practice midterm with MCQs + short answer questions
3. Includes: Time allocation per section, partial credit guidance

**Output:** US-style midterm practice paper with timing guide.

---

## 🎯 Full Exam Simulation

### UC-30: Complete Exam Simulation

**Scenario:** Student wants to practice under real exam conditions.

```bash
Prompt: "Simulate a full SPPU 2019 pattern DBMS exam. 2.5 hours, 70 marks. Generate the paper, then I'll answer, then you grade me."
```

**Workflow:**
1. Agent loads `skills/sppu-exam-simulator/SKILL.md`
2. Loads `skills/exam-paper-generator/SKILL.md`
3. Generates: Full question paper with time budget
4. Waits for student answers
5. Loads `skills/essay-grader/SKILL.md` to grade

**Output:** Full exam + grading cycle.

---

## 🔄 Multi-Step Workflows

### UC-31: Complete Semester Preparation

**Scenario:** Student wants end-to-end exam prep for one subject.

```bash
Prompt: "I want to prepare for DBMS. Here are my PYQs [upload]. Give me a complete study package."
```

**Workflow:**
```
Step 1: Load pyq-analyzer → Analyze PYQs
Step 2: Load imp-topics-generator → Generate IMP topics with 2-week plan
Step 3: Load notes-generator → Generate Cornell notes for each IMP topic
Step 4: Load mcq-practice-generator → Generate 20 practice MCQs
Step 5: Load flashcard-generator → Generate Anki flashcards
Step 6: Load essay-grader → Let student practice and get graded
```

**Output:** Complete study package: analysis + plan + notes + MCQs + flashcards + grading.

---

### UC-32: Assignment Pipeline

**Scenario:** Student needs to go from assignment PDF to submitted document.

```bash
Prompt: "I got this assignment PDF [upload]. I need it written and submitted as PDF."
```

**Workflow:**
```
Step 1: Load document-reader → Extract text from PDF
Step 2: Load assignment-writer → Write complete assignment
Step 3: Load document-generator → Convert to PDF
```

**Output:** Submitted-ready PDF document.

---

### UC-33: Last-Minute Overnight Prep

**Scenario:** Exam is tomorrow morning.

```bash
Prompt: "My OS exam is tomorrow at 9 AM. It's 8 PM now. HELP!"
```

**Workflow:**
```
12 hours total:
  Hours 1-2: Load crammer → Memory palace setup
  Hours 3-4: Load formula-sheet → Create one-page formula reference
  Hours 5-7: Load mind-map → Create revision mind maps
  Hours 8-10: Load mcq-practice → Test yourself
  Hours 11: Load crammer → Rapid review
  Hour 12: Sleep (critical!)
```

**Output:** 12-hour overnight prep plan with all resources.

---

## Summary

| Use Case | Skills Used | Time Required |
|---|---|---|
| Standard answer | answer-writer | 15 min |
| Numerical answer | answer-writer | 20 min |
| Notes generation | notes-generator | 30 min |
| PYQ analysis | pyq-analyzer | 45 min |
| IMP topics + plan | imp-topics-generator + study-planner | 30 min |
| Assignment | assignment-writer | 1-2 hours |
| Exam paper | exam-paper-generator | 30 min |
| Flashcards | flashcard-generator | 20 min |
| MCQs | mcq-practice-generator | 15 min |
| Viva prep | viva-oral-exam-prep | 30 min |
| Lab report | lab-report-writer | 45 min |
| Formula sheet | formula-sheet-generator | 20 min |
| Mind map | mind-map-generator | 15 min |
| Essay grading | essay-grader | 10 min |
| Cross-subject | cross-subject-mapper | 20 min |
| Cram plan | last-minute-crammer | 5 min |
| Case study | case-study-solver | 30 min |
| Different university | university-adapter + any skill | Varies |
| Full exam simulation | sppu-exam-simulator + answer-writer + essay-grader | 2.5 hrs |
| Complete prep (all) | All skills | 1-2 weeks |
