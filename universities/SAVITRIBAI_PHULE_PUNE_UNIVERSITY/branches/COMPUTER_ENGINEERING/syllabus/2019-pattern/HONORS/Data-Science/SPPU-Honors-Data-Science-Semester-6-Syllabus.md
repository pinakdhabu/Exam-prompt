# SPPU B.E. Computer Engineering — Honors in Data Science

## Semester VI Syllabus (2019 Pattern)

---

## Course Structure — Semester VI

| Course Code | Course Name                   |  TH   |  PR   | Credits |  ISA   |  ESA   |  Total  |
| ----------- | ----------------------------- | :---: | :---: | :-----: | :----: | :----: | :-----: |
| 310503      | Big Data Analytics            |   3   |   —   |    3    |   30   |   70   |   100   |
| 310504      | Big Data Analytics Laboratory |   —   |   2   |    1    |   25   |   25   |   50    |
| **Total**   |                               | **3** | **2** |  **4**  | **55** | **95** | **150** |

---

## 310503: Big Data Analytics

**Teaching Scheme:** Theory: 03 Hours/Week | **Credits:** 03

**Examination:** ISA: 30, ESA: 70

**Prerequisites:** Data Science and Visualization (310501)

### Course Objectives

- Understand big data concepts and Hadoop ecosystem
- Learn MapReduce programming paradigm
- Master Apache Spark for large-scale data processing
- Apply big data analytics for business insights

### Course Outcomes

| CO  | Description                                                      |
| --- | ---------------------------------------------------------------- |
| CO1 | Explain big data characteristics and Hadoop ecosystem components |
| CO2 | Process large datasets using MapReduce paradigm                  |
| CO3 | Analyze data using Apache Spark DataFrames and SQL               |
| CO4 | Apply Spark MLlib for scalable machine learning                  |
| CO5 | Implement real-time data processing with Spark Streaming         |

### Course Contents

#### Unit I: Introduction to Big Data (07 Hours)

- Big Data: 5Vs — Volume, Velocity, Variety, Veracity, Value
- Big Data vs Traditional Data Processing
- Big Data Analytics Lifecycle
- Challenges in Big Data: Storage, Processing, Governance
- Big Data Use Cases: Healthcare, Finance, Retail, Social Media
- Introduction to Hadoop: History, Ecosystem, Architecture

#### Unit II: Hadoop Distributed File System (07 Hours)

- HDFS Architecture: NameNode, DataNode, Secondary NameNode
- HDFS Read/Write Operations
- HDFS Commands: File Management, Permissions
- Data Replication: Strategy, Rack Awareness
- HDFS Data Blocks: Size, Storage, Reliability
- HDFS Federation, High Availability

#### Unit III: MapReduce Programming (07 Hours)

- MapReduce Paradigm: Mapper, Reducer, Combiner, Partitioner
- MapReduce Workflow: Input Splits, Map, Shuffle, Sort, Reduce
- Hadoop MapReduce Job Configuration
- Input/Output Formats: TextInputFormat, SequenceFileInputFormat
- MapReduce Examples: Word Count, Joins, Sorting
- YARN Architecture: ResourceManager, NodeManager, Container

#### Unit IV: Apache Spark (07 Hours)

- Spark Architecture: Driver, Executor, Cluster Manager
- RDDs: Transformations, Actions, Lineage, Persistence
- Spark DataFrames: Schema, Operations, Optimization
- Spark SQL: Queries, Temp Views, Hive Integration
- Spark vs MapReduce: Performance Comparison
- Spark Cluster Deployment: Standalone, YARN, Mesos, Kubernetes

#### Unit V: Scalable Machine Learning with MLlib (07 Hours)

- MLlib Overview: Data Types, Pipelines
- Feature Engineering: VectorAssembler, StringIndexer, OneHotEncoder
- Classification: Logistic Regression, Decision Tree, Random Forest
- Regression: Linear Regression, GBT Regression
- Clustering: K-Means, LDA
- Recommendation: ALS (Alternating Least Squares)
- Model Tuning: Cross-validator, Train-validation Split

#### Unit VI: Streaming and Graph Analytics (07 Hours)

- Spark Streaming: DStreams, Structured Streaming
- Kafka Integration: Producer, Consumer
- Real-time Analytics: Window Operations, Stateful Processing
- GraphX: Graph Computation, PageRank, Connected Components
- GraphFrames: Graph Queries, Motif Finding
- Big Data in Cloud: AWS EMR, Azure HDInsight, GCP Dataproc

### Learning Resources

#### Textbooks

1. Tom White, "Hadoop: The Definitive Guide", 4th Edition, O'Reilly, 2015
2. Bill Chambers, Matei Zaharia, "Spark: The Definitive Guide", O'Reilly, 2018

#### Reference Books

1. Holden Karau, "Learning Spark", 2nd Edition, O'Reilly, 2020
2. Jules S. Damji, "Learning Spark", 2nd Edition, O'Reilly, 2020

---

## 310504: Big Data Analytics Laboratory

**Teaching Scheme:** Practical: 02 Hours/Week | **Credits:** 01

**Examination:** TW: 25, PR: 25

### Laboratory Experiments

1. Install and configure Hadoop in pseudo-distributed mode
2. HDFS file management operations (put, get, mkdir, chmod)
3. Implement Word Count using MapReduce
4. Implement MapReduce for data aggregation and joins
5. Set up Apache Spark and perform RDD transformations
6. Analyze data using Spark DataFrames and SQL
7. Build a classification model using Spark MLlib
8. Implement real-time streaming with Spark + Kafka
9. Perform graph analysis using GraphFrames
10. Mini-project: Big data analytics pipeline on real dataset

---

> **Official Source:** http://www.unipune.ac.in | SPPU, Pune
