# SPPU B.E. Computer Engineering — Honors in Internet of Things (IoT)

## Semester V Syllabus (2019 Pattern)

---

## Course Structure — Semester V

| Course Code | Course Name                         |  TH   |  PR   | Credits |  ISA   |  ESA   |  Total  |
| ----------- | ----------------------------------- | :---: | :---: | :-----: | :----: | :----: | :-----: |
| 310601      | Embedded Systems and IoT            |   3   |   —   |    3    |   30   |   70   |   100   |
| 310602      | Embedded Systems and IoT Laboratory |   —   |   2   |    1    |   25   |   25   |   50    |
| **Total**   |                                     | **3** | **2** |  **4**  | **55** | **95** | **150** |

---

## 310601: Embedded Systems and IoT

**Teaching Scheme:** Theory: 03 Hours/Week | **Credits:** 03

**Examination:** ISA: 30, ESA: 70

**Prerequisites:** Microprocessor, Computer Networks

### Course Objectives

- Understand embedded system architectures and microcontrollers
- Learn IoT protocols, platforms, and system design
- Build IoT systems integrating sensors, cloud, and analytics

### Course Outcomes

| CO  | Description                                                           |
| --- | --------------------------------------------------------------------- |
| CO1 | Explain embedded system architecture and ARM microcontroller features |
| CO2 | Interface sensors and actuators with microcontrollers                 |
| CO3 | Implement IoT communication protocols                                 |
| CO4 | Design IoT systems with cloud integration                             |
| CO5 | Develop real-time IoT applications                                    |

### Course Contents

#### Unit I: Embedded Systems Fundamentals (07 Hours)

- Embedded Systems: Definition, Characteristics, Applications
- Microprocessor vs Microcontroller: ARM, AVR, PIC
- ARM Cortex-M Architecture: Registers, Memory Map, Interrupts
- GPIO Programming: Configuration, Input/Output Modes
- Timers: SysTick, General Purpose, PWM Generation
- ADC: Resolution, Sampling, Conversion Modes
- Low Power Modes: Sleep, Deep Sleep, Standby

#### Unit II: Sensors and Actuators (07 Hours)

- Sensor Types: Temperature (DHT11, LM35), Humidity, Motion (PIR), Ultrasonic
- Actuators: DC Motors, Servo Motors, Stepper Motors, Relays
- Signal Conditioning: Amplification, Filtering, Level Shifting
- Digital Interfaces: I2C, SPI, UART — Protocol Details
- MEMS Sensors: Accelerometer, Gyroscope, Magnetometer
- Power Management: Battery, Voltage Regulation
- PCB Design Basics for Sensor Integration

#### Unit III: IoT Protocols and Connectivity (07 Hours)

- IoT Network Architecture: Perception, Network, Application Layers
- IEEE 802.15.4: LR-WPAN, Frame Structure
- 6LoWPAN: Header Compression, Fragmentation
- Bluetooth Low Energy (BLE): Advertisement, Connection, Services
- LoRaWAN: Architecture, Classes, Data Rate
- Zigbee: Network Topologies, Application Profiles
- NB-IoT and LTE-M for Cellular IoT

#### Unit IV: IoT Platforms and Cloud (07 Hours)

- IoT Platforms: Arduino, Raspberry Pi, ESP32, NodeMCU
- Cloud IoT Platforms: AWS IoT Core, Azure IoT Hub, Google Cloud IoT
- Data Protocols: MQTT, CoAP, HTTP/2
- Data Storage: Time-series Databases (InfluxDB, TimescaleDB)
- IoT Dashboards: Node-RED, Grafana
- Edge Computing: Edge Gateway, Local Processing
- Device Management: Provisioning, Update, Monitoring

#### Unit V: IoT Application Protocols (07 Hours)

- MQTT: Publish-Subscribe, QoS Levels, Retained Messages, Will Messages
- CoAP: RESTful, Observe, Block-wise Transfer
- AMQP: Message Queue, Routing, Security
- WebSocket for Real-time IoT Communication
- gRPC for IoT: Protocol Buffers, Streaming
- HTTP/2: Multiplexing, Server Push
- Protocol Comparison and Selection Criteria

#### Unit VI: IoT Security and Applications (07 Hours)

- IoT Security: Authentication, Encryption, Secure Boot
- Secure Communication: TLS/DTLS for IoT
- IoT Application Domains:
  - Smart Home: Lighting, HVAC, Security
  - Smart City: Traffic, Parking, Waste Management
  - Industrial IoT: Predictive Maintenance, SCADA
  - Healthcare: Remote Monitoring, Wearables
  - Agriculture: Soil Monitoring, Smart Irrigation
- IoT Project Lifecycle: Requirements, Design, Prototyping, Deployment

### Learning Resources

#### Textbooks

1. Arshdeep Bahga, Vijay Madisetti, "Internet of Things: A Hands-On Approach", Universities Press,
   2015
2. Raj Kamal, "Internet of Things: Architecture and Design Principles", McGraw Hill, 2017

#### Reference Books

1. Adrian McEwen, Hakim Cassimally, "Designing the Internet of Things", Wiley, 2013
2. David Hanes, "IoT Fundamentals: Networking Technologies, Protocols, and Use Cases", Cisco Press,
   2017

---

## 310602: Embedded Systems and IoT Laboratory

**Teaching Scheme:** Practical: 02 Hours/Week | **Credits:** 01 | **TW:** 25, **PR:** 25

### Laboratory Experiments

1. Blink LED and read switch input using GPIO on ARM microcontroller
2. Interface temperature sensor (DHT11/LM35) and display on serial monitor
3. Interface ultrasonic sensor for distance measurement
4. Control servo motor using PWM
5. Implement I2C communication to read data from sensor
6. Set up ESP32/NodeMCU WiFi and publish data via MQTT
7. Create an AWS IoT thing and publish sensor data to cloud
8. Build a Node-RED dashboard to visualize sensor data
9. Implement BLE communication between two devices
10. Mini-project: IoT system with sensors, cloud, and dashboard

---

> **Official Source:** http://www.unipune.ac.in | SPPU, Pune
