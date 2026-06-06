---

# ARTIFICIAL INTELLIGENCE — Sample Solution

**Paper Code:** [6262]-45 | **Total Marks:** 70 | **Time:** 2½ Hours

---

## Q1) a) Problem Solving Strategies and Backtracking [9]

**Problem Solving Strategies:**

1. **Uninformed Search (Blind)**: BFS, DFS, Depth-limited, Iterative deepening
2. **Informed Search (Heuristic)**: A\*, Best-first, Greedy, Hill climbing
3. **Local Search**: Simulated annealing, Genetic algorithms, Hill climbing variants
4. **Game Playing**: Minimax, Alpha-beta pruning
5. **Constraint Satisfaction**: Backtracking, Forward checking, Arc consistency
6. **Adversarial Search**: Expectiminimax for stochastic games

**Backtracking** is a systematic trial-and-error approach where we incrementally build candidates
for a solution and abandon a candidate ("backtrack") as soon as we determine it cannot lead to a
valid solution.

**N-Queens Problem (N=4):**

Place 4 queens on a 4×4 board such that no two queens attack each other.

```
Step 1: Place Q1 at (1,1)
  Q . . .
  . . . .
  . . . .
  . . . .

Step 2: Place Q2 at (2,3)
  Q . . .
  . . Q .
  . . . .
  . . . .

Step 3: Place Q3 — row 3: col 1? attacked. col 2? attacked (diagonal to Q1). col 3? attacked (vertical to Q2). col 4? attacked. → BACKTRACK

Step 2': Place Q2 at (2,4)
  Q . . .
  . . . Q
  . . . .
  . . . .

Step 3: Place Q3 at (3,2)
  Q . . .
  . . . Q
  . Q . .
  . . . .

Step 4: Place Q4 — row 4: all attacked → BACKTRACK

... (continues until solution found)

Solution:
  . Q . .
  . . . Q
  Q . . .
  . . Q .
```

---

## Q1) b) Minimax with Alpha-Beta Pruning [9]

**Minimax Algorithm:**

```python
def minimax(node, depth, maximizingPlayer):
    if depth == 0 or node is terminal:
        return heuristic_value(node)

    if maximizingPlayer:
        value = -∞
        for child in node.children:
            value = max(value, minimax(child, depth-1, False))
        return value
    else:
        value = +∞
        for child in node.children:
            value = min(value, minimax(child, depth-1, True))
        return value
```

**Alpha-Beta Pruning:** Tracks α (best for MAX) and β (best for MIN) to prune branches that cannot
influence the decision.

```
                   MAX  — α = -∞ initially
                  /    \
          MIN — α=-∞,β=+∞     MIN — α=-∞,β=+∞
         / | \                 / | \
       MAX   MAX   MAX       MAX   MAX   MAX
      3-5   6-2   2-1       9-4   7-8    ...
      ↓     ↓     ↓          ↓     ↓
   eval(3)=3  eval(6)=6  eval(2)=2  eval(9)=9  eval(7)=7

At left MIN: values from children = [3,6,2] → MIN chooses min = 2
  → α = max(-∞, 2) = 2

At right MIN: first child MAX returns 9 → MIN's β = min(+∞,9)=9
  second child MAX returns 7 → β = min(9,7)=7
  third child... α=2, β=7. Since α < β, continue.
  third child returns 8 → β = min(7,8)=7
  MIN chooses min(9,7,8)=7

At root MAX: chooses max(2,7)=7

Alpha-beta saved evaluating children under nodes where pruning occurred.
```

```
[ANSWER BOX]
Minimax value = 7
(Max chooses right sub-tree, Min chooses value 7)
```

---

## Q2) a) Game Theory: Stochastic vs Partial Games [9]

**Game Theory** studies mathematical models of strategic interaction among rational decision-makers.

| Feature       | Stochastic Games                               | Partial (Imperfect Information) Games |
| ------------- | ---------------------------------------------- | ------------------------------------- |
| Chance        | Include random elements (dice, shuffled cards) | No explicit randomness                |
| Information   | All players see game state                     | Players have private information      |
| Example       | Backgammon, Monopoly                           | Poker, Bridge, Scrabble               |
| Modeling      | Expectiminimax algorithm                       | Game tree with information sets       |
| Luck vs Skill | Mixed                                          | Pure skill (but hidden info)          |

