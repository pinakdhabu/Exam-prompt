---
name: universal-viva-oral-exam-prep
description:
  Prepares students for oral exams, viva voce, interviews, and defense presentations for ANY
  university worldwide. Simulates realistic examiner-student dialogue with follow-up questions,
  anticipated probes, and grading criteria. Covers ALL disciplines, ALL exam conditions
  (closed/open, panel, individual, online).
---

# Universal Viva / Oral Exam Preparation

## Overview

Prepares students comprehensively for oral examination formats. Simulates examiner behavior,
anticipates follow-up questions based on answer content, and provides answer framing strategies
calibrated to the examiner's expected standards. Covers all viva formats from undergraduate lab viva
to PhD defense.

## How This Skill Works

1. **User provides**: Subject/topic, viva type (lab, project, course, comprehensive, PhD defense),
   university, exam duration, panel size
2. **System analyzes**: Expected question domains, common examiner strategies, weak spots typically
   probed
3. **System simulates**: Mock viva session with questions, answers, follow-ups, and examiner
   feedback
4. **System provides**: Question bank, answer templates, confidence-building strategies

## 1. Viva Types

| Viva Type               | Duration   | Panel Size               | Question Style                                     | Preparation Focus                                        |
| ----------------------- | ---------- | ------------------------ | -------------------------------------------------- | -------------------------------------------------------- |
| **Lab Viva**            | 5-10 min   | 1 examiner               | Procedure, results, observations, apparatus        | Practical steps, expected outputs, troubleshooting       |
| **Course Viva**         | 10-20 min  | 1-2 examiners            | All course topics, depth varies                    | Syllabus coverage, weak area probing                     |
| **Project Viva**        | 15-30 min  | 2-3 examiners            | Your specific project, methodology, decisions      | Justify choices, explain design, results analysis        |
| **Comprehensive**       | 30-60 min  | 3-5 examiners            | Multi-subject, cross-domain connections            | Integrate knowledge across courses                       |
| **PhD Defense**         | 60-120 min | 3-5 examiners + audience | Deep research questions, contribution, future work | Thesis defense, contribution defense, publication record |
| **Internship Viva**     | 10-20 min  | 1-2 panelists            | Work done, skills applied, learning outcomes       | Project contributions, technical skills, soft skills     |
| **Admission Interview** | 15-30 min  | 1-3 panelists            | Motivation, background, subject interest           | Personal narrative, subject passion, career goals        |
| **Online Viva**         | Variable   | Screen-share + panel     | Similar to above but with tech demo component      | Clear speech, screen readiness, backup plans             |

## 2. Examiner Strategy Profiles

Examiners typically follow one or more of these strategies:

| Examiner Type              | Behavior                                 | How to Handle                                                         |
| -------------------------- | ---------------------------------------- | --------------------------------------------------------------------- |
| **The Foundation Prober**  | Starts easy, keeps asking "why"          | Build answers from basics; never skip fundamentals                    |
| **The Application-Seeker** | Always asks "give an example"            | Prepare examples for every concept                                    |
| **The Devil's Advocate**   | Challenges every answer                  | Stay calm; acknowledge then defend with evidence                      |
| **The Comparer**           | "How is X different from Y?"             | Prepare compare-contrast pairs for key concepts                       |
| **The Deep Diver**         | Picks one topic and goes deep            | Choose what you say carefully; every point can be explored            |
| **The Story Teller**       | Asks about your journey                  | Prepare your narrative arc clearly                                    |
| **The Silent One**         | Says little, expects you to keep talking | Structure answers as complete explanations; watch for non-verbal cues |

## 3. Answer Framing Framework

### Structure: CLAIM EVIDENCE LINK

