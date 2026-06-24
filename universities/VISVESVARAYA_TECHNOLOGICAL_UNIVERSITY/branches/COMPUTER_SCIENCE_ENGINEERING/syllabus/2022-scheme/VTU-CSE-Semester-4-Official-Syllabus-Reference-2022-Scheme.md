# VTU Fourth Semester Computer Science & Engineering — Official Syllabus Reference (2022 Scheme)

> Extracted from official VTU syllabus documents (effective from Academic Year 2023-24).
>
> This document provides exact module-wise syllabus, course outcomes, examination structure,
> laboratory work, practical guidelines and curriculum information for the Fourth Semester of B.E.
> in Computer Science and Engineering under the 2022 Scheme.
>
> Use this as the authoritative source for:
>
> - Exam preparation
> - PYQ analysis
> - Note generation
> - Unit planning
> - AI tutoring
> - Important topic extraction
> - Curriculum mapping
>
> No syllabus topic has been intentionally omitted or condensed.

---

# Semester IV — Course Structure

| Sl. | Course Code             | Course Title                        | L:T:P:S     | CIE     | SEE     | Total   | Credits |
| --- | ----------------------- | ----------------------------------- | ----------- | ------- | ------- | ------- | ------- |
| 1   | BCS401                  | Analysis & Design of Algorithms     | 3:0:0:0     | 50      | 50      | 100     | 3       |
| 2   | BCS402 (IPCC)           | Microcontrollers                    | 3:0:2:0     | 50      | 50      | 100     | 4       |
| 3   | BCS403 (IPCC)           | Database Management Systems         | 3:0:2:0     | 50      | 50      | 100     | 4       |
| 4   | BCSL404                 | Analysis & Design of Algorithms Lab | 0:0:2:0     | 50      | 50      | 100     | 1       |
| 5   | BCS405x                 | ESC/ETC/PLC                         | 2:2:0:0     | 50      | 50      | 100     | 3       |
| 6   | BCS456x                 | AEC/SEC - IV                        | 1:0:0/0:0:2 | 50      | 50      | 100     | 1       |
| 7   | BBOC407                 | Biology for Computer Engineers      | 2:0:0:0     | 50      | 50      | 100     | 2       |
| 8   | BUHK408                 | Universal Human Values Course       | 1:0:0:0     | 50      | 50      | 100     | 1       |
| 9   | BNSK459/BPEK459/BYOK459 | NSS/PE/Yoga                         | 0:0:2:0     | 100     | ---     | 100     | 0       |
|     | **Total**               |                                     |             | **500** | **400** | **900** | **19**  |

**ESC/ETC/PLC Options (BCS405x):**

- BCS405A: Discrete Mathematical Structures
- BCS405B: Graph Theory
- BCS405C: Optimization Technique
- BCS405D: Linear Algebra

**AEC/SEC Options (BCS456x):**

- BCS456A: Green IT and Sustainability
- BCS456B: Capacity Planning for IT
- BCS456C: UI/UX
- BCSL456D: Technical Writing using LaTeX

---

## BCS401: Analysis & Design of Algorithms

**Teaching Scheme:** Theory: 03 Hours/Week

**Credits:** 03

**Examination:** CIE: 50 Marks, SEE: 50 Marks, Total: 100 Marks

**Examination Nature:** Theory (03 Hours)

### Course Objectives

- To learn the methods for analyzing algorithms and evaluating their performance.
- To demonstrate the efficiency of algorithms using asymptotic notations.
- To solve problems using various algorithm design methods, including brute force, greedy, divide
  and conquer, decrease and conquer, transform and conquer, dynamic programming, backtracking, and
  branch and bound.
- To learn the concepts of P and NP complexity classes.

### Course Outcomes

| CO  | Description                                                                                                                               |
| --- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| CO1 | Apply asymptotic notational method to analyze the performance of the algorithms in terms of time complexity                               |
| CO2 | Demonstrate divide & conquer approaches and decrease & conquer approaches to solve computational problems                                 |
| CO3 | Make use of transform & conquer and dynamic programming design approaches to solve the given real world or complex computational problems |
| CO4 | Apply greedy and input enhancement methods to solve graph & string based computational problems                                           |
| CO5 | Analyse various classes (P, NP and NP Complete) of problems                                                                               |
| CO6 | Illustrate backtracking, branch & bound and approximation methods                                                                         |

### Course Contents

#### Module 1: Introduction and Brute Force Approaches (08 Hours)

**Introduction:**

- What is an Algorithm?
- Fundamentals of Algorithmic Problem Solving

**Fundamentals of the Analysis of Algorithm Efficiency:**

- Analysis Framework
- Asymptotic Notations and Basic Efficiency Classes
- Mathematical Analysis of Non-recursive Algorithms
- Mathematical Analysis of Recursive Algorithms

**Brute Force Approaches:**

