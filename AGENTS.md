<skills_system priority="1">

## Available Skills

<!-- SKILLS_TABLE_START -->
<usage>
When users ask you to perform tasks related to exam preparation, answer writing, notes generation, PYQ analysis, or any academic work — check if any of the available skills below can help.

How to use skills:
- Skills are in the `skills/` directory, each with a `SKILL.md` file
- Read the appropriate skill's SKILL.md for detailed instructions
- Base directory for skills: `./skills/<skill-name>/`

Usage notes:
- Only use skills listed in <available_skills> below
- Do not invoke a skill that is already loaded in your context
- This repo is pre-configured for SPPU Computer Engineering. For OTHER universities:
  1. Load `universal-university-adapter` skill
  2. Provide a directory path containing PYQ PDFs and syllabus PDFs, or upload them directly
  3. The adapter scans, identifies the university pattern, and routes to the correct skill
  4. If nothing provided → it asks: "Please provide your syllabus PDF and PYQ pdfs"
- All skills work for ANY university, ANY department, ANY subject worldwide
</usage>

<available_skills>

<skill>
<name>universal-a-plus-answer-writer</name>
<description>Generates 10/10 GPA exam answers for ANY university worldwide. Covers ALL question types (theory, numerical, MCQ, case study, derivation, diagram, design, oral, lab), ALL mark levels (1-100+), ALL 50+ command words, ALL exam conditions (closed/open book, online, viva, take-home), and ALL 6 Bloom's levels. Pre-configured with SPPU Computer Engineering intelligence. Adapts to any syllabus PDF.</description>
<location>project</location>
</skill>

<skill>
<name>universal-notes-generator</name>
<description>Generates syllabus-locked exam-ready NOTES for ANY university worldwide. Supports 12+ note formats (Outline, Cornell, Mind Map, Flowchart, Table, Q&A, Summary, Detailed, Formula Sheet, Diagram, Rapid Revision, Cross-Subject) with auto-format selection. Works for ALL subjects, ALL departments.</description>
<location>project</location>
</skill>

<skill>
<name>universal-pyq-analyzer</name>
<description>Analyzes Previous Year Question Papers and syllabus from ANY university worldwide. Covers 13+ analysis types (frequency, weightage, marks, Bloom's, pattern, difficulty, CO mapping, trends, gap analysis) with statistical methods. Outputs probability-ranked topics, strategic advice, and exam prediction.</description>
<location>project</location>
</skill>

<skill>
<name>universal-imp-topics-generator</name>
<description>Generates high-probability IMP topics and exam strategies for ANY university worldwide. Covers 5 probability levels (Very High to Safe-to-Skim), 7 time-plan options (emergency to 1-month), per-unit strategies, and GPA-targeted preparation tracks. Outputs Must-Prepare, Selective, and Safe-to-Skim with exact question predictions grouped by marks.</description>
<location>project</location>
</skill>

<skill>
<name>universal-assignment-writer</name>
<description>Generates assignment-ready content for ANY university worldwide. Covers 12 assignment types (theory, numerical, case study, research, literature review, proposal, design, analysis, comparison, critical review, problem-solving, diagram) with 6 output formats. Always includes marking scheme, Bloom's level, and CO alignment.</description>
<location>project</location>
</skill>

<skill>
<name>universal-exam-paper-generator</name>
<description>Generates full exam question papers for ANY university worldwide. Supports 11+ university patterns (SPPU 2019/2024, VTU, JNTU, Mumbai, AKTU, RGPV, IIT/NIT, North American, UK/Oxford/Cambridge, Generic). Covers 13 question types with CO/Bloom mapping, marking schemes, and answer keys.</description>
<location>project</location>
</skill>

<skill>
<name>universal-subject-prompt-bank</name>
<description>Pre-optimized sample answers for ANY subject at ANY university. Contains a Subject Template Framework with 8 discipline templates (Engineering, Science, Management, Law, Medical, CS, Math, Humanities). Includes 16 sample answers across all mark levels with time budgets. SPPU Computer Engineering reference implementation included.</description>
<location>project</location>
</skill>

<skill>
<name>sppu-pyq-index</name>
<description>Complete index of SPPU Previous Year Question Paper collection (2019-2025) organized by year, semester, subject. References local PDF collection for all Computer Engineering subjects including FE, Honors, and electives. SPPU-specific.</description>
<location>project</location>
</skill>

<skill>
<name>universal-university-adapter</name>
<description>Universal entry point for ANY university worldwide. Detects university from directory scan, uploaded PDFs, verbal description, URL, or implicit context. Identifies exam pattern (Indian/US/UK/European/Australian/Asian), routes to the correct universal skill, and adapts content to the user's specific university and department. If no PDFs found, asks user to provide them.</description>
<location>project</location>
</skill>

</available_skills>
<!-- SKILLS_TABLE_END -->

</skills_system>
