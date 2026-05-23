---
name: sppu-universal-adapter
description: >
  Universal entry point for ANY SPPU engineering department. Scans user-provided directory for PYQ PDFs and syllabus PDFs,
  identifies department and subjects, then routes to the correct skill. If no PDFs found, asks user to provide them.
  Use this when user mentions a non-Comp department (Mechanical, Civil, Electrical, AIDS, etc.) or doesn't specify their department.
---

# SPPU Universal Department Adapter

## When to Use This Skill

Activate this skill when:
- User mentions a department OTHER than Computer Engineering (e.g., Mechanical, Civil, Electrical, Electronics, AIDS, etc.)
- User does NOT specify their department
- User says "I have PYQs in this folder" without specifying department
- User asks "Will this work for my department?"

## Workflow

### Step 1: Ask for Directory (if not provided)

If user hasn't provided a directory:
> "Please provide the directory path containing your PYQ PDFs and syllabus PDFs, or upload them directly."

### Step 2: Scan Directory

If user provides a path like `/home/user/SPPU PYQs`:
1. Recursively list all `.pdf` files using glob tool
2. Record file names, sizes, and paths
3. Identify which files are:
   - **Syllabus PDFs** — filenames containing "syllabus", "curriculum", "pattern", "rules"
   - **PYQ PDFs** — filenames containing subject codes, semester names, exam types (End Sem, In Sem)
   - **Merged collections** — files with "merged", "AIO", "all" in name

### Step 3: Read & Identify Department

Read the syllabus PDF (or text extract) to identify:
- Department name (Mechanical, Civil, Electrical, etc.)
- Academic pattern (2019 or 2024)
- Semester structure
- Subject names and codes
- Course Outcomes

Read a sample PYQ to understand:
- Question paper format (OR structure, mark distribution)
- Subject naming conventions
- Question types (theory, numerical, diagram-based)

### Step 4: Route to Correct Skill

Once department and pattern are identified:
- **For answer writing** → Load `skills/answer-writer/SKILL.md` (it works for ANY department)
- **For PYQ analysis** → Load `skills/pyq-analyzer/SKILL.md`
- **For notes generation** → Load `skills/notes-generator/SKILL.md`
- **For IMP topics** → Load `skills/imp-topics-generator/SKILL.md`
- **For assignments** → Load `skills/assignment-writer/SKILL.md`

### Step 5: Adapt Content to Department

The loaded skill's instructions are department-agnostic. Adapt by:
- Using the department's actual subject names and terminology from their syllabus PDF
- Applying the department's exam pattern (marks distribution, OR structure)
- Using department-specific examples in answers
- Referencing the department's Course Outcomes from their syllabus

## If No PDFs Found

If the directory has no PDFs, or user hasn't provided any:
> "No PDFs found. Please provide:
> 1. Your SPPU syllabus PDF (for your department)
> 2. At least 2-3 Previous Year Question Paper PDFs
>
> You can upload them directly in the chat or provide a directory path."

## Important Notes

- The skills in this repo are **department-agnostic** — they teach *how* to write answers and analyze papers, not *what* subject content to use
- Subject-specific intelligence comes from the **PDFs you provide**, not from pre-loaded data
- Computer Engineering is pre-configured by default (has syllabus reference in `SYLLABUS.md` and `pyq-index/SKILL.md`)
- For any other department, the AI builds intelligence from your uploaded PDFs