- Selection Sort and Bubble Sort
- Sequential Search and Brute Force String Matching

**Textbook Reference:** Ch. 1 (Sections 1.1, 1.2), Ch. 2 (Sections 2.1, 2.2, 2.3, 2.4), Ch. 3
(Sections 3.1, 3.2)

#### Module 2: Brute Force, Decrease-and-Conquer, Divide-and-Conquer (08 Hours)

**Brute Force Approaches (continued):**

- Exhaustive Search (Travelling Salesman Problem and Knapsack Problem)

**Decrease-and-Conquer:**

- Insertion Sort
- Topological Sorting

**Divide and Conquer:**

- Merge Sort
- Quick Sort
- Binary Tree Traversals
- Multiplication of Large Integers and Strassen's Matrix Multiplication

**Textbook Reference:** Ch. 3 (Section 3.4), Ch. 4 (Sections 4.1, 4.2), Ch. 5 (Sections 5.1, 5.2,
5.3, 5.4)

#### Module 3: Transform-and-Conquer and Space-Time Tradeoffs (08 Hours)

**Transform-and-Conquer:**

- Balanced Search Trees
- Heaps and Heapsort

**Space-Time Tradeoffs:**

- Sorting by Counting: Comparison Counting Sort
- Input Enhancement in String Matching: Horspool's Algorithm

**Textbook Reference:** Ch. 6 (Sections 6.3, 6.4), Ch. 7 (Sections 7.1, 7.2)

#### Module 4: Dynamic Programming and Greedy Method (08 Hours)

**Dynamic Programming:**

- Three Basic Examples
- The Knapsack Problem and Memory Functions
- Warshall's and Floyd's Algorithms

**The Greedy Method:**

- Prim's Algorithm
- Kruskal's Algorithm
- Dijkstra's Algorithm
- Huffman Trees and Codes

**Textbook Reference:** Ch. 8 (Sections 8.1, 8.2, 8.4), Ch. 9 (Sections 9.1, 9.2, 9.3, 9.4)

#### Module 5: Limitations, Backtracking, Branch-and-Bound (08 Hours)

**Limitations of Algorithmic Power:**

- Decision Trees
- P, NP, and NP-Complete Problems

**Coping with Limitations of Algorithmic Power:**

- Backtracking (n-Queens Problem, Subset-Sum Problem)
- Branch-and-Bound (Knapsack Problem)
- Approximation Algorithms for NP-Hard Problems (Knapsack Problem)

**Textbook Reference:** Ch. 11 (Section 11.2, 11.3), Ch. 12 (Sections 12.1, 12.2, 12.3)

### Learning Resources

#### Textbooks

1. Anany Levitin, "Introduction to the Design and Analysis of Algorithms", 3rd Edition, Pearson
   Education, 2012
2. Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, and Clifford Stein, "Introduction to
   Algorithms", 3rd Edition, MIT Press, 2009

#### Reference Books

1. Alfred V. Aho, John E. Hopcroft, Jeffrey D. Ullman, "Data Structures and Algorithms", Pearson
   Education, 2003
2. Sara Baase and Allen Van Gelder, "Computer Algorithms: Introduction to Design and Analysis", 3rd
   Edition, Pearson Education, 2008
3. Donald E. Knuth, "The Art of Computer Programming", Volumes 1-4, Addison-Wesley

---

## BCS402: Microcontrollers (IPCC)

**Teaching Scheme:** Theory: 03 Hours/Week, Practical: 02 Hours/Week

**Credits:** 04 (Theory 3 + Practical 1)

**Examination:** CIE: 50 Marks, SEE: 50 Marks, Total: 100 Marks

**Examination Nature:** Theory/Practical (Integrated)

### Course Objectives

- To understand the difference between Microprocessor and Microcontroller and architectural details
  of ARM Microcontroller.
- To acquire in-depth knowledge about the instruction set of ARM Cortex M3/M4.
- To understand the importance of peripherals like GPIO, Timers, PWM, ADC, DAC and Interrupts.
- To design and develop real-time applications using ARM Microcontrollers.
- To expose students to I/O and communication protocols and develop applications using them.

### Course Outcomes

| CO  | Description                                                                    |
| --- | ------------------------------------------------------------------------------ |
| CO1 | Explain the architectural details of ARM Cortex M3/M4                          |
| CO2 | Write programs for ARM Cortex M3/M4 for various real-world applications        |
| CO3 | Understand and analyze the usage of GPIO, Timers, PWM, ADC, DAC and Interrupts |
| CO4 | Design and develop real-time applications using ARM Microcontrollers           |
| CO5 | Develop applications using communication protocols (UART, SPI, I2C)            |
| CO6 | Design and develop real-world embedded systems                                 |

### Course Contents

#### Module 1: ARM Cortex-M Architecture (08 Hours)

