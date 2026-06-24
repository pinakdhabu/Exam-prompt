# University of Mumbai B.E. Computer Engineering — Official Syllabus Reference (R-2019 'C' Scheme)

> Compiled from official University of Mumbai syllabus documents (R-2019 / C-Scheme).
>
> This document provides exact unit-wise syllabus, course outcomes, examination structure, for B.E.
> in Computer Engineering under the R-2019 Pattern.
>
> No syllabus topic has been intentionally omitted or condensed.

---

# Semester IV — Course Structure

| Course Code | Course Name                             |   TH   |  PR   |  TUT  | Mid-Sem | End-Sem |   TW   |   PR   |  Total  | Credits |
| ----------- | --------------------------------------- | :----: | :---: | :---: | :-----: | :-----: | :----: | :----: | :-----: | :-----: |
| CSC401      | Applied Mathematics IV                  |   3    |   —   |   1   |   25    |   75    |   25   |   —    |   125   |    4    |
| CSC402      | Analysis of Algorithms                  |   3    |   —   |   —   |   25    |   75    |   —    |   —    |   100   |    3    |
| CSC403      | Database Management Systems             |   3    |   —   |   —   |   25    |   75    |   —    |   —    |   100   |    3    |
| CSC404      | Operating Systems                       |   3    |   —   |   —   |   25    |   75    |   —    |   —    |   100   |    3    |
| CSC405      | Microprocessor and Microcontrollers     |   3    |   —   |   —   |   25    |   75    |   —    |   —    |   100   |    3    |
| CSL401      | Database Management Systems Lab         |   —    |   3   |   —   |    —    |    —    |   25   |   25   |   50    |    2    |
| CSL402      | Microprocessor and Microcontrollers Lab |   —    |   2   |   —   |    —    |    —    |   25   |   —    |   25    |    1    |
|             | **Total**                               | **15** | **5** | **1** | **125** | **375** | **75** | **25** | **600** | **19**  |

---

## CSC401: Applied Mathematics IV

**Credits:** 4 | **CIE:** 25 Marks | **SEE:** 75 Marks

**Prerequisites:** Engineering Mathematics I, II, III

### Course Objectives

- To study complex integration, conformal mapping, and residue theorem
- To understand probability distributions and statistical inference
- To learn linear programming and optimization techniques
- To apply mathematics to computer science problems

### Course Outcomes

| CO  | Description                                                     |
| --- | --------------------------------------------------------------- |
| CO1 | Apply complex analysis techniques including contour integration |
| CO2 | Use conformal mapping for solving boundary value problems       |
| CO3 | Apply probability distributions and test hypotheses             |
| CO4 | Formulate and solve linear programming problems                 |
| CO5 | Solve transportation and assignment problems                    |

### Course Contents

**Unit I: Complex Integration (12 Hours):** Line integrals, Cauchy's integral theorem and formula,
Derivatives of analytic functions. Taylor's and Laurent's series expansions. Zeros and
singularities, Residue theorem, Evaluation of real definite integrals using residues (integrals
involving trigonometric and exponential functions)

**Unit II: Conformal Mapping (08 Hours):** Concepts of conformal mapping, Möbius (bilinear)
transformations, Mapping by elementary functions (w = z², w = eᶻ, w = sin z, w = cos z).
Applications in solving boundary value problems

**Unit III: Probability and Statistics (10 Hours):** Standard distributions: Binomial, Poisson,
Normal. Sampling distributions (χ², t, F). Hypothesis testing: Z-test, t-test, χ²-test (goodness of
fit, independence), F-test. ANOVA: One-way and two-way classification

**Unit IV: Linear Programming (10 Hours):** Mathematical formulation, Graphical method. Simplex
method (maximization and minimization), Big-M method, Two-phase method. Duality. Transportation
problem (NWCR, LCM, VAM, MODI). Assignment problem (Hungarian method)

**Unit V: Queuing Models (10 Hours):** Structure of queueing systems, Kendall's notation.
Birth-death process. M/M/1 (unlimited and finite capacity), M/M/c, M/G/1 queue. Applications in
computer systems and networks

### Learning Resources

**Textbooks:**

1. B.V. Ramana, "Higher Engineering Mathematics", Tata McGraw Hill
2. B.S. Grewal, "Higher Engineering Mathematics", 44th Edition, Khanna Publishers
3. Hamdy A. Taha, "Operations Research", 10th Edition, Pearson

