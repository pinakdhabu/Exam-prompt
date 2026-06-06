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

## 8. Integration with Other Skills

- **universal-notes-generator**: Creates structured notes that serve as answer reference material
- **universal-mcq-practice-generator**: Tests fundamental knowledge that viva questions build upon
- **universal-answer-writer**: Provides structured answer templates adaptable to oral delivery
- **universal-flashcard-generator**: Creates quick-recall flashcards for viva preparation
