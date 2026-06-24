# SPPU B.E. Computer Engineering — Honors in Internet of Things (IoT)
## Semester VI Syllabus (2019 Pattern)

---

## Course Structure — Semester VI

| Course Code | Course Name | TH | PR | Credits | ISA | ESA | Total |
|-------------|-------------|:--:|:--:|:-------:|:---:|:---:|:-----:|
| 310603 | IoT Architecture and Data Analytics | 3 | — | 3 | 30 | 70 | 100 |
| 310604 | IoT Architecture Laboratory | — | 2 | 1 | 25 | 25 | 50 |
| **Total** | | **3** | **2** | **4** | **55** | **95** | **150** |

---

## 310603: IoT Architecture and Data Analytics

**Teaching Scheme:** Theory: 03 Hours/Week | **Credits:** 03

**Prerequisites:** Embedded Systems and IoT (310601)

### Course Objectives
- Design scalable IoT architectures for enterprise deployment
- Implement real-time data processing and analytics
- Master edge computing and IoT data pipelines

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Design multi-tier IoT architectures for scale and reliability |
| CO2 | Implement real-time IoT data processing pipelines |
| CO3 | Apply analytics and ML to IoT data |
| CO4 | Manage IoT devices and firmware at scale |
| CO5 | Evaluate IoT system performance and optimize |

### Course Contents

#### Unit I: IoT Architecture Patterns (07 Hours)
- Three-Tier Architecture: Perception, Network, Application
- Five-Layer Architecture: Business, Application, Service Management, Object Abstraction, Objects
- Edge/Fog Architecture: Edge Nodes, Fog Layer, Cloud
- Event-Driven Architecture: Event Sources, Processing, Sinks
- Microservices for IoT: Service Decomposition, API Gateway
- Hybrid Architectures: Combining Cloud, Edge, and On-premise

#### Unit II: IoT Data Management (07 Hours)
- Data Lifecycle: Generation, Collection, Processing, Storage, Visualization
- Time-Series Data Characteristics: High Volume, Ordered, Append-only
- Data Storage: InfluxDB, TimescaleDB, Prometheus
- Streaming Data: Apache Kafka, MQTT Broker, NATS
- Data Pipeline: Kafka Streams, Apache Flink, Spark Structured Streaming
- Storage Optimization: Downsampling, Retention Policies, Compression

#### Unit III: Edge Computing (07 Hours)
- Edge vs Fog vs Cloud Computing
- Edge Devices: NVIDIA Jetson, Intel NUC, AWS Outposts
- Edge Analytics: Local ML Inference, Data Filtering
- Edge Orchestration: KubeEdge, Azure IoT Edge
- Edge-to-Cloud Communication: Protocol Selection, Bandwidth Management
- Processing at Edge: Filtering, Aggregation, Transformation

#### Unit IV: IoT Analytics and Machine Learning (07 Hours)
- Descriptive Analytics: Dashboards, Reports, Alerts
- Predictive Analytics: Regression, Time Series Forecasting
- Anomaly Detection: Statistical, ML-based (Isolation Forest, LSTM)
- Predictive Maintenance: Vibration Analysis, Remaining Useful Life
- ML at Edge: Model Compression, Quantization, TinyML
- Digital Twins: Virtual Representation, Simulation, What-if Analysis

#### Unit V: IoT System Design and Scalability (07 Hours)
- Scalability Design: Horizontal vs Vertical Scaling
- Load Balancing: Device Connections, API Requests
- High Availability: Redundancy, Failover, Multi-region
- Device Management: Fleet Management, OTA Updates, Remote Configuration
- API Design for IoT: REST, GraphQL, WebSocket
- Security at Scale: Device Authentication, Rate Limiting, DDoS Protection

#### Unit VI: IoT Case Studies and Industry 4.0 (07 Hours)
- Industry 4.0: Cyber-Physical Systems, Smart Manufacturing
- Smart Factory: PLC Integration, MES, SCADA
- Smart Building: BMS, Energy Optimization, Predictive Maintenance
- Smart Healthcare: Remote Monitoring, Asset Tracking
- Smart Agriculture: Precision Farming, Automated Irrigation
- Smart Energy: Smart Grid, Metering, DEM

### Learning Resources

#### Textbooks
1. Perry Lea, "IoT and Edge Computing for Architects", 2nd Edition, Packt, 2020
2. Benjamin Cabrera, "IoT Data Analytics", Wiley, 2021

#### Reference Books
1. Dominique Guinard, Vlad Trifa, "Building the Web of Things", Manning, 2016
2. Andrew Minterer, "Analytics for the Internet of Things", Packt, 2017

---

## 310604: IoT Architecture Laboratory

**Teaching Scheme:** Practical: 02 Hours/Week | **Credits:** 01 | **TW:** 25, **PR:** 25

### Laboratory Experiments

1. Set up Kafka cluster for IoT data ingestion
2. Implement streaming data processing with Kafka Streams
3. Store IoT time-series data in InfluxDB and query
4. Deploy an edge analytics function using AWS IoT Greengrass/Azure IoT Edge
5. Build a predictive maintenance model using sensor data
6. Implement OTA firmware updates for a device fleet
7. Design and implement a scalable MQTT broker cluster
8. Build a digital twin simulation of a physical device
9. Implement TinyML model on ESP32 for on-device inference
10. Mini-project: Complete IoT system design and implementation

---

> **Official Source:** http://www.unipune.ac.in | SPPU, Pune
