# SPPU Fourth Year Computer Engineering — Official Syllabus Reference (2019 Pattern)

> Extracted from official SPPU syllabus documents.
>
> This document provides exact unit-wise syllabus, course outcomes, examination structure,
> laboratory work, practical guidelines and curriculum information.
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

# BE (Fourth Year) Computer Engineering — Semester VII

## Semester VII — Course Structure

| Course Code | Course Name                       |   TH   |   PR   |  TUT   | Mid-Sem | End-Sem |   TW    |   PR   |   OR   |  Total  | Credits |
| ----------- | --------------------------------- | :----: | :----: | :----: | :-----: | :-----: | :-----: | :----: | :----: | :-----: | :-----: |
| 410241      | Design and Analysis of Algorithms |   03   |   --   |   --   |   30    |   70    |   --    |   --   |   --   |   100   |   03    |
| 410242      | Machine Learning                  |   03   |   --   |   --   |   30    |   70    |   --    |   --   |   --   |   100   |   03    |
| 410243      | Blockchain Technology             |   03   |   --   |   --   |   30    |   70    |   --    |   --   |   --   |   100   |   03    |
| 410244      | Elective III                      |   03   |   --   |   --   |   30    |   70    |   --    |   --   |   --   |   100   |   03    |
| 410245      | Elective IV                       |   03   |   --   |   --   |   30    |   70    |   --    |   --   |   --   |   100   |   03    |
| 410246      | Laboratory Practice III           |   --   |   04   |   --   |   --    |   --    |   50    |   50   |   --   |   100   |   02    |
| 410247      | Laboratory Practice IV            |   --   |   02   |   --   |   --    |   --    |   50    |   --   |   --   |   50    |   01    |
| 410248      | Project Stage I                   |   --   |   02   |   --   |   --    |   --    |   50    |   --   |   --   |   50    |   02    |
| 410249      | Audit Course 7                    |   --   |   --   |   --   |   --    |   --    |   --    |   --   |   --   |  Grade  |   --    |
| **Total**   |                                   | **15** | **08** | **--** | **150** | **350** | **150** | **50** | **--** | **700** | **20**  |

**Elective III Options:**

- 410244(A): Pervasive Computing
- 410244(B): Multimedia Techniques
- 410244(C): Cyber Security and Digital Forensics
- 410244(D): Object Oriented Modeling and Design
- 410244(E): Digital Signal Processing

**Elective IV Options:**

- 410245(A): Information Retrieval
- 410245(B): GPU Programming and Architecture
- 410245(C): Mobile Computing
- 410245(D): Software Testing and Quality Assurance
- 410245(E): Compilers

**Laboratory Practice III:** Assignments from 410241, 410242, 410243 **Laboratory Practice IV:**
Assignments from 410244, 410245

**Audit Course 7 Options:**

- AC7-I: MOOC — Learn New Skills
- AC7-II: Entrepreneurship Development
- AC7-III: Botnet of Things
- AC7-IV: 3D Printing
- AC7-V: Industrial Safety and Environment Consciousness

---

## 410241: Design and Analysis of Algorithms

**Prerequisites Courses:** Discrete Mathematics (210241), Fundamentals of Data Structures (210242),
Data Structures and Algorithms (210252), Theory of Computation (310242)

**Companion Course:** Laboratory Practice III (410246)

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To develop problem solving abilities using mathematical theories.
- To apply algorithmic strategies while solving problems.
- To analyze performance of different algorithmic strategies in terms of time and space.
- To develop time and space efficient algorithms.
- To study algorithmic examples in distributed and concurrent environments
- To Understand Multithreaded and Distributed Algorithms

### Course Outcomes

| CO  | Description                                                             |
| --- | ----------------------------------------------------------------------- |
| CO1 | Formulate the problem                                                   |
| CO2 | Analyze the asymptotic performance of algorithms                        |
| CO3 | Decide and apply algorithmic strategies to solve given problem          |
| CO4 | Find optimal solution by applying various methods                       |
| CO5 | Analyze and Apply Scheduling and Sorting Algorithms                     |
| CO6 | Solve problems for multi-core or distributed or concurrent environments |

### Course Contents

#### Unit I: Algorithms and Problem Solving (07 Hours) → CO1, CO3

- The Role of Algorithms in Computing — What are algorithms, Algorithms as technology
- Evolution of Algorithms, Design of Algorithm
- Need of Correctness of Algorithm
- Confirming correctness of Algorithm — sample examples
- Iterative algorithm design issues
- Problem solving Principles: Classification of problem, problem solving strategies
- Classification of time complexities (linear, logarithmic etc.)
- Towers of Hanoi

#### Unit II: Analysis of Algorithms and Complexity Theory (07 Hours) → CO2

- Analysis: Input size, best case, worst case, average case
- Counting Dominant operators, Growth rate, upper bounds
- Asymptotic growth: O, Ω, Θ, o and ω notations
- Polynomial and non-polynomial problems
- Deterministic and non-deterministic algorithms
- P-class problems, NP-class of problems
- Polynomial problem reduction
- NP complete problems — vertex cover and 3-SAT
- NP hard problem — Hamiltonian cycle

#### Unit III: Greedy and Dynamic Programming Algorithmic Strategies (08 Hours) → CO3, CO4

- Greedy strategy: Principle, control abstraction, time analysis
- Knapsack problem, Scheduling algorithms — Job scheduling and activity selection problem
- Dynamic Programming: Principle, control abstraction, time analysis
- Binomial coefficients, OBST, 0/1 knapsack, Chain Matrix multiplication

#### Unit IV: Backtracking and Branch-n-Bound (08 Hours) → CO3, CO4

- Backtracking: Principle, control abstraction, time analysis
- 8-queen problem, Graph coloring problem, Sum of subsets problem
- Branch-n-Bound: Principle, control abstraction, time analysis
- Strategies — FIFO, LIFO and LC approaches
- TSP, Knapsack problem

#### Unit V: Amortized Analysis (07 Hours) → CO3, CO5

- Amortized Analysis: Aggregate Analysis, Accounting Method, Potential Function method
- Amortized analysis — binary counter, stack
- Time-Space tradeoff
- Introduction to Tractable and Non-tractable Problems
- Introduction to Randomized and Approximate algorithms
- Embedded Algorithms: Embedded system scheduling, sorting for embedded systems

#### Unit VI: Multithreaded and Distributed Algorithms (07 Hours) → CO6

- Multithreaded Algorithms — Introduction, Performance measures, Analyzing multithreaded algorithms,
  Parallel loops, Race conditions
- Problem Solving using Multithreaded Algorithms — Multithreaded matrix multiplication,
  Multithreaded merge sort
- Distributed Algorithms — Introduction, Distributed breadth first search, Distributed Minimum
  Spanning Tree
- String Matching — Introduction, The Naive string matching algorithm, The Rabin-Karp algorithm

### Learning Resources

#### Text Books

1. Parag Himanshu Dave, Himanshu Bhalchandra Dave, "Design And Analysis of Algorithms", Pearson
   Education, ISBN 81-7758-595-9
2. Gilles Brassard, Paul Bratley, "Fundamentals of Algorithmics", PHI, ISBN 978-81-203-1131-2

#### Reference Books

1. Michael T. Goodrich, Roberto Tamassia, "Algorithm Design: Foundations, Analysis and Internet
   Examples", Wiley, ISBN 978-81-265-0986-7
2. Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest and Clifford Stein, "Introduction to
   Algorithms", MIT Press, ISBN 978-0-262-03384-8
3. Horowitz and Sahani, "Fundamentals of Computer Algorithms", University Press, ISBN: 978 817371
   6126
4. Rajeev Motwani and Prabhakar Raghavan, "Randomized Algorithms", Cambridge University Press, ISBN:
   978-0-521-61390-3

---

## 410242: Machine Learning

**Prerequisite Courses:** Data Science and Big Data Analytics (310251)

**Companion Course:** Laboratory Practice III (410246)

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the need for Machine learning
- To explore various data pre-processing methods.
- To study and understand classification methods
- To understand the need for multi-class classifiers.
- To learn the working of clustering algorithms
- To learn fundamental neural network algorithms.

### Course Outcomes

| CO  | Description                                                                                        |
| --- | -------------------------------------------------------------------------------------------------- |
| CO1 | Identify the needs and challenges of machine learning for real time applications.                  |
| CO2 | Apply various data pre-processing techniques to simplify and speed up machine learning algorithms. |
| CO3 | Select and apply appropriately supervised machine learning algorithms for real time applications.  |
| CO4 | Implement variants of multi-class classifier and measure its performance.                          |
| CO5 | Compare and contrast different clustering algorithms.                                              |
| CO6 | Design a neural network for solving engineering problems.                                          |

### Course Contents

#### Unit I: Introduction to Machine Learning (07 Hours) → CO1

- Introduction to Machine Learning
- Comparison of ML with traditional programming, ML vs AI vs Data Science
- Types of learning: Supervised, Unsupervised, Semi-supervised, Reinforcement learning
- Models of Machine learning: Geometric, Probabilistic, Logical, Grouping and grading models
- Parametric and non-parametric models
- Important Elements of Machine Learning — Data formats, Learnability, Statistical learning
  approaches

#### Unit II: Feature Engineering (07 Hours) → CO2

- Concept of Feature, Preprocessing of data: Normalization and Scaling, Standardization
- Managing missing values
- Introduction to Dimensionality Reduction: Principal Component Analysis (PCA)
- Feature Extraction: Kernel PCA, Local Binary Pattern
- Feature Selection Techniques: Sequential Forward Selection, Sequential Backward Selection
- Statistical feature engineering: count-based, Length, Mean, Median, Mode based feature vector
  creation
- Multidimensional Scaling, Matrix Factorization Techniques

#### Unit III: Supervised Learning: Regression (06 Hours) → CO3

- Bias, Variance, Generalization, Underfitting, Overfitting
- Linear regression
- Lasso regression, Ridge regression
- Gradient descent algorithm
- Evaluation Metrics: MAE, RMSE, R²

#### Unit IV: Supervised Learning: Classification (08 Hours) → CO4

- Classification: K-nearest neighbour, Support vector machine
- Ensemble Learning: Bagging, Boosting, Random Forest, Adaboost
- Binary-vs-Multiclass Classification
- Balanced and Imbalanced Multiclass Classification Problems
- Variants of Multiclass Classification: One-vs-One and One-vs-All
- Evaluation Metrics: Accuracy, Precision, Recall, F-score, Cross-validation
- Micro/Macro Average Precision, Recall, F-score

#### Unit V: Unsupervised Learning (07 Hours) → CO5

- K-Means, K-medoids Clustering
- Hierarchical Clustering
- Density-based Clustering
- Spectral Clustering
- Outlier analysis: Isolation factor, Local outlier factor
- Evaluation metrics: Elbow method, Extrinsic and Intrinsic methods

#### Unit VI: Introduction to Neural Networks (07 Hours) → CO6

- Artificial Neural Networks: Single Layer Neural Network, Multilayer Perceptron
- Back Propagation Learning
- Functional Link Artificial Neural Network
- Radial Basis Function Network
- Activation functions
- Introduction to Recurrent Neural Networks and Convolutional Neural Networks

### Learning Resources

#### Text Books

1. Bishop, Christopher M., and Nasser M. Nasrabadi, "Pattern recognition and machine learning",
   Vol. 4. No. 4. New York: springer, 2006.
2. Ethem Alpaydin, "Introduction to Machine Learning", PHI 2nd Edition-2013

#### Reference Books