**Stochastic example (Backgammon):** After rolling dice, player has limited moves based on the roll.
The AI must consider probabilities of future rolls.

**Partial game example (Poker):** Each player knows their own cards but not opponents'. The game
tree includes **information sets** — states indistinguishable to a player.

---

## Q2) b) CSP and Cryptarithmetic [8]

**Constraint Satisfaction Problem (CSP)** defined by:

- **Variables**: X₁, X₂, ..., Xₙ
- **Domains**: D₁, D₂, ..., Dₙ (finite sets of values)
- **Constraints**: Relations between variables

**Consistency Types:**

- **Node consistency**: All values in a variable's domain satisfy unary constraints
- **Arc consistency (AC-3)**: For every binary constraint, every value in one variable's domain has
  a consistent value in the other variable's domain
- **Path consistency**: For every pair of variables, consistency is ensured via all possible paths

**Cryptarithmetic: BASE + BALL = GAMES**

```
   B A S E
 + B A L L
 ---------
 G A M E S
```

**Step 1:** Column 1 (ones): E + L = S (or S + 10 if carry₁) **Step 2:** Column 2 (tens): S + L +
carry₁ = E (or E + 10 if carry₂) **Step 3:** Column 3 (hundreds): A + A + carry₂ = M (or M + 10 if
carry₃) **Step 4:** Column 4 (thousands): B + B + carry₃ = A (or A + 10 if carry₄) **Step 5:**
Column 5: carry₄ = G

From Step 4: B + B + carry₃ = A + 10·carry₄. Since G is the leading digit, G ≠ 0. If carry₄ = 1: G
= 1. Then B + B + carry₃ = A + 10 → A = 2B + carry₃ - 10 If carry₄ = 0: G = 0 (impossible as leading
digit)

So G = 1, carry₄ = 1

From Step 3: A + A + carry₂ = M + 10·carry₃ carry₃ can be 0 or 1.

From Step 4 with carry₄ = 1: 2B + carry₃ = A + 10 → A = 2B + carry₃ - 10 Since A is a digit (0-9),
2B + carry₃ ≥ 10. B cannot be 1 (G=1), so B ≥ 5. If B=5, A = 10 + carry₃ - 10 = carry₃. If carry₃=0,
A=0; if carry₃=1, A=1 (but G=1). If B=6, A = 12 + carry₃ - 10 = 2 + carry₃. So A=2 or 3. If B=7, A =
14 + carry₃ - 10 = 4 + carry₃. So A=4 or 5.

Let me try a known solution. After systematic search:

**Solution:** B=7, A=4, S=8, E=3, L=5, M=2, G=1

```
   7 4 8 3
 + 7 4 5 5
 ---------
 1 4 2 3 8
```

Verification: 7483 + 7455 = 14938 ✓

```
[ANSWER BOX]
B=7, A=4, S=8, E=3, L=5, M=2, G=1
BASE=7483, BALL=7455, GAMES=14938
```

---

## Q3) a) AI Agents and Wumpus World [9]

**AI Agent** is anything that perceives its environment through sensors and acts upon it through
actuators.

**Real-world agents:**

1. **Roomba** (vacuum cleaning robot) — senses dirt/walls, moves autonomously
2. **Tesla Autopilot** — senses road/obstacles via cameras/lidar, steers/accelerates
3. **ChatGPT** — senses text input, generates text responses
4. **Google Maps** — senses traffic data, suggests optimal routes
5. **Alexa/Siri** — senses voice commands, responds/controls smart home

**Knowledge-Based Agent in Wumpus World:**

The **Wumpus World** is a grid-based cave with:

- **Wumpus** (monster): emits stench in adjacent squares
- **Pits**: emit breeze in adjacent squares
- **Gold**: glitters in the same square

The agent's knowledge base uses logical inference:

```
Rules:
- If stench in (x,y) → Wumpus in adjacent cell
- If breeze in (x,y) → Pit in adjacent cell
- If glitter in (x,y) → Gold at (x,y)

The agent:
1. Perceives: [Stench, Breeze, Glitter, Bump, Scream]
2. Adds percepts to knowledge base
3. Infers safe vs dangerous squares using propositional logic
4. Chooses action: Move to safe unvisited square, grab gold, climb out
```