- Introduction to ARM Cortex-M3/M4
- RISC vs CISC architectures
- ARM Cortex-M3/M4 Core: Registers, Modes of Operation
- Memory System: Memory Map, Bit-Band Operations
- Stack Memory Operations
- Exception and Interrupts: Exception Types, Priority, Vector Table
- ARM Cortex-M4: DSP Extension and Floating Point Unit (FPU)
- Comparison with ARM7

**Textbook Reference:** Ch. 1, 2

#### Module 2: ARM Cortex-M Instruction Set (08 Hours)

- Introduction to ARM Cortex-M Assembly Language
- Data Types and Core Registers
- Memory Access Instructions: Load/Store, Multiple Load/Store
- Arithmetic and Logic Instructions
- Shift and Bit-Field Manipulation Instructions
- Branch and Control Flow Instructions
- Saturation Instructions
- Assembly vs C Programming for ARM

**Textbook Reference:** Ch. 3, 4

#### Module 3: GPIO, Timers and PWM (08 Hours)

**GPIO:**

- GPIO Registers, Configuration
- Input/Output Modes: Push-Pull, Open-Drain
- Alternate Functions
- Interfacing LEDs, Switches, and Seven-Segment Displays

**Timers:**

- SysTick Timer
- General Purpose Timers
- Timer Modes: One-Shot, Periodic
- Input Capture, Output Compare

**PWM:**

- PWM Generation
- Duty Cycle and Frequency Control
- Applications: Motor Control, LED Dimming

#### Module 4: ADC, DAC and Interrupts (08 Hours)

**ADC:**

- Successive Approximation ADC
- ADC Registers and Configuration
- Analog Sampling: Single, Continuous, Scan Mode
- Applications: Temperature Sensor, Potentiometer

**DAC:**

- DAC Architecture and Operation
- Waveform Generation

**Interrupts:**

- NVIC (Nested Vectored Interrupt Controller)
- Interrupt Priority and Pre-emption
- Enabling/Disabling Interrupts
- Interrupt Latency and Exception Model
- Writing Interrupt Service Routines (ISRs)

#### Module 5: Communication Protocols and Application Development (08 Hours)

**Communication Protocols:**

- UART: Frame Format, Baud Rate, Parity
- SPI: Master/Slave Configuration, Data Modes
- I2C: Multi-Master, Addressing, Clock Stretching
- CAN Protocol Basics

**Application Development:**

- Interfacing LCD Display
- Interfacing Keypad
- Sensor Interfacing: DHT11, Ultrasonic Sensor
- Motor Control: DC Motor, Servo Motor
- Low Power Modes: Sleep, Deep Sleep, Standby

### Learning Resources

#### Textbooks

1. Joseph Yiu, "The Definitive Guide to ARM Cortex-M3 and Cortex-M4 Processors", 3rd Edition,
   Newnes, 2014
2. Muhammad Ali Mazidi, "ARM Assembly Language Programming & Architecture", 2nd Edition, Mazidi &
   Naimi Publishers, 2016

#### Reference Books

1. Trevor Martin, "The Designer's Guide to the Cortex-M Processor Family", 2nd Edition, Newnes, 2013
2. Jonathan W. Valvano, "Embedded Systems: Real-Time Interfacing to ARM Cortex-M Microcontrollers",
   CreateSpace, 2015

### Practical Component (IPCC)

**Laboratory Experiments (8-10 lab slots):**

1. Blink an LED with different time intervals using GPIO
2. Interface a push button and toggle an LED using interrupt
3. Generate PWM signal and control brightness of an LED
4. Interface a potentiometer and read analog values using ADC
5. Display temperature sensor data on serial monitor using UART
6. Interface an LCD display (16×2) using I2C protocol
7. Interface a servo motor using PWM
8. Read data from DHT11 sensor and display on LCD
9. Implement SPI communication between two ARM microcontrollers
10. Mini-project: Real-time embedded system application

---

## BCS403: Database Management Systems (IPCC)

**Teaching Scheme:** Theory: 03 Hours/Week, Practical: 02 Hours/Week

**Credits:** 04 (Theory 3 + Practical 1)

**Examination:** CIE: 50 Marks, SEE: 50 Marks, Total: 100 Marks

**Examination Nature:** Theory/Practical (Integrated)

### Course Objectives

- To provide a basic understanding of database concepts, architecture and data models.
- To learn Entity-Relationship (ER) model and relational database design.
- To understand SQL and its constructs for database operations.
- To learn normalization techniques for database design.
- To understand transaction management, concurrency control, and recovery techniques.

### Course Outcomes

| CO  | Description                                                                       |
| --- | --------------------------------------------------------------------------------- |
| CO1 | Demonstrate the basic concepts of database systems and their architecture         |
| CO2 | Design Entity-Relationship (ER) diagrams and convert them into relational schemas |
| CO3 | Apply SQL queries for data definition, manipulation, and control                  |
| CO4 | Apply normalization techniques to design well-structured databases                |
| CO5 | Analyze transaction management, concurrency control, and recovery mechanisms      |

