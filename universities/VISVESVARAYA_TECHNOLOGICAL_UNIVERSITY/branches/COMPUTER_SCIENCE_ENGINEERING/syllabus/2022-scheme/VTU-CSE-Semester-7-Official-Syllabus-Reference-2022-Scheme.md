# VTU Seventh Semester Computer Science & Engineering — Official Syllabus Reference (2022 Scheme)

> Extracted from official VTU syllabus documents (effective from Academic Year 2023-24).
>
> This document provides exact module-wise syllabus, course outcomes, examination structure,
> laboratory work, practical guidelines and curriculum information for the Seventh Semester of B.E.
> in Computer Science and Engineering under the 2022 Scheme.
>
> No syllabus topic has been intentionally omitted or condensed.

---

# Semester VII — Course Structure (Swappable with Semester VIII)

| Sl. | Course Code   | Course Title                    | L:T:P:S  | CIE     | SEE     | Total   | Credits |
| --- | ------------- | ------------------------------- | -------- | ------- | ------- | ------- | ------- |
| 1   | BCS701 (IPCC) | Internet of Things              | 3:0:2:0  | 50      | 50      | 100     | 4       |
| 2   | BCS702 (IPCC) | Parallel Computing              | 3:0:2:0  | 50      | 50      | 100     | 4       |
| 3   | BCS703        | Cryptography & Network Security | 4:0:0:0  | 50      | 50      | 100     | 4       |
| 4   | BCS714x       | Professional Elective Course    | 3:0:0:0  | 50      | 50      | 100     | 3       |
| 5   | BCS755x       | Open Elective Course            | 3:0:0:0  | 50      | 50      | 100     | 3       |
| 6   | BCS786        | Major Project Phase-II          | 0:0:12:0 | 100     | 100     | 200     | 6       |
|     | **Total**     |                                 |          | **400** | **300** | **700** | **24**  |

**Professional Elective (PEC) Options (BCS714x):**

- BCS714A: Deep Learning
- BCS714B: Natural Language Processing
- BAD714D: Social Network Analysis
- BCS714D: Big Data Analytics

**Open Elective Options (BCS755x):**

- BCS755A: Introduction to DBMS
- BCS755B: Introduction to Algorithms
- BCS755C: Software Engineering
- BCS755D: Open Elective

---

## BCS701: Internet of Things (IPCC)

**Teaching Scheme:** Theory: 03 Hours/Week, Practical: 02 Hours/Week

**Credits:** 04 (Theory 3 + Practical 1)

**Examination:** CIE: 50 Marks, SEE: 50 Marks, Total: 100 Marks

**Examination Nature:** Theory/Practical (Integrated)

### Course Objectives

- Understand the fundamentals of IoT architecture and protocols
- Learn sensor interfacing and embedded system design for IoT
- Explore cloud platforms for IoT data processing and analytics
- Develop IoT applications for smart environments

### Course Outcomes

| CO  | Description                                                    |
| --- | -------------------------------------------------------------- |
| CO1 | Explain IoT architecture, protocols, and enabling technologies |
| CO2 | Interface sensors and actuators with IoT development boards    |
| CO3 | Implement communication protocols for IoT (MQTT, CoAP, HTTP)   |
| CO4 | Process and analyze IoT data using cloud platforms             |
| CO5 | Design and develop IoT applications for real-world problems    |

### Course Contents

#### Module 1: Introduction to IoT (08 Hours)

- Definition and Characteristics of IoT
- Physical Design: Things in IoT, IoT Protocols
- Logical Design: Functional Blocks, Communication Models, APIs
- IoT Enabling Technologies: WSN, Cloud Computing, Big Data, Embedded Systems
- IoT Levels and Deployment Templates
- IoT vs M2M

#### Module 2: IoT Hardware and Sensors (08 Hours)

