---

**Total No. of Questions : 8**

**SEAT No. :**

**[6262]-49**

**T.E. (Computer Engineering)**

**INTERNET OF THINGS AND EMBEDDED SYSTEMS**

**(2019 Pattern) (Semester - I) (310245(A))**

**Time : 2½ Hours]** | **[Max. Marks : 70**

---

**Instructions to the candidates:**

1. Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8.
2. Neat diagrams must be drawn wherever necessary.
3. Figures to the right indicate full marks.
4. Assume suitable data, if necessary.

---

### Unit III — IoT Design Methodology

**Q1)** **a)** Explain the IoT design methodology in detail. List and describe the steps involved in designing an IoT system with a suitable example of a smart home automation system. [9]

**IoT Design Methodology** is a structured approach to developing IoT systems. It consists of 10 steps:

1. **Purpose & Requirements Specification** — Define system purpose, behavior, and requirements
2. **Process Specification** — Define the use cases and IoT processes
3. **Domain Model Specification** — Define objects, attributes, relationships
4. **Information Model Specification** — Define data structures and flows
5. **Service Specifications** — Define services and their APIs
6. **IoT Level Specification** — Choose appropriate IoT deployment level (1-6)
7. **Functional View Specification** — Define functions, modules, components
8. **Operational View Specification** — Define deployment, hosting, operations
9. **Device & Component Integration** — Select and integrate hardware/software
10. **Application Development** — Build and test IoT applications

**Example — Smart Home Automation:**
```
Step 1: Purpose → Automated lighting and temperature control
Step 2: Process → User sets temp via app → Controller reads sensor → Activate HVAC
Step 3: Domain → Room, Sensor, Actuator, Controller, User
Step 4: Information → Temperature, Humidity, Light level, Occupancy
Step 5: Service → getTemperature(), setLightLevel(), detectMotion()
Step 6: Level 3 (cloud + local processing)
Step 7: Sensor module, Controller module, Cloud module, UI module
Step 8: AWS cloud, Raspberry Pi local, Mobile app
Step 9: DHT22 sensors, relays, ESP8266, Raspberry Pi
Step 10: Node-RED dashboard + mobile app
```

**b)** Compare IoT communication models: Request-Response, Publisher-Subscriber, Push-Pull, and Exclusive Pair. Give one use case for each model. [9]

| Model | Communication | Coupling | Scalability | Use Case |
|---|---|---|---|---|
| **Request-Response** | Client sends request, server responds | Tight (client knows server) | Low | HTTP REST API — Smart thermostat query |
| **Publisher-Subscriber** | Publisher sends to topic, subscribers receive | Loose (no direct coupling) | High | MQTT — Temperature sensor publishing to all subscribers |
| **Push-Pull** | Producers push data, consumers pull | Loose (via queue/buffer) | High | Kafka — IoT sensor data stream processing |
| **Exclusive Pair** | Persistent bidirectional connection | Tight (dedicated pair) | Low | Bluetooth — Smartphone to fitness band |

---

**OR**

**Q2)** **a)** Explain the four pillars of IoT: M2M, SCADA, WSN, and RFID. Compare their roles in building IoT systems. [9]

**Four Pillars of IoT:**

| Pillar | Full Form | Function | Role in IoT |
|---|---|---|---|
| **M2M** | Machine-to-Machine | Direct device communication without human intervention | Foundation of autonomous IoT communication |
| **SCADA** | Supervisory Control and Data Acquisition | Industrial control system monitoring and control | Remote monitoring and control in industrial IoT |
| **WSN** | Wireless Sensor Network | Distributed sensor nodes collecting environmental data | Data acquisition layer for IoT |
| **RFID** | Radio Frequency Identification | Wireless identification and tracking | Object identification and asset tracking |

**Comparison:**
- **M2M** focuses on communication, **SCADA** on industrial control
- **WSN** provides sensing infrastructure, **RFID** provides identification
- All four pillars converge in IoT to enable sensing → communication → processing → actuation

**b)** What are sensor networks? Explain the architecture and applications of Wireless Sensor Networks (WSN) in IoT. [9]

**Wireless Sensor Networks (WSN)** consist of spatially distributed autonomous sensor nodes that monitor physical/environmental conditions and cooperatively pass data to a central location.

**WSN Architecture:**
```
[Sensor Nodes] → [Cluster Head] → [Gateway/Sink] → [Internet] → [Application Server]
     │               │
  Sensing          Aggregation + forwarding
```