---

## CSC402: Analysis of Algorithms

**Credits:** 3 | **CIE:** 25 Marks | **SEE:** 75 Marks

**Prerequisites:** Data Structures (CSC303), Discrete Mathematics (CSC302)

### Course Objectives

- To analyze worst-case and average-case complexity of algorithms
- To study divide-and-conquer, greedy, and dynamic programming strategies
- To understand backtracking and branch-and-bound techniques
- To explore NP-completeness and approximation algorithms
- To understand multithreaded and distributed algorithms

### Course Outcomes

| CO  | Description                                                             |
| --- | ----------------------------------------------------------------------- |
| CO1 | Analyze algorithms using asymptotic notations and recurrence relations  |
| CO2 | Apply divide-and-conquer technique to solve problems                    |
| CO3 | Design optimal solutions using greedy and dynamic programming           |
| CO4 | Apply backtracking and branch-and-bound to solve combinatorial problems |
| CO5 | Classify P, NP, NP-Complete, and NP-Hard problems                       |

### Course Contents

**Unit I: Complexity Analysis (08 Hours):** Asymptotic notations (O, Ω, Θ, o, ω). Recurrence
relations: Substitution, recursion tree, master theorem. Amortized analysis (aggregate, accounting,
potential). Examples: Binary counter, dynamic tables, disjoint set union

**Unit II: Divide and Conquer (08 Hours):** Binary search, Merge sort, Quick sort (randomized
version), Strassen's matrix multiplication. Maximum subarray (Kadane's). Closest pair of points.
Convex hull (Graham scan)

**Unit III: Greedy and Dynamic Programming (10 Hours):** Greedy: Activity selection, Huffman coding,
Fractional knapsack, Job sequencing with deadlines. Dynamic programming: 0/1 knapsack, LCS, Matrix
chain multiplication, OBST, Assembly line scheduling, Floyd-Warshall, Bellman-Ford

**Unit IV: Backtracking and Branch-and-Bound (08 Hours):** Backtracking: N-Queens, Graph coloring,
Hamiltonian cycle, Sum of subsets. Branch-and-bound: TSP, 0/1 knapsack (LC, FIFO), Job assignment

**Unit V: NP-Completeness and String Matching (08 Hours):** P, NP, NP-Complete, NP-Hard. Polynomial
reduction, Cook-Levin theorem (overview). NP-Complete problems: SAT, 3-SAT, Vertex cover, Clique.
String matching: Naive, Rabin-Karp, KMP. Approximation algorithms: Vertex cover (2-approximation),
TSP

### Learning Resources

**Textbooks:**

1. T.H. Cormen, C.E. Leiserson, R.L. Rivest, C. Stein, "Introduction to Algorithms", 4th Edition,
   MIT Press
2. E. Horowitz, S. Sahni, S. Rajasekaran, "Fundamentals of Computer Algorithms", 2nd Edition,
   University Press

**Reference Books:**

1. Jon Kleinberg, Eva Tardos, "Algorithm Design", Pearson
2. Steven S. Skiena, "The Algorithm Design Manual", 3rd Edition, Springer
3. Anany Levitin, "Introduction to the Design and Analysis of Algorithms", Pearson

---

## CSC403: Database Management Systems

**Credits:** 3 | **CIE:** 25 Marks | **SEE:** 75 Marks

### Course Objectives

- To understand DBMS architecture, data models, and database design
- To master SQL and relational database operations
- To learn normalization and functional dependency theory
- To understand transaction processing, concurrency control, and recovery
- To explore emerging database technologies

### Course Outcomes

| CO  | Description                                               |
| --- | --------------------------------------------------------- |
| CO1 | Design ER diagrams and convert them to relational schemas |
| CO2 | Write complex SQL queries and PL/SQL programs             |
| CO3 | Apply normalization techniques up to BCNF                 |
| CO4 | Implement transaction management and concurrency control  |
| CO5 | Apply crash recovery and backup techniques                |

### Course Contents

**Unit I: Introduction and Data Modeling (08 Hours):** DBMS architecture, Data models (ER,
relational, object-oriented). ER model: Entities, attributes, relationships, weak entities, ISA
hierarchy, aggregation, specialization, generalization. ER-to-relational mapping. Relational model:
Keys, integrity constraints (domain, entity, referential), triggers