- Sensors: Temperature, Humidity, Motion, Light, Ultrasonic, Gas
- Actuators: Relays, Motors, Solenoids
- IoT Development Boards: Arduino, Raspberry Pi, ESP32, NodeMCU
- GPIO Programming: Digital I/O, Analog Input, PWM
- Interfacing Sensors with Microcontrollers

#### Module 3: IoT Protocols and Connectivity (08 Hours)

- IEEE 802.15.4: LR-WPAN Standard
- 6LoWPAN: IPv6 over Low-Power Wireless Personal Area Networks
- ZigBee, Z-Wave, Bluetooth Low Energy (BLE)
- LoRaWAN, NB-IoT
- Application Layer Protocols: MQTT, CoAP, AMQP, HTTP
- MQTT Architecture: Broker, Publisher, Subscriber

#### Module 4: IoT Cloud Platforms and Analytics (08 Hours)

- Cloud Computing for IoT: AWS IoT Core, Azure IoT Hub, Google Cloud IoT
- Data Storage and Management: Time-series Databases, Edge Computing
- Data Analytics: Stream Processing, Batch Processing
- IoT Dashboards and Visualization
- Integration with REST APIs

#### Module 5: IoT Security and Applications (08 Hours)

**IoT Security:**

- Security Challenges: Authentication, Encryption, Access Control
- Device and Network Security
- Blockchain for IoT Security
- Privacy Concerns in IoT

**IoT Applications:**

- Smart Home: Lighting, HVAC, Security Systems
- Smart City: Traffic Management, Waste Management
- Industrial IoT (IIoT): Predictive Maintenance
- Healthcare IoT: Remote Patient Monitoring
- Agricultural IoT: Smart Irrigation

### Learning Resources

#### Textbooks

1. Arshdeep Bahga, Vijay Madisetti, "Internet of Things: A Hands-On Approach", Universities Press,
   2015
2. Adrian McEwen, Hakim Cassimally, "Designing the Internet of Things", Wiley, 2013

#### Reference Books

1. Raj Kamal, "Internet of Things: Architecture and Design Principles", McGraw Hill, 2017
2. David Hanes, "IoT Fundamentals: Networking Technologies, Protocols, and Use Cases", Cisco Press,
   2017
3. O. Vermesan, P. Friess, "Internet of Things: Converging Technologies for Smart Environments",
   River Publishers, 2013

---

## BCS702: Parallel Computing (IPCC)

**Teaching Scheme:** Theory: 03 Hours/Week, Practical: 02 Hours/Week

**Credits:** 04 (Theory 3 + Practical 1)

**Examination:** CIE: 50 Marks, SEE: 50 Marks, Total: 100 Marks

**Examination Nature:** Theory/Practical (Integrated)

### Course Objectives

- Understand parallel computing principles and architectures
- Learn parallel algorithm design and performance analysis
- Study shared memory and distributed memory programming models
- Implement parallel programs using OpenMP, MPI, and CUDA

### Course Outcomes

| CO  | Description                                                        |
| --- | ------------------------------------------------------------------ |
| CO1 | Explain parallel computing architectures and models                |
| CO2 | Design and analyze parallel algorithms for computational problems  |
| CO3 | Implement parallel programs using OpenMP for shared memory systems |
| CO4 | Develop distributed memory parallel programs using MPI             |
| CO5 | Implement GPU-accelerated programs using CUDA                      |

### Course Contents

#### Module 1: Introduction to Parallel Computing (08 Hours)

**Parallel Computing Overview:**

- Motivating Parallelism
- Scope of Parallel Computing
- Levels of Parallelism: Bit-level, Instruction-level, Data, Task

**Parallel Architectures:**

- Flynn's Taxonomy: SISD, SIMD, MISD, MIMD
- Shared Memory: UMA, NUMA, CC-NUMA
- Distributed Memory: Clusters, Massively Parallel Processors
- GPU Architecture: SIMT Model

**Parallel Programming Models:**