### Course Contents

#### Module 1: Introduction to Database Systems (08 Hours)

- Introduction: Database System Applications, Purpose of Database Systems
- View of Data, Database Languages
- Relational Databases
- Database Design
- Data Storage and Querying
- Transaction Management
- Database Architecture
- Database Users and Administrators
- History of Database Systems

**Textbook:** Ch. 1

#### Module 2: Entity-Relationship Model and Relational Model (08 Hours)

**Entity-Relationship Model:**

- Basic Concepts: Entity, Attributes, Relationships
- Entity Sets, Relationship Sets
- Attributes: Simple, Composite, Multi-valued, Derived
- Mapping Cardinalities
- Keys: Super Key, Candidate Key, Primary Key, Foreign Key
- ER Diagrams: Notations and Conventions
- Weak Entity Sets
- Extended E-R Features: Specialization, Generalization, Aggregation
- Reduction of ER Schema to Tables

**Relational Model:**

- Structure of Relational Databases
- Schema Diagrams
- Relational Query Languages
- Relational Operations

**Textbook:** Ch. 2, 6

#### Module 3: SQL and PL/SQL (08 Hours)

**SQL:**

- SQL Data Definition: CREATE, ALTER, DROP
- Basic Structure of SQL Queries: SELECT, FROM, WHERE
- Set Operations: UNION, INTERSECT, EXCEPT
- Aggregate Functions: COUNT, SUM, AVG, MIN, MAX
- GROUP BY and HAVING Clauses
- Nested Subqueries
- JOIN Operations: INNER, LEFT, RIGHT, FULL, NATURAL
- Views: Creation, Update, Materialized Views
- Data Control Language (DCL): GRANT, REVOKE

**PL/SQL:**

- PL/SQL Block Structure
- Variables and Constants
- Control Structures: IF, CASE, LOOP
- Cursors: Implicit and Explicit
- Procedures and Functions
- Packages
- Triggers: BEFORE, AFTER, INSTEAD OF

**Textbook:** Ch. 3, 4, 5

#### Module 4: Relational Database Design and Normalization (08 Hours)

- Features of Good Relational Design
- Atomic Domains and First Normal Form (1NF)
- Functional Dependencies: Inference Rules, Closure
- Lossless Decomposition
- Dependency Preservation
- Normal Forms: 2NF, 3NF, Boyce-Codd Normal Form (BCNF)
- Multivalued Dependencies and 4NF
- Join Dependencies and 5NF
- Database Design Process

**Textbook:** Ch. 7, 8

#### Module 5: Transaction Management, Concurrency Control and Recovery (08 Hours)

**Transaction Management:**

- Transaction Concept
- ACID Properties
- Transaction States
- Serializability: Conflict and View

**Concurrency Control:**

- Lock-Based Protocols
- Timestamp-Based Protocols
- Validation-Based Protocols
- Deadlock: Detection, Prevention, Recovery
- Multiple Granularity

**Recovery System:**

- Failure Classification
- Storage Structure
- Recovery Algorithms: Log-Based, Shadow Paging
- Buffer Management
- ARIES Recovery Algorithm

**Textbook:** Ch. 14, 15, 16, 17

### Learning Resources

#### Textbooks

1. Abraham Silberschatz, Henry F. Korth, S. Sudarshan, "Database System Concepts", 7th Edition,
   McGraw-Hill Education, 2019
2. Ramez Elmasri, Shamkant B. Navathe, "Fundamentals of Database Systems", 7th Edition, Pearson
   Education, 2016

#### Reference Books

1. Raghu Ramakrishnan, Johannes Gehrke, "Database Management Systems", 3rd Edition, McGraw-Hill,
   2014
2. C.J. Date, "An Introduction to Database Systems", 8th Edition, Pearson Education, 2003

### Practical Component (IPCC)

**Laboratory Experiments (8-10 lab slots):**

1. Design ER diagram for a given application and convert to relational schema
2. Create database tables with constraints (PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK)
3. Execute SQL queries using SELECT, WHERE, ORDER BY, GROUP BY, HAVING
4. Implement JOIN operations on multiple tables
5. Write nested queries and set operations (UNION, INTERSECT, EXCEPT)
6. Create and manipulate views
7. Implement PL/SQL procedures and functions
8. Create database triggers for data integrity
9. Implement cursor operations in PL/SQL
10. Mini-project: Design and develop a database application

---

## BCSL404: Analysis & Design of Algorithms Lab

**Teaching Scheme:** Practical: 02 Hours/Week

**Credits:** 01

**Examination:** CIE: 50 Marks, SEE: 50 Marks, Total: 100 Marks

**Examination Nature:** Practical (02 Hours)

### Course Objectives

- To implement various algorithms using different design strategies
- To analyze algorithm performance empirically
- To debug and optimize algorithm implementations

