# JNTUA Second Year B.Tech CSE — Official Syllabus Reference (R23 Regulation)

> Compiled from official JNTUA syllabus documents for reference purposes.
>
> This document provides exact unit-wise syllabus, course outcomes, examination structure, for
> B.Tech in Computer Science and Engineering under the R23 Regulation.
>
> Use this as the authoritative source for:
>
> - Exam preparation
> - PYQ analysis
> - Note generation
> - Unit planning
> - AI tutoring
>
> No syllabus topic has been intentionally omitted or condensed.

---

# Semester IV — Course Structure

| S.No | Course Code | Course Name                           | L:T:P | Credits | CIE | SEE | Total |
| ---- | ----------- | ------------------------------------- | :---: | :-----: | :-: | :-: | :---: |
| 1    | 23AHSBS20   | Numerical Methods & Complex Variables | 3:0:0 |    3    | 30  | 70  |  100  |
| 2    | 23A54401    | Formal Languages & Automata Theory    | 3:0:0 |    3    | 30  | 70  |  100  |
| 3    | 23A54402    | Design & Analysis of Algorithms       | 3:0:0 |    3    | 30  | 70  |  100  |
| 4    | 23A54403    | Operating Systems                     | 3:0:0 |    3    | 30  | 70  |  100  |
| 5    | 23A54404    | Machine Learning                      | 3:0:0 |    3    | 30  | 70  |  100  |
| 6    | 23A54405    | Software Engineering                  | 3:0:0 |    3    | 30  | 70  |  100  |
| 7    | 23A54406    | Operating Systems Lab                 | 0:0:3 |   1.5   | 30  | 20  |  50   |
| 8    | 23A54407    | Machine Learning Lab                  | 0:0:3 |   1.5   | 30  | 20  |  50   |
| 9    | 23A54408    | Algorithms Lab                        | 0:0:2 |    1    | 15  | 10  |  25   |
|      | **Total**   |                                       |       | **22**  |     |     |       |

---

## 23AHSBS20: Numerical Methods & Complex Variables

**Credits:** 3 | **CIE:** 30 Marks | **SEE:** 70 Marks

**Prerequisites:** Linear Algebra & Calculus (23AHSBS01), Differential Equations & Vector Calculus
(23AHSBS10)

### Course Objectives

- To introduce numerical methods for solving algebraic and transcendental equations
- To study interpolation, numerical differentiation, and integration techniques
- To understand numerical solutions of ordinary differential equations
- To introduce complex analysis, analytic functions, and complex integration
- To apply numerical and complex analysis methods to engineering problems

### Course Outcomes

| CO  | Description                                                                         |
| --- | ----------------------------------------------------------------------------------- |
| CO1 | Solve algebraic and transcendental equations using numerical methods                |
| CO2 | Apply interpolation techniques to estimate intermediate values                      |
| CO3 | Perform numerical differentiation and integration                                   |
| CO4 | Solve ordinary differential equations using numerical methods                       |
| CO5 | Apply complex analysis concepts including analytic functions and conformal mappings |
| CO6 | Evaluate complex integrals using Cauchy's theorem and residue theorem               |

### Course Contents

#### Unit I: Solution of Algebraic and Transcendental Equations (10 Hours) → CO1

- Introduction to Numerical Methods: Need, Types of Errors (Relative, Absolute, Percentage)
- Bisection Method: Algorithm, Convergence, Limitations
- Regula-Falsi Method: Algorithm, Geometric Interpretation
- Newton-Raphson Method: Derivation, Convergence, Multiple Roots
- Secant Method: Algorithm, Comparison with Newton-Raphson
- System of Nonlinear Equations: Fixed Point Iteration
- Muller's Method for Complex Roots

#### Unit II: Interpolation (10 Hours) → CO2

- Finite Differences: Forward, Backward, Central Difference Operators
- Newton's Forward Interpolation Formula
- Newton's Backward Interpolation Formula
- Gauss Forward and Backward Interpolation
- Stirling's and Bessel's Interpolation Formulae
- Lagrange's Interpolation: Unequally Spaced Data
- Newton's Divided Difference Interpolation
- Inverse Interpolation
- Cubic Spline Interpolation

#### Unit III: Numerical Differentiation and Integration (10 Hours) → CO3

- Numerical Differentiation: Derivatives using Forward, Backward, and Central Difference Formulae
- Maxima and Minima of Tabulated Functions
- Numerical Integration: Newton-Cotes Formulae
- Trapezoidal Rule: Derivation, Error Estimate, Composite Rule
- Simpson's 1/3 Rule: Derivation, Error, Composite Rule
- Simpson's 3/8 Rule: Derivation, Error
- Romberg's Integration: Richardson's Extrapolation
- Gaussian Quadrature: Two-point and Three-point Formulae

#### Unit IV: Numerical Solution of Ordinary Differential Equations (10 Hours) → CO4

- Initial Value Problems: Taylor Series Method
- Euler's Method: Algorithm, Error Analysis
- Modified Euler's Method: Predictor-Corrector
- Runge-Kutta Methods: RK2, RK4 (4th Order)
- Multi-step Methods: Adams-Bashforth Method
- Adams-Moulton Predictor-Corrector Method
- Milne's Method
- Boundary Value Problems: Finite Difference Method, Shooting Method