- Shared Memory: Threads, OpenMP
- Distributed Memory: Message Passing (MPI)
- Data Parallel: CUDA, OpenCL
- Hybrid Models

#### Module 2: Parallel Algorithm Design (08 Hours)

**Decomposition Techniques:**

- Domain Decomposition: Data Parallelism
- Functional Decomposition: Task Parallelism
- Recursive Decomposition: Divide and Conquer
- Exploratory Decomposition: Search-based

**Tasks and Interactions:**

- Granularity: Fine, Coarse
- Load Balancing: Static, Dynamic
- Mapping and Scheduling

**Performance Analysis:**

- Speedup, Efficiency, Scalability
- Amdahl's Law, Gustafson's Law
- Isoefficiency Metric

#### Module 3: Shared Memory Programming with OpenMP (08 Hours)

- OpenMP Overview: Fork-Join Model
- Parallel Regions: #pragma omp parallel
- Work Sharing: for, sections, single
- Synchronization: critical, atomic, barrier, reduction
- Data Scoping: private, shared, firstprivate, lastprivate
- Scheduling: static, dynamic, guided, runtime
- OpenMP Tasks and Task Dependencies

#### Module 4: Distributed Memory Programming with MPI (08 Hours)

- MPI: Process Model, Communicators
- Point-to-Point Communication: MPI_Send, MPI_Recv
- Collective Communication: Broadcast, Scatter, Gather, Reduce, Alltoall
- Derived Data Types
- Virtual Topologies
- Non-blocking Communication
- Parallel I/O with MPI

#### Module 5: GPU Computing with CUDA (08 Hours)

- GPU Architecture: Streaming Multiprocessors, Warps, Thread Blocks
- CUDA Programming Model: Host, Device, Kernels
- Memory Hierarchy: Global, Shared, Constant, Texture
- Thread Synchronization
- CUDA Optimization: Memory Coalescing, Occupancy, Bank Conflicts
- Practical Examples: Vector Addition, Matrix Multiplication, Convolution

### Practical Component (IPCC)

1. Measure speedup of parallel vs sequential programs
2. Implement matrix multiplication using OpenMP
3. Parallelize merge sort using OpenMP tasks
4. Implement parallel reduction using OpenMP
5. Implement broadcast and reduce operations using MPI
6. Perform matrix-vector multiplication using MPI
7. Implement parallel prefix sum (scan) using CUDA
8. Implement 2D convolution on GPU using CUDA
9. Perform parallel image processing operations
10. Mini-project: Parallel application (e.g., parallel image denoising, N-body simulation)

### Learning Resources

#### Textbooks

1. Ananth Grama, Anshul Gupta, George Karypis, Vipin Kumar, "Introduction to Parallel Computing",
   2nd Edition, Addison-Wesley, 2003
2. John Cheng, Max Grossman, Ty McKercher, "Professional CUDA C Programming", Wiley, 2014

#### Reference Books

1. Peter S. Pacheco, "An Introduction to Parallel Programming", Morgan Kaufmann, 2011
2. David B. Kirk, Wen-mei W. Hwu, "Programming Massively Parallel Processors", 3rd Edition, Morgan
   Kaufmann, 2017

---

## BCS703: Cryptography & Network Security

**Teaching Scheme:** Theory: 04 Hours/Week | **Credits:** 04 | **Total Hours:** 50

**Examination:** CIE: 50 Marks, SEE: 50 Marks, Total: 100 Marks

**Examination Nature:** Theory (03 Hours)

### Course Objectives

- Understand fundamental concepts of cryptography and network security
- Learn symmetric and asymmetric encryption algorithms
- Study authentication, digital signatures, and key management
- Explore network security protocols and system security

### Course Outcomes

| CO  | Description                                                              |
| --- | ------------------------------------------------------------------------ |
| CO1 | Explain security concepts, threats, and cryptographic mechanisms         |
| CO2 | Apply symmetric and asymmetric encryption algorithms for data protection |
| CO3 | Implement authentication protocols and digital signature schemes         |
| CO4 | Analyze network security protocols (IPSec, SSL/TLS, PGP)                 |
| CO5 | Evaluate system security mechanisms including firewalls and IDS          |