### Course Outcomes

| CO  | Description                                                                                                      |
| --- | ---------------------------------------------------------------------------------------------------------------- |
| CO1 | Implement algorithm design strategies including brute force, divide and conquer, greedy, and dynamic programming |
| CO2 | Analyze the time complexity of implemented algorithms                                                            |
| CO3 | Design algorithms for real-world computational problems                                                          |
| CO4 | Evaluate algorithm performance and select appropriate strategies                                                 |

### Laboratory Experiments

1. Implement Selection Sort and analyze its time complexity
2. Implement Bubble Sort and compare with Selection Sort
3. Implement Sequential Search and Binary Search
4. Implement Merge Sort using divide and conquer
5. Implement Quick Sort using divide and conquer
6. Compute Strassen's Matrix Multiplication
7. Implement Warshall's Algorithm for transitive closure
8. Implement Floyd's Algorithm for all-pairs shortest path
9. Implement 0/1 Knapsack using Dynamic Programming
10. Implement Prim's Algorithm for Minimum Spanning Tree
11. Implement Kruskal's Algorithm for Minimum Spanning Tree
12. Implement Dijkstra's Algorithm for single source shortest path
13. Implement Huffman Coding
14. Solve n-Queens problem using Backtracking
15. Mini-project: Algorithm application in real-world scenario

---

## BCS405A: Discrete Mathematical Structures (ESC/ETC/PLC)

**Teaching Scheme:** Theory: 02 Hours/Week, Tutorial: 02 Hours/Week

**Credits:** 03

**Examination:** CIE: 50 Marks, SEE: 50 Marks, Total: 100 Marks

### Course Objectives

- To introduce mathematical logic and proof techniques
- To understand set theory, relations, and functions
- To study counting principles and combinatorics
- To explore algebraic structures
- To apply discrete mathematics in computer science

### Course Outcomes

| CO  | Description                                                              |
| --- | ------------------------------------------------------------------------ |
| CO1 | Apply logical reasoning and proof techniques to solve problems           |
| CO2 | Apply set theory, relations, and functions in computer science contexts  |
| CO3 | Solve counting problems using combinatorial methods                      |
| CO4 | Apply algebraic structures to computing problems                         |
| CO5 | Model and solve real-world problems using discrete mathematical concepts |

### Course Contents

#### Module 1: Mathematical Logic and Proofs (06 Hours)

- Propositional Logic: Propositions, Connectives, Truth Tables
- Logical Equivalences
- Predicates and Quantifiers
- Rules of Inference
- Proof Methods: Direct, Indirect, Contradiction, Induction

#### Module 2: Sets, Relations, and Functions (06 Hours)

- Set Operations, Venn Diagrams
- Cartesian Products
- Relations: Properties, Closures, Equivalence Relations, Partial Orders
- Functions: Injective, Surjective, Bijective, Composition
- Recursive Functions

#### Module 3: Counting Principles (06 Hours)

- Pigeonhole Principle
- Permutations and Combinations
- Binomial Coefficients
- Inclusion-Exclusion Principle
- Recurrence Relations

#### Module 4: Algebraic Structures (06 Hours)

- Groups: Definition, Properties, Subgroups
- Cyclic Groups, Permutation Groups
- Rings and Fields
- Homomorphisms and Isomorphisms

#### Module 5: Graph Theory (06 Hours)

- Graph Terminology
- Graph Representations: Adjacency Matrix, Adjacency List
- Graph Traversals: DFS, BFS
- Euler and Hamiltonian Paths
- Planar Graphs and Graph Coloring

### Learning Resources

#### Textbooks

1. Kenneth H. Rosen, "Discrete Mathematics and Its Applications", 8th Edition, McGraw-Hill, 2019
2. Bernard Kolman, Robert C. Busby, Sharon C. Ross, "Discrete Mathematical Structures", 6th Edition,
   Pearson, 2008

#### Reference Books

1. Ralph P. Grimaldi, "Discrete and Combinatorial Mathematics", 5th Edition, Pearson, 2004
2. C.L. Liu, "Elements of Discrete Mathematics", 2nd Edition, McGraw-Hill, 1985

---

## BCS405B: Graph Theory (ESC/ETC/PLC)

**Teaching Scheme:** Theory: 02 Hours/Week, Tutorial: 02 Hours/Week

**Credits:** 03

**Examination:** CIE: 50 Marks, SEE: 50 Marks, Total: 100 Marks

### Course Objectives

- To introduce fundamental concepts of graph theory
- To study graph representations and traversals
- To understand connectivity and coloring
- To explore applications in computer science
- To analyze network flows and matching

### Course Outcomes

| CO  | Description                                                   |
| --- | ------------------------------------------------------------- |
| CO1 | Explain basic concepts of graphs, trees, and their properties |
| CO2 | Apply graph traversal algorithms for problem solving          |
| CO3 | Analyze graph connectivity and planarity                      |
| CO4 | Apply graph coloring and network flow concepts                |
| CO5 | Model real-world problems using graph theory                  |

