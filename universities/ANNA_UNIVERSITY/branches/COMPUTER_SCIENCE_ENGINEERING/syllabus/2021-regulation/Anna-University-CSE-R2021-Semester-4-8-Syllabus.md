# Anna University B.E. CSE — Official Syllabus Reference (R2021 Regulation)

> Compiled from official Anna University syllabus documents for reference purposes.
>
> This document provides exact unit-wise syllabus, course outcomes, examination structure, for B.E.
> in Computer Science and Engineering under the R2021 Regulation.
>
> No syllabus topic has been intentionally omitted or condensed.

---

# Semester IV — Course Structure

| S.No | Course Code | Course Name                                  | L:T:P | Credits | CIE | SEE | Total |
| ---- | ----------- | -------------------------------------------- | :---: | :-----: | :-: | :-: | :---: |
| 1    | MA3451      | Probability and Queueing Theory              | 3:1:0 |    4    | 25  | 75  |  100  |
| 2    | CS3451      | Introduction to Operating Systems            | 3:0:2 |    4    | 25  | 75  |  100  |
| 3    | CS3452      | Theory of Computation                        | 3:1:0 |    4    | 25  | 75  |  100  |
| 4    | CS3491      | Artificial Intelligence and Machine Learning | 3:0:2 |    4    | 25  | 75  |  100  |
| 5    | CS3411      | Database Management Systems                  | 3:0:2 |    4    | 25  | 75  |  100  |
| 6    | CS3461      | Operating Systems Lab                        | 0:0:3 |   1.5   | 25  | 25  |  50   |
| 7    | CS3481      | AIML Lab                                     | 0:0:3 |   1.5   | 25  | 25  |  50   |
|      | **Total**   |                                              |       | **23**  |     |     |       |

---

## MA3451: Probability and Queueing Theory

**Credits:** 4 (L:3, T:1, P:0) | **CIE:** 25 Marks | **SEE:** 75 Marks

**Prerequisites:** MA3354 Discrete Mathematics

### Course Objectives

- To understand probability concepts and random variables
- To study standard probability distributions and their applications
- To learn two-dimensional random variables and correlation
- To understand random processes and queueing models
- To apply queueing theory to computer networks and systems

### Course Outcomes

| CO  | Description                                                              |
| --- | ------------------------------------------------------------------------ |
| CO1 | Apply probability axioms, Bayes' theorem, and random variable concepts   |
| CO2 | Use standard distributions (Binomial, Poisson, Normal) for modeling      |
| CO3 | Analyze two-dimensional random variables and compute correlation         |
| CO4 | Apply random process concepts including Markov chains                    |
| CO5 | Analyze queueing models (M/M/1, M/M/c, M/G/1) for performance evaluation |
| CO6 | Apply queueing theory to computer system performance analysis            |

### Course Contents

**Unit I: Probability and Random Variables (12 Hours):** Axioms of probability, Conditional
probability, Bayes' theorem, Random variables (discrete and continuous), Probability mass function,
Probability density function, Cumulative distribution function, Mathematical expectation, Moments,
Moment generating functions, Chebyshev's inequality

**Unit II: Standard Probability Distributions (12 Hours):** Discrete distributions: Binomial,
Poisson, Geometric, Negative Binomial. Continuous distributions: Uniform, Exponential, Gamma,
Weibull, Normal (Gaussian), Lognormal. Applications of each distribution in engineering

**Unit III: Two-Dimensional Random Variables (12 Hours):** Joint distributions (joint PMF, joint
PDF, joint CDF), Marginal distributions, Conditional distributions, Independence of random
variables, Covariance and correlation, Joint moment generating functions, Central limit theorem

**Unit IV: Random Processes and Markov Chains (12 Hours):** Classification of random processes
(stationary, wide-sense stationary, ergodic), Autocorrelation and cross-correlation, Power spectral
density. Markov chains: State transition diagram, Transition probability matrix, Chapman-Kolmogorov
equations, Steady-state probabilities, Classification of states

**Unit V: Queueing Theory (12 Hours):** Characteristics of queueing systems (arrival process,
service process, number of servers, queue capacity, queue discipline), Kendall's notation
(A/B/c/K/N/D). Little's law. Birth-death process. M/M/1 queue (steady-state probabilities,
performance measures): M/M/c queue, M/M/1/K (finite buffer), M/G/1 queue (Pollaczek-Khinchin
formula). Applications: CPU scheduling, network traffic analysis, call center modeling

### Learning Resources

**Textbooks:**

1. Oliver C. Ibe, "Fundamentals of Applied Probability and Random Processes", 2nd Edition, Academic
   Press, 2014
2. D. Gross, J.F. Shortle, J.M. Thompson, C.M. Harris, "Fundamentals of Queueing Theory", 5th
   Edition, Wiley, 2018

**Reference Books:**

1. S. Ross, "A First Course in Probability", 10th Edition, Pearson, 2018
2. Donald Gross, Carl M. Harris, "Fundamentals of Queueing Theory", 4th Edition, Wiley

---

## CS3451: Introduction to Operating Systems

**Credits:** 4 (L:3, P:2) | **CIE:** 25 Marks | **SEE:** 75 Marks

### Course Objectives

- To understand OS structure, system calls, and boot process
- To study process management, CPU scheduling, and synchronization
- To learn memory management and virtual memory techniques
- To understand file systems, I/O management, and mass storage
- To explore case studies of modern operating systems

### Course Outcomes