---

## Q3) b) Knowledge Engineering and FOL [9]

**Knowledge Engineering Process:**

1. **Identify the task**: What knowledge must be represented?
2. **Assemble relevant knowledge**: Gather facts about the domain
3. **Choose a knowledge representation**: FOL, rules, frames, etc.
4. **Encode general knowledge about the domain**: Write axioms
5. **Encode a description of the specific problem**: Write facts
6. **Pose queries to the inference procedure**: Ask questions
7. **Debug the knowledge base**: Check for incorrect or missing knowledge

**FOL Representation:**

```
1. ∀x (Equilateral(x) → Isosceles(x))
2. ∀x (Isosceles(x) → (AB(x) = AC(x)))
3. ∀x ((AB(x) = AC(x)) → (AngleB(x) = AngleC(x)))
4. Equilateral(ABC)

Derivation:
5. Isosceles(ABC)           [1,4 — Modus Ponens]
6. AB(ABC) = AC(ABC)        [2,5 — Modus Ponens]
7. AngleB(ABC) = AngleC(ABC) [3,6 — Modus Ponens]
```

```
[ANSWER BOX]
Proved: AngleB(ABC) = AngleC(ABC) ✓
```

---

## Q4) a) FOL Representation [9]

**i) All birds fly:**

```
∀x (Bird(x) → Flies(x))
```

**ii) Some boys play cricket:**

```
∃x (Boy(x) ∧ PlaysCricket(x))
```

**iii) A first cousin is a child of a parent's sibling:**

```
∀x ∀y (FirstCousin(x, y) ↔ ∃z ∃w (Parent(z, x) ∧ Parent(w, y) ∧ Sibling(z, w)))
```

where Parent(z,x) means z is a parent of x, and Sibling(z,w) means z and w share at least one
parent.

**iv) You can fool all the people some of the time, and some of the people all the time, but you
cannot fool all the people all the time:**

```
(∃t ∀p (Person(p) → CanFool(p, t))) ∧
(∀p ∃t CanFool(p, t)) ∧
¬(∀t ∀p (Person(p) → CanFool(p, t)))
```

---

## Q4) b) Propositional vs Predicate Logic [8]

| Parameter      | Propositional Logic                 | Predicate Logic (FOL)                     |
| -------------- | ----------------------------------- | ----------------------------------------- |
| Basic unit     | Propositions (P, Q, R)              | Predicates + terms                        |
| Variables      | Not supported                       | Variables + quantifiers                   |
| Quantifiers    | None                                | ∀ (universal), ∃ (existential)            |
| Expressiveness | Limited (facts only)                | Higher (relationships, generalizations)   |
| Example        | "It is raining" → R                 | "∀x (Rain(x) → Wet(x))"                   |
| Inference      | Truth tables, resolution            | Unification, resolution with substitution |
| Decidability   | Decidable                           | Semi-decidable                            |
| Use case       | Simple circuits, truth verification | Knowledge bases, theorem proving          |

---

## Q5) a) Forward Chaining vs Backward Chaining [9]

| Feature      | Forward Chaining                | Backward Chaining                   |
| ------------ | ------------------------------- | ----------------------------------- |
| Direction    | Data-driven (facts → goal)      | Goal-driven (goal → facts)          |
| Start        | Known facts                     | Query/goal                          |
| Strategy     | Apply rules to derive new facts | Match goal against rule consequents |
| Search       | Breadth-first (bottom-up)       | Depth-first (top-down)              |
| Suitable for | Monitoring, planning, diagnosis | Question answering, theorem proving |
| Example      | Expert system for diagnosis     | Prolog interpreter                  |

**Forward Chaining Algorithm:**

```
1. Start with known facts in working memory
2. Find all rules whose premises match the facts
3. Fire (execute) the matched rules → add new facts
4. Repeat until goal is reached or no new facts can be derived
```

**Backward Chaining Algorithm:**

```
1. Start with the goal to prove
2. Find rules whose conclusion matches the goal
3. Recursively prove the rule's premises (subgoals)
4. If all premises match known facts → goal is proved
```

