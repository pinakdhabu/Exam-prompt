# Savitribai Phule Pune University

# High Performance Computing (410250)

## BE (Computer Engineering) — Semester VIII — 2019 Pattern

**Total Marks: 70 | Time: 2½ Hours**

### Instructions:

1. Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8.
2. Neat diagrams must be drawn wherever necessary.
3. Assume suitable data if necessary.
4. Figures to the right indicate full marks.

---

## Unit III — Parallel Communication — 18 Marks

**Q1)** Solve **any one** of the following:

**a)** Explain Broadcast and Reduce operations with diagrams. Compare One-to-All Broadcast with
All-to-One Reduction. Show the communication steps on an 8-node hypercube. [6]

**b)** Explain Scatter and Gather operations. How do they differ from Broadcast and Reduce? Give MPI
function signatures for each. [6]

**c)** Write a short note on Circular Shift on a mesh. Explain the communication steps for shifting
data on a 2D mesh with wrap-around connections. [5]

**OR**

**Q2)** Solve **any one** of the following:

**a)** Explain the Prefix-Sum (Scan) operation for an 8-node hypercube. Show the stepwise
computation of parallel prefix-sum. [6]

**b)** Explain One-to-All Broadcast and All-to-One Reduction on a ring topology. Analyze the
communication time for p processors. [6]

**c)** Explain with example and algorithm the All-to-All Broadcast on a 3×3 mesh. How does the
communication cost compare with one-to-all broadcast? [5]

---

## Unit IV — Analytical Modeling of Parallel Programs — 17 Marks

**Q3)** Solve **any one** of the following:

**a)** Explain the performance metrics of a parallel system: Speedup, Efficiency, Cost, and
Utilization. Derive Amdahl's Law and discuss its implications. [6]

**b)** Explain Matrix-Matrix multiplication in detail. Analyze the parallel formulation and its
performance for both row-wise and 2D partitioning. [6]

**c)** Write a note on minimum execution time and cost-optimal execution time in parallel computing.
[5]

**OR**

**Q4)** Solve **any one** of the following:

**a)** Write a short note on Matrix-Vector Multiplication using: [9]

- i) Row-wise 1D partitioning
- ii) 2D partitioning
- iii) Comparison of 1D and 2D partitioning

**b)** Explain the Dense Matrix Algorithms: [8]

- i) Matrix-Vector Multiplication
- ii) Matrix-Matrix Multiplication

---

## Unit V — CUDA Architecture — 18 Marks

**Q5)** Solve **any one** of the following:

**a)** Explain CUDA Architecture in detail. Describe the GPU hardware model: Streaming
Multiprocessors (SMs), CUDA cores, warp scheduling, and memory hierarchy. [9]

**b)** Write a short note on Managing GPU Memory. Explain global, shared, constant, and texture
memory. How does memory coalescing affect performance? [9]

**OR**

**Q6)** Solve **any one** of the following:

**a)** Modify Depth First Search (DFS) for parallel execution and analyze its complexity. Discuss
the challenges of parallelizing DFS and how work stealing addresses load imbalance. [9]

**b)** Explain Dijkstra's algorithm in parallel formulation. Analyze the performance of parallel
Dijkstra for all-pairs shortest paths. [9]

---

## Unit VII — HPC Applications — 17 Marks

**Q7)** Solve **any one** of the following:

**a)** Write a short note on Parallel Breadth First Search (BFS). Explain the level-synchronous
approach and how it maps to GPUs. [4]

**b)** Explain the term: Communication Strategies in BFS. How do different strategies affect the
performance of parallel BFS? [5]

**c)** Write notes on: [9]

- i) Random Communication Strategy
- ii) Ring Communication Strategy
- iii) Blackboard Communication Strategy

**OR**

**Q8)** Solve **any one** of the following:

**a)** Explain Odd-Even Transposition Sort with a suitable example. Show the sorting process for the
sequence [5, 2, 8, 1, 9, 3] on a 6-processor linear array. [6]

**b)** Write a short note on Parallel Formulation for CRCW PRAM. Explain how concurrent read and
concurrent write are handled in parallel sorting. [6]

**c)** Explain Distributed Computing for Document Classification. How is data distributed across
nodes? Discuss the MapReduce approach for text classification. [6]

---

\*\*\* End of Paper \*\*\*
