# SPPU B.E. Computer Engineering — Honors in Cyber Security
## Semester VII Syllabus (2019 Pattern)

---

## Course Structure — Semester VII

| Course Code | Course Name | TH | PR | Credits | ISA | ESA | Total |
|-------------|-------------|:--:|:--:|:-------:|:---:|:---:|:-----:|
| 410401 | IoT and Embedded Security | 3 | — | 3 | 30 | 70 | 100 |
| 410402 | IoT and Embedded Security Laboratory | — | 2 | 1 | 25 | 25 | 50 |
| **Total** | | **3** | **2** | **4** | **55** | **95** | **150** |

---

## 410401: IoT and Embedded Security

**Teaching Scheme:** Theory: 03 Hours/Week | **Credits:** 03 | **ISA:** 30, **ESA:** 70

**Prerequisites:** Information and Cyber Security (310401), Computer Networks

### Course Objectives
- Understand IoT architecture, protocols, and security challenges
- Learn embedded system security and hardware security mechanisms
- Master IoT penetration testing and secure development practices

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Identify IoT security threats and attack surfaces across IoT layers |
| CO2 | Apply cryptographic protocols for IoT communication security |
| CO3 | Implement embedded system security mechanisms |
| CO4 | Perform IoT penetration testing and vulnerability assessment |
| CO5 | Design secure IoT architectures for enterprise deployments |

### Course Contents

#### Unit I: IoT Security Landscape (07 Hours)
- IoT Security Challenges: Constraints, Heterogeneity, Scale
- IoT Attack Surface: Device, Communication, Cloud, Application
- Threat Modeling for IoT: STRIDE, DREAD, PASTA
- IoT Security Requirements: Authentication, Authorization, Integrity
- IoT Security Standards: NIST IR 8228, ENISA, IoT Security Foundation
- Case Studies: IoT Botnets (Mirai, Reaper), Smart Home Attacks

#### Unit II: IoT Device and Firmware Security (07 Hours)
- Embedded Device Architecture: MCU, SoC, Memory, Peripherals
- Secure Boot: Root of Trust, Chain of Trust
- Firmware Analysis: Extraction, Disassembly, Vulnerability Discovery
- Firmware Update: OTA Updates, Signed Firmware, Rollback Protection
- Hardware Security: Secure Element, TPM, HSM
- Side-Channel Attacks: Power Analysis, Timing, EM
- Physical Security: Tamper Detection, Secure Enclosure

#### Unit III: IoT Communication Security (07 Hours)
- IoT Protocols Security: MQTT, CoAP, AMQP, HTTP/2
- 6LoWPAN and RPL Security
- Bluetooth Low Energy (BLE) Security
- Zigbee and Z-Wave Security
- LoRaWAN Security: Join Procedure, Frame Encryption
- IPSec and TLS for IoT: DTLS, Constrained Environments
- Software-Defined Perimeter for IoT

#### Unit IV: IoT Cloud and Application Security (07 Hours)
- IoT Cloud Platforms: AWS IoT, Azure IoT Hub, Google Cloud IoT
- Cloud Security: IAM, Encryption, Auditing
- IoT Data Security: Storage Encryption, Access Control, Anonymization
- Web Application Security for IoT Dashboards
- Mobile App Security for IoT Control Applications
- API Security: REST API, GraphQL, OAuth for IoT
- Edge Computing Security: Secure Edge Gateway, Data Filtering

#### Unit V: IoT Penetration Testing (07 Hours)
- IoT Testing Methodology: Attack Surface Enumeration
- Hardware Hacking: UART, JTAG, SPI, I2C, Reading Flash
- Firmware Analysis: binwalk, firmware-mod-kit, Strings Analysis
- Network Protocol Testing: Replay Attacks, Fuzzing
- Mobile App Testing: APK Decompilation, Insecure Storage
- Cloud API Testing: Authentication Bypass, Injection
- Radio Hacking: Software Defined Radio (SDR), RF Signal Analysis

#### Unit VI: Secure IoT Development and Compliance (07 Hours)
- Secure SDLC for IoT: Requirements, Design, Implementation, Testing
- IoT Security Frameworks: OWASP IoT Top 10, IoT Security Maturity Model
- Privacy by Design in IoT: Data Minimization, Consent, Anonymization
- Blockchain for IoT Security: Distributed Ledger, Smart Contracts
- Regulatory Compliance: EU Cyber Resilience Act, GDPR for IoT
- IoT Security Operations: Monitoring, Incident Response, Patching

### Learning Resources

#### Textbooks
1. Brian Russell, Drew Van Duren, "Practical Internet of Things Security", 2nd Edition, Packt, 2016
2. Fei Hu, "Security and Privacy in Internet of Things (IoTs)", CRC Press, 2016

#### Reference Books
1. Mark Stanislav, "IoT Penetration Testing Cookbook", Packt, 2017
2. Aditya Gupta, "The IoT Hacker's Handbook", Apress, 2019

---

## 410402: IoT and Embedded Security Laboratory

**Teaching Scheme:** Practical: 02 Hours/Week | **Credits:** 01 | **TW:** 25, **PR:** 25

### Laboratory Experiments

1. Perform firmware analysis using binwalk and extract filesystem
2. Identify and exploit UART interface on an embedded device
3. Implement MQTT communication with TLS encryption
4. Configure and test CoAP security with DTLS
5. Perform BLE security assessment using BlueZ/BTLE tools
6. Fuzz test an IoT protocol implementation
7. Conduct hardware side-channel analysis (power/timing)
8. Safer IoT cloud platform security assessment (AWS IoT/Azure)
9. Perform mobile app security assessment for IoT companion app
10. Mini-project: Full IoT penetration test on a simulated IoT system

---

> **Official Source:** http://www.unipune.ac.in | SPPU, Pune