1. Tom Mitchell, "Machine learning", McGraw-Hill series in Computer Science, 1997
2. Shalev-Shwartz, Shai, and Shai Ben-David, "Understanding machine learning: From theory to
   algorithms", Cambridge university press, 2014.
3. Jiawei Han, Micheline Kamber, and Jian Pei, "Data Mining: Concepts and Techniques", Elsevier
   Publishers, 3rd Edition
4. Hastie, Trevor, et al., "The elements of statistical learning: data mining, inference, and
   prediction", Vol. 2. New York: springer, 2009.
5. Goodfellow I., Bengio Y. and Courville, "Deep Learning", MIT Press, 2016

---

## 410243: Blockchain Technology

**Prerequisite Courses:** Computer Networks and Security (310244)

**Companion Course:** Laboratory Practice III (410246)

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- Technology behind Blockchain
- Crypto currency, Bitcoin and Smart contracts
- Different consensus algorithms used in Blockchain
- Real-world applications of Blockchain
- To analyze Blockchain Ethereum Platform using Solidity
- To Describe Blockchain Case Studies

### Course Outcomes

| CO  | Description                                                                                        |
| --- | -------------------------------------------------------------------------------------------------- |
| CO1 | Interpret the fundamentals and basic concepts in Blockchain                                        |
| CO2 | Compare the working of different blockchain platforms                                              |
| CO3 | Use Crypto wallet for cryptocurrency based transactions                                            |
| CO4 | Analyze the importance of blockchain in finding the solution to the real-world problems            |
| CO5 | Illustrate the Ethereum public block chain platform                                                |
| CO6 | Identify relative application where block chain technology can be effectively used and implemented |

### Course Contents

#### Unit I: Mathematical Foundation for Blockchain (06 Hours) → CO1

- Cryptography: Symmetric Key Cryptography and Asymmetric Key Cryptography
- Elliptic Curve Cryptography (ECC)
- Cryptographic Hash Functions: SHA256
- Digital Signature Algorithm (DSA)
- Merkel Trees

#### Unit II: Blockchain Fundamentals (07 Hours) → CO1

- History, Centralized Vs. Decentralized Systems
- Layers of Blockchain: Application Layer, Execution Layer, Semantic Layer, Propagation Layer,
  Consensus Layer
- Why is Blockchain important?
- Limitations of Centralized Systems
- Blockchain Adoption So Far

#### Unit III: Blockchain Platforms and Consensus in Blockchain (06 Hours) → CO2

- Types of Blockchain Platforms: Public, Private and Consortium
- Bitcoin, Ethereum, Hyperledger, IoTA, Corda, R3
- Consensus in Blockchain: Consensus Approach, Consensus Elements, Consensus Algorithms
- Proof of Work, Byzantine General problem, Proof of Stake, Proof of Elapsed Time
- Proof of Activity, Proof of Burn

#### Unit IV: Cryptocurrency — Bitcoin, and Token (06 Hours) → CO3

- Introduction, Bitcoin and the Cryptocurrency
- Cryptocurrency Basics, Types of Cryptocurrency, Cryptocurrency Usage
- Cryptowallets: Metamask, Coinbase, Binance

#### Unit V: Blockchain Ethereum Platform using Solidity (06 Hours) → CO5

- What is Ethereum, Types of Ethereum Networks
- EVM (Ethereum Virtual Machine)
- Introduction to smart contracts, Purpose and types of Smart Contracts
- Implementing and deploying smart contracts using Solidity
- Swarm (Decentralized Storage Platform)
- Whisper (Decentralized Messaging Platform)
- Truffle Development Environment

#### Unit VI: Blockchain Case Studies (06 Hours) → CO4, CO6

- Prominent Blockchain Applications
- Retail, Banking and Financial Services
- Government Sector, Healthcare, IOT
- Energy and Utilities
- Blockchain Integration with other Domains

### Learning Resources

#### Text Books

1. Martin Quest, "Blockchain Dynamics: A Quick Beginner's Guide on Understanding the Foundations of
   Bitcoin and Other Cryptocurrencies", Create Space Independent Publishing Platform, 15-May-2018
2. Imran Bashir, "Mastering Blockchain: Distributed Ledger Technology, Decentralization and Smart
   Contracts Explained", Second Edition, Packt Publishing, 2018
3. Alex Leverington, "Ethereum Programming", Packt Publishing, 2017

#### Reference Books

1. Bikramaditya Singhal, Gautam Dhameja, Priyansu Sekhar Panda, "Beginning Blockchain — A Beginner's
   Guide to Building Blockchain Solutions", 2018
2. Chris Dannen, "Introducing Ethereum and Solidity", Foundations of Cryptocurrency and Blockchain
   Programming for Beginners
3. Daniel Drescher, "Blockchain Basics", A Non-Technical Introduction in 25 Steps
4. Ritesh Modi, "Solidity Programming Essentials", Packt Publishing, 2018
5. Chandramouli Subramanian, Asha A George, Abhilash K A and Meena Karthikeyan, "Blockchain
   Technology", Universities Press, ISBN-9789389211634

---

## 410244(A): Elective III — Pervasive Computing

**Prerequisite Courses:** Internet of Things and Embedded Systems (310245A)

**Companion Course:** Laboratory Practice IV (410247)

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the fundamentals of pervasive computing
- To learn about pervasive devices and their applications
- To study context-aware systems
- To understand intelligent systems and interaction
- To learn HCI design in pervasive computing environments
- To understand security challenges in pervasive computing

### Course Outcomes

| CO  | Description                                                                                     |
| --- | ----------------------------------------------------------------------------------------------- |
| CO1 | Demonstrate fundamental concepts in pervasive computing.                                        |
| CO2 | Explain pervasive devices and decide appropriate one as per the need of real time applications. |
| CO3 | Classify and analyze context aware systems for their efficiency in different ICT systems.       |
| CO4 | Illustrate intelligent systems and generic intelligent interactive applications.                |
| CO5 | Design HCI systems in pervasive computing environment.                                          |
| CO6 | Explore the security challenges and know the role of ethics in pervasive computing.             |

### Course Contents

#### Unit I: Introduction to Pervasive Computing (07 Hours) → CO1

- Pervasive Computing: History, Principles, Characteristics
- Problems/Issues & Challenges, Advantages
- Pervasive Computing Applications, Devices and interfaces
- Device technology trends, Connecting issues and protocols

#### Unit II: Smart Computing with Pervasive Computing Devices (07 Hours) → CO2

- Smart Devices: CCI, Smart Environment: CPI and CCI
- Smart Devices: iHCI and HPI
- Wearable devices, Application and Requirements
- PDA Device characteristics — PDA Based Access Architecture
- Voice Enabling Pervasive Computing: Voice Standards, Speech Applications

#### Unit III: Context Aware Systems (07 Hours) → CO3

- Introduction, Types of Context
- Context Aware Computing and Applications
- Modelling Context-Aware Systems
- Mobility awareness, spatial awareness, temporal awareness
- Middleware Support

#### Unit IV: Intelligent Systems and Interaction (07 Hours) → CO4

- Introduction, Basic Concepts, IS Architectures
- Semantic KBIS, Classical Logic IS, Soft Computing IS Models
- IS System Operations, Interaction Multiplicity
- IS Interaction Design, Generic Intelligent Interaction Applications

#### Unit V: User Interaction Design — HCI and Wearable Computing (07 Hours) → CO5

- Introduction of Interaction Design, Basics and Concepts
- Importance of Interaction Design, Difference between ID and UX
- What is HCI? Importance, Advantages and Disadvantages
- HCI Design and Architecture
- Wearable Computing: Importance, Architecture, Applications
- Security issues in Wearable Computing

#### Unit VI: Security Challenges & Ethics in Pervasive Computing (07 Hours) → CO6

- Security issues in Pervasive Computing: security model, authentication & authorization
- Access control, secure resource discovery
- Pervasive computing security challenges & requirements
- Privacy & trust issues
- Role of Ethics in pervasive computing security

---

## 410244(B): Elective III — Multimedia Techniques

**Prerequisite Courses:** Computer Graphics (210241)

**Companion Course:** Laboratory Practice IV (410247)

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the media and supporting devices associated with multimedia
- To learn content-based information analysis in multimedia systems
- To learn audio, video, graphics and color representation techniques
- To understand compression algorithms for multimedia
- To learn AR/VR technologies for multimedia
- To understand Multimedia IoT architectures

### Course Outcomes

| CO  | Description                                                                                                                                        |
| --- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| CO1 | Describe the media and supporting devices commonly associated with multimedia information and systems.                                             |
| CO2 | Demonstrate the use of content-based information analysis in a multimedia information system.                                                      |
| CO3 | Critique multimedia presentations in terms of their appropriate use of audio, video, graphics, color, and other information presentation concepts. |
| CO4 | Implement a multimedia application using an authoring system.                                                                                      |
| CO5 | Understanding of technologies for tracking, navigation and gestural control.                                                                       |
| CO6 | Implement Multimedia Internet of Things Architectures.                                                                                             |

### Course Contents

#### Unit I: Introduction to Multimedia (07 Hours) → CO1

- What is Multimedia and their Components, History of Multimedia
- Hypermedia, WWW, and Internet
- Multimedia Tools: Static (text, graphics, still images), Active (sound, animation, video)
- Multimedia Sharing and Distribution
- Multimedia Authoring Tools: Adobe Premiere, Adobe Director, Adobe Flash

#### Unit II: Graphics and Data Representation Techniques (07 Hours) → CO2

- Graphics data types: 1-bit, 8-bit grey, 16-bit grey, 8-bit & 24-bit color images
- Color Lookup tables
- File Formats: GIF, JPEG, PNG, TIFF, PSD, BMP, WMF, RAW, EXIF
- Text file format: RTF, TGA
- Applications/Use of text in Multimedia

#### Unit III: Multimedia Representations Techniques (07 Hours) → CO3

- Analog video: CRT, NTSC, PAL, SECAM
- Digital Video: Chroma Subsampling, HDTV, UHDTV
- Component Video: HDMI, 3D Video and TV
- Basics of Digital Audio: Nyquist Theorem, SNR, SQNR
- MIDI Overview, Audio Coding: PCM, DPCM, DM

#### Unit IV: Compression Algorithms (07 Hours) → CO3, CO4

- Introduction to compression — need, types
- Lossless compression: RLC, VLC, DBC, AC, Lossless image compression
- Lossy compression: Rate distortion theory, Quantization, Transform coding
- Image compression standards: JPEG, JPEG 2000, Bilevel image compression
- Video compression: Motion compensation, MPEG Video coding (1,2,4,7)
- Audio Compression: ADPCM, Vocoders, MPEG audio compression

#### Unit V: Augmented Reality (AR), Virtual Reality (VR) and Mixed Reality (MR) (07 Hours) → CO5

- Basics of VR, difference between VR and AR
- Components and Performance issues in AR
- Input devices — controllers, motion trackers, motion capture
- Output devices — Head Mounted VR Displays, AR/MR glasses
- 3D interactive and procedural graphics, Immersive surround sound
- Haptic and vibrotactile devices
- VRML Programming

#### Unit VI: Multimedia Internet of Things (07 Hours) → CO6

- IoT and Multimedia IoT Architecture
- M-IoT Architectures: Multi-Agent Based, AI-Based, Software-Defined
- Big Data Layered architecture
- Applications of M-IoT: Road Management System, Industrial Applications, Health Monitoring

---

## 410244(C): Elective III — Cyber Security and Digital Forensics

