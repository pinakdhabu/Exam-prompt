---
name: universal-code-solution-generator
description: >
  Generates step-by-step solutions for coding problems, numericals, and programming assignments for
  ANY university worldwide. Produces explanation, algorithm, pseudocode, actual code, complexity
  analysis, and test cases. Works for ALL programming languages, ALL subjects, ALL exam patterns.
---

# Universal Code Solution Generator

Generates exam-ready coding solutions with proper formatting, explanation, and analysis.

## Capabilities

- **Algorithm design**: Step-by-step approach to solve the problem
- **Pseudocode**: Language-agnostic logic representation
- **Actual code**: In user's specified programming language
- **Complexity analysis**: Time and space with justification
- **Test cases**: Sample inputs with expected outputs
- **Edge cases**: Points out boundary conditions
- **Dry run**: Manual trace of code execution for small input

## Usage

Trigger when user asks for:

- "Write a program to..."
- "Solve this coding problem"
- "How to implement..."
- "Code for..."
- "Algorithm for..."

## Output Format

````
Problem: [Original problem statement]

Approach: [Strategy explanation]

Algorithm:
Step 1: ...
Step 2: ...

Pseudocode:
[language-agnostic pseudocode]

Implementation ([Language]):
```[language]
[actual code]
````

Complexity:

- Time: O(...) - [justification]
- Space: O(...) - [justification]

Test Cases: | Input | Expected Output | Actual Output | |-------|----------------|---------------| |
... | ... | ... |

Edge Cases:

- [boundary condition 1]
- [boundary condition 2]

Dry Run (for small input): [manual trace with variable states at each step]

```

## Supported Languages

C, C++, Java, Python, JavaScript, TypeScript, Go, Rust, Kotlin, SQL, R, MATLAB, and any language specified by the user.

---

## Error Handling

| Situation | Action |
|---|---|
| Language not specified | Auto-detect from problem context or ask user; default to Python if ambiguous |
| Code incomplete | Generate complete solution with full implementation; note any assumptions |
| Complexity ambiguous | Analyze both time and space complexity with justification for each |
| Test cases missing | Generate at least 3 test cases including normal, edge, and boundary cases |

## Quality Gate — Check Before Output

- [ ] Code compiles/runs without syntax errors in the specified language
- [ ] Complexity analysis present with O-notation and clear justification
- [ ] Edge cases handled (empty input, boundary values, null/undefined, large inputs)
- [ ] Output matches expected format (problem → approach → algorithm → pseudocode → code → complexity → tests)
- [ ] Test cases include input, expected output, and actual output columns

## Integration with Other Skills

| Skill | Integration |
|---|---|
| **universal-session-config** | Reads language preferences and subject context from session profile |
| **universal-a-plus-answer-writer** | Provides exam-ready answer techniques for code-based exam questions |
| **universal-diagram-generator** | Renders flowcharts and algorithm diagrams from Mermaid code blocks in solutions |
```