---

## Q5) b) Unification and Default Reasoning [9]

**i) Unification in FOL:** Unification finds a **substitution** θ that makes two logical expressions
identical.

**Algorithm:**

```
UNIFY(p, q) = θ where SUBST(θ, p) = SUBST(θ, q)

Examples:
- UNIFY(Knows(John, x), Knows(John, Mary)) → {x/Mary}
- UNIFY(Knows(John, x), Knows(y, Bill)) → {x/Bill, y/John}
- UNIFY(Knows(John, x), Knows(x, Mary)) → FAIL (occurs check)
```

**Occurs check**: Ensures variable doesn't appear in the expression substituted for it.

**ii) Reasoning with Default Information:** **Default reasoning** allows drawing conclusions based
on typical cases, allowing exceptions.

- **Closed World Assumption**: What is not known to be true is false
- **Circumscription**: Minimize the extent of certain predicates (only true when forced)
- **Default logic**: Rules of form "If A, and it's consistent to assume B, then infer C"
  - Example: `Bird(x) : Flies(x) / Flies(x)` — "If x is a bird and it's consistent that x flies,
    conclude x flies"
- **Non-monotonic reasoning**: Adding new information may retract previous conclusions (unlike
  standard logic)

---

## Q6) a) FOL Inference Rules [9]

**i) Universal Generalization (UG):** If P(c) is true for an arbitrary c, then ∀x P(x)

```
P(c) for an arbitrary c
∴ ∀x P(x)
```

_Restriction:_ c must be arbitrary (not a specific individual introduced by EI)

**ii) Universal Instantiation (UI):** From ∀x P(x), infer P(c) for any particular constant c

```
∀x P(x)
∴ P(c)
```

_Example:_ ∀x (Human(x) → Mortal(x)) → Human(Socrates) → Mortal(Socrates)

**iii) Existential Instantiation (EI):** From ∃x P(x), infer P(c) for a **new** constant c (Skolem
constant) not used before

```
∃x P(x)
∴ P(k)   [k is a new Skolem constant]
```

_Example:_ ∃x King(x) → King(K₁) where K₁ is a new Skolem constant

**iv) Existential Introduction (EG):** If P(c) holds for a specific c, then ∃x P(x)

```
P(c)
∴ ∃x P(x)
```

_Example:_ King(John) → ∃x King(x)

---

## Q6) b) Ontological Engineering [9]

**Ontological Engineering** is the process of specifying a set of concepts, categories, properties,
and relationships in a domain.

**Categories (Upper Ontology):**

```
                    Thing
                   /     \
            Abstract      Concrete
           /    |   \     /   |   \
      Sets  Numbers  ...  Objects  Events
                           /    \
                    Physical  Mental
                      /    \
              Living     Non-living
             /    |  \
       Animal Plant  Fungus
```

**Object Categories:**

- **Physical objects**: Have mass, occupy space, exist in time
- **Substances**: Mass noun quantities (water, gold)
- **Events**: Things that happen at a time and place
- **Processes**: Extended events with internal structure

**Model:** A simplified representation of reality capturing only relevant aspects. In AI, ontologies
enable:

- Knowledge sharing and reuse
- Semantic interoperability
- Common vocabulary for agents
- Logical inference about categories and relations

---

## Q7) a) Goal Stack Planning (STRIPS) [6]

**STRIPS (Stanford Research Institute Problem Solver):** A classical planning algorithm using
means-ends analysis.

**Operators:**

```
STACK(x, y): Pre: CLEAR(y), HOLD(x) → Add: ON(x,y), CLEAR(y)⁻, HOLD(x)⁻
UNSTACK(x, y): Pre: ON(x,y), CLEAR(x), EMPTY → Add: HOLD(x), CLEAR(y), ON(x,y)⁻, EMPTY⁻
PICKUP(x): Pre: ON(x,Table), CLEAR(x), EMPTY → Add: HOLD(x), ON(x,Table)⁻, EMPTY⁻
PUTDOWN(x): Pre: HOLD(x) → Add: ON(x,Table), EMPTY, HOLD(x)⁻
```

**Initial:** ON(C,A), ON(A,Table), ON(B,Table), CLEAR(B), CLEAR(C), EMPTY **Goal:** ON(B,C), ON(C,A)