**Prerequisite Courses:** Computer Networks and Security (310244), Information Security (310254(A))

**Companion Course:** Laboratory Practice IV (410247)

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To understand threats in cyberspace and defense mechanisms against cyber-attacks
- To build security solutions against cyber-attacks
- To understand the need of digital forensic and role of digital evidences
- To learn rules and types of evidence collection
- To analyze, validate and process crime scenes
- To identify methods to generate legal evidence and investigation reports

### Course Outcomes

| CO  | Description                                                                           |
| --- | ------------------------------------------------------------------------------------- |
| CO1 | Analyze threats in order to protect or defend in cyberspace from cyber-attacks.       |
| CO2 | Build appropriate security solutions against cyber-attacks.                           |
| CO3 | Underline the need of digital forensic and role of digital evidences.                 |
| CO4 | Explain rules and types of evidence collection                                        |
| CO5 | Analyze, validate and process crime scenes                                            |
| CO6 | Identify the methods to generate legal evidence and supporting investigation reports. |

### Course Contents

#### Unit I: Introduction to Cyber Security (06 Hours) → CO1

- Introduction and Overview of Cyber Crime
- Nature and Scope of Cyber Crime
- Types of Cyber Crime: crime against individual, property, cyber extortion, drug trafficking, cyber
  terrorism
- Need for Information security, Threats to Information Systems
- Information Assurance, Cyber Security, Security Risk Analysis

#### Unit II: Cyber Crime Issues and Cyber Attacks (06 Hours) → CO2

- Unauthorized Access to Computers, Computer Intrusions
- Viruses and Malicious Code, Internet Hacking and Cracking
- Software Piracy, Intellectual Property
- Cybercrime prevention methods
- Application security (Database, E-mail, Internet)
- Data Security: Backups, Archival Storage, Data Disposal
- Security Technology: Firewall and VPNs, OS Security

#### Unit III: Introduction to Digital Forensics (06 Hours) → CO3

- What is Computer Forensics?
- Use of Computer Forensics in Law Enforcement
- Computer Forensics Services, Benefits
- Professional Forensics Methodology
- Types of Computer Forensics Technology: Military, Law Enforcement, Business
- Computer Forensics Evidence and Capture: Data Recovery, Back-up

#### Unit IV: Evidence Collection and Data Seizure (06 Hours) → CO4

- Why Collect Evidence? Collection Options, Obstacles
- Types of Evidence, Rules of Evidence, Volatile Evidence
- Collection and Archiving, Methods of Collection
- Chain of Custody
- Duplication and Preservation of Digital Evidence
- Computer Image Verification and Authentication

#### Unit V: Computer Forensics Analysis and Validation (06 Hours) → CO5

- Determining what data to collect and analyze
- Validating forensic data, Data-hiding techniques
- Network Forensics: performing live acquisitions, using network tools
- Processing Crime and Incident Scenes
- Identifying digital evidence, seizing digital evidence
- Storing digital evidence, obtaining a digital hash

#### Unit VI: Current Computer Forensic Tools (06 Hours) → CO6

- Evaluating computer forensic tool needs
- Computer forensics software and hardware tools
- Validating and testing forensics software
- E-Mail Investigations: roles of client and server, investigating e-mail crimes
- Using specialized e-mail forensic tools

---

## 410244(D): Elective III — Object Oriented Modeling and Design

**Prerequisite Courses:** Software Engineering (210245)

**Companion Course:** Laboratory Practice IV (410247)

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the concepts of object-oriented and basic class modeling
- To learn to draw class, sequence and interaction diagrams
- To understand design patterns for problem solving
- To analyze applications, architectural styles and software control strategies
- To develop class design models and handle legacy systems

### Course Outcomes

| CO  | Description                                                                        |
| --- | ---------------------------------------------------------------------------------- |
| CO1 | Describe the concepts of object-oriented and basic class modelling.                |
| CO2 | Draw class diagrams, sequence diagrams and interaction diagrams to solve problems. |
| CO3 | Choose and apply a befitting design pattern for the given problem                  |
| CO4 | Analyze applications, architectural styles and software control strategies         |
| CO5 | Develop class design models and choose legacy systems.                             |
| CO6 | Understand Design Patterns                                                         |

### Course Contents

#### Unit I: Introduction to Modeling (06 Hours) → CO1

- What is Object Orientation? OO development, OO themes
- Modeling as Design Technique: Modeling, abstraction, The three models
- Class Modeling: Object and class concepts, Link and associations concepts
- Generalization and inheritance, Navigation of class models

#### Unit II: Advanced Class Modeling and State Modeling (06 Hours) → CO2

- Advanced object and class concepts, Association ends, N-ary associations
- Aggregation, Abstract classes, Multiple inheritance
- Metadata, Reification, Constraints, Derived data, Packages
- State Modeling: Events, States, Transitions and Conditions
- State diagrams, State diagram behavior

#### Unit III: Advanced State Modeling and Interaction Modeling (06 Hours) → CO2, CO3

- Advanced State Modeling: Nested state diagrams, Concurrency
- Interaction Modeling: Use case models, Sequence models, Activity models
- Use case relationships, Procedural sequence models

#### Unit IV: Application Analysis: System Design (06 Hours) → CO3, CO4

- Application Analysis: Interaction model, Class model, State model
- Overview of system design, Estimating performance
- Making a reuse plan, Breaking system into sub-systems
- Identifying concurrency, Allocation of sub-systems
- Management of data storage, Handling global resources
- Common architectural styles

#### Unit V: Class Design, Implementation Modeling, Legacy Systems (06 Hours) → CO4, CO5

- Overview of class design, Bridging the gap
- Realizing use cases, Designing algorithms
- Refactoring, Design optimization
- Implementation Modeling, Fine-tuning classes and generalizations
- Legacy Systems: Reverse engineering, Building class/interaction/state models
- Wrapping, Maintenance

#### Unit VI: Design Pattern (06 Hours) → CO6

- What is a pattern? Pattern categories, Relationships between patterns
- Communication Patterns: Forwarder-Receiver, Client-Dispatcher-Server, Publisher-Subscriber
- Management Patterns: Command processor, View handler
- Idioms: Introduction, Idioms and style, Counted Pointer example

---

## 410244(E): Elective III — Digital Signal Processing

**Prerequisite Courses:** Engineering Mathematics III (207003)

**Companion Course:** Laboratory Practice IV (410247)

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To understand mathematical models of DT Signals and Systems
- To apply Fourier and Z-Transform for signal processing
- To understand design and implementation of DT filters
- To demonstrate knowledge of signals and systems for design and analysis
- To use signal transforms for digital processing applications
- To understand filtering and different filter structures

### Course Outcomes

| CO  | Description                                                                             |
| --- | --------------------------------------------------------------------------------------- |
| CO1 | Understand the mathematical models and representations of DT Signals and Systems        |
| CO2 | Apply different transforms like Fourier and Z-Transform from applications point of view |
| CO3 | Understand the design and implementation of DT systems as DT filters                    |
| CO4 | Demonstrate the knowledge of signals and systems for design and analysis                |
| CO5 | Apply knowledge and use the signal transforms for digital processing applications       |
| CO6 | Understand Filtering and Different Filter Structures                                    |

### Course Contents

#### Unit I: Signals and Systems (08 Hours) → CO1

- Continuous time (CT), Discrete-time (DT) and Digital signals
- Basic DT signals and Operations
- Discrete-time Systems, Properties of DT Systems
- Linear Time Invariant (LTI) Systems, Impulse response, Linear convolution
- FIR and IIR systems, Periodic Sampling
- A to D conversion: Sampling, quantization and encoding

#### Unit II: Frequency Domain Representation of Signal (08 Hours) → CO1

- Introduction to Fourier Series
- Fourier Transform (FT), Properties of FT
- Discrete Fourier Transform (DFT), IDFT, Twiddle factor
- Properties of DFT, Circular convolution
- DFT as Linear filtering, Overlap save and add

#### Unit III: Fast Fourier Transform (FFT) and Z-Transform (08 Hours) → CO2

- Effective computation of DFT, Radix-2 FFT: DIT FFT, DIF FFT
- Z-transform (ZT), ROC and its properties
- ZT Properties, Pole Zero Plot
- Inverse Z Transform: Power series method, Partial fraction expansion

#### Unit IV: Analysis of DT-LTI Systems (08 Hours) → CO3

- System function H(z), All poll and all zero systems
- Analysis of LTI system using H(Z)
- Unilateral Z-transform: solution of difference equation
- Frequency response of system, Pole zero plot

#### Unit V: Digital Filter Design (08 Hours) → CO5

- Concept of filtering, Ideal filters and approximations
- FIR and IIR filters, Linear phase response
- FIR filter Design: Fourier Series method, Windowing method
- IIR filter design: Impulse Invariance method, Bilinear Z transformation (BLT)

#### Unit VI: Filter Structures and DSP Processors (08 Hours) → CO6

- Filter Structures for FIR Systems: direct form, cascade form
- Filter Structures for IIR Systems: direct form, cascade form, parallel form
- DSP Processors: ADSP 21XX features, SHARC DSP
- Introduction to OMAP (Open Multimedia Application Platform)

---

## Elective IV Options (410245)

### 410245(A): Elective IV — Information Retrieval

**Prerequisite Courses:** Database Management Systems (310241)

**Companion Course:** Laboratory Practice IV (410247)

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the basic concepts, indexing, and performance analysis of Information Retrieval
  systems
- To study classification, clustering, and filtering techniques for IR
- To understand evaluation methods and transition to large-scale search services
- To explore parallel IR and web search structures

### Course Outcomes

| CO  | Description                                                                        |
| --- | ---------------------------------------------------------------------------------- |
| CO1 | Implement the concept of Information Retrieval                                     |
| CO2 | Generate quality information out of retrieved information                          |
| CO3 | Apply techniques such as classification, clustering, and filtering over multimedia |
| CO4 | Evaluate and analyze retrieved information                                         |
| CO5 | Understand the data in various Application and Extensions of IR                    |
| CO6 | Understand Parallel information retrieving and web structure                       |

### Course Contents

#### Unit I: Introduction, Basic Techniques and Tokenizing (07 Hours) → CO1

- The IR System, Software Architecture of the IR System
- Basic IR Models: Boolean, TF-IDF, Vector, Probabilistic, Latent Semantic Indexing
- Basic Tokenizing: Simple Tokenizing, Stop-Word Removal, Stemming

#### Unit II: Static Inverted Indices and Query Processing (07 Hours) → CO2

- Inverted Index Construction, Index Components, Index Life Cycle
- The Dictionary: Sort-based, Hash-based
- Query Processing: Document-at-a-Time, Term-at-a-Time
- Query optimization, Lightweight Structure

#### Unit III: Index Compression and Dynamic Inverted Indices (07 Hours) → CO2

- Data Compression: Huffman Coding, Arithmetic Coding
- Compressing Postings Lists: Nonparametric/Parametric Gap Compression
- Dynamic Inverted Indices, Incremental Index Updates
- Document Deletions and Modifications

#### Unit IV: Probabilistic Retrieval, Language Modeling, Categorization and Filtering (07 Hours) → CO3

- Probabilistic Retrieval: Binary Independence Model, BM25
- Language Models, Smoothing, Ranking with Language Models
- Categorization and Filtering: Classification, Linear/Similarity-Based/Probabilistic Classifiers

#### Unit V: Measuring Effectiveness and Efficiency (07 Hours) → CO4

- Traditional effectiveness measures, TREC
- Efficiency criteria, Query Scheduling, Caching
- Introduction to Redis and Memcached