| Component    | Purpose                               | Example                                                                                                                      |
| ------------ | ------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| **Claim**    | Direct answer to the question         | "TCP is a connection-oriented protocol."                                                                                     |
| **Evidence** | Support with facts, data, or examples | "It uses a three-way handshake (SYN, SYN-ACK, ACK) before data transfer and includes flow control via sliding window."       |
| **Link**     | Connect back to the broader context   | "This reliability makes TCP suitable for applications like web browsing and file transfer where data integrity is critical." |

### Answer Depth Levels

| Level        | Depth                                                  | When to Use                                           |
| ------------ | ------------------------------------------------------ | ----------------------------------------------------- |
| **Basic**    | 2-3 sentences, direct answer                           | Initial answer; let examiner decide if they want more |
| **Standard** | 4-6 sentences, with example                            | Most questions; shows competence                      |
| **Detailed** | 7-10 sentences, with mechanism + example + edge case   | When examiner nods or says "tell me more"             |
| **Expert**   | Full explanation with nuance, exceptions, and research | PhD defense, comprehensive viva                       |

### If You Don't Know

```
Step 1: Acknowledge honestly
"I am not entirely certain about [specific aspect], but I can explain what I know about [related concept]."

Step 2: Show reasoning ability
"Based on my understanding of the underlying principles, I believe the answer would be..."

Step 3: Offer to explore
"I would be happy to work through the reasoning or look into this further."

Avoid: Bluffing, guessing randomly, saying "I don't know" and stopping.
```

## 4. Common Follow-Up Probes

| Initial Answer                    | Likely Follow-Up                                                        | Preparation                               |
| --------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------- |
| "I used X algorithm."             | "Why X over Y? What are the trade-offs?"                                | Know alternatives and their pros/cons     |
| "The result was Z."               | "How did you validate that result? Could there be another explanation?" | Know your validation methodology          |
| "X is important because..."       | "Under what conditions would X NOT be important?"                       | Understand edge cases and limitations     |
| "The concept works like this..."  | "How does it differ in real-world vs ideal conditions?"                 | Know practical vs theoretical differences |
| "I studied this from [textbook]." | "What are the criticisms or limitations of that approach?"              | Know multiple perspectives                |

## 5. Mock Viva Simulation

**User**: Simulate a 10-minute lab viva on Sorting Algorithms for VTU CSE, 3rd semester.

```
Examiner: Explain the working of Quick Sort.
You: "Quick Sort is a divide-and-conquer algorithm. It selects a pivot element, partitions the array around the pivot such that elements smaller than the pivot go left and larger go right, then recursively sorts the sub-arrays."

Examiner: How do you choose the pivot? Does it matter?
You: "Yes, pivot choice significantly affects performance. Common strategies: first element, last element, median-of-three, or random. A bad pivot (always smallest or largest) gives O(n^2) worst case. Random pivot selection probabilistically avoids worst-case behavior."

Examiner: Can you implement the partition function?
You: [Write pseudo-code for Lomuto or Hoare partition while explaining each step]

Examiner: When would you NOT use Quick Sort?
You: "Quick Sort is not suitable when: (1) stable sorting is required (it is not stable), (2) data is nearly sorted (unless randomized), (3) worst-case guarantees are critical (use Merge Sort or Heap Sort instead), (4) recursion depth is limited (embedded systems)."

Examiner: Good. Compare Quick Sort and Merge Sort.
...
```

## 6. Preparation Checklist

| Task                                     | When          | Duration |
| ---------------------------------------- | ------------- | -------- |
| List all possible question domains       | 1 week before | 1 hr     |
| Prepare 2-minute answers for each domain | 1 week before | 2 hrs    |
| Identify compare-contrast pairs          | 3 days before | 1 hr     |
| List potential "I don't know" scenarios  | 3 days before | 30 min   |
| Mock session with peer (record it)       | 2 days before | 1 hr     |
| Review your own mock session             | 1 day before  | 30 min   |
| Prepare tech setup (online viva)         | 1 day before  | 30 min   |

## 7. Common Mistakes