### Course Contents

#### Module 1: Introduction to Security and Classical Encryption (10 Hours)

**Security Fundamentals:**

- CIA Triad: Confidentiality, Integrity, Availability
- Security Attacks: Passive (Eavesdropping, Traffic Analysis), Active (Masquerade, Replay, DoS)
- Security Services: Authentication, Access Control, Non-repudiation
- Security Mechanisms: Encryption, Digital Signatures, Access Control

**Classical Encryption Techniques:**

- Substitution Ciphers: Caesar, Monoalphabetic, Playfair, Hill, Vigenere
- Transposition Ciphers: Rail Fence, Columnar
- Steganography
- Cryptanalysis Principles

#### Module 2: Symmetric and Asymmetric Cryptography (10 Hours)

**Symmetric Key Cryptography:**

- Block Cipher Principles: Feistel Structure
- Data Encryption Standard (DES): Structure, Key Schedule, Modes of Operation
- Advanced Encryption Standard (AES): Structure, Rounds, Key Expansion
- Block Cipher Modes: ECB, CBC, CFB, OFB, CTR

**Asymmetric Key Cryptography:**

- Principles of Public-Key Cryptography
- RSA Algorithm: Key Generation, Encryption, Decryption, Signing
- Elliptic Curve Cryptography (ECC)
- Diffie-Hellman Key Exchange

#### Module 3: Authentication, Hash Functions, and Digital Signatures (10 Hours)

**Cryptographic Hash Functions:**

- Requirements, Security Properties
- SHA-512: Structure, Compression Function
- Message Authentication Codes (MAC): HMAC

**Digital Signatures:**

- Digital Signature Standard (DSS)
- ECDSA
- Digital Certificate: X.509 Format
- Public Key Infrastructure (PKI): CA, Registration, Certificate Chains

#### Module 4: Network Security Protocols (10 Hours)

**IP Security (IPSec):**

- IPSec Architecture: AH, ESP
- Security Associations (SA)
- IKE Protocol
- VPN Configuration

**SSL/TLS:**

- SSL Architecture: Record, Handshake, Change Cipher Spec, Alert Protocols
- TLS 1.3 Improvements
- HTTPS Protocol

**Email Security:**

- PGP (Pretty Good Privacy): Key Management, Encryption, Authentication
- S/MIME

**Web Security:**

- SET (Secure Electronic Transaction)
- Web Authentication: OAuth, OpenID Connect, SAML

#### Module 5: System Security and Recent Trends (10 Hours)

**Firewall:**

- Packet Filtering, Stateful Inspection, Application Gateway
- Firewall Architecture: Screened Host, Screened Subnet

**Intrusion Detection and Prevention:**

- IDS Types: Signature-based, Anomaly-based
- HIDS vs NIDS
- Snort

**Wireless Security:**

- WEP, WPA2, WPA3
- IEEE 802.11i

**Recent Trends:**

- Cloud Security: Shared Responsibility
- IoT Security Challenges
- Blockchain Security
- Zero Trust Architecture

### Learning Resources

#### Textbooks

1. William Stallings, "Cryptography and Network Security: Principles and Practice", 7th Edition,
   Pearson, 2017
2. Atul Kahate, "Cryptography and Network Security", 4th Edition, McGraw Hill, 2019

#### Reference Books

1. Charles P. Pfleeger, Shari Lawrence Pfleeger, "Security in Computing", 5th Edition, Pearson, 2015
2. Bruce Schneier, "Applied Cryptography", 2nd Edition, Wiley, 2015
3. Behrouz A. Forouzan, "Cryptography and Network Security", 3rd Edition, McGraw Hill, 2015

---

## BCS714A: Deep Learning (Professional Elective)