#### Unit VI: Parallel Information Retrieval, Web Search (07 Hours) → CO5, CO6

- Parallel Query Processing, MapReduce
- Web Search: Structure of web, Static/Dynamic ranking, Evaluation
- Web Crawlers, Python Scrapy, Beautiful Soup

### Learning Resources

#### Text Books

1. Stefan Büttcher, Charles L.A. Clarke, Gordon V. Cormack, "Information Retrieval: Implementing and
   Evaluating Search Engines", MIT Press
2. Christopher D. Manning, Prabhakar Raghavan, Hinrich Schütze, "Introduction to Information
   Retrieval", Cambridge University Press
3. Ricardo Baeza-Yates, Berthier Ribeiro-Neto, "Modern Information Retrieval", 2nd Edition,
   Addison-Wesley

#### Reference Books

1. W. Bruce Croft, Donald Metzler, Trevor Strohman, "Search Engines: Information Retrieval in
   Practice", Pearson
2. C. J. van Rijsbergen, "Information Retrieval", Butterworth-Heinemann

---

### 410245(B): Elective IV — GPU Programming and Architecture

**Prerequisite Courses:** Computer Graphics (210244)

**Companion Course:** Laboratory Practice IV (410247)

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To understand Graphics Processing Unit (GPU) concepts and basics of GPU architectures
- To write programs for massively parallel processors
- To understand the issues in mapping algorithms for GPUs
- To introduce different GPU programming models and examine the architecture of modern GPUs

### Course Outcomes

| CO  | Description                                                           |
| --- | --------------------------------------------------------------------- |
| CO1 | Describe GPU architecture                                             |
| CO2 | Write programs using CUDA, identify issues, and debug them            |
| CO3 | Implement efficient algorithms in GPUs for common application kernels |
| CO4 | Write simple programs using OpenCL                                    |
| CO5 | Identify efficient parallel programming patterns to solve problems    |
| CO6 | Explore the modern GPUs architecture and its applications             |

### Course Contents

#### Unit I: Introduction to GPU (07 Hours) → CO1

- Evolution of GPU architectures
- Typical GPU Architecture
- CUDA Hardware Overview: Threads, Blocks, Grids, Warps, Scheduling
- Memory Handling: Shared, Global, Constant, Texture Memory
- Review of Traditional Architecture

#### Unit II: CUDA Programming (07 Hours) → CO2

- Using CUDA
- Multi-GPU solutions
- Optimizing CUDA Applications: Problem decomposition, Memory considerations, Transfers, Thread
  usage, Resource contentions

#### Unit III: Programming Issues (07 Hours) → CO3

- CUDA Error Handling
- Parallel Programming Issues
- Synchronization, Algorithmic Issues
- Finding and Avoiding Errors

#### Unit IV: OpenCL Basics (07 Hours) → CO4

- OpenCL Standard, Kernels
- Host Device Interaction
- Execution Environment, Memory Model
- Basic OpenCL Examples

#### Unit V: Algorithms on GPU (07 Hours) → CO5

- Parallel Patterns: Convolution, Prefix Sum, Sparse Matrix
- Matrix Multiplication
- Programming Heterogeneous Cluster

#### Unit VI: OpenCL and Application Design (07 Hours) → CO6

- OpenCL for Heterogeneous Computing
- Application Design: Efficient Neural Network Training/Inferencing

### Learning Resources

#### Text Books

1. Shane Cook, "CUDA Programming: A Developer's Guide to Parallel Computing with GPUs"
2. David R. Kaeli et al., "Heterogeneous Computing with OpenCL", 3rd Edition
3. Benedict Gaster et al., "Heterogeneous Computing with OpenCL"

#### Reference Books

1. Nicholas Wilt, "CUDA Handbook"
2. Jason Sanders et al., "CUDA by Example", Addison-Wesley
3. David B. Kirk et al., "Programming Massively Parallel Processors"

---

### 410245(C): Elective IV — Mobile Computing

**Prerequisite Courses:** Computer Networks and Security (310244)

**Companion Course:** Laboratory Practice IV (410247)

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To introduce basic concepts, principles, techniques and systems/networking issues for mobile
  computing
- To demonstrate protocols of mobile communication
- To cover GSM architecture and support services
- To study location and handoff management
- To summarize VLR and HLR identification algorithms
- To learn current field technologies and design/develop network protocols

### Course Outcomes

| CO  | Description                                                                          |
| --- | ------------------------------------------------------------------------------------ |
| CO1 | Develop a strong grounding in mobile network fundamentals                            |
| CO2 | Apply knowledge in MAC, Network, and Transport Layer protocols for wireless networks |
| CO3 | Illustrate the Global System for Mobile Communications (GSM)                         |
| CO4 | Use 3G/4G technology-based networks with bandwidth planning, VLR and HLR algorithms  |
| CO5 | Classify network and transport layers of mobile communication                        |
| CO6 | Design and develop wireless network protocols using simulation tools                 |

### Course Contents

#### Unit I: Introduction to Mobile Computing (07 Hours) → CO1

- Mobile computing, Constraints, Applications
- Generations 1G to 5G, Radio frequency Technology
- PSTN, PCS Architecture
- Bluetooth, Ad-hoc Networks
- 5G spectrum sharing

#### Unit II: Mobile Wireless Protocols (07 Hours) → CO2

- WAP: Applications, Architecture, Protocol Stack
- Routing protocols for ad hoc networks: DSDV, AODV
- MAC protocols: SDMA, FDMA, TDMA, CDMA
- Cellular Wireless Networks, Handoff types
- Cellular frequency management

#### Unit III: Global System for Mobile Communications (GSM) (07 Hours) → CO3

- GSM architecture: Mobile Station, BSS, Switching subsystem, Security
- Data Services: HSCSD, GPRS
- UMTS core network, UTRAN
- 802.11 Architecture and Standards
- 5G Communications

#### Unit IV: GSM Networking Signaling and Mobile Management (07 Hours) → CO4

- GSM MAP Service framework
- Location management: VLR and HLR
- Failure restoration, VLR identification algorithms
- Handoff strategies
- Micro-mobility: CellularIP, HAWAII

#### Unit V: Mobile Network and Transport Layers (07 Hours) → CO5

- Mobile IP, IP packet delivery, Tunneling, Encapsulation
- IPv6, DHCP
- VANET, MANET
- Traditional TCP, Snooping TCP, Mobile TCP
- Wireless Application Protocol

#### Unit VI: 3G and 4G Technologies (07 Hours) → CO6

- W-CDMA, UMTS, HSPA, HSDPA, HSUPA
- LTE, 3GPP2, CDMA2000, EV-DO
- Architecture of 5G
- Role of 5G in IoT

### Learning Resources

#### Text Books

1. Jochen Schiller, "Mobile Communications", 2nd Edition, Pearson, ISBN: 978-81-317-2426-2
2. Martin Sauter, "3G, 4G and Beyond", Wiley
3. Raj Kamal, "Mobile Computing", 2nd Edition, Oxford University Press, ISBN: 978-0-19-806713-7

#### Reference Books

1. William Stallings, "Wireless Communications & Networks", 2nd Edition, Pearson
2. Christopher Cox, "An Introduction to LTE", Wiley
3. Andrea Goldsmith, "Wireless Communications", Cambridge University Press

---

### 410245(D): Elective IV — Software Testing and Quality Assurance

**Prerequisite Courses:** Software Engineering (210253), Software Project Management (310245(D))

**Companion Course:** Laboratory Practice IV (410247)

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To introduce basic concepts of software testing
- To understand ways to increase effectiveness, test coverage, and execution speed
- To understand white box, black box, object-oriented, web-based, and cloud testing
- To understand the importance of software quality and assurance in system development
- To learn about automation testing and associated tools
- To understand practices and tools to help QA professionals test more efficiently

### Course Outcomes

| CO  | Description                                                                                    |
| --- | ---------------------------------------------------------------------------------------------- |
| CO1 | Describe fundamental concepts like manual testing, automation testing, and SQA                 |
| CO2 | Design and develop project test plans, test cases, test data, and conduct test operations      |
| CO3 | Apply recent automation tools for various testing types                                        |
| CO4 | Apply different approaches of quality management, assurance, and standards to software systems |
| CO5 | Apply and analyze effectiveness of Software Quality Tools                                      |
| CO6 | Apply tools necessary for efficient testing frameworks                                         |

### Course Contents

#### Unit I: Introduction to Software Testing (07 Hours) → CO1

- Historical perspective, Definition, Core Components
- Testing and Debugging, Need of Testing
- Quality Assurance and Testing, TQM
- Software Quality, Quality Management System
- Manual Testing vs Automation Testing

#### Unit II: Test Planning and Quality Management (07 Hours) → CO2

- Test Planning: Artifacts, Strategy, Test Organization
- Test Plan Contents, Test cases and Test Data
- Entry and Exit criteria
- Test Monitoring and Control
- Test Metrics, Quality Assurance Process

#### Unit III: Test Case Design Techniques (07 Hours) → CO3

- White Box, Black Box, Grey Box Testing Methodologies
- Static Techniques: Reviews, Walkthroughs, Inspection
- Dynamic Techniques: Statement, Branch, Path, Condition, Loop Coverage
- Black Box Techniques: BVA, Equivalence Partitioning, State Transition
- Levels of Testing: Unit, Integration, System, Acceptance, Regression

#### Unit IV: Software Quality Assurance and Quality Control (07 Hours) → CO4

- SQA Introduction, Constraints of Software Product Quality
- Quality models: McCall, Boehm, ISO 9126
- Measurement and metrics
- Quality management system models
- International quality standards: ISO 9000, CMM, CMMI

#### Unit V: Automation Testing Tools / Performance Testing Tools (07 Hours) → CO5

- Automation Testing: Process, Frameworks
- Selenium Tool Suite: IDE, RC, WebDriver, Grid
- SoapUI, RPA, Tosca, Appium
- Performance Testing: Apache JMeter

#### Unit VI: Testing Framework (07 Hours) → CO6

- Software Quality Dilemma, Achieving Software Quality
- SQA Tasks, Goals, Metrics
- Six Sigma for Software Engineering
- ISO 9000 Quality Standards
- Ishikawa's 7 basic tools
- Defect Removal Effectiveness (DRE)

### Learning Resources

#### Text Books

1. M G Limaye, "Software Testing Principles, Techniques and Tools", McGraw Hill, ISBN:
   978-0-07-013990-5
2. Srinivasan Desikan, Gopal Swamy Ramesh, "Software Testing Principles and Practices", Pearson,
   ISBN: 978-81-775-8848-3

#### Reference Books

1. Naresh Chauhan, "Software Testing Principles and Practices", Oxford University Press
2. Stephen Kan, "Metrics and Models in Software Quality Engineering", 2nd Edition, Addison-Wesley

---

### 410245(E): Elective IV — Compilers

**Prerequisite Courses:** Theory of Computation (310242), Systems Programming and Operating System
(310243)

**Companion Course:** Laboratory Practice IV (410247)

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the major phases of compilation and the theory behind compiler design
- To learn lexical analysis and parsing techniques
- To study syntax-directed translation and intermediate code generation
- To understand code optimization and code generation
- To learn about symbol tables and runtime environments

### Course Outcomes

| CO  | Description                                                      |
| --- | ---------------------------------------------------------------- |
| CO1 | Analyze the phases of a compiler and design lexical analyzers    |
| CO2 | Design and implement top-down and bottom-up parsers              |
| CO3 | Apply syntax-directed translation to generate intermediate code  |
| CO4 | Analyze symbol table organization and runtime storage management |
| CO5 | Apply code optimization techniques                               |
| CO6 | Design and implement a code generator                            |