### Course Contents

#### Module 1: Introduction to Graphs (06 Hours)

- Definitions and Examples
- Types of Graphs: Simple, Directed, Weighted, Bipartite
- Graph Isomorphism
- Graph Representations: Adjacency Matrix, Incidence Matrix, Adjacency List

#### Module 2: Trees and Connectivity (06 Hours)

- Trees: Properties, Rooted Trees
- Spanning Trees: BFS, DFS Trees
- Minimum Spanning Tree: Prim's, Kruskal's
- Connectivity: Vertex and Edge Connectivity
- Menger's Theorem

#### Module 3: Graph Traversals and Eulerian/Hamiltonian Graphs (06 Hours)

- DFS and BFS Algorithms
- Eulerian Circuits and Eulerian Trails
- Hamiltonian Cycles and Paths
- Traveling Salesman Problem

#### Module 4: Graph Coloring and Planarity (06 Hours)

- Vertex Coloring: Chromatic Number
- Greedy Coloring Algorithm
- Edge Coloring
- Planar Graphs: Euler's Formula
- Kuratowski's Theorem

#### Module 5: Network Flows and Matching (06 Hours)

- Flow Networks
- Max Flow-Min Cut Theorem
- Ford-Fulkerson Algorithm
- Bipartite Matching
- Hall's Marriage Theorem

### Learning Resources

#### Textbooks

1. Narsingh Deo, "Graph Theory with Applications to Engineering and Computer Science", PHI, 2016
2. Douglas B. West, "Introduction to Graph Theory", 2nd Edition, Pearson, 2001

#### Reference Books

1. Reinhard Diestel, "Graph Theory", 4th Edition, Springer, 2010
2. J.A. Bondy, U.S.R. Murty, "Graph Theory with Applications", Springer, 2008

---

## BCS456A: Green IT and Sustainability (AEC/SEC)

**Teaching Scheme:** Theory: 01 Hour/Week

**Credits:** 01

**Examination:** CIE: 50 Marks, SEE: 50 Marks (MCQ), Total: 100 Marks

**Examination Nature:** Theory (01 Hour, MCQ)

### Course Outcomes

| CO  | Description                                                    |
| --- | -------------------------------------------------------------- |
| CO1 | Understand the need for Green IT and its environmental impacts |
| CO2 | Apply green practices in data centers and IT infrastructure    |
| CO3 | Evaluate the role of virtualization in energy efficiency       |
| CO4 | Analyze lifecycle assessment and e-waste management            |
| CO5 | Implement green IT strategies in organizations                 |

### Course Contents

#### Module 1: Introduction to Green IT

- Environmental Impacts of IT
- Carbon Footprint of Computing
- Green IT: Definition, Scope, Benefits
- Green IT vs Sustainable IT

#### Module 2: Green Data Centers

- Data Center Energy Consumption
- PUE (Power Usage Effectiveness) Metrics
- Cooling Techniques: Air, Liquid, Free Cooling
- Virtualization and Consolidation
- Cloud Computing for Green IT

#### Module 3: E-Waste Management

- E-Waste: Sources, Composition, Hazards
- E-Waste Management Rules (2016, 2022)
- Recycling and Recovery
- Extended Producer Responsibility (EPR)

#### Module 4: Green Software and Lifecycle

- Green Software Engineering
- Energy-Efficient Coding Practices
- Software Lifecycle Assessment
- Green Metrics and Benchmarking

#### Module 5: Sustainable IT Strategies

- Enterprise Green IT Strategy
- Green Procurement
- Regulatory Compliance: Energy Star, WEEE, RoHS
- Case Studies: Google, Microsoft, Amazon Sustainability

### Learning Resources

#### Textbooks

1. San Murugesan, G.R. Gangadharan, "Harnessing Green IT: Principles and Practices", Wiley-IEEE
   Press, 2012
2. Mohammad Dastbaz, Colin Pattinson, Babak Akhgar, "Green Information Technology: A Sustainable
   Approach", Elsevier, 2015

---

## BCS456C: UI/UX (AEC/SEC)

**Teaching Scheme:** Theory: 01 Hour/Week

**Credits:** 01

**Examination:** CIE: 50 Marks, SEE: 50 Marks (MCQ), Total: 100 Marks

**Examination Nature:** Theory (01 Hour, MCQ)

### Course Objectives

- Understand user experience design requirements, with design goals, metrics and targets.
- Explore different prototyping methods, UX design principles with case examples.
- Understand the role of design thinking concepts and mental models in UX design.

### Course Outcomes