**Unit II: SQL and Relational Algebra (08 Hours):** Relational algebra (σ, π, ⋈, ∪, −, ÷, ρ). SQL:
DDL (CREATE, ALTER, DROP), DML (INSERT, UPDATE, DELETE, SELECT), JOINs (INNER, OUTER, CROSS),
subqueries, set operations, GROUP BY/HAVING, views, indexes. PL/SQL: Procedures, functions,
packages, triggers, cursors, exception handling

**Unit III: Database Design and Normalization (08 Hours):** Functional dependencies: Armstrong's
axioms, closure, canonical cover. Normal forms: 1NF, 2NF, 3NF, BCNF, 4NF, 5NF. Lossless join
decomposition, Dependency preservation. Multi-valued dependencies, Join dependencies

**Unit IV: Transaction Processing and Concurrency (08 Hours):** ACID properties. Transaction states.
Serializability: Conflict and view. Concurrency control: 2PL, Strict 2PL, Timestamp ordering (TSO),
Optimistic concurrency, MVCC. Deadlock: Detection (wait-for graph), Prevention, Avoidance. Isolation
levels in SQL

**Unit V: Crash Recovery and Storage (08 Hours):** Storage hierarchy, RAID. File organization (heap,
sequential, hash, clustered, B+-tree indexing). Query processing (selection, join, sorting).
Recovery: Log-based (undo, redo, undo/redo), checkpoints, ARIES algorithm. Shadow paging. Backup and
recovery strategies

### Learning Resources

**Textbooks:**

1. Silberschatz, Korth, Sudarshan, "Database System Concepts", 7th Edition, McGraw Hill
2. R. Elmasri, S. Navathe, "Fundamentals of Database Systems", 7th Edition, Pearson

**Reference Books:**

1. Raghu Ramakrishnan, Johannes Gehrke, "Database Management Systems", 3rd Edition, McGraw Hill
2. C.J. Date, "An Introduction to Database Systems", 8th Edition, Addison-Wesley

---

## CSC404: Operating Systems

**Credits:** 3 | **CIE:** 25 Marks | **SEE:** 75 Marks

### Course Objectives

- To understand the role and functions of operating systems
- To study process management, scheduling, and synchronization
- To learn memory management and virtual memory
- To understand file systems, I/O, and mass storage management

### Course Outcomes

| CO  | Description                                                               |
| --- | ------------------------------------------------------------------------- |
| CO1 | Explain OS functions, structures, and system calls                        |
| CO2 | Apply CPU scheduling and process synchronization                          |
| CO3 | Implement deadlock handling mechanisms                                    |
| CO4 | Apply memory management techniques (paging, segmentation, virtual memory) |
| CO5 | Analyze file systems and disk scheduling algorithms                       |

### Course Contents

**Unit I: OS Overview and Process Management (08 Hours):** OS functions, Evolution (batch,
multiprogramming, timesharing, real-time, distributed), System calls (process, file, device, IPC).
Process: States, PCB, context switch. Threads: User vs kernel, multithreading models. CPU
scheduling: FCFS, SJF, Priority, Round Robin, Multilevel queue/feedback