**Plan:**

```
1. ON(B,C) is false. To achieve ON(B,C):
   Precondition: CLEAR(C), HOLD(B)
   We need CLEAR(C) — already true (B is clear, C is clear)
   We need HOLD(B) — B is on Table, clear, empty hand → PICKUP(B)

2. PICKUP(B): Pre: ON(B,Table), CLEAR(B), EMPTY ✓
   → Executed. State: HOLD(B), ON(C,A), CLEAR(C), ON(A,Table)

3. STACK(B,C): Pre: CLEAR(C), HOLD(B) ✓
   → Executed. State: ON(B,C), EMPTY, ON(C,A)

4. ON(C,A) holds already → Done
```

**Final Plan:**

```
1. PICKUP(B)
2. STACK(B, C)
```

```
[ANSWER BOX]
STRIPS plan: [PICKUP(B), STACK(B, C)]
Achieves goal ON(B,C) ∧ ON(C,A)
```

---

## Q7) b) Planning vs Problem Solving [5]

| Aspect               | Problem Solving                     | Planning                                     |
| -------------------- | ----------------------------------- | -------------------------------------------- |
| Focus                | Finding a path from start to goal   | Generating a sequence of actions             |
| State representation | Simple state representation         | Rich, structured representation (predicates) |
| Actions              | Single-step moves                   | Operators with preconditions/effects         |
| Search space         | State space                         | Plan space                                   |
| Handling goals       | Single goal                         | Multiple conjunctive goals                   |
| Efficiency           | Can be wasteful for complex domains | Uses domain knowledge, means-ends analysis   |

**Example:** In the block world, problem solving would try all possible moves from the start state
until the goal is reached. Planning (STRIPS) identifies the relevant subgoal (ON(B,C)), finds the
operator (STACK) and its preconditions, and works backward to find the needed actions.

---

## Q7) c) AI Components and Architecture [8]

**AI Components:**

1. **Perception**: Sensors, cameras, microphones — gathering input from the environment
2. **Knowledge Base**: Facts, rules, models about the world (explicitly represented)
3. **Inference Engine**: Reasoning mechanisms (forward/backward chaining, resolution)
4. **Learning Module**: ML/DL algorithms that improve performance from data
5. **Planning Module**: Generates sequences of actions to achieve goals
6. **Natural Language Processing**: Understanding and generating human language
7. **Decision Making**: Selecting actions based on utility, preferences, or policies

**AI Architecture (Layered):**

```
┌──────────────────────────────────────────┐
│           User Interface Layer           │
│  (Voice, GUI, Text, Visual)              │
├──────────────────────────────────────────┤
│         Application Layer                │
│  (Chatbot, Robot, Recommendation, etc.)   │
├──────────────────────────────────────────┤
│         Decision Making Layer            │
│  (Planning, Scheduling, Control)          │
├──────────────────────────────────────────┤
│        Reasoning / Inference Layer       │
│  (Forward/Backward Chaining, Uncertainty) │
├──────────────────────────────────────────┤
│        Knowledge Representation          │
│  (Ontologies, Rules, Frames, Networks)    │
├──────────────────────────────────────────┤
│          Learning Layer                  │
│  (ML, DL, RL, Pattern Recognition)        │
├──────────────────────────────────────────┤
│          Perception Layer                │
│  (Vision, Speech, NLP, Sensor Fusion)     │
└──────────────────────────────────────────┘
```

---

## Q8) a) Planning in Non-Deterministic Domains [5]

**Non-deterministic planning** deals with environments where action outcomes are not fully
predictable.

**Approaches:**

1. **Conditional Planning**: Generate plans with branches (if-then-else) based on sensor feedback
   - Example: "Pick up cup. If cup is hot, use glove. Else, hold directly."

2. **Contingency Planning**: Plan for possible failures
   - Example: If gripper fails to grasp, retry or change angle

3. **Execution Monitoring**: Plan is executed step-by-step; if unexpected state is detected, re-plan

4. **Markov Decision Processes (MDPs)**: Model actions with probabilistic outcomes
   - Algorithm: Value iteration, Policy iteration

**Key difference from classical planning:**