| CO  | Description                                                             |
| --- | ----------------------------------------------------------------------- |
| CO1 | Explain the user experience design requirements                         |
| CO2 | Relate design thinking concepts and mental models to UX design          |
| CO3 | Illustrate UX design in line with design goals, metrics and targets     |
| CO4 | Demonstrate different prototyping in relation with software engineering |
| CO5 | Explain UX design principles with case examples                         |

### Course Contents

#### Module 1: Introduction to UX

- Usability to User Experience
- Emotional Impact as Part of User Experience
- User Experience Needs a Business Case
- Extracting Interaction Design Requirements
- Formal Requirement Extraction, Methods for Requirement Extraction

#### Module 2: Design Thinking and Mental Models

- Design Thinking: Principles, Process
- Design Perspectives
- User Personas
- Ideation and Sketching
- Mental Models and Conceptual Design
- Storyboards, Design Influencing User Behaviour

#### Module 3: Design Production and UX Metrics

- Detailed Design, Wireframes
- UX Goals, Metrics and Targets
- UX Measures, Measurement Instruments
- Design Guidelines and Standards

#### Module 4: Prototyping

- Depth & Breadth of a Prototype
- Fidelity of Prototypes: Low, Medium, High
- Paper Prototypes
- Connections with Software Engineering
- The Challenge of Connecting SE and UX

#### Module 5: UX Guidelines

- Using and Interpreting Design Guidelines
- Human Memory Limitations
- UX Design Guidelines & Examples: Planning, Translation, Physical Action, Outcomes, Assessment
- Case Studies of UX Design

### Learning Resources

#### Textbooks

1. Rex Hartson, Pardha S. Pyla, "The UX Book: Process and Guidelines for Ensuring a Quality User
   Experience", Morgan Kaufmann, Elsevier, 2012

#### Reference

1. Alan Cooper, "About Face: The Essentials of Interaction Design", 4th Edition, Wiley, 2014

---

## BCSL456D: Technical Writing using LaTeX (AEC/SEC)

**Teaching Scheme:** Practical: 02 Hours/Week

**Credits:** 01

**Examination:** CIE: 50 Marks, SEE: 50 Marks (Practical), Total: 100 Marks

### Course Objectives

- To introduce the basic syntax and semantics of the LaTeX scripting language
- To understand the presentation of tables and figures in the document
- To illustrate the LaTeX syntax to represent theorems and mathematical equations
- To make use of the libraries (Tikz, Algorithm) to design diagrams and algorithms

### Course Outcomes

| CO  | Description                                                                          |
| --- | ------------------------------------------------------------------------------------ |
| CO1 | Apply basic LaTeX commands to develop simple documents                               |
| CO2 | Develop LaTeX script to present tables and figures in documents                      |
| CO3 | Illustrate LaTeX script to present theorems and mathematical equations               |
| CO4 | Develop programs to generate complete reports with citations and bibliography        |
| CO5 | Illustrate the use of Tikz and Algorithm libraries to design graphics and algorithms |

### Laboratory Experiments

1. Create a simple document with sections and paragraphs including header and footer
2. Create a document displaying a sample Abstract/Summary
3. Create a title page for a project report with logos and text formatting
4. Create a certificate page with blank spaces for user entry
5. Create a document with a properly labeled table
6. Include side-by-side graphics using subfigure concept
7. Display mathematical equations with proper formatting
8. Display numbered theorems, definitions, corollaries, and lemmas
9. Create a document with citations and bibliography
10. Design a tree diagram using Tikz library
11. Present an algorithm using Algorithm/Algorithmic/Algorithm2e library
12. Create a simple report and article with suitable commands

---

## BBOC407: Biology for Computer Engineers

**Teaching Scheme:** Theory: 02 Hours/Week

**Credits:** 02

**Examination:** CIE: 50 Marks, SEE: 50 Marks, Total: 100 Marks

### Course Objectives

- To understand the basic concepts of biology and its relevance to engineering
- To learn cell biology, genetics, and molecular biology fundamentals
- To explore bio-inspired computing and biological applications in CS

### Course Outcomes

| CO  | Description                                            |
| --- | ------------------------------------------------------ |
| CO1 | Explain the basic principles of life and cell biology  |
| CO2 | Describe the central dogma of molecular biology        |
| CO3 | Apply biological principles to computational problems  |
| CO4 | Analyze bio-inspired algorithms and their applications |
| CO5 | Evaluate the ethical implications of bio-computing     |

### Course Contents

#### Module 1: Cell Biology

- Cell Theory, Cell Structure and Function
- Prokaryotic vs Eukaryotic Cells
- Cell Organelles: Nucleus, Mitochondria, Ribosomes, ER, Golgi
- Cell Division: Mitosis, Meiosis
- Tissues and Organs

#### Module 2: Biomolecules

- Carbohydrates: Monosaccharides, Disaccharides, Polysaccharides
- Proteins: Amino Acids, Peptide Bonds, Protein Structure (Primary to Quaternary)
- Lipids: Fats, Phospholipids, Steroids
- Nucleic Acids: DNA and RNA Structure