| Mistake                            | Why It Hurts                  | Better Approach                                               |
| ---------------------------------- | ----------------------------- | ------------------------------------------------------------- |
| One-word answers                   | Shows no depth                | Expand with 2-3 sentence CLAIM EVIDENCE LINK                  |
| Talking too long without structure | Examiner loses interest       | Structured "topic sentence + explanation + wrap-up"           |
| Arguing with examiner              | Creates negative impression   | Acknowledge their point, then provide your evidence           |
| Not making eye contact (in-person) | Signals lack of confidence    | Maintain natural eye contact; look at different panel members |
| Reading from notes (online)        | Noticeably reduces engagement | Use brief bullet points only; speak naturally                 |
| Stopping at "I don't know"         | Shows no problem-solving      | Use "I'm not sure, but here's how I would approach it"        |

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

## 8. Integration with Other Skills

- **universal-notes-generator**: Creates structured notes that serve as answer reference material
- **universal-mcq-practice-generator**: Tests fundamental knowledge that viva questions build upon
- **universal-a-plus-answer-writer**: Provides structured answer templates adaptable to oral
  delivery
- **universal-flashcard-generator**: Creates quick-recall flashcards for viva preparation
- **universal-thesis-generator**: Provides thesis content for PhD defense and comprehensive viva
  preparation

---

## 9. STAR / PAR Framework for Behavioral & Project Vivas

For project vivas, internship vivas, and behavioral questions, use the STAR or PAR framework instead
of CLAIM EVIDENCE LINK.

### STAR Framework (Situation, Task, Action, Result)

| Component     | Purpose                            | Example (Project Viva)                                                                           |
| ------------- | ---------------------------------- | ------------------------------------------------------------------------------------------------ |
| **Situation** | Describe the context               | "Our final-year project was to build a real-time traffic management system."                     |
| **Task**      | State your specific responsibility | "I was responsible for the vehicle detection module using YOLOv5."                               |
| **Action**    | Explain what you did and how       | "I collected 5000 annotated images, fine-tuned the model, and achieved 92% mAP on the test set." |
| **Result**    | State the outcome and impact       | "The system reduced average intersection wait time by 34% in simulation."                        |

### PAR Framework (Problem, Action, Result) — Compact version

| Component   | Purpose                   | Example                                                             |
| ----------- | ------------------------- | ------------------------------------------------------------------- |
| **Problem** | What was the challenge?   | "The existing system had 40% false positives in vehicle detection." |
| **Action**  | What did you do about it? | "I implemented background subtraction with adaptive thresholding."  |
| **Result**  | What was the improvement? | "False positives dropped to 8%, and detection speed improved 2x."   |

### When to Use Which

| Viva Type                     | Recommended Framework | Why                                     |
| ----------------------------- | --------------------- | --------------------------------------- |
| Technical project viva        | STAR                  | Depth of technical contribution matters |
| Internship viva               | PAR                   | Impact-focused, time-constrained        |
| Behavioral / HR-style         | STAR                  | Shows soft skills and problem-solving   |
| Comprehensive (cross-subject) | CLAIM EVIDENCE LINK   | Knowledge-based, not project-based      |
| PhD defense (contributions)   | STAR                  | Highlights specific research impact     |

---

## 10. Technical Whiteboard Protocol

For vivas that involve whiteboard coding, diagramming, or algorithm explanation:

### Whiteboard Communication Structure

```
Step 1: CLARIFY
  "Let me make sure I understand the problem. We need to..."
  [Paraphrase question, confirm with examiner]

Step 2: THINK ALOUD
  "I'm thinking about this approach..."
  [Narrate your thought process — examiners want to see reasoning, not just the answer]

Step 3: SKETCH
  "Let me draw the high-level structure first."
  [Draw boxes/lines; label components; keep it simple]

Step 4: EXPLAIN
  "This component handles X, this one handles Y..."
  [Walk through the diagram; point as you explain]

Step 5: CODE / DETAIL
  "Now I'll implement the core logic..."
  [Write pseudo-code or actual code left-to-right, top-to-bottom]

Step 6: TRACE
  "Let me trace through an example to verify..."
  [Run a sample input through your code/diagram verbally]

Step 7: WRAP
  "To summarize, this solution achieves..."
  [Recap complexity, trade-offs, edge cases]
```