**Unit II: Process Synchronization and Deadlocks (08 Hours):** Race conditions, Critical section.
Peterson's solution, Hardware synchronization (TSL, swap). Semaphores (binary, counting). Classical
problems: Producer-Consumer, Readers-Writers, Dining Philosophers. Deadlock: Necessary conditions,
Prevention, Avoidance (Banker's algorithm), Detection, Recovery

**Unit III: Memory Management (08 Hours):** Memory hierarchy. Contiguous allocation (fixed/dynamic,
fragmentation). Paging: Page table, TLB, hierarchical/hashed/inverted page tables. Segmentation.
Segmentation with paging. Virtual memory: Demand paging, Page replacement (FIFO, LRU, Optimal,
Clock), Thrashing (working set model, page fault frequency)

**Unit IV: File Systems (08 Hours):** File concepts (attributes, operations, types). Directory
structure (single-level, tree, acyclic-graph). File allocation (contiguous, linked, indexed). Free
space management (bitmap, linked list, grouping). File system mounting. CPER. Disk scheduling: FCFS,
SSTF, SCAN, C-SCAN, LOOK, C-LOOK. RAID levels

**Unit V: Case Studies and Advanced Topics (08 Hours):** Linux: Architecture, kernel modules,
process management, file system (ext4), memory management, system calls. Windows: Architecture (NT
kernel), processes/threads, memory management, file system (NTFS). Virtual machines (Hypervisor
types), Containers (Docker). Real-time OS concepts

### Learning Resources

**Textbooks:**

1. A. Silberschatz, P.B. Galvin, G. Gagne, "Operating System Concepts", 10th Edition, Wiley
2. William Stallings, "Operating Systems: Internals and Design Principles", 9th Edition, Pearson

**Reference Books:**

1. Andrew S. Tanenbaum, "Modern Operating Systems", 5th Edition, Pearson
2. Maurice J. Bach, "Design of the UNIX Operating System", PHI

---

## CSC405: Microprocessor and Microcontrollers

**Credits:** 3 | **CIE:** 25 Marks | **SEE:** 75 Marks

### Course Objectives

- To understand 8086 microprocessor architecture and programming
- To study interfacing techniques with memory and I/O devices
- To learn 8051 microcontroller architecture and applications
- To understand advanced processors and embedded systems

### Course Outcomes

| CO  | Description                                                            |
| --- | ---------------------------------------------------------------------- |
| CO1 | Explain 8086 architecture, pin diagram, and addressing modes           |
| CO2 | Write assembly language programs for 8086                              |
| CO3 | Design memory and I/O interfacing circuits                             |
| CO4 | Explain 8051 microcontroller architecture and programming              |
| CO5 | Compare microprocessors and microcontrollers for embedded applications |

### Course Contents

**Unit I: 8086 Microprocessor Architecture (08 Hours):** 8086 architecture: Execution unit (EU), Bus
interface unit (BIU). Register set (general purpose, segment, pointer, index, flag). Segment
registers and memory segmentation. Pin diagram and functions. Clock generator (8284). Minimum and
maximum mode configurations. Bus timing (read/write cycles)

**Unit II: 8086 Instruction Set and Programming (08 Hours):** Addressing modes (register, immediate,
direct, register indirect, based, indexed, based indexed). Instruction set: Data transfer,
arithmetic, logical, shift/rotate, string, control transfer (conditional/unconditional jumps,
call/return, loop), processor control. Assembly language programming: Programs for arithmetic
operations, code conversion, string operations, sorting, multi-byte operations

**Unit III: 8086 Interfacing (08 Hours):** Memory interfacing (RAM, EPROM). I/O interfacing:
Programmed I/O, interrupt-driven I/O, DMA. Programmable peripheral interface (8255): Modes,
initialization. Programmable interrupt controller (8259): Cascading. Programmable timer (8253/8254):
Modes, square wave generation. DMA controller (8237). ADC/DAC interfacing

**Unit IV: 8051 Microcontroller (08 Hours):** 8051 architecture: CPU, RAM, ROM, I/O ports,
timers/counters, serial port, interrupt system. Pin diagram. Memory organization (internal and
external). Instruction set: Data transfer, arithmetic, logical, Boolean, branch. Assembly and C
programming for 8051: LED blinking, switch input, timer/counter programming, serial communication

**Unit V: Advanced Processors and Applications (08 Hours):** ARM processor basics: Architecture,
registers, modes, instruction set (thumb). Comparison: Microprocessor vs microcontroller. Embedded
systems: Components (sensor, ADC, microcontroller, actuator), RTOS overview. Applications: IoT
devices, smart home, automotive. Introduction to Raspberry Pi and Arduino

### Learning Resources

**Textbooks:**

1. Douglas V. Hall, "Microprocessors and Interfacing: Programming and Hardware", 2nd Edition, McGraw
   Hill
2. Muhammad Ali Mazidi, "The 8051 Microcontroller and Embedded Systems", 2nd Edition, Pearson
3. A. Nagoor Kani, "Microprocessors and Microcontrollers", McGraw Hill

**Reference Books:**

1. Barry B. Brey, "The Intel Microprocessors: 8086/8088... Pentium", 8th Edition, Pearson
2. Kenneth J. Ayala, "The 8051 Microcontroller", 3rd Edition, Cengage
3. Steve Furber, "ARM System-on-Chip Architecture", 2nd Edition, Addison-Wesley

---

## Laboratory Courses (Semester IV)

### CSL401: Database Management Systems Lab

**Practical:** 3 Hours/Week | **Credits:** 2

**Assignments:** DDL commands (CREATE, ALTER, DROP) with constraints, DML operations (INSERT,
UPDATE, DELETE, SELECT) with WHERE, ORDER BY, GROUP BY, HAVING, JOIN operations (INNER, LEFT, RIGHT,
FULL), Subqueries and correlated subqueries, Views and indexes creation, PL/SQL: Procedures and
functions, Triggers and cursors, Database design project (ER to relational mapping, normalization,
SQL implementation), Front-end connectivity (PHP/Java with MySQL/Oracle)

### CSL402: Microprocessor and Microcontrollers Lab

**Practical:** 2 Hours/Week | **Credits:** 1

**Assignments:** 8086 ALP: 16-bit arithmetic operations, BCD arithmetic, String operations (compare,
reverse, concatenate), Sorting algorithms (bubble, insertion), Code conversions (BCD to HEX, HEX to
ASCII), 8255 PPI interfacing (LED display, switch input), 8253/8254 timer programming, 8051 C
programming: LED blinking, 7-segment display, Keypad interface, Traffic light controller simulation

---

# Semester V — Course Structure

| Course Code | Course Name                                  | Credits |
| ----------- | -------------------------------------------- | :-----: |
| CSC501      | Software Engineering                         |    3    |
| CSC502      | Computer Networks                            |    3    |
| CSC503      | Theory of Computation                        |    3    |
| CSC504      | System Programming and Compiler Construction |    3    |
| CSDLO501x   | Department Level Optional Course I           |    3    |
| CSL501      | Software Engineering Lab                     |    2    |
| CSL502      | Computer Networks Lab                        |    2    |
|             | **Total**                                    | **19**  |

---

## CSC501: Software Engineering

**Credits:** 3 | **CIE:** 25 Marks | **SEE:** 75 Marks

**Contents:** Software process models (Waterfall, Incremental, Spiral, Prototyping, Agile/Scrum).
Requirements engineering (elicitation, SRS, use cases). Design (cohesion, coupling, architectural
styles, UML). Testing (white-box: path/branch coverage, black-box: equivalence/BVA, integration,
system testing). Project management (estimation: LOC/FP/COCOMO, scheduling: PERT/CPM, risk
management). Quality assurance (ISO 9001, CMMI, Six Sigma). Maintenance (refactoring, reengineering)

## CSC502: Computer Networks

**Credits:** 3 | **CIE:** 25 Marks | **SEE:** 75 Marks

**Contents:** Layered models (OSI, TCP/IP). Physical layer (transmission media, switching). Data
link layer (framing, error detection/correction, flow control). MAC protocols (CSMA/CD, Ethernet).
Network layer (IPv4/IPv6 addressing, subnetting, CIDR, NAT, routing: RIP/OSPF/BGP). Transport layer
(TCP/UDP, flow/congestion control). Application layer (HTTP, DNS, SMTP, FTP). Network security
(cryptography: DES/AES/RSA, firewalls, VPN)

## CSC503: Theory of Computation

**Credits:** 3 | **CIE:** 25 Marks | **SEE:** 75 Marks

**Contents:** Finite automata (DFA, NFA, ε-NFA, minimization). Regular expressions (Arden's theorem,
pumping lemma). Context-free grammars (derivations, parse trees, ambiguity, CNF, GNF). Pushdown
automata. Turing machines (variants, universal TM, recursive/R.E. languages). Undecidability
(halting problem, PCP, Rice's theorem). Chomsky hierarchy. Intro to P vs NP

## CSC504: System Programming and Compiler Construction

**Credits:** 3 | **CIE:** 25 Marks | **SEE:** 75 Marks

**Contents:** System software overview (assembler, loader, linker, macro processor, compiler).
Assemblers (pass-1, pass-2, symbol table, literal table). Loaders (relocation, linking). Macro
processors (macro definition, expansion, nested macros). Compiler phases. Lexical analysis (regular
expressions, NFA/DFA, Lex). Parsing (top-down: LL(1), bottom-up: LR(0), SLR, CLR, LALR, YACC).
Syntax-directed translation. Intermediate code (three-address code). Code optimization (basic
blocks, DAG, data-flow analysis)

## DLOC Options (Semester V)

**CSDLO5011: Web Technologies:** HTML5/CSS3, JavaScript ES6+, React.js, Node.js/Express, MongoDB,
REST APIs, JWT auth **CSDLO5012: Applied Mathematics for AI:** Linear algebra (vectors, matrices,
eigenvalues), Calculus (gradients, optimization), Probability (Bayesian inference), Statistics (MLE,
hypothesis testing) **CSDLO5013: Advanced Database Systems:** Query optimization, Distributed
databases, NoSQL (MongoDB, Cassandra), Big data (Hadoop, Spark), Data warehousing, MapReduce

## Laboratory Courses (Semester V)

**CSL501: Software Engineering Lab:** SRS document creation, UML diagrams (use case, class,
sequence, activity, state, component, deployment), Use case specification, Test case design and
execution, Project using Agile methodology (Scrum), Version control with Git **CSL502: Computer
Networks Lab:** Socket programming (TCP/UDP), HTTP client/server, Packet capture using Wireshark,
Network simulation using NS2/3/Cisco Packet Tracer, Routing algorithms (distance vector, link
state), Network configuration (IP, subnet, routing table)

---

# Semester VI — Course Structure

| Course Code | Course Name                         | Credits |
| ----------- | ----------------------------------- | :-----: |
| CSC601      | Artificial Intelligence             |    3    |
| CSC602      | Data Warehousing and Mining         |    3    |
| CSC603      | Cryptography and System Security    |    3    |
| CSC604      | Mobile Communication and Computing  |    3    |
| CSDLO601x   | Department Level Optional Course II |    3    |
| CSL601      | Artificial Intelligence Lab         |    2    |
| CSL602      | Data Warehousing and Mining Lab     |    2    |
|             | **Total**                           | **19**  |

---

## CSC601: Artificial Intelligence

**Credits:** 3 | **CIE:** 25 Marks | **SEE:** 75 Marks

**Contents:** AI fundamentals (agents, PEAS). Problem solving: State space search, BFS, DFS, IDDFS.
Informed search: Heuristics, A\* (admissibility, consistency). Local search: Hill climbing,
simulated annealing, genetic algorithms. Adversarial search: Minimax, alpha-beta pruning. Knowledge
representation: Propositional logic, FOL, inference rules, resolution, forward/backward chaining.
Reasoning under uncertainty: Bayesian networks, inference. Planning: STRIPS, partial-order planning.
AI applications: NLP, expert systems, robotics

## CSC602: Data Warehousing and Mining

**Credits:** 3 | **CIE:** 25 Marks | **SEE:** 75 Marks

**Contents:** Data warehousing: Architecture, OLAP vs OLTP, star/snowflake schemas, fact
constellation, data cubes, operations (drill-down, roll-up, slice, dice, pivot), ETL process. Data
mining: Preprocessing (cleaning, transformation, reduction). Association rules: Apriori, FP-growth,
correlation measures. Classification: Decision trees (ID3, C4.5, CART), Naive Bayes, k-NN, SVM,
ensemble methods (Random Forest, AdaBoost). Clustering: K-means, hierarchical, DBSCAN. Outlier
detection. Web and text mining

## CSC603: Cryptography and System Security

**Credits:** 3 | **CIE:** 25 Marks | **SEE:** 75 Marks

**Contents:** Security concepts (CIA, threats, attacks). Classical ciphers (Caesar, Playfair, Hill,
Vigenère, DES). Modern ciphers: AES (structure, rounds), RSA (key generation,
encryption/decryption), Diffie-Hellman, ECC. Hash functions (SHA-256, MD5), Digital signatures
(DSA). Authentication: Kerberos, X.509, PKI. Network security: Firewalls, IDS/IPS, IPsec, SSL/TLS,
VPN. Web security: SQL injection, XSS, CSRF, OWASP Top 10. System security: Buffer overflow,
malware, access control (DAC, MAC, RBAC)

## CSC604: Mobile Communication and Computing

**Credits:** 3 | **CIE:** 25 Marks | **SEE:** 75 Marks

**Contents:** Mobile communication: Cellular systems (1G to 5G), GSM (architecture, location
management), CDMA. Wireless networks: WLAN (802.11), Bluetooth, WiMAX. Mobile IP, Mobile TCP. Mobile
computing: WAP, Android architecture (components, activities, services, content providers). Mobile
app development: UI design, sensors (GPS, accelerometer, camera), data storage (SQLite, Room),
networking (HTTP, REST). Location-based services. Mobile security

## DLOC Options (Semester VI)

**CSDLO6011: Wireless Networking:** 802.11 protocol, Bluetooth/BLE, ZigBee, LoRaWAN, MANET routing
(AODV, DSDV), Wireless sensor networks **CSDLO6012: Digital Signal Processing:** DFT/FFT,
Z-transform, FIR/IIR filter design, DSP processors, Speech and image processing basics **CSDLO6013:
Image Processing:** Digital image fundamentals, Enhancement (histogram, spatial/frequency
filtering), Restoration, Segmentation (edge detection, thresholding), Compression (JPEG), Feature
extraction (SIFT, HOG)

## Laboratory Courses (Semester VI)

**CSL601: AI Lab:** BFS/DFS problem solving, A\* for 8-puzzle, Tic-Tac-Toe with Minimax, CSP
(Sudoku), Bayesian network (diagnosis problem), Expert system rule base, Chatbot using NLP **CSL602:
Data Mining Lab:** Data preprocessing (cleaning, normalization, PCA), Apriori/Frequent pattern
mining, Decision tree classifier, Naive Bayes classifier, k-NN classifier, K-means clustering,
Hierarchical clustering, Sentiment analysis

---

# Semester VII — Course Structure

| Course Code | Course Name                          | Credits |
| ----------- | ------------------------------------ | :-----: |
| CSC701      | Machine Learning                     |    3    |
| CSC702      | Big Data Analytics                   |    3    |
| CSDLO701x   | Department Level Optional Course III |    3    |
| CSDLO702x   | Department Level Optional Course IV  |    3    |
| ILO701x     | Institute Level Optional Course I    |    3    |
| CSL701      | Machine Learning Lab                 |    2    |
| CSL702      | Big Data Analytics Lab               |    2    |
| CSL703      | Project I                            |    2    |
|             | **Total**                            | **21**  |

---

## CSC701: Machine Learning

**Credits:** 3 | **CIE:** 25 Marks | **SEE:** 75 Marks

**Contents:** ML fundamentals (supervised/unsupervised/reinforcement). Regression: Linear,
polynomial, ridge, lasso (gradient descent, OLS). Classification: Logistic regression, decision
trees, k-NN, SVM (kernels: linear, polynomial, RBF). Ensemble: Random Forest, AdaBoost, Gradient
Boosting, XGBoost. Evaluation: Cross-validation, confusion matrix, precision/recall/F1, ROC-AUC.
Regularization: L1/L2, early stopping. Unsupervised: K-means, DBSCAN, hierarchical. Dimensionality
reduction: PCA. Neural networks: MLP, backpropagation, activation functions. Deep learning intro
(CNN, RNN concepts)

## CSC702: Big Data Analytics

**Credits:** 3 | **CIE:** 25 Marks | **SEE:** 75 Marks

**Contents:** Big Data fundamentals (3Vs/5Vs), Hadoop ecosystem (HDFS, MapReduce, YARN). NoSQL:
HBase, MongoDB, Cassandra. Apache Spark: RDDs, DataFrames, Spark SQL, MLlib. Stream processing:
Kafka, Flink. Data pipelines: Hive (HQL), Pig (Latin). Data visualization with Tableau/Power BI.
Cloud big data: AWS EMR, Google BigQuery. Real-world case studies

## DLOC Options (Semester VII)

**CSDLO7011: Deep Learning:** MLP, CNN (architectures: LeNet, AlexNet, VGG, ResNet), RNN, LSTM, GRU,
Autoencoders, GANs, Transfer learning, TensorFlow/PyTorch **CSDLO7012: Robotics:** Robot kinematics,
Sensors, ROS, Path planning (A\*, RRT), SLAM, Robot control, Applications **CSDLO7013: Soft
Computing:** ANN, Fuzzy logic (sets, relations, inference systems), Genetic algorithms, Hybrid
systems (neuro-fuzzy, GA-ANN) **CSDLO7021: Cyber Forensics:** Digital evidence, Computer forensics
process, Disk/data analysis, Network forensics, Malware analysis, Forensic tools (EnCase, FTK)
**CSDLO7022: Blockchain Technology:** Blockchain fundamentals, Cryptography (hashing, ECDSA),
Bitcoin (transactions, mining), Ethereum (smart contracts, Solidity, DApps), Hyperledger, Consensus
(PoW, PoS, PBFT), Use cases **CSDLO7023: High Performance Computing:** Parallel architectures (SIMD,
MIMD), OpenMP, MPI, CUDA programming, GPU computing, Performance analysis (Amdahl's law,
scalability)

## ILO Options (Semester VII)

**ILO7011: Project Management:** PM lifecycle, WBS, PERT/CPM, Risk management, Agile project
management, PMBOK **ILO7012: Finance Management:** Accounting principles, Financial statements, Cost
analysis, Capital budgeting, Working capital management **ILO7013: Entrepreneurship:** Business
model canvas, Lean startup, Market validation, Funding (angel, VC), IPR, Pitching **ILO7014:
Environmental Management:** Environment impact assessment, Sustainable development, Pollution
control, Environmental laws, Green computing

## Laboratory Courses (Semester VII)

**CSL701: ML Lab:** Data preprocessing, Linear/Logistic regression, Decision trees, SVM, Random
Forest, k-NN clustering, PCA dimensionality reduction, Neural network with Keras, Model evaluation
and hyperparameter tuning **CSL702: Big Data Lab:** Hadoop setup, MapReduce word count, HDFS
operations, Hive queries, Pig scripts, Spark RDD operations, Spark MLlib classification, Kafka
producer/consumer, MongoDB CRUD operations

---

# Semester VIII — Course Structure

| Course Code | Course Name                        | Credits |
| ----------- | ---------------------------------- | :-----: |
| CSC801      | Distributed Computing              |    3    |
| CSDLO801x   | Department Level Optional Course V |    3    |
| ILO801x     | Institute Level Optional Course II |    3    |
| CSL801      | Project II                         |    6    |
|             | **Total**                          | **15**  |

---

## CSC801: Distributed Computing

**Credits:** 3 | **CIE:** 25 Marks | **SEE:** 75 Marks

**Contents:** Distributed systems fundamentals (characteristics, challenges, CAP theorem).
Communication: RPC, RMI, message queues (RabbitMQ, Kafka). Naming: DNS, distributed hash tables
(Chord). Synchronization: Clock synchronization (NTP), logical clocks (Lamport, vector), mutual
exclusion (Ricart-Agrawala, Maekawa), election (Bully, Ring). Consistency: Eventual, causal,
sequential, strong. Replication (primary-backup, consensus, quorum). Fault tolerance: Failure
detection, Byzantine generals, Paxos, Raft consensus. Distributed file systems (GFS, HDFS).
MapReduce and Spark. Microservices architecture. Case study: Google, Amazon, Twitter architectures

## DLOC Options (Semester VIII)

**CSDLO8011: Natural Language Processing:** Text preprocessing, Language models (n-grams), POS
tagging, Parsing, Word embeddings (Word2Vec, GloVe), Sequence models (LSTM, GRU), Transformers
(BERT, GPT), Applications (MT, QA, summarization, sentiment) **CSDLO8012: Cloud Computing:**
AWS/Google Cloud services (compute, storage, database, networking), Containers (Docker, Kubernetes),
Serverless (Lambda, Cloud Functions), Cloud security, Cost management, Migration strategies
**CSDLO8013: Internet of Everything:** IoT architecture, Sensors/actuators, MQTT/CoAP protocols,
Edge computing, IoT security, Smart city, Healthcare, Industrial IoT

## ILO Options (Semester VIII)

**ILO8011: IPR & Patents:** Intellectual property types (patents, copyright, trademark, trade
secret), Patent filing process, Patent search, Technology transfer, Licensing **ILO8012: Product
Lifecycle Management:** PLM concepts, Product design, PDM, PLM software, Digital manufacturing
**ILO8013: E-Commerce:** E-commerce models (B2B, B2C, C2C), Payment systems, Digital marketing,
Supply chain, Security, Legal aspects **ILO8014: Disaster Management:** Types, Disaster cycle, Risk
assessment, Preparedness, Response, Recovery, ICT in disaster management

### CSL801: Project II

**Credits:** 6 | **TW:** 100 Marks | **OR:** 50 Marks

Continuation of Project I. Implementation, testing, deployment, and documentation. Project report
and final presentation/viva voce.

---

> **Official Source:** https://mu.ac.in | University of Mumbai