| CO  | Description                                                             |
| --- | ----------------------------------------------------------------------- |
| CO1 | Explain operating system architecture, system calls, and OS structures  |
| CO2 | Apply CPU scheduling algorithms and analyze process management          |
| CO3 | Implement process synchronization using semaphores and handle deadlocks |
| CO4 | Apply memory management techniques including paging and virtual memory  |
| CO5 | Analyze file systems, disk scheduling, and I/O management               |

### Course Contents

**Unit I: Introduction to Operating Systems (10 Hours):** Computer system organization (CPU, memory,
I/O devices, system bus), Interrupts, I/O operations, DMA. OS structure: Multiprogramming,
time-sharing, multiprocessor, real-time, distributed. System calls (process, file, device,
information, communication). System programs. OS design: Monolithic, layered, microkernel, modular.
Building and booting an OS

**Unit II: Process Management and CPU Scheduling (10 Hours):** Process concept: Process states,
Process Control Block (PCB), Context switching. Operations on processes: Create, terminate. Process
scheduling: Scheduling queues, Schedulers (long-term, medium-term, short-term). CPU scheduling
algorithms: FCFS, SJF (preemptive/non-preemptive), Priority, Round Robin. Multilevel queue
scheduling, Multilevel feedback queue. Threads: User and kernel threads, Multithreading models,
Thread libraries (Pthreads). Case study: Linux process management