### Course Contents

#### Unit I: Introduction to Compilation (07 Hours) → CO1

- Language Processors: Compiler, Interpreter, Assembler
- Phases of a Compiler: Lexical, Syntax, Semantic, Intermediate Code, Optimization, Code Generation
- Compiler Construction Tools
- Lexical Analysis: Role, Tokens, Patterns, Lexemes
- Regular Expressions and Finite Automata for Lexical Analysis
- Lex Tool

#### Unit II: Syntax Analysis — Parsing (07 Hours) → CO2

- Role of Parser, Context-Free Grammars (CFG)
- Derivations and Parse Trees
- Top-Down Parsing: Recursive Descent, Predictive, LL(1) Parsers
- Bottom-Up Parsing: Shift-Reduce, LR Parsers (SLR, CLR, LALR)
- Handling Ambiguous Grammars
- YACC Tool

#### Unit III: Syntax-Directed Translation and Intermediate Code Generation (07 Hours) → CO3

- Syntax-Directed Definitions (SDD), Syntax-Directed Translation Schemes (SDT)
- Evaluation of Semantic Rules
- Intermediate Representations: Abstract Syntax Tree (AST)
- Three-Address Code: Quadruples, Triples, Indirect Triples
- Type Checking: Static and Dynamic

#### Unit IV: Symbol Table and Runtime Environments (07 Hours) → CO4

- Symbol Table Organization: Linear, Hash, Tree Structures
- Scope Management: Block-structured languages
- Runtime Storage Management: Static, Stack, Heap Allocation
- Activation Records

#### Unit V: Code Optimization (07 Hours) → CO5

- Principal Sources of Optimization
- Basic Blocks and Flow Graphs
- Local Optimization: Constant Folding, Algebraic Simplification
- Global Optimization: Data-flow Analysis, Reaching Definitions
- Loop Optimization: Loop Unrolling, Loop Invariant Code Motion
- Peephole Optimization

#### Unit VI: Code Generation (07 Hours) → CO6

- Issues in Code Generation: Input, Output, Target Language
- Target Machine Architecture
- Basic Blocks and Flow Graphs for Code Generation
- Register Allocation and Assignment
- Simple Code Generator Algorithm
- DAG Representation for Basic Blocks

### Learning Resources

#### Text Books

1. Alfred V. Aho, Monica S. Lam, Ravi Sethi, Jeffrey D. Ullman, "Compilers: Principles, Techniques,
   and Tools", 2nd Edition, Pearson, ISBN: 978-81-317-2101-0
2. Kenneth C. Louden, "Compiler Construction: Principles and Practice", Cengage Learning, ISBN:
   978-81-315-0115-3

#### Reference Books

1. Andrew W. Appel, "Modern Compiler Implementation in C", Cambridge University Press
2. Steven S. Muchnick, "Advanced Compiler Design and Implementation", Morgan Kaufmann
3. John R. Levine, Tony Mason, Doug Brown, "Lex & Yacc", O'Reilly

---

# BE (Fourth Year) Computer Engineering — Semester VIII

## Semester VIII — Course Structure

| Course Code | Course Name                |   TH   |   PR   |  TUT   | Mid-Sem | End-Sem |   TW    |   PR   |   OR   |  Total  | Credits |
| ----------- | -------------------------- | :----: | :----: | :----: | :-----: | :-----: | :-----: | :----: | :----: | :-----: | :-----: |
| 410250      | High Performance Computing |   03   |   --   |   --   |   30    |   70    |   --    |   --   |   --   |   100   |   03    |
| 410251      | Deep Learning              |   03   |   --   |   --   |   30    |   70    |   --    |   --   |   --   |   100   |   03    |
| 410252      | Elective V                 |   03   |   --   |   --   |   30    |   70    |   --    |   --   |   --   |   100   |   03    |
| 410253      | Elective VI                |   03   |   --   |   --   |   30    |   70    |   --    |   --   |   --   |   100   |   03    |
| 410254      | Laboratory Practice V      |   --   |   02   |   --   |   --    |   --    |   50    |   50   |   --   |   100   |   01    |
| 410255      | Laboratory Practice VI     |   --   |   02   |   --   |   --    |   --    |   50    |   --   |   --   |   50    |   01    |
| 410256      | Project Stage II           |   --   |   06   |   --   |   --    |   --    |   100   |   --   |   50   |   150   |   06    |
| 410257      | Audit Course 8             |   --   |   --   |   --   |   --    |   --    |   --    |   --   |   --   |  Grade  |   --    |
| **Total**   |                            | **12** | **10** | **--** | **120** | **280** | **200** | **50** | **50** | **700** | **20**  |

**Elective V Options:**

- 410252(A): Natural Language Processing
- 410252(B): Image Processing
- 410252(C): Software Defined Networks
- 410252(D): Advanced Digital Signal Processing
- 410252(E): Open Elective I

**Elective VI Options:**

- 410253(A): Pattern Recognition
- 410253(B): Soft Computing
- 410253(C): Business Intelligence
- 410253(D): Quantum Computing
- 410253(E): Open Elective II

**Laboratory Practice V:** Assignments from 410250, 410251 **Laboratory Practice VI:** Assignments
from 410252, 410253

**Audit Course 8 Options:**

- AC8-I: Usability Engineering
- AC8-II: Conversational Interfaces
- AC8-III: Social Media and Analytics
- AC8-IV: MOOC — Learn New Skills
- AC8-V: Emotional Intelligence

---

## 410250: High Performance Computing

**Companion Course:** Laboratory Practice V (410254)

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To understand different parallel programming models
- To analyze the performance and modeling of parallel programs
- To illustrate the various techniques to parallelize the algorithm
- To implement parallel communication operations
- To discriminate CUDA Architecture and its components
- To understand scope of Parallel Computing and its search algorithms

### Course Outcomes

| CO  | Description                                                               |
| --- | ------------------------------------------------------------------------- |
| CO1 | Understand various Parallel Paradigm                                      |
| CO2 | Design and Develop an efficient parallel algorithm to solve given problem |
| CO3 | Illustrate data communication operations on various parallel architecture |
| CO4 | Analyze and measure performance of modern parallel computing systems      |
| CO5 | Apply CUDA architecture for parallel programming                          |
| CO6 | Analyze the performance of HPC applications                               |

### Course Contents

#### Unit I: Introduction to Parallel Computing (07 Hours) → CO1

- Motivating Parallelism
- Modern Processor: Stored-program computer architecture, General-purpose Cache-based Microprocessor
  architecture
- Parallel Programming Platforms: Implicit Parallelism, Dichotomy of Parallel Computing Platforms
- Physical Organization of Parallel Platforms, Communication Costs in Parallel Machines
- Levels of parallelism
- Models: SIMD, MIMD, SIMT, SPMD, Data Flow Models, Demand-driven Computation
- Architectures: N-wide superscalar architectures, multi-core, multi-threaded

**Exemplar/Case Study:** Case study: Multi-core System.

#### Unit II: Parallel Algorithm Design (07 Hours) → CO2

- Principles of Parallel Algorithm Design: Preliminaries, Decomposition Techniques
- Characteristics of Tasks and Interactions
- Mapping Techniques for Load Balancing
- Methods for Containing Interaction Overheads
- Parallel Algorithm Models: Data, Task, Work Pool and Master Slave Model
- Complexities: Sequential and Parallel Computational Complexity
- Anomalies in Parallel Algorithms

**Exemplar/Case Study:** Foster's parallel algorithm design methodology.

#### Unit III: Parallel Communication (07 Hours) → CO3

- Basic Communication: One-to-All Broadcast, All-to-One Reduction
- All-to-All Broadcast and Reduction, All-Reduce and Prefix-Sum Operations
- Collective Communication using MPI: Scatter, Gather, Broadcast
- Blocking and non-blocking MPI
- All-to-All Personalized Communication, Circular Shift
- Improving the speed of some communication operations

**Exemplar/Case Study:** Monte-Carlo Pi computing using MPI.

#### Unit IV: Analytical Modeling of Parallel Programs (07 Hours) → CO4

- Sources of Overhead in Parallel Programs
- Performance Measures and Analysis: Amdahl's and Gustafson's Laws
- Speedup Factor and Efficiency, Cost and Utilization
- Execution Rate and Redundancy, The Effect of Granularity on Performance
- Scalability of Parallel Systems
- Minimum Execution Time and Minimum Cost, Optimal Execution Time
- Asymptotic Analysis of Parallel Programs
- Matrix Computation: Matrix-Vector Multiplication, Matrix-Matrix Multiplication

**Exemplar/Case Study:** The DAG Model of parallel computation.

#### Unit V: CUDA Architecture (07 Hours) → CO5

- Introduction to GPU: GPU Architecture overview
- Introduction to CUDA
- CUDA programming model, write and launch a CUDA kernel
- Handling Errors
- CUDA memory model
- Manage communication and synchronization
- Parallel programming in CUDA-C

**Exemplar/Case Study:** GPU applications using SYCL and CUDA on NVIDIA.

#### Unit VI: High Performance Computing Applications (07 Hours) → CO6

- Scope of Parallel Computing
- Parallel Search Algorithms: Depth First Search (DFS), Breadth First Search (BFS)
- Parallel Sorting: Bubble and Merge
- Distributed Computing: Document classification
- Frameworks: Kubernetes
- GPU Applications, Parallel Computing for AI/ML
- Disaster detection and management / Smart Mobility / Urban planning

### Learning Resources

#### Text Books

1. Ananth Grama, Anshul Gupta, George Karypis, and Vipin Kumar, "Introduction to Parallel
   Computing", 2nd edition, Addison-Wesley, 2003.
2. Seyed H. Roosta, "Parallel Processing and Parallel Algorithms Theory and Computation",
   Springer-Verlag 2000.
3. John Cheng, Max Grossman, and Ty McKercher, "Professional CUDA C Programming", John Wiley & Sons,
   Inc.

#### Reference Books

1. Kai Hwang, "Scalable Parallel Computing", McGraw Hill 1998.
2. George S. Almasi and Alan Gottlieb, "Highly Parallel Computing", The Benjamin and Cummings Pub.
   Co., Inc.
3. Jason Sanders, Edward Kandrot, "CUDA by Example", Addison-Wesley.
4. Pacheco, Peter S., "An Introduction to Parallel Programming", Morgan Kaufmann Publishers.
5. Ajay D. Kshemkalyani, Mukesh Singhal, "Distributed Computing: Principles, Algorithms, and
   Systems", Cambridge March 2011.

---

## 410251: Deep Learning

**Prerequisite Courses:** Machine Learning (410242)

**Companion Course:** Laboratory Practice V (410254)

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the basics of neural networks
- To compare different deep learning models
- To understand the Recurrent and Recursive nets in Deep Learning
- To understand the basics of deep reinforcement Learning models
- To analyze Types of Networks
- To describe Reinforcement Learning

### Course Outcomes

| CO  | Description                                                                                                                                                 |
| --- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| CO1 | Understand the basics of Deep Learning and apply the tools to implement deep learning applications                                                          |
| CO2 | Evaluate the performance of deep learning models (e.g., with respect to the bias-variance tradeoff, overfitting and underfitting, estimation of test error) |
| CO3 | Apply the technique of Convolution (CNN) and Recurrent Neural Network (RNN) for implementing Deep Learning models                                           |
| CO4 | To implement and apply deep generative models                                                                                                               |
| CO5 | Construct and apply on-policy reinforcement learning algorithms                                                                                             |
| CO6 | Understand Reinforcement Learning Process                                                                                                                   |