**Teaching Scheme:** Theory: 03 Hours/Week | **Credits:** 03 | **Total Hours:** 40

**Examination:** CIE: 50 Marks, SEE: 50 Marks, Total: 100 Marks

### Course Objectives

- Understand deep learning fundamentals and neural network architectures
- Learn CNNs, RNNs, and generative models
- Implement deep learning solutions using frameworks like TensorFlow/PyTorch

### Course Outcomes

| CO  | Description                                                            |
| --- | ---------------------------------------------------------------------- |
| CO1 | Explain the foundations of deep learning and neural networks           |
| CO2 | Design and train Convolutional Neural Networks (CNNs) for visual tasks |
| CO3 | Implement RNNs and LSTMs for sequential data analysis                  |
| CO4 | Apply generative models including GANs and autoencoders                |
| CO5 | Deploy deep learning models for real-world applications                |

### Course Contents

#### Module 1: Foundations of Deep Learning (08 Hours)

- Machine Learning vs Deep Learning
- Biological Neuron vs Artificial Neuron
- Perceptron: Architecture, Limitations
- Multilayer Perceptron: Architecture, Backpropagation
- Activation Functions: Sigmoid, Tanh, ReLU, Leaky ReLU, Softmax
- Loss Functions: MSE, Cross-Entropy, Hinge
- Regularization: L1, L2, Dropout, Early Stopping
- Hyperparameter Tuning: Learning Rate, Batch Size, Epochs

#### Module 2: Convolutional Neural Networks (08 Hours)

- CNN Architecture: Convolution, Pooling, Fully Connected
- Convolution Operation: Padding, Stride, Filters
- Pooling Layers: Max, Average, Global Average
- CNN Architectures: LeNet-5, AlexNet, VGGNet, ResNet, Inception
- Transfer Learning: Feature Extraction, Fine-tuning
- Data Augmentation: Rotation, Flip, Zoom, Crop
- Object Detection: YOLO, SSD (Conceptual)

#### Module 3: Recurrent Neural Networks (08 Hours)

- RNN Architecture: Sequence Models, Unfolding
- Vanishing/Exploding Gradient Problem
- LSTM: Gates (Forget, Input, Output), Cell State
- GRU: Reset and Update Gates
- Bidirectional RNNs
- Sequence-to-Sequence Models with Attention
- Applications: Text Classification, Time Series, Language Modeling

#### Module 4: Generative Models and Autoencoders (08 Hours)

- Autoencoders: Undercomplete, Denoising, Variational (VAE)
- Generative Adversarial Networks (GANs): Generator, Discriminator
- GAN Training: Min-Max Game, Nash Equilibrium
- DCGAN, Conditional GAN
- Applications of GANs: Image Generation, Super-resolution, Style Transfer

#### Module 5: Advanced Topics and Deployment (08 Hours)

- Attention Mechanisms: Self-Attention, Multi-Head Attention
- Transformer Architecture: Encoder, Decoder
- BERT: Pre-training, Fine-tuning
- GPT: Autoregressive Language Models
- Model Deployment: TensorFlow Serving, ONNX, TFLite
- Ethical Considerations in Deep Learning

### Learning Resources

#### Textbooks

1. Ian Goodfellow, Yoshua Bengio, Aaron Courville, "Deep Learning", MIT Press, 2016
2. Francois Chollet, "Deep Learning with Python", 2nd Edition, Manning, 2021

#### Reference Books

1. Aston Zhang et al., "Dive into Deep Learning", Cambridge University Press, 2023
2. Josh Patterson, Adam Gibson, "Deep Learning: A Practitioner's Approach", O'Reilly, 2017

---

## BCS714B: Natural Language Processing (Professional Elective)

**Teaching Scheme:** Theory: 03 Hours/Week | **Credits:** 03 | **Total Hours:** 40

**Examination:** CIE: 50 Marks, SEE: 50 Marks, Total: 100 Marks

### Course Objectives