**Node Components:** Sensor, Microcontroller, Transceiver, Power source

**Applications:**
- **Environmental monitoring** — Temperature, humidity, air quality
- **Healthcare** — Patient vital sign monitoring
- **Agriculture** — Soil moisture, irrigation control
- **Smart cities** — Traffic monitoring, waste management
- **Industrial** — Machine health monitoring, predictive maintenance

---

### Unit IV — IoT Protocols

**Q3)** **a)** Explain MQTT protocol in detail. Describe MQTT architecture, message types, QoS levels, and security features. Compare MQTT with MQTT-SN. [9]

**MQTT (Message Queuing Telemetry Transport)** is a lightweight publish-subscribe messaging protocol designed for constrained devices and low-bandwidth networks.

**Architecture:**
```
[Publisher] → [MQTT Broker] → [Subscriber 1]
                          → [Subscriber 2]
```

**Message Types (14 types):** CONNECT, CONNACK, PUBLISH, PUBACK, SUBSCRIBE, SUBACK, UNSUBSCRIBE, UNSUBACK, PINGREQ, PINGRESP, DISCONNECT

**QoS Levels:**
| QoS | Level | Delivery Guarantee | Overhead |
|---|---|---|---|
| 0 | At most once | Fire and forget | Minimum |
| 1 | At least once | Guaranteed, may duplicate | Medium |
| 2 | Exactly once | Guaranteed, no duplicate | Maximum |

**Security:** TLS/SSL encryption, username/password authentication, X.509 certificates, ACL-based access control

**MQTT vs MQTT-SN:**
| Feature | MQTT | MQTT-SN |
|---|---|---|
| Transport | TCP | UDP |
| Header size | 2 bytes min | 1 byte min |
| Designed for | Networked devices | Battery-powered sensors |
| Topics | UTF-8 strings | Topic IDs (shorter) |

**b)** What is 6LoWPAN? Explain its architecture, header compression techniques, and role in IoT networking. [8]

**6LoWPAN (IPv6 over Low-Power Wireless Personal Area Networks)** enables IPv6 packets to be transmitted over IEEE 802.15.4 networks.

**Architecture:**
- **Adaptation layer** between network and data link layers
- Handles fragmentation, reassembly, header compression

**Header Compression Techniques:**
- **Stateless compression** — Removes redundant IPv6 fields (version, flow label)
- **Context-based compression** — Uses shared context for common prefixes
- **HC1/HC2 compression** — Compresses IPv6/UDP headers from 48 bytes to ~7 bytes

**Role in IoT:**
- Enables direct IP connectivity to sensor nodes
- End-to-end IPv6 networking (no gateway translation)
- Interoperable with existing IP infrastructure
- Used in smart grid, home automation, industrial monitoring

---

**OR**

**Q4)** **a)** Compare Zigbee and LoRa protocols on the basis of: frequency band, data rate, range, power consumption, and application areas. [9]

| Parameter | Zigbee | LoRa |
|---|---|---|
| **Frequency Band** | 2.4 GHz, 915 MHz (US), 868 MHz (EU) | 868 MHz (EU), 915 MHz (US), 433 MHz (Asia) |
| **Data Rate** | 20-250 kbps | 0.3-50 kbps |
| **Range** | 10-100 m (indoors) | 2-15 km (urban), up to 40 km (rural) |
| **Power Consumption** | Low (battery years) | Very low (battery 10+ years) |
| **Topology** | Star, Mesh, Tree | Star |
| **Network Size** | Up to 65,000 nodes | Thousands per gateway |
| **Latency** | 15-30 ms | Variable (depends on spreading factor) |
| **Standards** | IEEE 802.15.4 | LoRaWAN |
| **Application** | Home automation, smart lighting, sensor networks | Smart city, agriculture, asset tracking, meter reading |
| **Cost** | Moderate | Low |

**b)** Explain the Modbus protocol. Describe Modbus RTU and Modbus TCP with frame formats and applications. [8]

**Modbus** is a serial communication protocol developed by Modicon for industrial automation systems. It follows a master-slave (client-server) architecture.

**Modbus RTU (Remote Terminal Unit):**
- Binary serial transmission (RS-232/RS-485)
- Frame: [Slave Address (1B)] [Function Code (1B)] [Data (N B)] [CRC (2B)]
- Compact, efficient for constrained networks

**Modbus TCP:**
- TCP/IP based (port 502)
- Frame: [Transaction ID (2B)] [Protocol ID (2B)] [Length (2B)] [Unit ID (1B)] [Function Code (1B)] [Data]
- No CRC (handled by TCP)
- Connects multiple devices over Ethernet

