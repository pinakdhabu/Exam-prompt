# Savitribai Phule Pune University
# Design and Analysis of Algorithms (410241)
## BE (Computer Engineering) — Semester VII — 2019 Pattern

**Total Marks: 70 | Time: 2½ Hours**

### Instructions:
1. Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8.
2. Neat diagrams must be drawn wherever necessary.
3. Assume suitable data if necessary.
4. Figures to the right indicate full marks.

---

## Unit III — Greedy and Dynamic Programming — 18 Marks

**Q1)** Solve **any one** of the following:

**a)** State the principle of optimality in dynamic programming. Consider a set of five activities with start and finish times: A(1,3), B(2,5), C(3,6), D(5,7), E(6,9). Use the greedy activity selection algorithm to find the maximum number of non-conflicting activities. Show all steps. [9]

**b)** Solve the 0/1 Knapsack problem using dynamic programming for capacity W = 8 and items: [9]

| Item | Weight | Profit |
|------|--------|--------|
| I1 | 2 | 3 |
| I2 | 3 | 4 |
| I3 | 4 | 5 |
| I4 | 5 | 7 |

Construct the DP table and find the optimal subset.

**OR**

**Q2)** Solve **any one** of the following:

**a)** Solve the Chain Matrix Multiplication problem for dimensions: 5×4, 4×6, 6×2, 2×7. Use dynamic programming to find the minimum number of scalar multiplications and the optimal parenthesization. Show all tables. [9]

**b)** What is the fractional knapsack problem? Give its mathematical formulation. Find the optimal solution for capacity W = 15 with items: [9]

| Item | Weight | Value |
|------|--------|-------|
| A | 5 | 30 |
| B | 10 | 40 |
| C | 8 | 32 |
| D | 3 | 15 |

---

## Unit IV — Backtracking and Branch-n-Bound — 17 Marks

**Q3)** Solve **any one** of the following:

**a)** Consider the graph coloring problem on the following graph with vertices {A, B, C, D, E} and edges: A-B, A-C, B-D, B-E, C-D, C-E, D-E. Use backtracking to color the graph using 3 colors (Red, Green, Blue). Show the state space tree step by step. [9]

**b)** Solve the 0/1 Knapsack problem using LC Branch and Bound for capacity m = 10 with items: [8]

| Item | Weight | Value |
|------|--------|-------|
| O1 | 5 | 10 |
| O2 | 4 | 8 |
| O3 | 3 | 5 |
| O4 | 6 | 12 |

Show the state space tree with bounding function calculations.

**OR**

**Q4)** Solve **any one** of the following:

**a)** State the Sum of Subsets problem. Write the backtracking algorithm. Given a set S = {3, 5, 6, 7, 9} and sum d = 15, find all subsets that sum to 15 using backtracking. Show the state space tree. [9]

**b)** Solve the Travelling Salesman Problem using Branch and Bound for the following cost matrix: [8]

|   | A | B | C | D |
|---|---|---|---|---|
| A | ∞ | 20 | 30 | 10 |
| B | 20 | ∞ | 15 | 25 |
| C | 30 | 15 | ∞ | 35 |
| D | 10 | 25 | 35 | ∞ |

Assume A as the starting city.

---

## Unit V — Amortized Analysis — 18 Marks

**Q5)** Solve **any one** of the following:

**a)** Explain the accounting method of amortized analysis. Apply it to analyze the amortized cost of a stack supporting three operations: PUSH, POP, and MULTIPOP(k). Show that each operation has O(1) amortized cost. [9]

**b)** What are approximation algorithms? Classify them based on the approximation ratio. Explain the vertex cover approximation algorithm with an example and analyze its approximation ratio. [9]

**OR**

**Q6)** Solve **any one** of the following:

**a)** Explain the potential function method of amortized analysis. Apply it to analyze the amortized cost of INCREMENT operation on a binary counter. Show that the amortized cost is O(1). [9]

**b)** What is an NP-complete problem? Prove that the Boolean Satisfiability Problem (SAT) is NP-complete. Discuss the significance of polynomial-time reduction with an example. [9]

---

## Unit VI — Multithreaded and Distributed Algorithms — 17 Marks

**Q7)** Solve **any one** of the following:

**a)** Write the Rabin-Karp string matching algorithm. Given text T = "2359023141526739921" and pattern P = "31415", trace the execution. What is the expected and worst-case time complexity? [9]

**b)** Explain the following performance measures for multithreaded algorithms: [8]
   - i) Speedup
   - ii) Efficiency
   - iii) Work
   - iv) Span (Critical Path Length)

**OR**

**Q8)** Solve **any one** of the following:

**a)** Explain the distributed Breadth First Search (BFS) algorithm. Consider a graph with 6 nodes where each node knows only its neighbors. Show the stepwise execution of distributed BFS from node A. [9]

**b)** Describe the multithreaded matrix multiplication algorithm. Analyze its work and span. Compare the conventional O(n³) approach with the multithreaded divide-and-conquer approach. [8]

---

\*\*\* End of Paper \*\*\*