### Course Contents

#### Unit I: Foundations of Deep Learning (07 Hours) → CO1

- Machine learning vs. deep learning
- Supervised/Unsupervised Learning
- Bias-variance tradeoff, Hyperparameters
- Under/Overfitting, Regularization
- Limitations, History, Advantages/Challenges
- Learning representations, Architectural principles
- Architecture design, Applications
- Industry tools: TensorFlow, Keras, PyTorch, Caffe, Shogun

**Exemplar/Case Study:** Deep Mind, AlphaGo, Boston Dynamics.

#### Unit II: Deep Neural Networks (DNNs) (07 Hours) → CO2

- Biological Neuron, Perceptron
- Multilayer Feed-Forward Networks
- Training: Backpropagation, Forward propagation
- Activation Functions: Linear, Sigmoid, Tanh, Hard Tanh, Softmax, Rectified Linear
- Loss Functions: Regression, Classification, Reconstruction
- Hyperparameters: Learning Rate, Regularization, Momentum, Sparsity
- Deep Feedforward Networks: Example of Ex OR, Hidden Units, Cost functions
- Gradient-based learning, Gradient descent, Vanishing/Exploding gradients
- Sentiment Analysis
- Deep Learning with PyTorch / Jupyter / Colab

**Exemplar/Case Study:** Music Genre Classification.

#### Unit III: Convolution Neural Network (CNN) (07 Hours) → CO3

- Overview and Architecture
- Structure: Padding, Strides, Settings
- ReLU layer, Pooling, Fully Connected Layers
- Interleaving, Local Response Normalization
- Training CNNs

**Exemplar/Case Study:** AlexNet, VGG.

#### Unit IV: Recurrent Neural Network (RNN) (07 Hours) → CO3

- Unfolding Computational Graphs
- Bidirectional RNNs
- Encoder-Decoder Seq2Seq Architectures
- Deep Recurrent Networks, Recursive Neural Networks
- Long-Term Dependencies challenges
- Echo State Networks, Leaky Units / Other Strategies
- LSTM / Gated RNNs
- Optimization, Explicit Memory
- Practical Methodology: Metrics, Baseline Models, Data gathering, Hyperparameters

**Exemplar/Case Study:** Multi-Digit Number Recognition.

#### Unit V: Deep Generative Models (07 Hours) → CO4

- Introduction to Generative Models
- Boltzmann Machine
- Deep Belief Networks
- Generative Adversarial Network (GAN): Discriminator/Generator Networks
- Types of GAN, Applications of GAN

**Exemplar/Case Study:** GAN for detection of real or fake images.

#### Unit VI: Reinforcement Learning (07 Hours) → CO5, CO6

- Introduction to Reinforcement Learning
- Markov Decision Process, Framework, Challenges
- Dynamic Programming
- Q Learning and Deep Q-Networks
- Deep Q Recurrent Networks
- Simple reinforcement learning for Tic-Tac-Toe

**Exemplar/Case Study:** Self driving cars, Deep learning for chatbots.

### Learning Resources

#### Text Books

1. Goodfellow, I., Bengio, Y., Courville, A, "Deep Learning", MIT Press, 2016.
2. Josh Patterson & Adam Gibson, "Deep Learning"
3. Charu Agarwal, "Neural Networks and deep learning", A textbook
4. Nikhil Buduma, "Fundamentals of Deep Learning", SPD
5. Francois Chollet, "Deep Learning with Python"

#### Reference Books

1. Richard S. Sutton and Andrew G. Barto, "Reinforcement Learning: An Introduction"
2. Seth Weidman, "Deep Learning from Scratch: Building with Python from First Principles", O'Reilly
3. Francois Duval, "Deep Learning for Beginners, Practical Guide with Python and Tensorflow"

---

## 410252(A): Elective V — Natural Language Processing

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To comprehend the foundations of Natural Language Processing
- To understand various morphological, syntactic and semantic NLP tasks
- To learn language modeling for NLP
- To familiarize with NLP tools and libraries
- To understand real-world applications of NLP and Machine Translation

### Course Outcomes

| CO  | Description                                                                            |
| --- | -------------------------------------------------------------------------------------- |
| CO1 | Describe the fundamental concepts and techniques of Natural Language Processing        |
| CO2 | Analyze the structure of natural language in terms of morphology, syntax and semantics |
| CO3 | Apply appropriate NLP techniques for various linguistic tasks                          |
| CO4 | Integrate various NLP techniques for comprehensive language processing                 |
| CO5 | Use various NLP tools and libraries for language processing tasks                      |
| CO6 | Develop real-world applications involving Natural Language Processing                  |

### Course Contents

#### Unit I: Introduction to NLP (07 Hours) → CO1

- Origins and challenges of NLP
- Language and Grammar
- Processing Indian Languages
- NLP Applications
- Text Tokenization, Text Normalization, Sentence Segmentation
- Stemming, Lemmatization
- POS Tagging

#### Unit II: Morphological, Syntactic and Semantic Analysis (07 Hours) → CO2

- Morphological Analysis: Inflectional, Derivational
- N-gram Language Models
- Syntactic Analysis: Parsing, Constituency and Dependency
- Semantic Analysis: Word Senses, WordNet
- Word Sense Disambiguation (WSD)

#### Unit III: Language Modelling and Word Embeddings (07 Hours) → CO3

- N-gram Language Models: Markov Models, Estimation, Smoothing
- Vector Semantics: Word Embeddings (Word2Vec, GloVe, BERT)
- Topic Modelling: Latent Dirichlet Allocation (LDA)
- TF-IDF, Pointwise Mutual Information (PMI)

#### Unit IV: Information Extraction (07 Hours) → CO4

- Information Retrieval: Boolean, Vector Space, Probabilistic models
- Named Entity Recognition (NER)
- Relation Extraction
- Reference Resolution: Anaphora Resolution

#### Unit V: NLP Tools and Resources (07 Hours) → CO5

- NLP Libraries: NLTK, spaCy, Gensim
- Linguistic Resources: WordNet, SentiWordNet, Indian Language Corpora
- WSD Algorithms: Lesk, Walker, Simplified Lesk
- Evaluating NLP Systems

#### Unit VI: NLP Applications (07 Hours) → CO6

- Machine Translation: Approaches, Evaluation
- Sentiment Analysis: Lexicon-based, ML-based
- Question Answering Systems
- Chatbots and Dialogue Systems
- Natural Language Generation (NLG)

### Learning Resources

#### Text Books

1. Daniel Jurafsky, James H. Martin, "Speech and Language Processing", 3rd Edition, Pearson, ISBN:
   978-93-325-3553-0
2. Christopher D. Manning, Hinrich Schütze, "Foundations of Statistical Natural Language
   Processing", MIT Press, ISBN: 978-0-262-13360-9

#### Reference Books

1. James Allen, "Natural Language Understanding", Pearson
2. Steven Bird, Ewan Klein, Edward Loper, "Natural Language Processing with Python", O'Reilly
3. Jacob Eisenstein, "Introduction to Natural Language Processing", MIT Press

---

### 410252(B): Elective V — Image Processing

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To learn the fundamental concepts of Digital Image Processing
- To understand image enhancement techniques in spatial and frequency domain
- To learn image segmentation, compression, and object recognition
- To understand image restoration models
- To explore domain-specific applications of image processing

### Course Outcomes

| CO  | Description                                                                    |
| --- | ------------------------------------------------------------------------------ |
| CO1 | Apply mathematics and fundamental algorithms for image processing applications |
| CO2 | Apply image enhancement methods in spatial and frequency domain                |
| CO3 | Apply algorithmic approaches for image segmentation                            |
| CO4 | Summarize image compression and object recognition techniques                  |
| CO5 | Apply image restoration techniques                                             |
| CO6 | Explore specialized domain-specific image processing applications              |

### Course Contents

#### Unit I: Digital Image Fundamentals (07 Hours) → CO1

- Introduction to Digital Image Processing (DIP), Applications
- Image Sensing and Acquisition, Sampling and Quantization
- Spatial and Intensity Resolution
- Color Models: RGB, CMY, HSV
- Basics of OpenCV

#### Unit II: Image Enhancement (07 Hours) → CO2

- Spatial Domain Enhancement: Point Processing, Mask Processing
- Histogram Processing: Equalization, Matching
- Smoothing Filters: Averaging, Gaussian, Median
- Sharpening Filters: Laplacian, Sobel, Prewitt
- Frequency Domain Enhancement: Fourier Transform, Low-pass/High-pass filtering
- Homomorphic Filtering

#### Unit III: Image Segmentation (07 Hours) → CO3

- Discontinuity Detection: Point, Line, Edge Detection
- Thresholding: Global, Adaptive
- Region-based Segmentation: Region Growing, Split and Merge
- Hough Transform
- Watershed Segmentation

#### Unit IV: Image Compression and Object Recognition (07 Hours) → CO4

- Compression Fundamentals: Redundancy, Fidelity Criteria
- Lossless Compression: Huffman, Arithmetic, Run-length, LZW
- Lossy Compression: JPEG Standards
- Object Recognition: Decision-theoretic, Structural methods

#### Unit V: Image Restoration (07 Hours) → CO5

- Image Degradation/Restoration Model
- Noise Models: Gaussian, Rayleigh, Salt-and-Pepper
- Restoration Filters: Mean, Order-statistic, Adaptive
- Inverse Filtering, Wiener Filtering

#### Unit VI: Domain Applications (07 Hours) → CO6

- Medical Imaging: MRI, CT, X-ray enhancement
- Remote Sensing and Satellite Imaging
- Document Image Processing
- Biometric Applications: Face, Fingerprint, Iris

### Learning Resources

#### Text Books

1. Rafael C. Gonzalez, Richard E. Woods, "Digital Image Processing", 4th Edition, Pearson, ISBN:
   978-0-13-335672-4
2. Anil K. Jain, "Fundamentals of Digital Image Processing", PHI, ISBN: 978-81-203-0929-6

#### Reference Books

1. William K. Pratt, "Digital Image Processing", 4th Edition, Wiley
2. Milan Sonka, Vaclav Hlavac, Roger Boyle, "Image Processing, Analysis, and Machine Vision",
   Cengage
3. S. Jayaraman, S. Esakkirajan, T. Veerakumar, "Digital Image Processing", McGraw Hill

---

### 410252(C): Elective V — Software Defined Networks

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To learn the fundamentals of Software Defined Networks
- To understand SDN frameworks and OpenFlow
- To understand the role of Data Center in SDN
- To learn SDN programming and NFV
- To understand industrial use-cases of SDN

### Course Outcomes

| CO  | Description                                          |
| --- | ---------------------------------------------------- |
| CO1 | Interpret the need and requirements of SDN solutions |
| CO2 | Analyze different methodologies for SDN              |
| CO3 | Design best practices for SDN deployment             |
| CO4 | Program network elements using SDN                   |
| CO5 | Understand network virtualization using OpenFlow     |
| CO6 | Develop applications using SDN                       |

### Course Contents

#### Unit I: Introduction to SDN (07 Hours) → CO1

- Challenges of Traditional Networks
- History and Evolution of SDN
- SDN Architecture: Infrastructure, Control, Application layers
- Southbound and Northbound Interfaces

#### Unit II: OpenFlow (07 Hours) → CO2