**Applications:** PLC communication, SCADA systems, industrial IoT, energy monitoring

---

### Unit V — Cloud Platforms for IoT

**Q5)** **a)** Explain the role of Software Defined Networking (SDN) in IoT. Describe the SDN architecture with a neat diagram. [9]

**SDN** separates the control plane from the data plane, enabling centralized network management and programmability — crucial for dynamic IoT networks.

**SDN Architecture:**
```
┌─────────────────────────────────────┐
│      Application Layer              │
│  (Traffic engineering, Security,    │
│   Load balancing, IoT mgmt apps)    │
└───────────────┬─────────────────────┘
                │ Northbound API (REST)
┌───────────────▼─────────────────────┐
│     Control Plane (SDN Controller)  │
│  (OpenDaylight, ONOS, Ryu, POX)     │
└───────────────┬─────────────────────┘
                │ Southbound API (OpenFlow)
┌───────────────▼─────────────────────┐
│      Data Plane (Forwarding)        │
│  (Switches, Routers, Access Points) │
└─────────────────────────────────────┘
```

**Role in IoT:**
- Dynamic network reconfiguration for mobile IoT devices
- Quality of Service (QoS) for time-sensitive IoT traffic
- Centralized security policy enforcement
- Network slicing for diverse IoT applications

**b)** Compare AWS IoT, Microsoft Azure IoT, and ThingSpeak cloud platforms for IoT applications. Discuss their features, pricing models, and ideal use cases. [9]

| Feature | AWS IoT | Azure IoT | ThingSpeak |
|---|---|---|---|
| **Device SDK** | AWS IoT SDK | Azure IoT SDK | Arduino/MATLAB |
| **Protocols** | MQTT, HTTP, WebSocket | MQTT, AMQP, HTTP | MQTT, HTTP |
| **Rules Engine** | IoT Rules (SQL-like) | IoT Hub message routing | MATLAB Analysis |
| **Data Storage** | DynamoDB, S3 | Cosmos DB, Blob | Built-in channel storage |
| **Analytics** | IoT Analytics | Stream Analytics | MATLAB Integration |
| **Edge** | Greengrass | IoT Edge | — |
| **Pricing** | Pay per message | Pay per hub unit | Free tier (limited channels) |
| **Best for** | Enterprise IoT, scale | Enterprise, Azure ecosystem | Prototyping, education, research |

---

**OR**

**Q6)** **a)** What is RESTful Web Service? Explain REST API design principles for IoT. How does REST differ from SOAP and gRPC? [9]

**REST (Representational State Transfer)** is an architectural style for designing networked applications using HTTP methods.

**REST Design Principles for IoT:**
1. **Resource-based** — Each IoT device/sensor is a resource (/sensors/temp1)
2. **HTTP methods** — GET (read), POST (create), PUT (update), DELETE (remove)
3. **Stateless** — Each request contains all information needed
4. **Uniform interface** — Consistent URL patterns
5. **Representation** — JSON/XML data formats

**REST vs SOAP vs gRPC:**

| Feature | REST | SOAP | gRPC |
|---|---|---|---|
| **Protocol** | HTTP/HTTPS | HTTP, SMTP, JMS | HTTP/2 |
| **Data Format** | JSON, XML | XML | Protocol Buffers |
| **Performance** | Medium | Slow | Fast |
| **Coupling** | Loose | Tight | Moderate |
| **Tooling** | Simple (curl) | Complex (WSDL) | Moderate (protoc) |
| **IoT Fit** | Good for web-facing APIs | Heavy for constrained | Excellent for internal services |

**b)** Explain the Django web application framework for IoT. Describe the Django architecture (MVT pattern) with a block diagram. [9]

**Django** is a high-level Python web framework that follows the MVT (Model-View-Template) architecture.

**Django MVT Architecture:**
```
[Client/Browser] → [URL Dispatcher] → [View] ↔ [Model] ↔ [Database]
                         ↓                ↓
                    [Template (HTML)]   Response (JSON/HTML)
```

- **Model** — Defines data structure (ORM mapping to database)
- **View** — Business logic, processes requests, queries models
- **Template** — HTML presentation layer
- **URL Dispatcher** — Maps URLs to views

**Django for IoT:**
- REST API via Django REST Framework (DRF)
- InfluxDB integration for time-series sensor data
- Celery for background sensor data processing
- Channels for WebSocket-based real-time sensor updates
- Admin interface for device management

