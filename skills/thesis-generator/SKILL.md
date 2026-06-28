---
name: universal-thesis-generator
description: >
  Generates complete academic thesis, dissertation, or project report structures for ANY university
  worldwide. Supports all sections — abstract, introduction, literature review, methodology,
  implementation, results, conclusion. Adapts to university-specific formatting guidelines and
  citation styles.
---

# Universal Thesis Generator

Generates structured academic thesis/dissertation/project report content with proper formatting.

## Supported Output Types

| Type                  | Typical Length | Audience              |
| --------------------- | -------------- | --------------------- |
| **Bachelor's thesis** | 40-80 pages    | Academic committee    |
| **Master's thesis**   | 60-120 pages   | Supervisor + examiner |
| **PhD dissertation**  | 150-300 pages  | Doctoral committee    |
| **Project report**    | 30-50 pages    | Department faculty    |
| **Term paper**        | 10-20 pages    | Course instructor     |

### Per-Degree Length Guidance

| Degree Level        | Typical Pages | Chapters | Figures/Tables | References   |
| ------------------- | ------------- | -------- | -------------- | ------------ |
| **Bachelor's (B.E./B.Tech)** | 40–60  | 5–6      | 10–20          | 20–40        |
| **Bachelor's (B.Sc/BA)**     | 30–50  | 4–5      | 5–15           | 15–30        |
| **Master's (M.E./M.Tech)**   | 60–100 | 5–7      | 20–40          | 40–80        |
| **Master's (M.Sc/MA)**       | 50–80  | 5–6      | 10–25          | 30–60        |
| **M.Phil.**                  | 80–120 | 5–6      | 15–30          | 50–100       |
| **PhD**                      | 150–250 | 7–9     | 30–60          | 100–250      |
| **PhD (STEM fields)**        | 150–200 | 7–8     | 40–60          | 120–200      |
| **PhD (Humanities/Social Sciences)** | 200–300 | 8–9 | 10–20          | 150–250      |

Adjust based on university-specific guidelines where available. Shorter PhD dissertations (100–150 pages) are common in UK/European programs with published-paper formats.

## Structure Template

```
1. Abstract — Summary of entire work (200-300 words)
2. Introduction — Problem statement, objectives, scope
3. Literature Review — Existing work, gaps, contribution
4. Methodology — Approach, tools, techniques used
5. Implementation — System design, algorithms, results
6. Testing & Analysis — Test cases, performance, discussion
7. Conclusion — Findings, limitations, future work
8. References — Bibliography in specified citation style
```

## Usage

Trigger when user asks for:

- "Thesis on..."
- "Dissertation on..."
- "Project report on..."
- "Research paper on..."
- "Term paper on..."

## Supported Citation Styles

APA, MLA, Chicago, IEEE, Harvard, Vancouver, ACM, or custom per university guidelines.

## Ethics & Data Management

### Required Ethics Section Content

Every thesis/dissertation must include an ethics statement addressing:

| Aspect                    | What to Cover                                                          |
| ------------------------- | ---------------------------------------------------------------------- |
| **Data collection**       | How data was obtained (surveys, experiments, public datasets, scraping) |
| **Informed consent**      | Was consent obtained? How was privacy protected? (if human subjects)    |
| **IRB/ethics approval**   | Approval number and institution (if required by university)             |
| **Data storage**          | Where and how long raw data is stored (GDPR/DPA compliance)           |
| **Reproducibility**       | Steps taken to ensure results can be independently verified            |
| **Bias & limitations**    | Acknowledged confounders, biases, and scope constraints                |
| **AI tools disclosure**   | Declaration of any AI/LLM tools used in writing or analysis            |

### Data Management Plan Template

```
Data Management Plan
├── Data types: [experimental, survey, simulation, observational]
├── Volume: [estimated storage requirements]
├── Formats: [CSV, JSON, HDF5, MATLAB, etc.]
├── Storage: [local backup, institutional repo, cloud with encryption]
├── Sharing: [public repository, available on request, embargo period]
├── Retention: [duration required by university/funder policy]
└── Ethics approval: [reference number if applicable]
```

## Viva / Defense Cross-Reference

This thesis generator interfaces with `universal-viva-oral-exam-prep` for defense preparation:

| Thesis Phase             | Viva Prep Needed                                          |
| ------------------------ | --------------------------------------------------------- |
| After proposal           | Defense of methodology & scope                             |
| After literature review  | Anticipate questions on gaps and theoretical framework     |
| After results            | Prepare for results interpretation challenges              |
| Before submission        | Full mock defense: contributions, limitations, future work |
| Post-submission          | Panel question rehearsal, whiteboard protocol              |

Always cross-reference with `universal-viva-oral-exam-prep` when the user requests PhD defense or comprehensive viva materials.

## Error Handling

| Error                        | Cause                                   | Solution                                                   |
| ---------------------------- | --------------------------------------- | ---------------------------------------------------------- |
| No thesis type specified     | Missing degree level                    | Ask: Bachelor's, Master's, or PhD                          |
| Page count exceeds guidelines| Output too long for degree level         | Compress to per-degree length guidance above               |
| Citation style not supported | Unspecified or unknown format           | Default to IEEE for engineering, APA for sciences, MLA for arts |
| Ethics section missing       | Required by most universities            | Add ethics statement using the template above              |
| Missing supervisor info      | No advisor/guide mentioned              | Prompt for supervisor name and affiliation                  |
| Figure/table numbering error | Cross-references broken                 | Renumber sequentially; use automatic labeling               |
| Bibliography format wrong    | Bib entries don't match style            | Validate against style guide; regenerate reference list     |

## Quality Gate

Before delivering thesis output, verify:

- [ ] Degree level is specified and per-degree length guidance is applied
- [ ] All required chapters are present (abstract through references)
- [ ] Ethics & data management section is included (for thesis/dissertation)
- [ ] Citation style matches university requirements
- [ ] Figure/table numbering is sequential and cross-references match
- [ ] Page count falls within per-degree guidance range
- [ ] Viva/defense readiness is flagged if PhD or Master's thesis
- [ ] All citations in text appear in the bibliography and vice versa
- [ ] No placeholder text ("TODO", "TBD", "Lorem ipsum") remains

## Integration with Other Skills

| Skill                              | Integration                                                         |
| ---------------------------------- | ------------------------------------------------------------------- |
| **universal-viva-oral-exam-prep**  | Provides defense preparation, mock viva, and panel Q&A simulation   |
| **universal-document-reader**      | Converts source PDFs (papers, references) to extraction-ready text  |
| **universal-document-generator**   | Converts thesis markdown to print-ready PDF with proper formatting  |
| **universal-cross-subject-mapper** | Maps interdisciplinary connections for literature review            |
| **universal-session-config**       | Reads university, department, and citation style preferences        |