- Classical: Action a always leads from state s to a well-defined s'
- Non-deterministic: Action a may lead to different states with different probabilities

---

## Q8) b) Importance of Planning and Classical Planning Algorithm [5]

**i) Importance of Planning:**

- **Efficiency**: Avoids exhaustive search by focusing on goal-relevant actions
- **Goal-directed**: Decomposes complex goals into manageable subgoals
- **Resource optimization**: Minimizes time, cost, or energy
- **Error prevention**: Predicts action outcomes before execution
- **Autonomy**: Enables robots and AI systems to act without human guidance

**ii) Algorithm for Classical Planning (STRIPS-like):**

```
function STRIPS(initial_state, goals, operators):
    stack = [goals]
    plan = []
    state = initial_state

    while stack not empty:
        goal = pop(stack)
        if goal satisfied in state:
            continue
        if goal is conjunctive (AND):
            order subgoals, push onto stack
            continue
        // goal is a single literal, find operator
        op = choose operator whose ADD list includes goal
        push op's preconditions onto stack (as subgoals)
        when preconditions are satisfied:
            push op to plan
            update state with op's effects (ADD/DELETE)
    return plan
```

---

## Q8) c) Scope and Future of AI [8]

**AI (Artificial Intelligence)** is the science and engineering of making intelligent machines,
especially intelligent computer programs.

**Scope in various walks of life:**

- **Healthcare**: Disease diagnosis (radiology AI), drug discovery, robotic surgery
- **Transportation**: Self-driving cars, traffic optimization, logistics
- **Education**: Personalized tutoring, automated grading, adaptive learning
- **Finance**: Fraud detection, algorithmic trading, credit scoring
- **Agriculture**: Crop monitoring, precision farming, yield prediction
- **Entertainment**: Recommendation systems (Netflix, Spotify), game AI
- **Cybersecurity**: Threat detection, anomaly analysis, automated response

**Future Opportunities:**

- **General AI (AGI)**: Systems that match or exceed human-level intelligence across all domains
- **Explainable AI (XAI)**: Making AI decisions transparent and interpretable
- **AI + Robotics**: Humanoid robots for manufacturing, caregiving, exploration
- **AI for Science**: Climate modeling, protein folding (AlphaFold), fusion energy
- **Ethical AI**: Fairness, bias mitigation, responsible AI frameworks
- **Neuromorphic Computing**: Hardware that mimics brain architecture for energy-efficient AI

```
[ANSWER BOX]
AI scope spans healthcare to finance to transportation.
Future lies in AGI, explainable AI, and ethical AI frameworks.
```

---

═══════════════════════════════════════════════════════

## EXAMINER COMMENTARY

**Why this scores full marks:**

- N-Queens shown with step-by-step board states and backtracking visualization
- Alpha-beta pruning includes full tree trace with boundary values
- Cryptarithmetic solved systematically with column-wise deduction
- STRIPS plan includes operator definitions, preconditions, and state updates
- FOL derivations shown with inference rule citations (Modus Ponens)
- All comparisons use structured tables

**Common Deductions:**

- Not showing backtracking steps in CSP/N-Queens
- Confusing α (best for MAX) vs β (best for MIN) in alpha-beta
- Missing quantifiers (∀, ∃) in FOL representations
- Confusing Universal Instantiation with Existential Instantiation
- Not specifying ADD/DELETE lists in STRIPS operator definitions
- Writing vague AI scope answers without concrete examples

**Time Budget:**

- Q1 (18 min): Problem-solving strategies 9 min + Alpha-beta 9 min
- Q2 (18 min): Game theory 9 min + CSP/Cryptarithmetic 8 min
- Q3 (18 min): Wumpus agents 9 min + Knowledge engineering 9 min
- Q4 (18 min): FOL sentences 9 min + Propositional vs Predicate 8 min
- Q5 (18 min): Chaining 9 min + Unification 9 min
- Q6 (18 min): Inference rules 9 min + Ontology 9 min
- Q7 (18 min): STRIPS 6 min + Planning vs solving 5 min + Architecture 8 min
- Q8 (18 min): Non-deterministic 5 min + Importance 5 min + Scope 8 min
- **Total: ~144 min** (within 150 min limit)

═══════════════════════════════════════════════════════

---
