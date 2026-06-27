---
totalQuestions: 8
totalPages: 2
paperCode: PC4082
paperIdentifier: '[6404]-251'
department: B.E. (Computer Engineering)
subject: DESIGN AND ANALYSIS OF ALGORITHMS
pattern: 2019 Pattern
semester: VII
subjectCode: 410241
time: 2.5 Hours
maxMarks: 70
instructions:
  - Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8.
  - Neat diagrams must be drawn wherever necessary.
  - Figures to the right side indicate full marks.
  - Assume suitable data necessary.
---

# Unit III — Greedy and Dynamic Programming — 18 Marks

**Q1)** Solve **any one** of the following:

**a)** Explain the Bellman-Ford shortest path algorithm. Find the shortest paths from source vertex A to all other vertices in the directed graph with edge weights: A→B (–1), A→C (4), B→C (3), B→D (2), B→E (2), D→C (5), D→B (1), E→D (–3). Detect if a negative-weight cycle exists. [9]

**b)** Consider the character set with frequencies: A: 15, B: 25, C: 5, D: 8, E: 12, F: 35. Construct the Huffman tree and find the corresponding prefix codes. Decode the sequence `1100100101` using your tree. [9]

**OR**

**Q2)** Solve **any one** of the following:

**a)** State the characteristics of Dynamic Programming. Determine the Longest Common Subsequence (LCS) for sequences $X = \langle A, B, C, B, D, A, B \rangle$ and $Y = \langle B, D, C, A, B, A \rangle$. Show all tables used in computation and reconstruct the LCS. [9]

**b)** Solve the Job Sequencing with Deadlines problem using Greedy approach for $n=5$ jobs with profits $P = \langle 100, 60, 40, 20, 10 \rangle$ and deadlines $D = \langle 2, 1, 2, 1, 3 \rangle$. Find the optimal sequence and total profit. [9]

---

# Unit IV — Backtracking and Branch-n-Bound — 17 Marks

**Q3)** Solve **any one** of the following:

**a)** Draw the state space tree for the 8-Queens problem using Backtracking. Explain the formulation of the bounding function used to prune the search tree. Show the placement of the first 4 queens. [9]

**b)** Solve the 15-puzzle problem using Least-Cost Branch and Bound. Explain the calculation of cost function $g(x)$ and heuristic function $\hat{h}(x)$ using the number of misplaced tiles. Trace the first two levels of search. [8]

**OR**

**Q4)** Solve **any one** of the following:

**a)** Explain the Hamiltonian Cycle problem. Given a graph with vertices {1, 2, 3, 4, 5} and edges: 1-2, 1-3, 1-4, 2-3, 2-5, 3-4, 3-5, 4-5, find all Hamiltonian cycles starting from vertex 1 using backtracking. Draw the state space tree. [9]

**b)** Solve the Job Assignment Problem using Branch and Bound for 4 jobs and 4 agents with the cost matrix: [8]

| Agent / Job | J1 | J2 | J3 | J4 |
| ----------- | -- | -- | -- | -- |
| A1          | 9  | 2  | 7  | 8  |
| A2          | 6  | 4  | 3  | 7  |
| A3          | 5  | 8  | 1  | 8  |
| A4          | 7  | 6  | 9  | 4  |

Identify the optimal assignment and calculate the minimum cost.

---

# Unit V — Amortized Analysis — 18 Marks

**Q5)** Solve **any one** of the following:

**a)** Explain the Aggregate Method of amortized analysis. Apply it to analyze the operations (PUSH, POP, MULTIPOP) on a stack. Prove that the amortized cost per operation is $O(1)$. [9]

**b)** What is NP-completeness? Discuss Cook's Theorem. Prove that the Clique Decision Problem (CDP) is NP-complete by reducing 3-SAT to CDP. [9]

**OR**

**Q6)** Solve **any one** of the following:

**a)** Explain the Potential Method of amortized analysis. Consider a dynamic table that doubles in size when full. Formulate a potential function $\Phi$ and prove that the amortized cost of an insertion operation is $O(1)$. [9]

**b)** Discuss Vertex Cover Problem. Explain the 2-approximation algorithm for Vertex Cover. Show its execution on a graph of your choice and prove its approximation ratio is at most 2. [9]

---

# Unit VI — Multithreaded and Distributed Algorithms — 17 Marks

**Q7)** Solve **any one** of the following:

**a)** Describe the Knuth-Morris-Pratt (KMP) string matching algorithm. Construct the prefix function $\pi$ for the pattern $P = \text{"ababaca"}$ and trace the execution on text $T = \text{"bacababacab"}$. [9]

**b)** What are distributed algorithms? Explain the distributed Minimum Spanning Tree (MST) algorithm (Gallager-Humblet-Spira algorithm). What is its message complexity? [8]

**OR**

**Q8)** Solve **any one** of the following:

**a)** Write the Rabin-Karp string matching algorithm. For prime $q = 11$, trace the algorithm to search for pattern $P = \text{"31"}$ in text $T = \text{"23590231415"}$. Highlight any spurious hits. [9]

**b)** Describe a multithreaded algorithm for matrix multiplication using divide-and-conquer. Analyze its Work, Span, and Parallelism. [8]

*** End of Paper ***