- Understand the fundamentals of NLP and text processing
- Learn statistical and neural approaches to NLP
- Build applications using modern NLP techniques

### Course Outcomes

| CO  | Description                                                              |
| --- | ------------------------------------------------------------------------ |
| CO1 | Apply text preprocessing techniques for NLP tasks                        |
| CO2 | Implement word embeddings and language models                            |
| CO3 | Design NLP systems using sequence models and transformers                |
| CO4 | Build applications for text classification, NER, and machine translation |

### Course Contents

#### Module 1: Text Processing and Language Modeling (08 Hours)

- Text Preprocessing: Tokenization, Stemming, Lemmatization
- POS Tagging: HMM-based, CRF-based
- N-gram Language Models: Estimation, Smoothing (Laplace, Kneser-Ney)
- Named Entity Recognition (NER)
- Text Classification: Naive Bayes, Logistic Regression

#### Module 2: Word Embeddings (08 Hours)

- Distributional Semantics
- Word2Vec: CBOW, Skip-gram
- GloVe: Global Vectors
- FastText: Subword Information
- Evaluating Embeddings: Word Similarity, Analogy Tasks

#### Module 3: Sequence Models for NLP (08 Hours)

- RNNs for Sequence Labeling
- LSTM and GRU for Text Processing
- Bidirectional RNNs
- Sequence-to-Sequence Models
- Attention Mechanism: Additive, Multiplicative, Scaled Dot-Product

#### Module 4: Transformer and Pre-trained Models (08 Hours)

- Transformer Architecture: Self-Attention, Multi-Head Attention, Positional Encoding
- BERT: Pre-training (Masked LM, Next Sentence Prediction), Fine-tuning
- GPT: Autoregressive Pre-training
- Sentence Embeddings: SBERT, Sentence Transformers
- Fine-tuning Transformers: Hugging Face Library

#### Module 5: NLP Applications (08 Hours)

- Sentiment Analysis
- Machine Translation: Encoder-Decoder, Transformer
- Text Summarization: Extractive, Abstractive
- Question Answering
- Chatbots and Dialogue Systems
- Information Extraction
- Evaluation Metrics: BLEU, ROUGE, METEOR

### Learning Resources

#### Textbooks

1. Daniel Jurafsky, James H. Martin, "Speech and Language Processing", 3rd Edition, Pearson, 2022
2. Jacob Eisenstein, "Introduction to Natural Language Processing", MIT Press, 2019

#### Reference Books

1. Yoav Goldberg, "Neural Network Methods in Natural Language Processing", Morgan & Claypool, 2017
2. Christopher D. Manning, Hinrich Schütze, "Foundations of Statistical Natural Language
   Processing", MIT Press, 1999

---

## BCS714D: Big Data Analytics (Professional Elective)

**Teaching Scheme:** Theory: 03 Hours/Week | **Credits:** 03 | **Total Hours:** 40

**Examination:** CIE: 50 Marks, SEE: 50 Marks, Total: 100 Marks

### Course Objectives

- Understand big data fundamentals and processing frameworks
- Learn Hadoop ecosystem components
- Apply data analytics using Spark and MapReduce

### Course Outcomes

| CO  | Description                                               |
| --- | --------------------------------------------------------- |
| CO1 | Explain big data characteristics and the Hadoop ecosystem |
| CO2 | Process large datasets using MapReduce programming model  |
| CO3 | Analyze data using Apache Spark and its MLlib             |
| CO4 | Apply NoSQL databases for big data storage                |
| CO5 | Visualize and present big data analytics results          |

### Course Contents

#### Module 1: Introduction to Big Data (08 Hours)

- Big Data: 5Vs (Volume, Velocity, Variety, Veracity, Value)
- Big Data vs Traditional Data
- Big Data Analytics Lifecycle
- Challenges in Big Data
- Big Data Use Cases: Healthcare, Retail, Finance

#### Module 2: Hadoop Ecosystem (08 Hours)