#### Module 3: Enzymes and Metabolism

- Enzymes: Classification, Mechanism of Action
- Factors Affecting Enzyme Activity
- Metabolism: Catabolism and Anabolism
- Glycolysis, Kreb's Cycle, Electron Transport Chain
- Photosynthesis

#### Module 4: Genetics and Molecular Biology

- Mendelian Genetics
- DNA Replication, Transcription, Translation
- Gene Regulation: Operon Model
- Mutations and Genetic Diseases
- Recombinant DNA Technology

#### Module 5: Bio-Inspired Computing

- Neural Networks: Biological Neuron Model
- Genetic Algorithms: Selection, Crossover, Mutation
- Swarm Intelligence: Ant Colony Optimization, Particle Swarm
- DNA Computing
- Ethical Issues in Biotechnology and Computing

### Learning Resources

#### Textbooks

1. Campbell, "Biology: Concepts & Connections", 10th Edition, Pearson Education, 2021
2. Alberts et al., "Molecular Biology of the Cell", 6th Edition, Garland Science, 2014

#### Reference Books

1. Lehninger, "Principles of Biochemistry", 8th Edition, W.H. Freeman, 2021
2. Marco Dorigo, Thomas Stützle, "Ant Colony Optimization", MIT Press, 2004

---

## BUHK408: Universal Human Values Course

**Teaching Scheme:** Tutorial: 01 Hour/Week

**Credits:** 01

**Examination:** CIE: 50 Marks, SEE: 50 Marks, Total: 100 Marks

### Course Objectives

- To help students develop a holistic perspective of life
- To understand the harmony at various levels
- To inculcate human values and professional ethics

### Course Outcomes

| CO  | Description                                                  |
| --- | ------------------------------------------------------------ |
| CO1 | Understand the need for value education and self-exploration |
| CO2 | Analyze harmony in the human being and in family             |
| CO3 | Evaluate harmony in society and nature                       |
| CO4 | Apply professional ethics in engineering practice            |
| CO5 | Develop holistic approach to life and profession             |

### Course Contents

#### Module 1: Introduction to Value Education

- Need for Value Education
- Self-Exploration as the Process for Value Education
- Continuous Happiness and Prosperity
- Right Understanding, Relationship, and Physical Facility

#### Module 2: Harmony in the Human Being

- Human Being as Co-existence of Self and Body
- Needs of Self vs Needs of Body
- Harmony in the Self: Understanding Myself
- Harmony of Self with Body: Health

#### Module 3: Harmony in Family and Society

- Family as Basic Unit of Human Interaction
- Trust: The Foundational Value in Relationship
- Respect as Right Evaluation
- Understanding Harmony in Society: Universal Human Order

#### Module 4: Harmony in Nature and Existence

- Understanding Harmony in Nature
- Four Orders of Nature: Material, Plant, Animal, Human
- Interconnectedness and Mutual Fulfillment
- Holistic Perception of Harmony in Existence

#### Module 5: Professional Ethics

- Professional Ethics in Light of Right Understanding
- Competence in Professional Ethics
- Issues in Professional Ethics
- Strategies for Transition towards Value-based Life and Profession

### Learning Resources

#### Textbooks

1. R.R. Gaur, R. Asthana, G.P. Bagaria, "A Foundation Course in Human Values and Professional
   Ethics", 3rd Revised Edition, UHV Publications, 2023

#### Reference Books

1. A. Nagaraj, "Jeevan Vidya: Ek Parichaya", Jeevan Vidya Prakashan, 1999
2. A.N. Tripathy, "Human Values", New Age International Publishers, 2003

---

# Assessment Details (Common for All Courses)

## Continuous Internal Evaluation (CIE)

- **For the Assignment component of CIE:** 25 marks
- **For the Internal Assessment Test component:** 25 marks
- The first test will be administered after 40-50% of syllabus coverage
- The second test will be administered after 85-90% of syllabus coverage
- Minimum passing mark for CIE is 40% of maximum marks (20 out of 50)

## Semester End Examination (SEE)

- Theory SEE conducted by University as per scheduled timetable (duration 03 hours)
- The question paper will have **ten questions**, each set for **20 marks**
- There will be **2 questions from each module** (with a maximum of 3 sub-questions per question)
- Students must answer **5 full questions**, selecting one full question from each module
- Marks scored shall be proportionally reduced to **50 marks**
- Minimum passing mark for SEE is 35% of maximum marks (18 out of 50)

## Overall Passing Criteria

A student shall be deemed to have satisfied the academic requirements and earned the credits if the
student secures a minimum of **40% (40 marks out of 100)** in the sum total of CIE and SEE taken
together.

---

> **Disclaimer:** This document is compiled from official VTU syllabus documents (2022 Scheme) for
> reference purposes. For the latest updates, always refer to the official VTU website:
> https://vtu.ac.in