### Whiteboard Etiquette

| Do                                        | Don't                                           |
| ----------------------------------------- | ----------------------------------------------- |
| Write legibly and large (visible from 2m) | Cram everything into a corner                   |
| Use clear labels and arrows               | Draw messy or unlabeled diagrams                |
| Keep diagrams simple (max 5-7 components) | Overcomplicate with unnecessary detail          |
| Erase only when space runs out            | Erase immediately — examiner may refer back     |
| Use color if markers available            | Spend time on artistic quality                  |
| Number steps or components                | Write in cursive (harder to read from distance) |

### Common Whiteboard Scenarios

| Scenario                      | Preparation                                                           |
| ----------------------------- | --------------------------------------------------------------------- |
| Data structure visualization  | Practice drawing linked lists, trees, graphs with labeled nodes       |
| Algorithm walkthrough         | Trace sorting/searching algorithms step-by-step with pointer movement |
| System design / architecture  | Draw layered diagrams (client → API → service → DB)                   |
| Network / protocol diagrams   | Practice TCP handshake, HTTP flow, OSI layer diagrams                 |
| Database schema / ER diagrams | Tables with keys, relationships, cardinality notation                 |
| Mathematical derivation       | Write equations top-to-bottom, number each line                       |

---

## 11. PhD Defense Long-Form Example

For PhD defense preparation, extend the Mock Viva Simulation into a full defense structure:

### Defense Format (Typical)

| Phase                 | Duration  | What Happens                                              | Preparation Focus                            |
| --------------------- | --------- | --------------------------------------------------------- | -------------------------------------------- |
| **Presentation**      | 20-30 min | Candidate presents thesis summary (slides)                | 3-minute-per-slide pacing, key contributions |
| **Panel Questions**   | 30-45 min | External + internal examiners probe methodology & results | Anticipate 10-15 deep questions              |
| **Open Floor**        | 10-20 min | Audience questions (if present)                           | Prepare 3-5 general-interest answers         |
| **Closed Session**    | 10-15 min | Panel deliberates (candidate waits outside)               | —                                            |
| **Result Announcement | 5 min     | Outcome and corrections (if any)                          | —                                            |

### Example Defense Q&A Sequence

```
Examiner: "Your work claims a 15% improvement over state-of-the-art. How did you ensure
a fair comparison?"

Candidate: [STAR framework]
  Situation: "The existing benchmarks in the literature use different datasets, making
  direct comparison unreliable."
  Task: "I needed a reproducible evaluation protocol that isolates the contribution of
  my method."
  Action: "I implemented all three competing methods from their published code, used the
  same train/test split across all, ran 5-fold cross-validation, and reported both mean
  and variance."
  Result: "The 15% improvement is statistically significant (p < 0.01, paired t-test).
  I've shared the full reproduction package on GitHub."

Examiner: "What would you do differently if you had another 6 months?"

Candidate: "Three directions: (1) extend the dataset to include [edge case], (2) explore
  [alternative architecture] which was published after my work, and (3) run a user study
  to validate practical impact. These are outlined in the future work section."
```

### PhD Defense Checklist

- [ ] Contribution statement refined to 2-3 sentences
- [ ] 10 anticipated examiner questions with STAR/PAR answers
- [ ] Weaknesses/future work identified and framed positively
- [ ] Publication list with venues and dates prepared
- [ ] Reproduction package / code repository accessible
- [ ] Backup slides for anticipated deep-dives
- [ ] Timing rehearsed (presentation fits within limit)
- [ ] Non-verbal cues rehearsed (eye contact, pacing, gestures)

---