- OpenFlow Protocol: Switches, Controllers
- OpenFlow Message Types: Symmetric, Asynchronous, Controller-to-Switch
- Flow Table Pipelines
- OpenFlow Ports

#### Unit III: Data Center (07 Hours) → CO3

- Data Center Demands and Challenges
- VLANs, EVPN, VxLAN
- Data Center Interconnection

#### Unit IV: SDN Programming (07 Hours) → CO4

- SDN Programming Basics
- Northbound API: REST API, RESTCONF
- Network Functions Virtualization (NFV) Concepts
- NFV Architecture

#### Unit V: Network Virtualization (07 Hours) → CO5

- Benefits and Challenges of NFV
- NFV Use Cases
- Vendor Landscape: Cisco, VMware, Juniper, OpenSource

#### Unit VI: SDN Frameworks and Applications (07 Hours) → CO6

- SDN Controllers: Open Daylight, Floodlight, ONOS, Ryu
- SDN Orchestration
- SDN Security: Threats, Mitigation
- SDN Applications: Load Balancing, Traffic Engineering

### Learning Resources

#### Text Books

1. Paul Goransson, Chuck Black, "Software Defined Networks: A Comprehensive Approach", 2nd Edition,
   Morgan Kaufmann, ISBN: 978-0-12-416684-8
2. Thomas D. Nadeau, Ken Gray, "SDN: Software Defined Networks", O'Reilly, ISBN: 978-1-449-34230-2

#### Reference Books

1. William Stallings, "Foundations of Modern Networking: SDN, NFV, QoE, IoT, and Cloud", Pearson
2. Patricia A. Morreale, James M. Anderson, "Software Defined Networking: Design and Deployment",
   CRC Press
3. Vivek Tiwari, "SDN and OpenFlow for Beginners", Amazon Digital Services

---

### 410252(D): Elective V — Advanced Digital Signal Processing

**Prerequisite Courses:** Digital Signal Processing (410244(E))

**Companion Course:** Laboratory Practice VI (410255)

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To study the parametric methods for power spectrum estimation
- To study adaptive filtering techniques and applications of adaptive filtering
- To learn and understand Multi-rate DSP and applications
- To explore appropriate transforms
- To understand basic concepts of speech production, speech analysis, speech coding and parametric
  representation of speech
- To acquire knowledge about different methods used for speech coding and understand various
  applications of speech processing
- To learn and understand basics of Image Processing and various image filters with its applications

### Course Outcomes

| CO  | Description                                                                                       |
| --- | ------------------------------------------------------------------------------------------------- |
| CO1 | Understand and apply different transforms for the design of DT/Digital systems                    |
| CO2 | Explore the knowledge of adaptive filtering and Multi-rate DSP                                    |
| CO3 | Design DT systems in the field/area of adaptive filtering, spectral estimation and multi-rate DSP |
| CO4 | Explore use of DCT and WT in speech and image processing                                          |
| CO5 | Develop algorithms in the field of speech, image processing and other DSP applications            |
| CO6 | Identify Image Processing Techniques                                                              |

### Course Contents

#### Unit I: DFT and Applications (07 Hours) → CO1

- Linear filtering, spectral leakage, spectral resolution and selection of Window Length
- Frequency analysis, 2-D DFT
- Applications in Image and Speech Processing

**Exemplar/Case Study:** Case Study of Image/Speech Processing Application.

#### Unit II: Adaptive FIR and IIR Filter Design (07 Hours) → CO2, CO3

- DT Filters, FIR and IIR filters: characteristics and design
- Adaptive FIR Filter design: Steepest descent and Newton method, LMS method, Applications
- Adaptive IIR Filter design: Pade Approximation, Least square design, Applications

**Exemplar/Case Study:** Demonstration of DT filter and FIR filter with suitable application.

#### Unit III: Multi-rate DSP and Applications (07 Hours) → CO2, CO3

- Introduction, Decimation by a Factor D, Interpolation by a Factor I
- Sampling Rate Conversion by a Rational Factor I/D
- Filter Design and Implementation for sampling rate Conversion
- Multistage Implementation of Sampling Rate Conversion
- Applications of Multirate Signal Processing, Sampling Rate Conversion of Bandpass Signals
- Linear Prediction And Optimum Linear Filters: Innovations Representation
- Forward and Backward linear prediction, Solution of the Normal Equations
- Properties of linear prediction Error Filter, AR Lattice and ARMA Lattice-Ladder Filters

**Exemplar/Case Study:** Implementation for sampling rate Conversion Multi-rate Digital Signal
Processing.

#### Unit IV: Spectral Estimation (07 Hours) → CO1, CO4

- Estimation of density spectrum
- Nonparametric method, Parametric method, Evaluation
- DCT and WT — DCT and KL transform, STFT, WT
- Harr Wavelet and Daubechies Wavelet
- Applications of DCT and WT

**Exemplar/Case Study:** A spectral estimation case study in frequency-domain by subspace methods.

#### Unit V: Speech Processing (07 Hours) → CO5

- Speech coding: Phase Vocoder, LPC, Sub-band coding, Adaptive Transform Coding
- Harmonic Coding, Vector Quantization based Coders
- Fundamentals of Speech recognition, Speech segmentation
- Text-to-speech conversion, speech enhancement
- Speaker Verification, Applications

**Exemplar/Case Study:** Investigation of data augmentation techniques for disordered speech
recognition.

#### Unit VI: Image Processing (07 Hours) → CO6

- Image as 2D signal and image enhancement techniques
- Filter design: low pass, high pass and bandpass for image smoothing and edge detection
- Optimum linear filter and order statistic filter
- Examples — Wiener and Median filters, Applications

**Exemplar/Case Study:** Medical image processing for coronavirus (COVID-19) pandemic: A survey.

### Learning Resources

#### Text Books

1. J. G. Proakis, D. G. Manolakis, "Digital Signal Processing: Principles, Algorithms, and
   Applications", Prentice Hall, 2007
2. Dr. Shaila D. Apate, "Advanced Digital Signal Processing", Wiley Publ., 2013
3. S. K. Mitra, "Digital Signal Processing: A Computer Based Approach", McGraw Hill Higher
   Education, 2006
4. Rabiner and Juang, "Fundamentals of Speech Recognition", Prentice Hall, 1994
5. Rafael C. Gonzalez, Richard E. Woods, "Digital Image Processing and Analysis", Pearson Education,
   2007

#### Reference Books

1. Tarun Rawat, "Digital Signal Processing", Oxford University Press
2. Roberto Crist, "Modern Digital Signal Processing", Cengage Learning
3. Nelson Morgan, Ben Gold, "Speech and Audio Signal Processing", Wiley
4. Raghuveer M. Rao, Ajit S. Bopardikar, "Wavelet Transforms: Introduction to Theory and
   Applications", Pearson

---

### 410253(A): Elective VI — Pattern Recognition

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To learn basic concepts and approaches of Pattern Recognition
- To understand various classification techniques
- To be aware of recent advances in Pattern Recognition
- To learn applications of Pattern Recognition
- To implement optimal path searching and pattern recognition techniques

### Course Outcomes

| CO  | Description                                               |
| --- | --------------------------------------------------------- |
| CO1 | Analyze different pattern recognition techniques          |
| CO2 | Identify and apply various pattern recognition approaches |
| CO3 | Evaluate statistical and structural pattern recognition   |
| CO4 | Perceive recent advances in pattern recognition           |
| CO5 | Implement dynamic programming for pattern recognition     |
| CO6 | Analyze patterns using Genetic Algorithms                 |

### Course Contents

#### Unit I: Introduction to Pattern Recognition (07 Hours) → CO1

- What is Pattern Recognition?
- Pattern Recognition System Design Cycle
- Feature Extraction and Selection
- Models of Pattern Recognition
- Applications of Pattern Recognition

**Exemplar/Case Study:** Water quality analysis, Air quality prediction.

#### Unit II: Statistical Pattern Recognition (07 Hours) → CO2

- Introduction to Bayesian Decision Theory
- Error Estimation
- Parametric Techniques: Maximum Likelihood, Bayesian Estimation
- Non-parametric Techniques: Parzen Window, K-NN Estimation
- Fuzzy Classification

**Exemplar/Case Study:** Spoken word recognition.

#### Unit III: Structural Pattern Recognition (07 Hours) → CO3

- Tree Classifiers, Decision Trees
- Formal Grammars and Parsing
- String and Graph Based Representations
- Syntactic Recognition

**Exemplar/Case Study:** Disease recognition from symptoms.

#### Unit IV: Clustering Techniques (07 Hours) → CO4

- Hierarchical Clustering: Agglomerative, Divisive
- Partitional Clustering: K-Means, K-Medoids
- Graph Based Clustering
- Optimization Methods: Simulated Annealing

**Exemplar/Case Study:** Financial time series clustering.

#### Unit V: Dynamic Programming and Path Searching (07 Hours) → CO5

- Template Matching
- Bellman's Principle of Optimality
- Dynamic Time Warping (DTW)
- Correlation Based Methods

**Exemplar/Case Study:** Handwritten digit recognition using DTW.

#### Unit VI: Advanced Topics and Applications (07 Hours) → CO6

- Fuzzy Logic in Pattern Recognition
- Pattern Classification Using Genetic Algorithms
- Applications: Biometric, Facial, Fingerprint, 3D Object Recognition

**Exemplar/Case Study:** Fingerprint recognition system.

### Learning Resources

#### Text Books

1. Richard O. Duda, Peter E. Hart, David G. Stork, "Pattern Classification", 2nd Edition, Wiley,
   ISBN: 978-0-471-05669-0
2. Sergios Theodoridis, Konstantinos Koutroumbas, "Pattern Recognition", 4th Edition, Academic
   Press, ISBN: 978-1-59749-272-0

#### Reference Books

1. B.D. Ripley, "Pattern Recognition and Neural Networks", Cambridge University Press
2. V. Susheela Devi, M. Narasimha Murty, "Pattern Recognition: An Introduction", Universities Press
3. Malay K. Pakhira, "Digital Image Processing and Pattern Recognition", PHI

---

### 410253(B): Elective VI — Soft Computing

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To study various soft computing approaches and algorithms for problem solving
- To apply soft computing techniques for intelligent systems
- To explore Genetic Algorithms for optimization
- To understand hybrid soft computing systems

### Course Outcomes

| CO  | Description                                                          |
| --- | -------------------------------------------------------------------- |
| CO1 | Be aware of various soft computing techniques and their applications |
| CO2 | Understand and implement Artificial Neural Networks                  |
| CO3 | Implement Evolutionary Computing techniques                          |
| CO4 | Implement Fuzzy Logic for problem solving                            |
| CO5 | Apply Genetic Algorithms for optimization                            |
| CO6 | Develop hybrid soft computing systems                                |

### Course Contents

#### Unit I: Introduction to Soft Computing (07 Hours) → CO1

- What is Soft Computing?
- Soft Computing vs. Hard Computing
- Characteristics of Soft Computing
- Applications of Soft Computing
- Constituents of Soft Computing: ANN, Fuzzy Logic, GA

**Exemplar/Case Study:** Waste water management using soft computing.

#### Unit II: Artificial Neural Networks (07 Hours) → CO2

- Biological Neuron Model
- Artificial Neuron Model: McCulloch-Pitts
- Activation Functions
- ANN Architecture: Single Layer, Multilayer
- Learning Techniques: Supervised, Unsupervised, Reinforcement
- Backpropagation Learning Algorithm

**Exemplar/Case Study:** IBM neuro-symbolic AI, Handwriting recognition.

#### Unit III: Evolutionary Computing (07 Hours) → CO3

