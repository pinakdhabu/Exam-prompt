# SPPU B.E. Computer Engineering — Honors in Data Science
## Semester VIII Syllabus (2019 Pattern)

---

## Course Structure — Semester VIII

| Course Code | Course Name | TH | PR | Credits | ISA | ESA | Total |
|-------------|-------------|:--:|:--:|:-------:|:---:|:---:|:-----:|
| 410503 | Data Engineering and Pipelines | 3 | — | 3 | 30 | 70 | 100 |
| 410504 | Data Engineering Laboratory | — | 2 | 1 | 25 | 25 | 50 |
| **Total** | | **3** | **2** | **4** | **55** | **95** | **150** |

---

## 410503: Data Engineering and Pipelines

**Teaching Scheme:** Theory: 03 Hours/Week | **Credits:** 03

**Prerequisites:** Big Data Analytics (310503), ML and Data Science (410501)

### Course Objectives
- Design and build robust data pipelines for production
- Master ETL/ELT processes and data warehouse design
- Implement data quality, governance, and monitoring

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Design data pipeline architectures for various use cases |
| CO2 | Implement ETL/ELT processes using modern tools |
| CO3 | Build and manage data warehouses and data lakes |
| CO4 | Implement data quality monitoring and governance |
| CO5 | Orchestrate complex data workflows |

### Course Contents

#### Unit I: Data Pipeline Architecture (07 Hours)
- Data Pipeline Fundamentals: Sources, Processing, Storage
- Batch vs Streaming Pipelines
- Lambda Architecture: Batch + Speed Layer
- Kappa Architecture: Streaming-first
- Data Lake vs Data Warehouse vs Lakehouse
- Pipeline Orchestration: DAGs, Scheduling, Monitoring

#### Unit II: ETL/ELT and Data Integration (07 Hours)
- ETL vs ELT: When to Use Each
- Data Extraction: APIs, Databases, Web Scraping, Log Files
- Data Transformation: Cleaning, Enrichment, Aggregation
- Data Loading: Full vs Incremental Loads
- Change Data Capture (CDC): Debezium, Kafka Connect
- Data Integration Tools: Apache NiFi, Talend, Airbyte

#### Unit III: Data Warehousing and Modeling (07 Hours)
- Dimensional Modeling: Star Schema, Snowflake Schema
- Fact Tables: Transactional, Periodic Snapshot, Cumulative Snapshot
- Dimension Tables: Slowly Changing Dimensions (SCD Type 1, 2, 3)
- Data Warehouse Architecture: Kimball, Inmon, Data Vault
- SQL for Analytics: Window Functions, CTEs, Complex Joins
- OLAP Cubes: MOLAP, ROLAP, HOLAP

#### Unit IV: Data Lake and Lakehouse (07 Hours)
- Data Lake Architecture: Storage, Catalog, Governance
- Apache Iceberg: Table Format, Partitioning, Snapshots
- Delta Lake: ACID Transactions, Schema Enforcement, Time Travel
- Apache Hudi: Copy-on-Write, Merge-on-Read
- Lakehouse Architecture: Databricks, Apache Spark
- Data Catalog: Apache Atlas, DataHub, Amundsen

#### Unit V: Workflow Orchestration (07 Hours)
- Apache Airflow: DAGs, Operators, Sensors, Executors
- Apache Beam: Unified Batch and Streaming
- Prefect: Workflow as Code, Retries, Notifications
- Dagster: Asset-based Orchestration
- Scheduling: Cron, Event-driven, Sensor-based
- Monitoring and Alerting: Prometheus, Grafana, PagerDuty

#### Unit VI: Data Quality and Governance (07 Hours)
- Data Quality Dimensions: Accuracy, Completeness, Consistency, Timeliness
- Data Quality Frameworks: Great Expectations, Deequ
- Data Profiling and Validation
- Data Cataloging and Lineage
- Data Governance: Policies, Roles, Ownership
- Data Security: Encryption, Access Control, Auditing
- GDPR, CCPA, and Data Privacy Compliance

### Learning Resources

#### Textbooks
1. Joe Reis, Matt Housley, "Fundamentals of Data Engineering", O'Reilly, 2022
2. Ralph Kimball, Margy Ross, "The Data Warehouse Toolkit", 3rd Edition, Wiley, 2013

#### Reference Books
1. James Densmore, "Data Pipelines Pocket Reference", O'Reilly, 2021
2. Bas Harenslak, Julian Rutger de Ruiter, "Data Pipelines with Apache Airflow", Manning, 2021

---

## 410504: Data Engineering Laboratory

**Teaching Scheme:** Practical: 02 Hours/Week | **Credits:** 01

**Examination:** TW: 25, PR: 25

### Laboratory Experiments

1. Design and implement an ETL pipeline using Python and Pandas
2. Build a data pipeline using Apache Airflow DAGs
3. Implement streaming data pipeline with Kafka + Spark Streaming
4. Design a star schema data warehouse and load data
5. Implement Slowly Changing Dimensions (SCD Type 1, 2) in SQL
6. Build a Delta Lake table and perform ACID operations
7. Implement data quality checks using Great Expectations
8. Set up data lineage tracking using OpenLineage/DataHub
9. Orchestrate a complete data pipeline with Airflow + Spark + Delta Lake
10. Mini-project: End-to-end data engineering pipeline

---

> **Official Source:** http://www.unipune.ac.in | SPPU, Pune