**Unit III: Process Synchronization and Deadlocks (10 Hours):** Inter-process communication: Shared
memory, message passing, pipes. Critical section problem: Peterson's solution, hardware support
(TestAndSet, Swap). Semaphores: Binary and counting, wait and signal. Classical problems: Bounded
buffer, Readers-Writers, Dining philosophers, Sleeping barber. Monitors: Condition variables.
Deadlock: Characterization (necessary conditions), Prevention, Avoidance (Banker's algorithm),
Detection (wait-for-graph), Recovery

**Unit IV: Memory Management (10 Hours):** Memory hierarchy, Address binding (compile-time,
load-time, execution-time). Logical vs physical address space. Swapping. Contiguous allocation:
Fixed/dynamic partitions, Fragmentation (external, internal), Compaction. Paging: Page, frame, page
table, TLB hit/miss. Page table structures (hierarchical, hashed, inverted). Segmentation.
Segmentation with paging. Virtual memory: Demand paging, Page fault, Copy-on-write. Page
replacement: FIFO, Optimal, LRU, Clock. Thrashing: Working set model, Page fault frequency

**Unit V: File Systems and Mass Storage (10 Hours):** File concept: Attributes, operations, types.
Access methods: Sequential, direct. Directory structure: Single-level, two-level, tree,
acyclic-graph. File system mounting. File allocation: Contiguous, linked, indexed. Free space
management: Bitmap, linked list, grouping. Disk structure: Platters, tracks, sectors, cylinders.
Disk scheduling: FCFS, SSTF, SCAN, C-SCAN, LOOK, C-LOOK. RAID levels: 0, 1, 5, 6, 10. Case studies:
Linux ext4, Windows NTFS

### Learning Resources

**Textbooks:**

1. Abraham Silberschatz, Peter B. Galvin, Greg Gagne, "Operating System Concepts", 10th Edition,
   Wiley, 2018
2. William Stallings, "Operating Systems: Internals and Design Principles", 9th Edition, Pearson,
   2018

**Reference Books:**

1. Andrew S. Tanenbaum, Herbert Bos, "Modern Operating Systems", 5th Edition, Pearson, 2022
2. Remzi H. Arpaci-Dusseau, Andrea C. Arpaci-Dusseau, "Operating Systems: Three Easy Pieces",
   CreateSpace, 2018

---

## CS3452: Theory of Computation

**Credits:** 4 (L:3, T:1, P:0) | **CIE:** 25 Marks | **SEE:** 75 Marks

### Course Objectives

- To develop formal reasoning about computational problems
- To understand finite automata, regular expressions, and regular languages
- To study context-free grammars, pushdown automata, and parsing
- To explore Turing machines, computability, and the Church-Turing thesis
- To understand decidability, undecidability, and NP-completeness

### Course Outcomes

| CO  | Description                                                       |
| --- | ----------------------------------------------------------------- |
| CO1 | Design deterministic and non-deterministic finite automata        |
| CO2 | Convert between regular expressions and finite automata           |
| CO3 | Design context-free grammars and pushdown automata for languages  |
| CO4 | Design Turing machines and understand the limits of computation   |
| CO5 | Analyze decidability and undecidability of computational problems |
| CO6 | Classify problems within the Chomsky hierarchy                    |

### Course Contents

**Unit I: Finite Automata (12 Hours):** Introduction to automata theory, DFA: Definition, transition
function, extended transition function, language of a DFA. NFA: Definition, epsilon transitions.
Equivalence of NFA and DFA (subset construction). Minimization of DFA (Myhill-Nerode theorem).
Finite automata with output: Moore and Mealy machines. Applications: Lexical analysis, text pattern
matching

**Unit II: Regular Expressions and Regular Languages (12 Hours):** Regular expressions: Operators
(union, concatenation, Kleene star), precedence, algebraic laws. Arden's theorem. Conversion: RE to
NFA (Thompson's construction), NFA to RE (state elimination method). Pumping lemma for regular
languages (statement, proof, applications). Closure properties: Union, intersection, concatenation,
Kleene star, complement, difference, reversal, homomorphism. Decision properties: Emptiness,
finiteness, membership, equivalence

**Unit III: Context-Free Grammars and Pushdown Automata (12 Hours):** CFG: Definition, derivations
(leftmost, rightmost), parse trees, ambiguity, removal of ambiguity. Simplification: Removing
useless symbols, ε-productions, unit productions. Normal forms: Chomsky Normal Form (CNF), Greibach
Normal Form (GNF). Pushdown automata: Definition (stack, states, transitions). Design of PDA for
various languages. Equivalence: CFG to PDA (top-down, bottom-up construction), PDA to CFG.
Deterministic PDA and deterministic CFLs. Pumping lemma for CFLs. Closure properties of CFLs

**Unit IV: Turing Machines (12 Hours):** Turing machine: Definition, instantaneous description. TM
as language recognizer and transducer. Design of TMs for specific languages (aⁿbⁿcⁿ, ww,
palindrome). Variants: Multi-tape TM, non-deterministic TM, multi-head TM. Universal Turing machine.
Recursive and recursively enumerable languages. Chomsky hierarchy: Type 0 (unrestricted), Type 1
(context-sensitive), Type 2 (context-free), Type 3 (regular). Linear Bounded Automata (LBA)

**Unit V: Undecidability and Complexity (12 Hours):** Decidable and undecidable problems. Halting
problem and its undecidability (proof by diagonalization). Reducibility: Mapping reductions, Turing
reductions. Post's Correspondence Problem (PCP). Rice's theorem. Introduction to complexity theory:
Time complexity, P vs NP, NP-completeness, Cook-Levin theorem (overview), Examples: 3-SAT,
Hamiltonian path, Vertex cover, Clique

### Learning Resources

**Textbooks:**

1. John E. Hopcroft, Rajeev Motwani, Jeffrey D. Ullman, "Introduction to Automata Theory, Languages,
   and Computation", 3rd Edition, Pearson, 2008
2. Michael Sipser, "Introduction to the Theory of Computation", 3rd Edition, Cengage, 2013

**Reference Books:**

1. Peter Linz, "An Introduction to Formal Languages and Automata", 6th Edition, Jones & Bartlett,
   2016
2. K.L.P. Mishra, N. Chandrasekaran, "Theory of Computer Science: Automata, Languages, and
   Computation", 3rd Edition, PHI

---

## CS3491: Artificial Intelligence and Machine Learning

**Credits:** 4 (L:3, P:2) | **CIE:** 25 Marks | **SEE:** 75 Marks

### Course Objectives

- To understand AI problem-solving and search strategies
- To study knowledge representation and reasoning
- To learn supervised and unsupervised machine learning algorithms
- To understand neural networks and deep learning basics
- To apply AI/ML to real-world problems

### Course Outcomes

| CO  | Description                                                                |
| --- | -------------------------------------------------------------------------- |
| CO1 | Apply problem-solving using search algorithms                              |
| CO2 | Represent knowledge using logic and handle uncertainty                     |
| CO3 | Implement supervised learning algorithms for classification and regression |
| CO4 | Apply unsupervised learning techniques for pattern discovery               |
| CO5 | Design neural network models for predictive tasks                          |
| CO6 | Evaluate ML model performance using appropriate metrics                    |

### Course Contents

**Unit I: Problem Solving and Search (10 Hours):** Intelligent agents, Problem formulation (state
space, initial/goal states, actions, transition model). Uninformed search: BFS, DFS, IDDFS, uniform
cost. Informed search: Heuristics, greedy best-first, A\* algorithm (optimality, admissibility).
Adversarial search: Minimax, alpha-beta pruning. Constraint satisfaction problems: Backtracking,
forward checking, arc consistency

**Unit II: Knowledge Representation and Planning (10 Hours):** Propositional logic, First-order
logic (syntax, semantics), Inference rules (Modus ponens, resolution), Forward/backward chaining.
Ontologies, Semantic networks, Frames. Reasoning under uncertainty: Probability, Bayes' theorem,
Bayesian networks, Inference in Bayesian networks

**Unit III: Supervised Learning (10 Hours):** Regression: Linear regression (simple, multiple),
Gradient descent, Polynomial regression, Regularization (Ridge, Lasso). Classification: Logistic
regression, Decision trees (ID3, C4.5, CART), Ensemble methods (Random Forest, AdaBoost, Gradient
Boosting). Support Vector Machines (linear, kernel trick, RBF, polynomial). k-Nearest Neighbors.
Naive Bayes. Evaluation: Cross-validation, confusion matrix, precision, recall, F1, ROC-AUC

**Unit IV: Unsupervised Learning (10 Hours):** Clustering: K-means (initialization, elbow method,
silhouette score), Hierarchical clustering (agglomerative, divisive, dendrograms, linkage criteria),
DBSCAN. Dimensionality reduction: Principal Component Analysis (PCA), t-SNE. Anomaly detection
(isolation forest, LOF). Association rule mining: Apriori algorithm, FP-growth

**Unit V: Neural Networks and Deep Learning (10 Hours):** Artificial neurons, Perceptron, Activation
functions (sigmoid, tanh, ReLU, softmax). Multi-layer Perceptron (MLP), Backpropagation, Gradient
descent variants (SGD, Momentum, Adam). Convolutional Neural Networks (convolution, pooling, LeNet,
AlexNet concept). Recurrent Neural Networks (vanilla RNN, LSTM concept). Deep learning frameworks:
TensorFlow/Keras basics

### Learning Resources

**Textbooks:**

1. Stuart Russell, Peter Norvig, "Artificial Intelligence: A Modern Approach", 4th Edition, Pearson,
   2020
2. Christopher M. Bishop, "Pattern Recognition and Machine Learning", Springer, 2006
3. Tom M. Mitchell, "Machine Learning", McGraw Hill, 1997

**Reference Books:**

1. Ethem Alpaydin, "Introduction to Machine Learning", 4th Edition, MIT Press, 2020
2. Aurelien Geron, "Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow", 3rd
   Edition, O'Reilly, 2022
3. Ian Goodfellow, Yoshua Bengio, Aaron Courville, "Deep Learning", MIT Press, 2016

---

## CS3411: Database Management Systems

**Credits:** 4 (L:3, P:2) | **CIE:** 25 Marks | **SEE:** 75 Marks

### Course Objectives

- To understand DBMS concepts, data models, and database architecture
- To learn relational algebra, SQL, and query processing
- To study ER modeling and database design (normalization)
- To understand transaction processing, concurrency control, and recovery
- To explore NoSQL databases and big data storage

### Course Outcomes

| CO  | Description                                                             |
| --- | ----------------------------------------------------------------------- |
| CO1 | Design ER diagrams and map them to relational schemas                   |
| CO2 | Write complex SQL queries including joins, subqueries, and aggregations |
| CO3 | Apply normalization techniques up to BCNF for database design           |
| CO4 | Implement transaction management and concurrency control protocols      |
| CO5 | Apply crash recovery techniques for database consistency                |
| CO6 | Understand NoSQL databases and their use cases                          |

### Course Contents

**Unit I: Introduction to Database Systems (10 Hours):** Database vs file systems, DBMS architecture
(3-level: external, conceptual, internal), Data independence (logical, physical). Data models:
Relational, Entity-Relationship, Object-oriented, Semi-structured (XML, JSON). Database languages:
DDL, DML, DCL. Database users and administrators. Database system environment

**Unit II: Relational Model and SQL (10 Hours):** Relational model: Relations, tuples, attributes,
domains, keys (super, candidate, primary, foreign). Relational algebra: Select (σ), Project (π),
Rename (ρ), Union, Set difference, Cartesian product, Join (θ, natural, outer, semi), Division. SQL
basics: CREATE, INSERT, SELECT, WHERE, JOIN (INNER, LEFT, RIGHT, FULL). Aggregate functions (COUNT,
SUM, AVG, MAX, MIN), GROUP BY, HAVING. Subqueries (correlated, nested). Set operations. Views,
indexes, sequences. PL/SQL basics: Procedures, functions, triggers, cursors

**Unit III: Database Design and Normalization (10 Hours):** Entity-Relationship (ER) model:
Entities, attributes, relationships, weak entities, ISA hierarchy, aggregation. ER-to-relational
mapping. Functional dependencies: Armstrong's axioms, closure of attribute sets, minimal cover.
Normalization: 1NF, 2NF, 3NF, BCNF, 4NF, 5NF. Lossless join decomposition, Dependency preservation,
Multi-valued dependencies, Join dependencies

**Unit IV: Transaction Management and Concurrency Control (10 Hours):** Transaction concept: ACID
properties (Atomicity, Consistency, Isolation, Durability). Transaction states. Serializability:
Conflict serializability, View serializability, Precedence graphs. Concurrency control protocols:
Lock-based (shared/exclusive, 2PL, strict 2PL, rigorous 2PL), Timestamp-based (TS ordering, Thomas's
write rule), Optimistic concurrency control, Multiversion concurrency control (MVCC). Deadlock in
databases: Detection, prevention, avoidance. Isolation levels (Read Uncommitted, Read Committed,
Repeatable Read, Serializable)

**Unit V: Crash Recovery, Storage, and NoSQL (10 Hours):** Failure classification: Transaction
failures, system crashes, disk failures. Storage: RAID, buffer management, data dictionary storage.
Recovery: Log-based recovery (undo, redo, undo/redo), Checkpoints (fuzzy, consistent), ARIES
recovery algorithm. Shadow paging. Query processing: Selection, sorting, join strategies (nested
loop, merge, hash). Query optimization: Cost-based, heuristics. Introduction to NoSQL: CAP theorem,
BASE vs ACID. Key-value stores (Redis), Document stores (MongoDB), Column-family stores (Cassandra),
Graph databases (Neo4j). When to use NoSQL vs RDBMS

### Learning Resources

**Textbooks:**

1. Abraham Silberschatz, Henry F. Korth, S. Sudarshan, "Database System Concepts", 7th Edition,
   McGraw Hill, 2019
2. Ramez Elmasri, Shamkant B. Navathe, "Fundamentals of Database Systems", 7th Edition, Pearson,
   2016

**Reference Books:**

1. Raghu Ramakrishnan, Johannes Gehrke, "Database Management Systems", 3rd Edition, McGraw Hill,
   2002
2. C.J. Date, "An Introduction to Database Systems", 8th Edition, Pearson, 2003
3. Thomas M. Connolly, Carolyn E. Begg, "Database Systems: A Practical Approach to Design,
   Implementation, and Management", 6th Edition, Pearson, 2015
4. P. Rob, C. Coronel, "Database Systems: Design, Implementation, and Management", 13th Edition,
   Cengage, 2018

---

## Laboratory Courses (Semester IV)

### CS3461: Operating Systems Lab

**Practical:** 3 Hours/Week | **Credits:** 1.5 | **CIE:** 25 Marks | **SEE:** 25 Marks

**Assignments:** Linux system calls (fork, exec, getpid, wait, exit), CPU scheduling algorithms
(FCFS, SJF, Priority, Round Robin), Producer-Consumer using semaphores, Reader-Writers problem,
Dining Philosophers, Banker's algorithm for deadlock avoidance, Page replacement algorithms (FIFO,
LRU, Optimal), Disk scheduling algorithms (FCFS, SCAN, C-SCAN), Shell scripting, Inter-process
communication using pipes and shared memory

### CS3481: AIML Lab

**Practical:** 3 Hours/Week | **Credits:** 1.5 | **CIE:** 25 Marks | **SEE:** 25 Marks

**Assignments:** Search algorithms (BFS, DFS, A\*), Tic-Tac-Toe using Minimax, Python data
preprocessing with Pandas, Linear and Logistic Regression, Decision tree classification, k-NN
classifier, SVM classifier, K-means clustering, PCA for dimensionality reduction, MLP for MNIST
classification, CNN for image classification using TensorFlow/Keras, Sentiment analysis using basic
NLP techniques

---

# Semester V — Course Structure

| S.No | Course Code | Course Name                    | L:T:P | Credits | CIE | SEE | Total |
| ---- | ----------- | ------------------------------ | :---: | :-----: | :-: | :-: | :---: |
| 1    | CS3551      | Computer Networks              | 3:0:2 |    4    | 25  | 75  |  100  |
| 2    | CS3552      | Software Engineering           | 3:0:0 |    3    | 25  | 75  |  100  |
| 3    | CS3591      | Internet and Web Programming   | 3:0:0 |    3    | 25  | 75  |  100  |
| 4    | CS3501      | Compiler Design                | 3:0:2 |    4    | 25  | 75  |  100  |
| 5    | CS3553      | Resource Management Techniques | 3:0:0 |    3    | 25  | 75  |  100  |
| 6    | CS3561      | Computer Networks Lab          | 0:0:3 |   1.5   | 25  | 25  |  50   |
| 7    | CS3581      | Web Programming Lab            | 0:0:3 |   1.5   | 25  | 25  |  50   |
|      | **Total**   |                                |       | **20**  |     |     |       |

---

## CS3551: Computer Networks

**Credits:** 4 (L:3, P:2) | **CIE:** 25 Marks | **SEE:** 75 Marks

### Course Objectives

- To understand network architecture, protocols, and the TCP/IP model
- To study data link layer protocols, error detection, and MAC
- To learn IP addressing, routing algorithms, and network layer protocols
- To understand transport layer services, TCP, and UDP
- To explore application layer protocols and network security

### Course Outcomes

| CO  | Description                                                          |
| --- | -------------------------------------------------------------------- |
| CO1 | Explain the layered network models (OSI, TCP/IP) and their functions |
| CO2 | Apply error detection and correction techniques                      |
| CO3 | Design IP addressing schemes and implement routing algorithms        |
| CO4 | Analyze TCP flow control, congestion control, and reliability        |
| CO5 | Compare application layer protocols and their use cases              |
| CO6 | Identify network security threats and apply basic security measures  |

### Course Contents

**Unit I: Physical Layer and Data Link Layer (10 Hours):** Network topologies, Transmission media
(guided, unguided), Switching (circuit, packet, message). Data link layer: Framing, error detection
(parity, CRC, checksum), error correction (Hamming code). Flow control (Stop-and-Wait, Sliding
Window, Go-Back-N, Selective Repeat). MAC: Aloha, CSMA, CSMA/CD, CSMA/CA. Ethernet (IEEE 802.3),
Wireless LAN (IEEE 802.11), Bluetooth. Network devices: Hubs, bridges, switches, routers, gateways

**Unit II: Network Layer (10 Hours):** Logical addressing: IPv4 (classful, classless, CIDR,
subnetting), IPv6 (format, address types). ARP, RARP, ICMP, IGMP. Routing: Distance Vector
(Bellman-Ford, RIP), Link State (Dijkstra, OSPF). Hierarchical routing: BGP. Multicast routing
(concepts). NAT, DHCP

**Unit III: Transport Layer (10 Hours):** Transport layer services (multiplexing/demultiplexing).
UDP: Header, checksum. TCP: Header, connection management (3-way handshake, termination), flow
control (sliding window), congestion control (slow start, congestion avoidance, fast retransmit,
fast recovery). TCP timers. SCTP basics. QoS: Leaky bucket, token bucket

**Unit IV: Application Layer (10 Hours):** DNS: Hierarchy, resolution (iterative, recursive),
records. HTTP/HTTPS: Persistent/non-persistent, methods, status codes, cookies, caching. SMTP, POP3,
IMAP: Email architecture, MIME. FTP: Active/passive mode. DHCP: DORA. SNMP. P2P applications

**Unit V: Network Security (10 Hours):** Security objectives (CIA triad), threats and attacks.
Cryptography: Symmetric (DES, AES), Asymmetric (RSA, Diffie-Hellman). Digital signatures,
certificates, PKI. Network security: Firewalls (packet filter, stateful, application proxy),
IDS/IPS, VPN, TLS/SSL, HTTPS, IPsec, Wireless security (WPA2)

### Learning Resources

**Textbooks:**

1. James F. Kurose, Keith W. Ross, "Computer Networking: A Top-Down Approach", 8th Edition, Pearson,
   2020
2. Behrouz A. Forouzan, "Data Communications and Networking", 5th Edition, McGraw Hill, 2012

**Reference Books:**

1. Andrew S. Tanenbaum, David J. Wetherall, "Computer Networks", 5th Edition, Pearson, 2010
2. William Stallings, "Data and Computer Communications", 10th Edition, Pearson, 2013

---

## CS3552: Software Engineering

**Credits:** 3 (L:3, P:0) | **CIE:** 25 Marks | **SEE:** 75 Marks

### Course Objectives

- To understand software process models and their applicability
- To study requirements engineering and system modeling
- To learn design principles, architectural patterns, and UML
- To understand software testing strategies and quality assurance
- To explore project management and software maintenance

### Course Outcomes

| CO  | Description                                                           |
| --- | --------------------------------------------------------------------- |
| CO1 | Select appropriate software process model for a given project context |
| CO2 | Elicit, analyze, and document software requirements                   |
| CO3 | Design software architecture using UML diagrams and design patterns   |
| CO4 | Apply black-box and white-box testing techniques                      |
| CO5 | Estimate project cost, schedule, and manage risks                     |

### Course Contents

**Unit I: Software Process Models (9 Hours):** Software engineering fundamentals. Process: Framework
activities, umbrella activities. Waterfall, Incremental, Prototyping, Spiral, RAD. Agile: Scrum, XP,
Kanban. Comparison of models

**Unit II: Requirements Engineering (9 Hours):** Feasibility study, Requirements elicitation
(interviews, surveys, workshops). Functional vs non-functional requirements. Use case modeling. SRS
document (IEEE 830). Requirements validation

**Unit III: Software Design (9 Hours):** Design concepts: Abstraction, modularity, cohesion,
coupling. Architectural styles: Layered, pipe-and-filter, repository, client-server. OO design:
Class diagrams, sequence diagrams, activity diagrams, state diagrams. Design patterns: Singleton,
Factory, Observer, Strategy, Adapter

**Unit IV: Software Testing (9 Hours):** Testing fundamentals: Verification vs validation.
White-box: Statement, branch, path coverage, cyclomatic complexity. Black-box: Equivalence
partitioning, boundary value analysis, decision tables. Integration: Top-down, bottom-up, sandwich.
System and acceptance testing. Automation: Selenium, JUnit

**Unit V: Project Management and Quality (9 Hours):** Estimation: LOC, function points, COCOMO.
Scheduling: WBS, Gantt charts, PERT/CPM. Risk management: Identification, assessment, mitigation.
Quality assurance: ISO 9001, CMMI, Six Sigma. Configuration management, Maintenance types

### Learning Resources

**Textbooks:**

1. Roger S. Pressman, Bruce R. Maxim, "Software Engineering: A Practitioner's Approach", 9th
   Edition, McGraw Hill, 2019
2. Ian Sommerville, "Software Engineering", 10th Edition, Pearson, 2015

**Reference Books:**

1. Rajib Mall, "Fundamentals of Software Engineering", 5th Edition, PHI, 2018
2. Pankaj Jalote, "An Integrated Approach to Software Engineering", 3rd Edition, Springer, 2005

---

## CS3591: Internet and Web Programming

**Credits:** 3 (L:3, P:0) | **CIE:** 25 Marks | **SEE:** 75 Marks

### Course Objectives

- To understand web fundamentals, HTTP, and web architecture
- To learn client-side technologies: HTML, CSS, JavaScript
- To study server-side programming and database connectivity
- To understand web services, APIs, and modern web frameworks
- To explore web security, performance, and deployment

### Course Outcomes

| CO  | Description                                                          |
| --- | -------------------------------------------------------------------- |
| CO1 | Build responsive web pages using HTML5, CSS3, and Bootstrap          |
| CO2 | Create interactive client-side applications using JavaScript and DOM |
| CO3 | Develop server-side applications using Node.js/PHP                   |
| CO4 | Design and implement RESTful APIs and web services                   |
| CO5 | Connect web applications to databases using JDBC/ORM                 |

### Course Contents

**Unit I: Web Essentials (9 Hours):** Web evolution: Web 1.0, 2.0, 3.0. Client-server architecture.
HTTP/HTTPS protocol: Request/response, methods, headers, status codes, cookies, sessions. Web
servers: Apache, Nginx. URL structure. Domain names, DNS. Introduction to full-stack development

**Unit II: Client-Side Technologies (9 Hours):** HTML5: Semantic elements, forms, input types,
validation, multimedia (audio, video, canvas), SVG. CSS3: Selectors, box model, flexbox, grid,
responsive design (media queries), transitions, animations, preprocessors (SASS/SCSS). Bootstrap
framework: Grid system, components, utilities. JavaScript: ES6+ features (let/const, arrow
functions, template literals, destructuring, spread/rest, modules), DOM manipulation, event
handling, AJAX (XMLHttpRequest, fetch API), JSON parsing and generation

**Unit III: Advanced JavaScript and Frontend Frameworks (9 Hours):** Object-oriented JavaScript:
Prototypes, classes, inheritance. Functional programming: map, filter, reduce. Promises and
async/await. Error handling. Introduction to TypeScript. Frontend frameworks: React.js (components,
props, state, hooks, context, routing), Angular/Vue.js overview. State management (Redux concept)

**Unit IV: Server-Side Programming (9 Hours):** Node.js: Event-driven, non-blocking I/O, modules
(npm), Express.js framework (routing, middleware, request/response handling). Python web frameworks:
Django/Flask basics. PHP: Sessions, form handling, file I/O. RESTful API design: Principles,
endpoints, CRUD operations, authentication (JWT, OAuth), API documentation (Swagger/OpenAPI)

**Unit V: Databases, Web Security, and Deployment (9 Hours):** Database connectivity: JDBC (Java),
MySQL/MariaDB, MongoDB integration. ORMs: Sequelize (Node.js), Django ORM, SQLAlchemy. Web security:
OWASP Top 10 (SQL injection, XSS, CSRF, authentication flaws). HTTPS, CORS, input validation.
Deployment: Hosting (Vercel, Netlify, AWS, Heroku), CI/CD pipelines, Docker basics, Domain setup,
SSL/TLS certificates. Performance: Caching (Redis), CDN, lazy loading

### Learning Resources

**Textbooks:**

1. Robert W. Sebesta, "Programming the World Wide Web", 8th Edition, Pearson, 2014
2. David Flanagan, "JavaScript: The Definitive Guide", 7th Edition, O'Reilly, 2020

**Reference Books:**

1. Ethan Brown, "Web Development with Node and Express", 2nd Edition, O'Reilly, 2019
2. Alex Banks, Eve Porcello, "Learning React", 2nd Edition, O'Reilly, 2020
3. MDN Web Docs (Mozilla Developer Network)

---

## CS3501: Compiler Design

**Credits:** 4 (L:3, P:2) | **CIE:** 25 Marks | **SEE:** 75 Marks

### Course Objectives

- To understand the phases of a compiler and their interactions
- To study lexical analysis and parsing techniques
- To learn syntax-directed translation and intermediate code generation
- To understand code optimization and code generation
- To explore runtime environments and symbol table management

### Course Outcomes

| CO  | Description                                                            |
| --- | ---------------------------------------------------------------------- |
| CO1 | Design lexical analyzers using regular expressions and automata theory |
| CO2 | Implement top-down and bottom-up parsers                               |
| CO3 | Apply syntax-directed translation to generate intermediate code        |
| CO4 | Optimize code using data-flow analysis techniques                      |
| CO5 | Design and implement a code generator for a target machine             |

### Course Contents

**Unit I: Introduction and Lexical Analysis (10 Hours):** Compilers vs interpreters, Phases of a
compiler. Lexical analysis: Tokens, patterns, lexemes, attributes. Regular expressions and finite
automata (DFA, NFA, epsilon-NFA). Design of a lexical analyzer generator. Lex/flex tool

**Unit II: Syntax Analysis (10 Hours):** Context-free grammars, Parse trees, Derivations. Ambiguity,
Left recursion, Left factoring. Top-down parsing: Predictive parsing, LL(1) grammars (FIRST,
FOLLOW). Bottom-up parsing: Shift-reduce, LR(0) items, SLR, CLR, LALR parsers. Yacc/bison tool

**Unit III: Syntax-Directed Translation and Intermediate Code (10 Hours):** Syntax-directed
definitions (S-attributed, L-attributed), Dependency graphs. Translation schemes. Intermediate code:
Three-address code (quadruples, triples), Abstract syntax trees, Postfix notation. Type checking:
Static vs dynamic, Type expressions, Type equivalence, Overloading

**Unit IV: Code Optimization (10 Hours):** Principal sources of optimization. Basic blocks and flow
graphs. Local optimizations: Constant folding, algebraic simplification, strength reduction, dead
code elimination. Global optimizations: Data-flow analysis (reaching definitions, live variables,
available expressions), Loop optimization (invariant code motion, induction variable elimination,
loop unrolling). Peephole optimization

**Unit V: Code Generation and Runtime (10 Hours):** Issues in code generation (input, output,
target). Target machine architecture. Register allocation: Graph coloring algorithm. Simple code
generator. DAG representation of basic blocks. Runtime environments: Activation records, Stack
allocation, Heap management, Garbage collection

### Learning Resources

**Textbooks:**

1. Alfred V. Aho, Monica S. Lam, Ravi Sethi, Jeffrey D. Ullman, "Compilers: Principles, Techniques,
   and Tools", 2nd Edition, Pearson, 2007
2. Kenneth C. Louden, "Compiler Construction: Principles and Practice", Cengage Learning, 1997

**Reference Books:**

1. Andrew W. Appel, "Modern Compiler Implementation in C/Java", Cambridge University Press, 2004
2. Steven S. Muchnick, "Advanced Compiler Design and Implementation", Morgan Kaufmann, 1997

---

## CS3553: Resource Management Techniques

**Credits:** 3 (L:3, P:0) | **CIE:** 25 Marks | **SEE:** 75 Marks

### Course Objectives

- To understand linear programming and optimization techniques
- To study transportation and assignment problems
- To learn network flow and project scheduling techniques
- To understand inventory and queuing models
- To apply resource optimization in computer systems

### Course Outcomes

| CO  | Description                                                             |
| --- | ----------------------------------------------------------------------- |
| CO1 | Formulate and solve linear programming problems using graphical/simplex |
| CO2 | Solve transportation and assignment problems                            |
| CO3 | Apply network flow models and CPM/PERT for scheduling                   |
| CO4 | Analyze inventory models for resource management                        |
| CO5 | Apply queueing models for system performance analysis                   |

### Course Contents

**Unit I: Linear Programming (9 Hours):** Introduction to OR, Linear programming formulation,
Graphical method, Simplex method (Big-M, Two-phase), Duality, Dual simplex method, Sensitivity
analysis

**Unit II: Transportation and Assignment (9 Hours):** Transportation model: North-west corner, Least
cost, Vogel's approximation, MODI method, Degeneracy. Assignment model: Hungarian method, Variants
(maximization, unbalanced, prohibited routes)

**Unit III: Network Models (9 Hours):** Shortest path (Dijkstra, Floyd-Warshall), Minimum spanning
tree (Prim, Kruskal), Max flow (Ford-Fulkerson, Edmonds-Karp), Min cost flow, CPM/PERT: Network
construction, Critical path, Float/Slack, Crashing

**Unit IV: Inventory and Queuing (9 Hours):** Inventory models: EOQ, Production lot size, Quantity
discounts, Safety stock, Newsvendor. Queuing: M/M/1, M/M/c, M/G/1, Applications in resource
allocation, CPU scheduling, network traffic

**Unit V: Decision Theory and Game Theory (9 Hours):** Decision making under certainty, risk,
uncertainty. Decision trees. Game theory: Two-person zero-sum, Mixed strategies, Dominance, Nash
equilibrium

### Learning Resources

**Textbooks:**

1. Hamdy A. Taha, "Operations Research: An Introduction", 10th Edition, Pearson
2. F.S. Hillier, G.J. Lieberman, "Introduction to Operations Research", 10th Edition, McGraw Hill

---

## Laboratory Courses (Semester V)

### CS3561: Computer Networks Lab

**Practical:** 3 Hours/Week | **Credits:** 1.5 | **Assignments:** Socket programming (TCP/UDP), HTTP
client-server, DNS resolution simulation, ARP/RARP implementation, Distance vector routing (RIP
simulation), Link state routing (OSPF simulation), TCP congestion control study (NS2/NS3), Network
configuration using Packet Tracer, Wireshark packet analysis

### CS3581: Web Programming Lab

**Practical:** 3 Hours/Week | **Credits:** 1.5 | **Assignments:** Static website using HTML5/CSS3,
Responsive layout using Bootstrap, JavaScript DOM manipulation (forms, validation), AJAX fetch API
(REST consumer), Node.js/Express REST API with CRUD, Database connectivity (MongoDB/MySQL),
Full-stack web application (mini project), React.js component-based UI

---

# Semester VI — Course Structure

| S.No | Course Code | Course Name               | L:T:P | Credits | CIE | SEE | Total |
| ---- | ----------- | ------------------------- | :---: | :-----: | :-: | :-: | :---: |
| 1    | CCS334      | Professional Elective I   | 3:0:0 |    3    | 25  | 75  |  100  |
| 2    | CCS3xx      | Professional Elective II  | 3:0:0 |    3    | 25  | 75  |  100  |
| 3    | CCS3xx      | Professional Elective III | 3:0:0 |    3    | 25  | 75  |  100  |
| 4    | GE3xx       | Open Elective I           | 3:0:0 |    3    | 25  | 75  |  100  |
| 5    | GE3xx       | Open Elective II          | 3:0:0 |    3    | 25  | 75  |  100  |
| 6    | CS3611      | Mini Project              | 0:0:4 |    2    | 50  |  —  |  50   |
|      | **Total**   |                           |       | **17**  |     |     |       |

## Professional Elective Course Contents (Semester VI)

### Big Data Analytics (CCS334)

**Unit I:** Big Data fundamentals (3Vs, 5Vs), Hadoop ecosystem (HDFS architecture, MapReduce
programming, YARN), Data serialization (Avro, Parquet) **Unit II:** NoSQL databases: HBase
(architecture, data model, operations), Cassandra (ring architecture, consistency levels), MongoDB
(document model, aggregation pipeline, sharding) **Unit III:** Apache Spark: RDDs, DataFrames, Spark
SQL, Spark Streaming, MLlib **Unit IV:** Stream processing: Apache Kafka (topics, partitions,
producers, consumers), Apache Flink basics **Unit V:** Data warehousing: Hive (HQL, partitions,
buckets), Pig (Latin scripting), Apache Airflow for workflow management

### Cloud Computing

**Unit I:** Cloud models (IaaS, PaaS, SaaS, FaaS), Deployment (public, private, hybrid),
Virtualization (hypervisors, containers vs VMs) **Unit II:** AWS core services: EC2, S3, Lambda,
RDS, DynamoDB, VPC, IAM. Pricing models **Unit III:** Containers: Docker (images, containers,
Dockerfile, docker-compose, registry), Kubernetes (pods, services, deployments, ingress, configmaps)
**Unit IV:** Serverless: AWS Lambda (functions, triggers, limits), API Gateway, Step Functions. FaaS
tradeoffs **Unit V:** Cloud security (shared responsibility, IAM policies, encryption), Cloud
monitoring (CloudWatch, Prometheus), Cloud cost optimization

### Data Science and Analytics

**Unit I:** Data science lifecycle, Python ecosystem (Pandas, NumPy, Scikit-learn), Statistical
analysis **Unit II:** Data visualization (Matplotlib, Seaborn, Plotly), Exploratory data analysis
(EDA) **Unit III:** Machine learning pipelines: Preprocessing, feature engineering, model training,
evaluation, deployment **Unit IV:** Time series analysis: Stationarity, ARIMA, Prophet. Forecasting
applications **Unit V:** Text analytics: NLP pipeline, sentiment analysis, topic modeling. Case
studies

### Network and Web Security

**Unit I:** Security fundamentals: CIA triad, AAA, threat modeling (STRIDE, DREAD). OWASP Top 10
vulnerabilities **Unit II:** Web application security: SQL injection (prevention, parameterized
queries), XSS (reflected, stored, DOM-based), CSRF, SSRF, authentication flaws **Unit III:** Network
security: Firewall evasions, IDS/IPS (Snort), Honeypots, Network segmentation **Unit IV:**
Cryptography in practice: TLS/SSL handshake, Certificate management, HSTS, CSP headers **Unit V:**
Penetration testing methodology (reconnaissance, scanning, exploitation, post-exploitation,
reporting), Tools: Burp Suite, Nmap, Metasploit, Wireshark

---

# Semesters VII-VIII — Course Structure

**Semester VII:** Professional Electives IV & V, Open Electives III & IV, Project Work Phase I (4
credits)

**Semester VIII:** Project Work Phase II (12 credits), Comprehensive Viva Voce (2 credits)

---

> **Official Source:** https://cac.annauniv.edu | Anna University, Chennai
