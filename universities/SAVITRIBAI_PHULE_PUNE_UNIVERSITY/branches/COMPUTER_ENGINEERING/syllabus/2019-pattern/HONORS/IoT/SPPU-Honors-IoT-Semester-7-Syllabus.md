# SPPU B.E. Computer Engineering — Honors in Internet of Things (IoT)
## Semester VII Syllabus (2019 Pattern)

---

## Course Structure — Semester VII

| Course Code | Course Name | TH | PR | Credits | ISA | ESA | Total |
|-------------|-------------|:--:|:--:|:-------:|:---:|:---:|:-----:|
| 410601 | Machine Learning for IoT | 3 | — | 3 | 30 | 70 | 100 |
| 410602 | Machine Learning for IoT Laboratory | — | 2 | 1 | 25 | 25 | 50 |
| **Total** | | **3** | **2** | **4** | **55** | **95** | **150** |

---

## 410601: Machine Learning for IoT

**Teaching Scheme:** Theory: 03 Hours/Week | **Credits:** 03

### Course Objectives
- Apply ML techniques to sensor data analysis
- Implement ML models on resource-constrained devices
- Master edge AI and TinyML deployment

### Course Contents

#### Unit I: ML for Sensor Data (07 Hours)
- Sensor Data Characteristics: Time-dependent, Noisy, Multivariate
- Time Domain Features: Mean, RMS, Zero-crossing, Peak-to-Peak
- Frequency Domain Features: FFT, STFT, Power Spectral Density
- Signal Processing: Filtering, Windowing, Normalization
- Feature Extraction from IoT Time Series Data

#### Unit II: Predictive Analytics for IoT (07 Hours)
- Anomaly Detection: Statistical (Z-score, IQR), ML (Isolation Forest, LSTM)
- Predictive Maintenance: Feature Engineering, RUL Estimation
- Time Series Forecasting: ARIMA, Prophet, LSTM, Transformer
- Event Detection: Change Point Detection, Pattern Recognition

#### Unit III: Deep Learning for IoT (07 Hours)
- 1D CNNs for Sensor Data: Architecture, Applications
- LSTMs for Time Series: Models, Training, Optimization
- Autoencoders for Anomaly Detection in IoT
- Attention Mechanisms for Sensor Fusion
- Graph Neural Networks for IoT Networks

#### Unit IV: TinyML and Edge AI (07 Hours)
- TensorFlow Lite Micro: Model Conversion, Quantization, Pruning
- Model Compression: Weight Clustering, Distillation
- On-device Training: Federated Learning, Transfer Learning
- Hardware Acceleration: CMSIS-NN, ARM NN, Edge TPU
- Energy-aware ML: Power Budget, Duty Cycling, Wake-up Logic

#### Unit V: Computer Vision for IoT (07 Hours)
- Edge Vision: Camera Modules, Image Capture
- Object Detection: MobileNet, YOLO-Lite on Edge
- Face Detection and Recognition on Edge
- Smart Surveillance: Motion Detection, People Counting
- Image Compression for IoT: JPEG, WebP, Beyond

#### Unit VI: IoT ML Pipeline and Deployment (07 Hours)
- End-to-End ML Pipeline for IoT: Data Collection → Training → Deployment
- MQTT-based Model Serving at Edge
- Model Monitoring: Drift Detection, Retraining Triggers
- Multi-modal Learning: Combining Sensor, Image, Audio
- Case Studies: Smart Manufacturing, Healthcare IoT

### Learning Resources

#### Textbooks
1. Pietro Nannipieri, "Machine Learning for IoT", Packt, 2021
2. Pete Warden, Daniel Situnayake, "TinyML: Machine Learning with TensorFlow on Arduino", O'Reilly, 2019

---

## 410602: ML for IoT Laboratory

**Teaching Scheme:** Practical: 02 Hours/Week | **Credits:** 01

### Laboratory Experiments

1. Feature extraction from accelerometer/gyroscope time-series data
2. Implement anomaly detection on sensor data using Isolation Forest
3. Build LSTM model for time series forecasting
4. Deploy TensorFlow Lite model on ESP32/Arduino
5. Implement keyword spotting on edge device
6. Build edge-based person detection using MobileNet
7. Implement predictive maintenance model on machine sensor data
8. Set up federated learning simulation for IoT devices
9. Build multi-sensor fusion model using attention mechanisms
10. Mini-project: Complete edge AI IoT application

---

> **Official Source:** http://www.unipune.ac.in | SPPU, Pune