- Hill Climbing, Simulated Annealing
- Particle Swarm Optimization (PSO)
- Ant Colony Optimization (ACO)
- Artificial Hummingbird Algorithm

**Exemplar/Case Study:** Engineering application of hummingbird algorithm.

#### Unit IV: Fuzzy Logic (07 Hours) → CO4

- Introduction to Fuzzy Sets, Membership Functions
- Fuzzy Set Operations
- Fuzzy Relations and Composition
- Fuzzy Inference Systems: Mamdani, Sugeno
- Defuzzification Methods
- Fuzzy Logic Controller (FLC)

**Exemplar/Case Study:** Object detection robot using fuzzy logic.

#### Unit V: Genetic Algorithm (07 Hours) → CO5

- Introduction to Genetic Algorithms
- GA Terminologies: Chromosome, Gene, Population
- GA Operators: Selection, Crossover, Mutation
- GA with Constraints
- Classifier Systems

**Exemplar/Case Study:** Traveling Salesman Problem using GA.

#### Unit VI: Hybrid Systems (07 Hours) → CO6

- Need for Hybrid Systems
- Connectionist Production Systems
- Connectionist Logic Programming
- Fuzzy Connectionist Systems
- Application Areas of Hybrid Systems

**Exemplar/Case Study:** Disease prediction models using hybrid systems.

### Learning Resources

#### Text Books

1. S. N. Sivanandam, S. N. Deepa, "Principles of Soft Computing", 3rd Edition, Wiley, ISBN:
   978-81-265-3767-9
2. Jyh-Shing Roger Jang, Chuen-Tsai Sun, Eiji Mizutani, "Neuro-Fuzzy and Soft Computing", PHI, ISBN:
   978-81-203-2243-1

#### Reference Books

1. Leandro N. de Castro, "Fundamentals of Natural Computing: Basic Concepts, Algorithms, and
   Applications", CRC Press
2. S. Rajasekaran, G. A. Vijayalakshmi Pai, "Neural Networks, Fuzzy Logic and Genetic Algorithms:
   Synthesis and Applications", PHI
3. Nikola K. Kasabov, "Foundations of Neural Networks, Fuzzy Systems, and Knowledge Engineering",
   MIT Press
4. Timothy J. Ross, "Fuzzy Logic with Engineering Applications", 3rd Edition, Wiley

---

### 410253(C): Elective VI — Business Intelligence

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To introduce the concepts and components of Business Intelligence
- To understand data warehousing and OLAP
- To study BI technological architecture
- To learn data pre-processing techniques
- To understand ML models for business problems
- To identify the role of BI in specific sectors

### Course Outcomes

| CO  | Description                                                      |
| --- | ---------------------------------------------------------------- |
| CO1 | Differentiate Decision Support Systems and Business Intelligence |
| CO2 | Design and develop BI systems                                    |
| CO3 | Build graphical reports for BI applications                      |
| CO4 | Apply data pre-processing techniques for business data           |
| CO5 | Implement machine learning models for BI                         |
| CO6 | Identify role of BI in various business sectors                  |

### Course Contents

#### Unit I: Introduction to Business Intelligence (07 Hours) → CO1

- Decision Support Systems (DSS): History, Components
- BI Concepts: Definition, Evolution, Scope
- BI Architecture: Data Sources, ETL, Warehouse, Analytics, Presentation
- BI and Ethics
- Successful BI Implementation

**Exemplar/Case Study:** Riverlogic case study.

#### Unit II: Data Warehousing and OLAP (07 Hours) → CO2

- BI and Data Warehousing Architecture
- OLAP vs. OLTP
- Multi-dimensional Data Model: Cubes, Dimensions, Measures
- Schemas: Star, Snowflake, Fact Constellation
- Data Cube Operations: Drill-down, Roll-up, Slice, Dice, Pivot

**Exemplar/Case Study:** Retail industry data warehouse design.

#### Unit III: BI Reporting (07 Hours) → CO3

- Relational vs. Multidimensional Reporting
- Report Grouping, Filtering, Sorting
- Drill-down and Drill-through
- Report Output Formats
- BI Dashboard Design

**Exemplar/Case Study:** Heathrow and Edsby using Power BI.

#### Unit IV: Data Pre-processing for BI (07 Hours) → CO4

- Data Validation and Cleaning
- Data Transformation and Reduction
- Data Exploration: Univariate, Bivariate, Multivariate Analysis
- Feature Engineering for Business Data

**Exemplar/Case Study:** Data preparation case study for business analytics.

#### Unit V: Machine Learning for BI (07 Hours) → CO5

- Classification: Decision Trees, Naive Bayes, SVM
- Clustering: K-Means, Hierarchical
- Association Rules: Apriori Algorithm
- Model Evaluation for Business Applications

**Exemplar/Case Study:** Stock market analysis using ML.

#### Unit VI: BI Tools and Applications (07 Hours) → CO6

- BI Tools: WEKA, KNIME, RapidMiner
- Advanced Analytics in BI
- ERP and BI Integration
- BI Applications: Marketing, Logistics, Finance, Healthcare

**Exemplar/Case Study:** Food distribution and logistics case study.

### Learning Resources

#### Text Books

1. R. Grossmann, S. Rinderle-Ma, "Fundamentals of Business Intelligence", Springer, ISBN:
   978-3-662-46333-4
2. R. Sharda, D. Delen, E. Turban, "Business Intelligence and Analytics: Systems for Decision
   Support", 10th Edition, Pearson, ISBN: 978-0-13-340143-1

#### Reference Books

1. Paulraj Ponniah, "Data Warehousing: Fundamentals for IT Professionals", Wiley
2. Carlo Vercellis, "Business Intelligence: Data Mining and Optimization for Decision Making", Wiley
3. EMC Education Services, "Data Science and Big Data Analytics", Wiley
4. Ken W. Collier, "Agile Analytics: A Value-Driven Approach to Business Intelligence and
   Analytics", Addison-Wesley

---

### 410253(D): Elective VI — Quantum Computing

**Teaching Scheme:** TH: 03 Hours/Week

**Examination:** In-Sem (Paper): 30 Marks, End-Sem (Paper): 70 Marks

**Credits:** 03

### Course Objectives

- To gain expertise in Quantum Computing and Machine Learning
- To use open-source hardware and software for quantum computing
- To develop hybrid quantum-classical solutions
- To study quantum information theory
- To learn quantum algorithms and models

### Course Outcomes

| CO  | Description                                               |
| --- | --------------------------------------------------------- |
| CO1 | Understand the concepts of Quantum Computing              |
| CO2 | Understand mathematical foundation and quantum mechanics  |
| CO3 | Understand building blocks of quantum circuits            |
| CO4 | Understand quantum information processing and simulations |
| CO5 | Understand basic signal processing on quantum             |
| CO6 | Solve examples of Quantum Fourier Transform               |

### Course Contents

#### Unit I: Introduction to Quantum Computing (07 Hours) → CO1

- Introduction to Quantum Computing
- Qubits: Representation, Bloch Sphere
- Quantum Computation: Principles
- Quantum Algorithms
- Quantum Information Processing

#### Unit II: Mathematical Foundations (07 Hours) → CO2

- Linear Algebra Review: Vector Spaces, Matrices, Operators
- Postulates of Quantum Mechanics
- Density Operator
- Measurements in Quantum Systems

#### Unit III: Building Blocks of Quantum Circuits (07 Hours) → CO3

- Quantum Circuits: Quantum Gates, Single Qubit Gates
- CNOT Gate, Multi-Qubit Gates
- Universal Quantum Gates
- Computational Complexity in Quantum Computing

#### Unit IV: Quantum Information and Simulation (07 Hours) → CO4

- Simulation of Quantum Systems
- Fourier Transform: Basics
- Discrete Fourier Transform (DFT)
- Fast Fourier Transform (FFT) Basics

#### Unit V: Quantum Fourier Transform and Algorithms (07 Hours) → CO5, CO6

- Quantum Fourier Transform (QFT)
- Phase Estimation
- Order Finding and Factoring
- Period Finding

#### Unit VI: Quantum Machine Learning and Applications (07 Hours) → CO1

- Quantum Machine Learning and AI
- Quantum Neural Networks
- Quantum Cryptography
- Application Domains: Chemistry, Space, Finance
- Quantum Programming Frameworks: Qiskit, Cirq

### Learning Resources

#### Text Books

1. Michael A. Nielsen, Isaac L. Chuang, "Quantum Computation and Quantum Information", Cambridge
   University Press, ISBN: 978-1-107-00217-3
2. Peter Wittek, "Quantum Machine Learning: What Quantum Computing Means for Data Mining", Academic
   Press, ISBN: 978-0-12-800953-6

#### Reference Books

1. Andreas Wichert, "Principles of Quantum Artificial Intelligence", World Scientific
2. David McMahon, "Quantum Computing Explained", Wiley
3. Microsoft, Amazon, D-Wave Documentation for Quantum Computing Platforms

---

## Laboratory Courses

### 410246: Laboratory Practice III

**Practical:** 04 Hours/Week | **Credits:** 02 | **TW:** 50 Marks | **PR:** 50 Marks

**Assignments from:** Design and Analysis of Algorithms (410241), Machine Learning (410242),
Blockchain Technology (410243)

### 410247: Laboratory Practice IV

**Practical:** 02 Hours/Week | **Credits:** 01 | **TW:** 50 Marks

**Assignments from:** Elective III (410244) and Elective IV (410245)

### 410248: Project Stage I

**Practical:** 02 Hours/Week | **Credits:** 02 | **TW:** 50 Marks

Project work to be carried out individually or in groups under faculty supervision. Includes problem
identification, literature survey, requirement specification, and initial design.

### 410254: Laboratory Practice V

**Practical:** 02 Hours/Week | **Credits:** 01 | **TW:** 50 Marks | **PR:** 50 Marks

**Assignments from:** High Performance Computing (410250), Deep Learning (410251)

### 410255: Laboratory Practice VI

**Practical:** 02 Hours/Week | **Credits:** 01 | **TW:** 50 Marks

**Assignments from:** Elective V (410252) and Elective VI (410253)

### 410256: Project Stage II

**Practical:** 06 Hours/Week | **Credits:** 06 | **TW:** 100 Marks | **OR:** 50 Marks

Final year project continuation from Project Stage I. Includes implementation, testing, deployment,
and final project report submission with oral presentation.

---

# General Guidelines

1. Every undergraduate program has its own objectives and educational outcomes. The Program Outcomes
   (POs) for Engineering are categorically mentioned at the beginning of the curriculum.
2. @: CO and PO Mapping Matrix indicates correlation levels of 3 (high), 2 (medium), 1 (low) and '-'
   (no correlation).
3. #: Elaborated examples/Case Studies are included at the end of each unit. May be assigned as
   self-study, excluded from theory examinations.
4. For laboratory courses, set of suggested assignments is provided for reference. Beyond curriculum
   assignments and mini-project may be included.
5. For each laboratory assignment, students must draw/write/generate flowchart, algorithm, test
   cases, mathematical model, Test data set and comparative/complexity analysis (as applicable).
6. Term Work is continuous assessment that evaluates a student's progress throughout the semester.
7. Laboratory Journal — Program codes with sample output submitted as softcopy. Use of DVD is
   encouraged.
8. Audit Course — Students registered shall be awarded grade AP/PP. No grade points associated.

**Abbreviations:**

- TH: Theory
- TUT: Tutorial
- PR: Practical
- TW: Term Work
- OR: Oral
- Sem: Semester