#### Unit V: Complex Variables (10 Hours) → CO5, CO6

- Functions of Complex Variables: Limit, Continuity, Differentiability
- Analytic Functions: Cauchy-Riemann Equations (Cartesian and Polar Forms)
- Harmonic Functions: Conjugate Harmonics, Milne-Thomson Method
- Elementary Functions: Exponential, Trigonometric, Logarithmic, Hyperbolic
- Conformal Mappings: Möbius (Bilinear) Transformations, w = z², w = e^z, w = 1/z
- Complex Integration: Line Integrals, Cauchy's Integral Theorem
- Cauchy's Integral Formula: Derivative of Analytic Functions
- Taylor's and Laurent's Series Expansions

### Learning Resources

#### Textbooks

1. S.S. Sastry, "Introductory Methods of Numerical Analysis", 5th Edition, PHI Learning, 2012
2. M.K. Jain, S.R.K. Iyengar, R.K. Jain, "Numerical Methods for Scientific and Engineering
   Computation", 6th Edition, New Age International, 2012
3. R.V. Churchill, J.W. Brown, "Complex Variables and Applications", 9th Edition, McGraw Hill, 2013

#### Reference Books

1. Steven C. Chapra, Raymond P. Canale, "Numerical Methods for Engineers", 7th Edition, McGraw Hill,
   2015
2. Erwin Kreyszig, "Advanced Engineering Mathematics", 10th Edition, Wiley, 2011
3. B.S. Grewal, "Higher Engineering Mathematics", 44th Edition, Khanna Publishers, 2018
4. C. Ray Wylie, Louis C. Barrett, "Advanced Engineering Mathematics", 6th Edition, McGraw Hill

---

## 23A54401: Formal Languages & Automata Theory

**Credits:** 3 | **CIE:** 30 Marks | **SEE:** 70 Marks

**Prerequisites:** Discrete Mathematics (23A54301)

### Course Objectives

- To introduce the fundamental concepts of formal languages and automata theory
- To understand finite automata, regular expressions, and regular languages
- To study context-free grammars, pushdown automata, and parsing
- To explore Turing machines and the concept of decidability
- To understand the Chomsky hierarchy of formal languages

### Course Outcomes

| CO  | Description                                                                 |
| --- | --------------------------------------------------------------------------- |
| CO1 | Design finite automata for regular languages                                |
| CO2 | Construct regular expressions and apply pumping lemma for regular languages |
| CO3 | Design context-free grammars and pushdown automata                          |
| CO4 | Apply normal forms and parsing techniques for context-free grammars         |
| CO5 | Design Turing machines for computational problems                           |
| CO6 | Analyze decidability, undecidability, and the Chomsky hierarchy             |

### Course Contents

#### Unit I: Finite Automata (10 Hours) → CO1

- Introduction to Automata Theory: Alphabet, Strings, Languages
- Deterministic Finite Automata (DFA): Definition, Transition Diagrams, Transition Tables
- DFA Design: Language Acceptance, Applications
- Nondeterministic Finite Automata (NFA): Definition, Epsilon Transitions
- Equivalence of NFA and DFA: Subset Construction
- Minimization of DFA: Hopcroft's Algorithm, Myhill-Nerode Theorem
- Finite Automata with Output: Moore and Mealy Machines
- Conversion between Moore and Mealy Machines

#### Unit II: Regular Expressions and Languages (10 Hours) → CO2