- HDFS: Architecture, NameNode, DataNode, Replication
- YARN: Resource Manager, Node Manager, Scheduler
- MapReduce: Mapper, Reducer, Combiner, Partitioner
- Hadoop Cluster Setup and Configuration
- Hive: Data Warehousing, HiveQL
- Pig: Data Flow Scripting

#### Module 3: Apache Spark (08 Hours)

- Spark Architecture: Driver, Executor, Cluster Manager
- RDDs: Transformations, Actions, Lineage
- Spark DataFrames and Datasets
- Spark SQL
- Spark Streaming: DStreams, Structured Streaming
- Spark Performance Tuning

#### Module 4: Big Data Analytics with Spark MLlib (08 Hours)

- MLlib Overview
- Feature Engineering: VectorAssembler, StringIndexer, OneHotEncoder
- Regression: Linear Regression, Decision Tree Regression
- Classification: Logistic Regression, Random Forest, Gradient Boosting
- Clustering: K-Means, Bisecting K-Means
- Recommendation: ALS

#### Module 5: NoSQL Databases and Data Visualization (08 Hours)

- NoSQL: CAP Theorem, BASE Properties
- HBase: Column-Family Store, Schema Design
- MongoDB: Document Store, CRUD, Aggregation
- Neo4j: Graph Database, Cypher Query Language
- Data Visualization: Tableau, Power BI
- Big Data in Cloud: AWS EMR, Azure HDInsight, GCP Dataproc

### Learning Resources

#### Textbooks

1. Tom White, "Hadoop: The Definitive Guide", 4th Edition, O'Reilly, 2015
2. Bill Chambers, Matei Zaharia, "Spark: The Definitive Guide", O'Reilly, 2018

#### Reference Books

1. Seema Acharya, Subhashini Chellappan, "Big Data and Analytics", Wiley, 2015
2. Prajapati, "Big Data Analytics with R and Hadoop", Packt, 2013

---

## BCS786: Major Project Phase-II

**Teaching Scheme:** Practical: 12 Hours/Week | **Credits:** 06

**Examination:** CIE: 100 Marks, SEE: 100 Marks, Total: 200 Marks

### Course Objectives

- Apply software engineering principles to develop a complete project
- Demonstrate technical competency in a chosen domain
- Develop professional documentation and presentation skills

### Course Outcomes

| CO  | Description                                                                  |
| --- | ---------------------------------------------------------------------------- |
| CO1 | Identify and analyze a real-world problem requiring a computational solution |
| CO2 | Design and implement a complete software/hardware solution                   |
| CO3 | Test and validate the solution against requirements                          |
| CO4 | Document and present the project work professionally                         |

### Evaluation

**CIE (100 marks):** Based on project work Report (50%), presentation skill (25%), Q&A session (25%)
**SEE (100 marks):** Based on project work Report (50%), presentation skill (25%), Q&A session (25%)

---

# Assessment Details (Common for All Courses)

## Continuous Internal Evaluation (CIE)

- **Assignment component:** 25 marks
- **Internal Assessment Test component:** 25 marks
- First test after 40-50% syllabus coverage; second test after 85-90% coverage
- Minimum passing: 40% of CIE marks (20 out of 50)

**For IPCC (Integrated Professional Core Course):**

- Theory CIE: 15 marks (two tests) + 10 marks (other assessments)
- Practical CIE: 15 marks (experiment conduction) + 10 marks (lab test)

## Semester End Examination (SEE)

- **Theory:** 03 hours, 10 questions (2 per module), answer 5
- Marks proportionally scaled to 50
- Minimum passing: 35% of SEE marks (18 out of 50)

## Overall Passing Criteria

Minimum **40% (40 out of 100)** in the sum total of CIE and SEE taken together.

---

> **Disclaimer:** This document is compiled from official VTU syllabus documents (2022 Scheme) for
> reference purposes. For the latest updates, always refer to: https://vtu.ac.in