---

### Unit VI — Security in IoT

**Q7)** **a)** Analyze the major security vulnerabilities in IoT systems. Explain the security requirements and challenges for designing secure IoT applications. [9]

**Major IoT Security Vulnerabilities:**
1. **Weak authentication** — Default passwords, no password policies
2. **Insecure communication** — Unencrypted data transmission
3. **Insecure firmware** — No update mechanism, unsigned updates
4. **Physical tampering** — Access to device hardware
5. **Privacy violations** — Unauthorized data collection
6. **Resource constraints** — Limited CPU/memory for security
7. **Heterogeneity** — Diverse devices, protocols, standards

**Security Requirements:**
- **Confidentiality** — Encryption (AES for data, TLS for communication)
- **Integrity** — Message authentication codes, digital signatures
- **Availability** — DDoS protection, redundancy
- **Authentication** — Device identity, user authentication
- **Authorization** — Access control, least privilege
- **Non-repudiation** — Audit logs, digital signatures

**Challenges:**
- Low-power devices unable to run heavy crypto
- Scalability (millions of devices)
- Long device lifecycle (10+ years)
- Diverse attack surfaces

**b)** What is lightweight cryptography? Explain the need for lightweight cryptographic algorithms in IoT. Compare at least three lightweight ciphers. [8]

**Lightweight Cryptography** involves cryptographic algorithms optimized for resource-constrained devices (low CPU, small memory, limited power).

**Need:** Traditional algorithms (AES-256, RSA) are computationally expensive for IoT sensors with 8-bit microcontrollers, KB-level RAM, and battery operation.

| Parameter | PRESENT | SPECK | LEA |
|---|---|---|---|
| **Type** | Block cipher | Block cipher | Block cipher |
| **Block Size** | 64 bits | 64 bits | 128 bits |
| **Key Size** | 80/128 bits | 96-128 bits | 128 bits |
| **Gate Eq.** | ~1,500 gates | ~1,600 gates | ~3,800 gates |
| **Speed (cycles/byte)** | ~200 | ~150 | ~120 |
| **Security** | Adequate for constrained | High | High |
| **Standard** | ISO/IEC 29192-2 | NSA | Korean standard |

---

**OR**

**Q8)** **a)** Describe the threat modeling process for IoT systems. Explain key elements of IoT security: identity establishment, access control, and data message security. [9]

**Threat Modeling Process (STRIDE for IoT):**
1. **Identify assets** — Data, devices, network
2. **Create architecture diagram** — Data flow, trust boundaries
3. **Identify threats** — STRIDE per component
4. **Document threats** — Spoofing, Tampering, Repudiation, Info disclosure, DoS, Elevation of privilege
5. **Rate risks** — DREAD model (Damage, Reproducibility, Exploitability, Affected users, Discoverability)

**Key Security Elements:**
- **Identity Establishment** — Each device gets unique identity (X.509 certificates, hardware TPM). Pre-provisioned during manufacturing.
- **Access Control** — Role-based (RBAC) or attribute-based (ABAC). Determine which devices/users can access which resources.
- **Data Message Security** — Encryption (payload), authentication (MAC), integrity (hash chain). TLS for transport, AES-CCM for constrained.

**b)** Write short notes on any two: i) Security model for IoT ii) Blockchain for IoT security iii) Intrusion detection in IoT networks [8]

**i) Security Model for IoT:**
```
┌──────────────────────────────────────┐
│         Application Layer            │
│  (Secure APIs, user authentication)  │
├──────────────────────────────────────┤
│         Network Layer                │
│  (TLS/DTLS, IPSec, secure routing)   │
├──────────────────────────────────────┤
│      Perception Layer (Devices)       │
│  (Secure boot, encryption, tamper)   │
└──────────────────────────────────────┘
```
A layered approach ensures security at every level. Defense-in-depth principle applies.

**ii) Blockchain for IoT Security:**
- Decentralized identity management (no central authority)
- Immutable audit trail of device transactions
- Smart contracts for automated security policies
- Challenges: latency, energy consumption, scalability

---

---

## Examiner Commentary

This paper comprehensively tests IoT design methodology, protocol stack (MQTT, 6LoWPAN, Zigbee, LoRa), cloud platforms integration, and security. The REST/SOAP/gRPC comparison and lightweight cryptography comparison test analytical skills. Practical application through threat modeling and Django architecture ensures real-world relevance.