- Regular Expressions: Operators, Algebraic Laws
- Building Regular Expressions for Languages
- Finite Automata and Regular Expressions: Arden's Theorem
- Conversion: RE → NFA (Thompson's Construction), NFA → RE
- Regular Languages: Closure Properties (Union, Intersection, Concatenation, Kleene Star,
  Complement)
- Pumping Lemma for Regular Languages: Statement, Proof Technique
- Applications of Pumping Lemma: Proving Non-regularity
- Decision Properties of Regular Languages: Emptiness, Finiteness, Membership, Equality

#### Unit III: Context-Free Grammars and Languages (10 Hours) → CO3

- Context-Free Grammars: Definition, Derivation, Parse Trees
- Derivation Types: Leftmost, Rightmost
- Ambiguity in CFGs: Removal of Ambiguity
- Simplification of CFGs: Eliminating Useless Symbols, ε-Productions, Unit Productions
- Normal Forms: Chomsky Normal Form (CNF), Greibach Normal Form (GNF)
- Closure Properties of CFLs: Union, Concatenation, Kleene Star
- Pumping Lemma for CFLs
- Decision Properties of CFLs

#### Unit IV: Pushdown Automata (10 Hours) → CO3

- Pushdown Automata: Definition, Components, Instantaneous Descriptions
- Types of PDA: Deterministic (DPDA), Nondeterministic (NPDA)
- PDA Design: Acceptance by Final State, Acceptance by Empty Stack
- Equivalence of PDA and CFG: CFG → PDA, PDA → CFG
- Parsing: Top-Down and Bottom-Up Parsing
- LL(k) Grammars: Definition, Construction of LL(1) Parsing Table
- LR(k) Grammars: SLR, CLR, LALR Parsing

#### Unit V: Turing Machines and Undecidability (10 Hours) → CO5, CO6

- Turing Machine: Definition, Components, Instantaneous Descriptions
- TM Design: Standard Turing Machines
- Variants of Turing Machines: Multi-tape, Multi-head, Nondeterministic
- Equivalence of Variants with Standard TM
- Universal Turing Machine
- Chomsky Hierarchy: Type 0, Type 1, Type 2, Type 3 Grammars
- Recursive and Recursively Enumerable Languages
- Decidability: Halting Problem, Post's Correspondence Problem
- Undecidability: Rice's Theorem, Reducibility

### Learning Resources

#### Textbooks

1. John E. Hopcroft, Rajeev Motwani, Jeffrey D. Ullman, "Introduction to Automata Theory, Languages,
   and Computation", 3rd Edition, Pearson, 2008
2. Michael Sipser, "Introduction to the Theory of Computation", 3rd Edition, Cengage Learning, 2013

#### Reference Books

1. K.L.P. Mishra, N. Chandrasekaran, "Theory of Computer Science: Automata, Languages and
   Computation", 3rd Edition, PHI, 2007
2. Peter Linz, "An Introduction to Formal Languages and Automata", 6th Edition, Jones & Bartlett,
   2016
3. John C. Martin, "Introduction to Languages and the Theory of Computation", 4th Edition, McGraw
   Hill, 2010
4. Daniel I.A. Cohen, "Introduction to Computer Theory", 2nd Edition, Wiley, 1997

---

## 23A54402: Design & Analysis of Algorithms

**Credits:** 3 | **CIE:** 30 Marks | **SEE:** 70 Marks

**Prerequisites:** Data Structures (23A53102), Discrete Mathematics (23A53101)

### Course Objectives

- To analyze the asymptotic performance of algorithms
- To understand various algorithm design strategies
- To apply appropriate algorithmic techniques for problem solving
- To analyze time and space complexity of algorithms
- To understand P, NP, and NP-Complete problems

### Course Outcomes

| CO  | Description                                                                    |
| --- | ------------------------------------------------------------------------------ |
| CO1 | Analyze worst-case and average-case running times of algorithms                |
| CO2 | Apply divide-and-conquer strategy to solve problems                            |
| CO3 | Design optimal solutions using greedy and dynamic programming approaches       |
| CO4 | Apply backtracking and branch-and-bound techniques for complex problem solving |
| CO5 | Analyze polynomial and non-polynomial time problems                            |
| CO6 | Understand string matching and multithreaded algorithms                        |

### Course Contents

#### Unit I: Algorithm Analysis and Asymptotic Notation (10 Hours) → CO1

- Introduction: Algorithm Definition, Characteristics, Correctness
- Complexity Analysis: Time and Space Complexity
- Asymptotic Notations: Big-O, Omega, Theta, Little-o, Little-omega
- Standard Complexity Classes: O(1), O(log n), O(n), O(n log n), O(n²), O(2ⁿ), O(n!)
- Recurrence Relations: Substitution Method, Recursion Tree Method, Master Theorem
- Amortized Analysis: Aggregate, Accounting, Potential Methods
- Examples: Binary Counter, Stack Operations, Disjoint Set Union

#### Unit II: Divide and Conquer (10 Hours) → CO2

- Divide and Conquer Paradigm: Principles, Control Abstraction
- Binary Search: Algorithm, Analysis, Applications
- Merge Sort: Algorithm, Recurrence, Time and Space Analysis
- Quick Sort: Algorithm, Worst-case and Average-case Analysis, Randomized Version
- Strassen's Matrix Multiplication: Algorithm, Complexity
- Maximum Subarray Problem: Kadane's Algorithm, Divide and Conquer Solution
- Closest Pair of Points: Algorithm, Analysis

#### Unit III: Greedy and Dynamic Programming (10 Hours) → CO3

**Greedy Algorithms:**

- Greedy Strategy: Principle, Characteristics, Proof of Optimality
- Activity Selection Problem
- Fractional Knapsack Problem
- Huffman Coding: Algorithm, Correctness
- Job Sequencing with Deadlines
- Coin Change Problem (Greedy vs Optimal)

**Dynamic Programming:**

- Dynamic Programming Principle: Optimal Substructure, Overlapping Subproblems
- 0/1 Knapsack Problem
- Longest Common Subsequence (LCS)
- Matrix Chain Multiplication
- Optimal Binary Search Tree (OBST)
- Binomial Coefficient
- Floyd-Warshall Algorithm

#### Unit IV: Backtracking and Branch-and-Bound (10 Hours) → CO4

**Backtracking:**

- Backtracking Strategy: State Space Tree, Pruning
- N-Queens Problem: Algorithm, Analysis
- Graph Coloring Problem: m-Coloring
- Hamiltonian Cycle
- Sum of Subsets Problem
- Sudoku Solver using Backtracking

**Branch-and-Bound:**

- Branch-and-Bound Strategy: FIFO, LIFO, LC (Least Cost) Search
- Traveling Salesman Problem (TSP) using Branch-and-Bound
- 15-Puzzle Problem
- Job Assignment Problem

#### Unit V: NP-Completeness and Advanced Topics (10 Hours) → CO5, CO6

- Tractable and Intractable Problems: Polynomial vs Exponential
- Decision and Optimization Problems
- P-Class and NP-Class of Problems: Definitions, Examples
- NP-Hard and NP-Complete Problems: Definitions
- Polynomial Time Reduction: SAT, 3-SAT, Vertex Cover, Clique, Hamiltonian Path
- Cook-Levin Theorem: SAT is NP-Complete (Overview)
- Proving NP-Completeness: Reduction Techniques
- String Matching: Naive Algorithm, Rabin-Karp Algorithm, KMP Algorithm
- Introduction to Approximation Algorithms: Vertex Cover, TSP

### Learning Resources

#### Textbooks

1. Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, Clifford Stein, "Introduction to
   Algorithms", 4th Edition, MIT Press, 2022
2. Ellis Horowitz, Sartaj Sahni, Sanguthevar Rajasekaran, "Fundamentals of Computer Algorithms", 2nd
   Edition, Universities Press, 2008

#### Reference Books

1. Jon Kleinberg, Éva Tardos, "Algorithm Design", Pearson, 2006
2. Anany Levitin, "Introduction to the Design and Analysis of Algorithms", 3rd Edition, Pearson,
   2011
3. Michael T. Goodrich, Roberto Tamassia, "Algorithm Design: Foundations, Analysis, and Internet
   Examples", Wiley, 2001
4. Gilles Brassard, Paul Bratley, "Fundamentals of Algorithmics", PHI, 1996
5. Steven S. Skiena, "The Algorithm Design Manual", 3rd Edition, Springer, 2020

---

## 23A54403: Operating Systems

**Credits:** 3 | **CIE:** 30 Marks | **SEE:** 70 Marks

**Prerequisites:** Computer Organization & Architecture (23A54305), Data Structures (23A53102)

### Course Objectives

- To understand the structure and functions of operating systems
- To study process management, CPU scheduling, and synchronization
- To learn memory management and virtual memory techniques
- To understand file systems, I/O management, and mass storage
- To explore protection, security, and case studies of modern OS

### Course Outcomes

| CO  | Description                                                                                |
| --- | ------------------------------------------------------------------------------------------ |
| CO1 | Explain operating system architecture, system calls, and boot process                      |
| CO2 | Apply CPU scheduling algorithms and analyze their performance                              |
| CO3 | Implement process synchronization using semaphores, monitors, and handle deadlocks         |
| CO4 | Apply memory management techniques including paging, segmentation, and virtual memory      |
| CO5 | Understand file systems, disk scheduling, and I/O management                               |
| CO6 | Compare different operating systems (Linux, Windows) in terms of architecture and features |

### Course Contents

#### Unit I: Introduction to Operating Systems (10 Hours) → CO1

- Operating System: Definition, Functions, Evolution (Batch, Multiprogramming, Time-Sharing,
  Real-Time, Distributed)
- OS Services: Program Execution, I/O Operations, File Manipulation, Communication, Error Detection
- System Calls: Process Control, File Management, Device Management, Information Maintenance,
  Communication
- System Programs: File Manipulation, Status Information, File Modification, Programming Language
  Support
- OS Structure: Simple/Monolithic, Layered, Microkernel, Modular, Hybrid
- System Boot Process: BIOS, Boot Loader, Kernel Initialization
- Virtual Machines: Hypervisors (Type 1 and Type 2), Docker Containers

#### Unit II: Process Management and CPU Scheduling (10 Hours) → CO2

- Process Concept: Process States (New, Ready, Running, Blocked, Terminated), Process Control Block
  (PCB)
- Process Scheduling: Queues (Job Queue, Ready Queue, Device Queue), Schedulers (Long-term,
  Short-term, Medium-term)
- Context Switch: Mechanism, Overhead
- Threads: User-Level vs Kernel-Level Threads, Multithreading Models (Many-to-One, One-to-One,
  Many-to-Many)
- CPU Scheduling: Preemptive vs Non-preemptive
- Scheduling Algorithms: FCFS, SJF (Preemptive/Non-preemptive), Priority Scheduling, Round Robin,
  Multilevel Queue, Multilevel Feedback Queue
- Scheduling Criteria: CPU Utilization, Throughput, Turnaround Time, Waiting Time, Response Time
- Case Studies: Linux Completely Fair Scheduler, Windows Scheduling

#### Unit III: Process Synchronization and Deadlocks (10 Hours) → CO3

- Process Synchronization: Race Condition, Critical Section Problem
- Peterson's Solution: Software-based Synchronization
- Hardware Synchronization: Test-and-Set, Swap, Compare-and-Swap
- Semaphores: Binary, Counting, wait() and signal() Operations
- Classical Synchronization Problems: Bounded-Buffer (Producer-Consumer), Readers-Writers, Dining
  Philosophers, Sleeping Barber
- Monitors: Condition Variables, Signal and Wait Semantics
- Deadlock: Necessary Conditions (Mutual Exclusion, Hold-and-Wait, No Preemption, Circular Wait)
- Deadlock Prevention: Breaking Each Condition
- Deadlock Avoidance: Banker's Algorithm (Single and Multiple Resources), Safety Algorithm
- Deadlock Detection: Wait-for Graph, Detection Algorithm
- Recovery from Deadlock: Process Termination, Resource Preemption

#### Unit IV: Memory Management (10 Hours) → CO4

- Memory Hierarchy: Registers, Cache, Main Memory, Secondary Storage
- Contiguous Memory Allocation: Fixed Partitioning, Dynamic Partitioning (First-fit, Best-fit,
  Worst-fit)
- Fragmentation: External and Internal Fragmentation, Compaction
- Paging: Page, Frame, Page Table, TLB (Translation Lookaside Buffer)
- Page Table Structure: Hierarchical, Hashed, Inverted Page Tables
- Segmentation: Segment Table, Address Translation, Segmentation with Paging
- Virtual Memory: Demand Paging, Page Fault Handling, Copy-on-Write
- Page Replacement Algorithms: FIFO, Optimal (MIN), LRU, Clock (Second Chance), LFU, MFU
- Thrashing: Causes, Working Set Model, Page Fault Frequency
- Allocation of Frames: Fixed Allocation (Equal, Proportional), Global vs Local Replacement

#### Unit V: File Systems and Mass Storage (10 Hours) → CO5, CO6

- File Concept: Attributes, Operations (Create, Open, Read, Write, Close, Delete)
- File Access Methods: Sequential, Direct (Random), Indexed Access
- Directory Implementation: Single-Level, Two-Level, Tree-Structured, Acyclic-Graph, General-Graph
- File System Mounting: Mount Points, Mount Tables
- File Allocation Methods: Contiguous, Linked, Indexed (Single-level, Multi-level, Combined)
- Free Space Management: Bit Vector, Linked List, Grouping, Counting
- Disk Structure: Platters, Tracks, Sectors, Cylinders
- Disk Scheduling: FCFS, SSTF, SCAN, C-SCAN, LOOK, C-LOOK
- RAID Levels: RAID 0, 1, 5, 6, 10 (Performance and Reliability Trade-offs)
- Case Study: Linux ext4 File System, Windows NTFS

### Learning Resources

#### Textbooks

1. Abraham Silberschatz, Peter B. Galvin, Greg Gagne, "Operating System Concepts", 10th Edition,
   Wiley, 2018
2. William Stallings, "Operating Systems: Internals and Design Principles", 9th Edition, Pearson,
   2018

#### Reference Books

1. Andrew S. Tanenbaum, Herbert Bos, "Modern Operating Systems", 5th Edition, Pearson, 2022
2. Remzi H. Arpaci-Dusseau, Andrea C. Arpaci-Dusseau, "Operating Systems: Three Easy Pieces", 1st
   Edition, CreateSpace, 2018
3. Maurice J. Bach, "The Design of the UNIX Operating System", PHI, 1986
4. Daniel P. Bovet, Marco Cesati, "Understanding the Linux Kernel", 3rd Edition, O'Reilly, 2005
5. Gary Nutt, "Operating Systems: A Modern Perspective", 3rd Edition, Pearson, 2004

---

## 23A54404: Machine Learning

**Credits:** 3 | **CIE:** 30 Marks | **SEE:** 70 Marks

**Prerequisites:** Probability & Statistics for Engineers (23AHSBS19), Linear Algebra & Calculus
(23AHSBS01)

### Course Objectives

- To understand the fundamentals of machine learning and its types
- To learn data preprocessing, feature engineering, and dimensionality reduction
- To study supervised learning algorithms for regression and classification
- To understand ensemble methods and model evaluation techniques
- To learn unsupervised learning algorithms including clustering
- To introduce neural networks and deep learning fundamentals

### Course Outcomes

| CO  | Description                                                                            |
| --- | -------------------------------------------------------------------------------------- |
| CO1 | Understand machine learning concepts, types of learning, and the ML pipeline           |
| CO2 | Apply data preprocessing, feature engineering, and dimensionality reduction techniques |
| CO3 | Implement supervised learning algorithms for regression and classification problems    |
| CO4 | Evaluate model performance using appropriate metrics and cross-validation              |
| CO5 | Apply ensemble learning and unsupervised learning techniques                           |
| CO6 | Design and implement neural network models for basic classification tasks              |

### Course Contents

#### Unit I: Introduction to Machine Learning (10 Hours) → CO1

- Machine Learning: Definition, History, Applications
- Types of Learning: Supervised (Regression, Classification), Unsupervised (Clustering,
  Association), Semi-supervised, Reinforcement Learning
- Key Terminology: Features, Labels, Training Set, Test Set, Validation Set
- Machine Learning Pipeline: Data Collection, Preprocessing, Model Selection, Training, Evaluation,
  Deployment
- Bias-Variance Tradeoff: Underfitting, Overfitting, Optimal Model Complexity
- Model Evaluation: Holdout Method, Cross-Validation (k-Fold, Leave-One-Out, Stratified)
- Performance Metrics for Regression: MSE, RMSE, MAE, R² Score
- Performance Metrics for Classification: Accuracy, Precision, Recall, F1-Score, Confusion Matrix,
  ROC-AUC

#### Unit II: Data Preprocessing and Feature Engineering (10 Hours) → CO2

- Data Cleaning: Handling Missing Values (Mean/Median/Mode Imputation, Dropping), Handling Outliers
  (Z-Score, IQR)
- Data Transformation: Scaling (Min-Max Normalization, Z-Score Standardization), Log Transformation
- Encoding Categorical Variables: One-Hot Encoding, Label Encoding, Ordinal Encoding
- Feature Selection: Filter Methods (Chi-Square, Information Gain, Correlation), Wrapper Methods
  (Forward Selection, Backward Elimination, Recursive Feature Elimination), Embedded Methods (Lasso,
  Ridge)
- Feature Extraction: Principal Component Analysis (PCA) — Covariance Matrix, Eigenvalues,
  Eigenvectors, Variance Explained
- Dimensionality Reduction: t-SNE, LDA (Linear Discriminant Analysis)
- Handling Imbalanced Data: Oversampling (SMOTE), Undersampling, Class Weights

#### Unit III: Supervised Learning — Regression (10 Hours) → CO3

- Simple Linear Regression: Model Assumptions, Ordinary Least Squares (OLS) Estimation
- Multiple Linear Regression: Model, Interpretation, Assumptions (Linearity, Independence,
  Homoscedasticity, Normality)
- Polynomial Regression: Degree Selection, Overfitting
- Regularization: Ridge Regression (L2), Lasso Regression (L1), Elastic Net (L1+L2)
- Gradient Descent: Batch, Stochastic (SGD), Mini-Batch — Learning Rate, Convergence
- Logistic Regression: Sigmoid Function, Decision Boundary, Cost Function (Binary Cross-Entropy)
- Multiclass Classification: One-vs-Rest (OvR), One-vs-One (OvO), Softmax Regression
- Support Vector Machines: Maximal Margin Classifier, Support Vectors, Kernel Trick (Linear,
  Polynomial, RBF, Sigmoid), Soft Margin

#### Unit IV: Ensemble Methods and Decision Trees (10 Hours) → CO4

- Decision Trees: ID3 (Information Gain), C4.5 (Gain Ratio), CART (Gini Index)
- Tree Pruning: Pre-pruning, Post-pruning — Handling Overfitting
- Random Forest: Bagging, Feature Randomness, Out-of-Bag Error
- Ensemble Methods: Voting (Hard, Soft), Bagging (Bootstrap Aggregating), Boosting — AdaBoost,
  Gradient Boosting (XGBoost, LightGBM, CatBoost)
- Stacking: Meta-Learner, Blending
- Bias-Variance Analysis of Ensemble Methods
- Bayesian Learning: Naive Bayes Classifier, Gaussian Naive Bayes, Multinomial Naive Bayes

#### Unit V: Unsupervised Learning and Neural Networks (10 Hours) → CO5, CO6

**Clustering:**

- K-Means Clustering: Algorithm, Initialization (K-Means++), Elbow Method, Silhouette Score
- Hierarchical Clustering: Agglomerative (Bottom-up), Divisive (Top-down), Dendrogram, Linkage
  Criteria (Single, Complete, Average, Ward)
- DBSCAN: Density-based Clustering, Epsilon, MinPts, Handling Noise
- Gaussian Mixture Models (GMM): Expectation-Maximization (EM) Algorithm

**Association Rule Mining:**

- Apriori Algorithm: Support, Confidence, Lift
- FP-Growth Algorithm

**Neural Networks:**

- Artificial Neuron: McCulloch-Pitts Model, Perceptron, Activation Functions (Sigmoid, Tanh, ReLU,
  Leaky ReLU, Softmax)
- Multi-Layer Perceptron (MLP): Architecture, Forward Propagation, Backpropagation
- Hyperparameters: Learning Rate, Batch Size, Number of Epochs, Number of Hidden Layers, Neurons
- Regularization: Dropout, Batch Normalization, Early Stopping, Data Augmentation

### Learning Resources

#### Textbooks

1. Tom M. Mitchell, "Machine Learning", McGraw Hill, 1997
2. Christopher M. Bishop, "Pattern Recognition and Machine Learning", Springer, 2006
3. Ethem Alpaydin, "Introduction to Machine Learning", 4th Edition, MIT Press, 2020

#### Reference Books

1. Gareth James, Daniela Witten, Trevor Hastie, Robert Tibshirani, "An Introduction to Statistical
   Learning", 2nd Edition, Springer, 2021
2. Shai Shalev-Shwartz, Shai Ben-David, "Understanding Machine Learning: From Theory to Algorithms",
   Cambridge University Press, 2014
3. Aurélien Géron, "Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow", 3rd
   Edition, O'Reilly, 2022
4. Kevin P. Murphy, "Machine Learning: A Probabilistic Perspective", MIT Press, 2012
5. Sebastian Raschka, Vahid Mirjalili, "Python Machine Learning", 3rd Edition, Packt, 2019

---

## 23A54405: Software Engineering

**Credits:** 3 | **CIE:** 30 Marks | **SEE:** 70 Marks

**Prerequisites:** Programming in C (23AHSBS04), Data Structures (23A53102)

### Course Objectives

- To understand the principles of software engineering and process models
- To learn requirements engineering and system modeling
- To study design principles and architectural patterns
- To understand software testing strategies and quality assurance
- To explore project management and software maintenance

### Course Outcomes

| CO  | Description                                                                |
| --- | -------------------------------------------------------------------------- |
| CO1 | Select appropriate software process model for a given project              |
| CO2 | Elicit, analyze, and document software requirements using standard formats |
| CO3 | Design software architecture and apply design patterns for modular systems |
| CO4 | Apply object-oriented design principles using UML diagrams                 |
| CO5 | Design test cases using white-box and black-box testing techniques         |
| CO6 | Estimate project cost and schedule using empirical and analytical models   |

### Course Contents

#### Unit I: Software Process Models (10 Hours) → CO1

- Software Engineering: Definition, Software Crisis, Software Myths
- Software Process: Framework Activities (Communication, Planning, Modeling, Construction,
  Deployment)
- Process Models:
  - Waterfall Model: Phases, Advantages, Limitations
  - Incremental Model: Phases, Advantages
  - Evolutionary Process Models: Prototyping, Spiral Model (Risk-driven)
  - Concurrent Development Model
- Agile Development: Agile Manifesto, Principles
- Agile Methods: Scrum (Sprints, Product Backlog, Sprint Backlog, Daily Standup), XP (Extreme
  Programming), Kanban
- Comparison of Traditional vs Agile Approaches

#### Unit II: Requirements Engineering (10 Hours) → CO2

- Requirements Engineering: Inception, Elicitation, Elaboration, Negotiation, Specification,
  Validation, Management
- Requirements Elicitation: Interviews, Surveys, Questionnaires, Observation, Workshops,
  Brainstorming, Storyboarding
- Functional vs Non-functional Requirements
- Use Case Modeling: Actors, Use Cases, Use Case Diagrams, Relationships (Include, Extend,
  Generalization)
- Software Requirements Specification (SRS): IEEE 830 Standard
  - Introduction (Purpose, Scope, Definitions, References)
  - Overall Description (Product Perspective, User Characteristics, Assumptions)
  - Specific Requirements (External Interfaces, Functions, Performance, Logical Database, Design
    Constraints)
- Requirement Validation: Reviews, Prototyping, Test Case Generation

#### Unit III: Software Design and Architecture (10 Hours) → CO3

- Design Process: Quality Guidelines (Modularity, Cohesion, Coupling), Design Principles
- Cohesion: Types (Functional, Sequential, Communicational, Procedural, Temporal, Logical,
  Coincidental)
- Coupling: Types (Data, Stamp, Control, Common, Content)
- Architectural Styles: Data-centered (Repository), Data-flow (Pipe-and-Filter), Call-and-Return
  (Main-Program, OO, Layered), Independent Components (Event-driven), Virtual Machines (Rule-based)
- Object-Oriented Design: Abstraction, Encapsulation, Inheritance, Polymorphism
- UML Diagrams: Class Diagram, Sequence Diagram, Activity Diagram, State Machine Diagram, Component
  Diagram, Deployment Diagram
- Design Patterns: Creational (Singleton, Factory, Builder), Structural (Adapter, Composite, Proxy),
  Behavioral (Observer, Strategy, Template Method)

#### Unit IV: Software Testing (10 Hours) → CO4, CO5

- Testing Fundamentals: Verification vs Validation, Test Case, Test Suite
- Levels of Testing:
  - Unit Testing: Stubs, Drivers
  - Integration Testing: Big Bang, Top-Down, Bottom-Up, Sandwich (Mixed)
  - System Testing: Functional, Performance, Security, Usability
  - Acceptance Testing: Alpha, Beta, User Acceptance Testing (UAT)
- White-Box Testing: Statement Coverage, Branch Coverage, Path Coverage, Condition Coverage, Loop
  Testing, Basis Path Testing (Cyclomatic Complexity)
- Black-Box Testing: Equivalence Partitioning, Boundary Value Analysis, Decision Table Testing,
  State Transition Testing, Use Case Testing
- Regression Testing: Selective, Complete
- Testing Tools: Selenium, JUnit, PyTest

#### Unit V: Project Management and Maintenance (10 Hours) → CO6

- Project Planning: Scope, Feasibility (Technical, Economic, Operational, Schedule)
- Estimation: Decomposition Techniques (LOC, FP), Empirical Models (COCOMO — Basic, Intermediate,
  Detailed), Putnam Model
- Project Scheduling: Work Breakdown Structure (WBS), Activity Networks, Critical Path Method (CPM),
  Gantt Charts, PERT
- Risk Management: Risk Identification (Project, Technical, Business), Risk Assessment (Probability,
  Impact), Risk Mitigation, Monitoring, RMMM Plan
- Software Quality Assurance (SQA): Quality Concepts, Quality Control (QC), Quality Assurance (QA)
- Software Configuration Management (SCM): Baselines, Change Control, Version Control (Git), SCM
  Repository
- Software Maintenance: Corrective, Adaptive, Perfective, Preventive — Reengineering, Reverse
  Engineering, Forward Engineering

### Learning Resources

#### Textbooks

1. Roger S. Pressman, Bruce R. Maxim, "Software Engineering: A Practitioner's Approach", 9th
   Edition, McGraw Hill, 2019
2. Ian Sommerville, "Software Engineering", 10th Edition, Pearson, 2015

#### Reference Books

1. Pankaj Jalote, "An Integrated Approach to Software Engineering", 3rd Edition, Springer, 2005
2. Rajib Mall, "Fundamentals of Software Engineering", 5th Edition, PHI, 2018
3. Grady Booch, James Rumbaugh, Ivar Jacobson, "The Unified Modeling Language User Guide", 2nd
   Edition, Addison-Wesley, 2005
4. Carlo Ghezzi, Mehdi Jazayeri, Dino Mandrioli, "Fundamentals of Software Engineering", 2nd
   Edition, Pearson, 2003
5. Martin Fowler, "Refactoring: Improving the Design of Existing Code", 2nd Edition, Addison-Wesley,
   2018

---

## Laboratory Courses

### 23A54406: Operating Systems Lab

**Practical:** 3 Hours/Week | **Credits:** 1.5 | **CIE:** 30 Marks | **SEE:** 20 Marks

**Companion Course:** 23A54403: Operating Systems

#### Suggested Assignments

**Group A — Shell Programming (Any 2):**

1. Linux shell commands and basic shell scripting
2. Shell script for Fibonacci series, prime numbers, and factorial
3. Shell script for file operations (copy, move, rename, permissions)
4. Process management using shell (ps, kill, fork simulation)

**Group B — System Calls and Process Management (Any 4):** 5. Implementation of fork(), exec(),
wait(), exit() system calls 6. Inter-process communication using pipe() and FIFO (named pipe) 7.
Implementation of CPU scheduling algorithms (FCFS, SJF, Priority, Round Robin) 8. Implementation of
Producer-Consumer problem using semaphores 9. Implementation of Banker's Algorithm for deadlock
avoidance 10. Implementation of Reader-Writers problem using pthreads

**Group C — Memory Management (Any 2):** 11. Implementation of page replacement algorithms (FIFO,
LRU, Optimal) 12. Implementation of paging and page table simulation 13. Implementation of disk
scheduling algorithms (FCFS, SCAN, C-SCAN, LOOK)

**Group D — File Systems (Any 1):** 14. Implementation of file allocation strategies (Contiguous,
Linked, Indexed) 15. Implementation of file permissions and directory management

---

### 23A54407: Machine Learning Lab

**Practical:** 3 Hours/Week | **Credits:** 1.5 | **CIE:** 30 Marks | **SEE:** 20 Marks

**Companion Course:** 23A54404: Machine Learning

#### Suggested Assignments

**Group A — Data Preprocessing and Exploration (Any 2):**

1. Data loading, cleaning, handling missing values, outlier detection using Python (Pandas, NumPy)
2. Data visualization using Matplotlib and Seaborn (histograms, box plots, scatter plots,
   correlation heatmaps)
3. Feature scaling and encoding categorical variables

**Group B — Regression Algorithms (Any 2):** 4. Implementation of Simple and Multiple Linear
Regression from scratch and using scikit-learn 5. Implementation of Polynomial Regression and
analyzing overfitting 6. Implementation of Ridge, Lasso, and Elastic Net Regression

**Group C — Classification Algorithms (Any 3):** 7. Implementation of Logistic Regression for binary
classification 8. Implementation of k-Nearest Neighbors (k-NN) classifier and finding optimal k 9.
Implementation of Decision Trees and visualization 10. Implementation of Support Vector Machine with
different kernels 11. Implementation of Naive Bayes classifier

**Group D — Ensemble and Unsupervised Learning (Any 2):** 12. Implementation of Random Forest and
feature importance analysis 13. Implementation of K-Means clustering with elbow method 14.
Implementation of Hierarchical clustering and dendrogram visualization 15. Implementation of
Principal Component Analysis (PCA) for dimensionality reduction

**Group E — Neural Networks (Any 1):** 16. Implementation of Perceptron and Multi-Layer Perceptron
using TensorFlow/Keras 17. Build a neural network for handwritten digit recognition (MNIST)

---

### 23A54408: Algorithms Lab

**Practical:** 2 Hours/Week | **Credits:** 1 | **CIE:** 15 Marks | **SEE:** 10 Marks

**Companion Course:** 23A54402: Design & Analysis of Algorithms

#### Suggested Assignments

**Group A — Divide and Conquer (Any 2):**

1. Implementation of Merge Sort and analysis of time complexity
2. Implementation of Quick Sort (deterministic and randomized)
3. Implementation of Binary Search and its variations

**Group B — Greedy Algorithms (Any 2):** 4. Implementation of Huffman Coding 5. Implementation of
Activity Selection and Fractional Knapsack 6. Implementation of Job Sequencing with Deadlines

**Group C — Dynamic Programming (Any 3):** 7. Implementation of 0/1 Knapsack using DP 8.
Implementation of Longest Common Subsequence (LCS) 9. Implementation of Matrix Chain
Multiplication 10. Implementation of Floyd-Warshall Algorithm

**Group D — Backtracking and Graph Algorithms (Any 2):** 11. Implementation of N-Queens problem 12.
Implementation of Graph Coloring 13. Implementation of Prim's and Kruskal's MST Algorithms 14.
Implementation of Dijkstra's and Bellman-Ford Algorithms

---

> **Official Source:** https://www.jntua.ac.in/syllabus | JNTUA, Ananthapuramu