## 12. Non-English Oral Exam Note

For oral exams conducted in languages other than English:

### Language-Specific Adaptations

| Language    | Common Exam Format                                                    | Key Preparation                                                      |
| ----------- | --------------------------------------------------------------------- | -------------------------------------------------------------------- |
| **Hindi**   | Viva often mixes Hindi + English (Hinglish)                           | Prepare key technical terms in both languages; expect code-switching |
| **French**  | "Soutenance" — defense format; formal register expected               | Use "vous" form; prepare "synthèse" and "perspectives" sections      |
| **German**  | "Mündliche Prüfung" — structured Q&A; precise terminology valued      | Prepare "Fachbegriffe" (technical terms) in German                   |
| **Spanish** | "Defensa" or "Examen oral" — panel style, less formal than French     | Prepare "resumen ejecutivo" and "conclusiones" sections              |
| **Arabic**  | Oral exams in technical universities often bilingual (Arabic/English) | Confirm which language examiner prefers for technical terms          |
| **Japanese" | "Kōgai" (口頭試問) — formal Q&A; hierarchy matters                    | Use proper honorifics; prepare concise answers (time-limited)        |

### General Rules for Non-English Orals

1. **Confirm language** with the examiner at the start: "Should I answer in [language] or mix?"
2. **Technical terms**: Know the English term AND the local term — use both for clarity
3. **Formality**: Match the examiner's register — formal unless examiner switches to informal
4. **Pronunciation**: Practice saying key technical terms aloud in the exam language
5. **Filler phrases**: Learn local equivalents of "Let me think", "In other words", "For example"
6. **Code-switching**: If examiner switches languages mid-question, follow their lead

---

## Error Handling

| Error                              | Cause                                    | Solution                                                        |
| ---------------------------------- | ---------------------------------------- | --------------------------------------------------------------- |
| No viva type specified             | Missing exam format context              | Ask: lab, course, project, comprehensive, PhD defense, or other |
| No subject/topic provided          | No scope to prepare                      | Prompt for subject name or syllabus PDF                         |
| Panel size unknown                 | Missing context                          | Default to 1-2 examiners; let user correct                      |
| Question too vague                 | User asks unfocused question             | Ask "Which specific aspect would you like to practice?"         |
| Non-technical question mishandled  | Behavioral question in technical context | Switch to STAR/PAR framework                                    |
| Language mismatch                  | User prepares in different language      | Apply non-English oral exam rules from Section 12               |
| Whiteboard required but unprepared | User cannot draw diagrams on the spot    | Practice 5 common whiteboard patterns ahead of time             |
| PhD defense unprepared             | User lacks defense structure             | Use PhD Defense Checklist (Section 11) to scaffold preparation  |
| Mock session times out             | User runs out of prepared time           | Compress mock session; prioritize high-probability questions    |

## Quality Gate

Before presenting viva preparation materials, verify:

- [ ] Viva type is identified (lab, course, project, comprehensive, PhD defense, internship,
      interview)
- [ ] Subject/topic domain is specified
- [ ] University and exam pattern are known (from session config or user input)
- [ ] Answer framing framework matches viva type (CLAIM EVIDENCE LINK for technical, STAR/PAR for
      project/behavioral)
- [ ] At least one mock viva question is included for practice
- [ ] Common follow-up probes are anticipated (Section 4)
- [ ] Examiner strategy profile is identified (Section 2)
- [ ] Language is confirmed (use Section 12 rules if non-English)
- [ ] Whiteboard protocol is included if viva type involves diagrams/coding
- [ ] PhD defense checklist is included if viva type is PhD defense
- [ ] "I don't know" protocol (Section 3) is available for reference
- [ ] Preparation checklist (Section 6) timeline is feasible given available days
- [ ] Integration with related skills (thesis-generator, notes-generator, mcq-practice-generator) is
      active

If any check fails, prompt for missing information or apply sensible defaults before continuing.
