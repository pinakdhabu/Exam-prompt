# SPPU B.E. Computer Engineering — Honors in Virtual & Augmented Reality (VR/AR)
## Semester VI Syllabus (2019 Pattern)

---

## Course Structure — Semester VI

| Course Code | Course Name | TH | PR | Credits | ISA | ESA | Total |
|-------------|-------------|:--:|:--:|:-------:|:---:|:---:|:-----:|
| 310703 | Augmented Reality | 3 | — | 3 | 30 | 70 | 100 |
| 310704 | Augmented Reality Laboratory | — | 2 | 1 | 25 | 25 | 50 |
| **Total** | | **3** | **2** | **4** | **55** | **95** | **150** |

---

## 310703: Augmented Reality

**Teaching Scheme:** Theory: 03 Hours/Week | **Credits:** 03

**Prerequisites:** Virtual Reality (310701), Computer Graphics

### Course Objectives
- Understand AR tracking, registration, and rendering
- Learn computer vision techniques for AR
- Develop AR applications for mobile and wearable platforms

### Course Contents

#### Unit I: Augmented Reality Fundamentals (07 Hours)
- AR vs VR vs MR: Continuum, Differences
- AR History and Milestones
- AR Display Technologies: Optical See-through (Hololens), Video See-through, Retinal
- AR Taxonomies: Location-based, Marker-based, Markerless
- AR Applications: Retail, Education, Navigation, Industrial
- Challenges in AR: Latency, Occlusion, Lighting, Calibration

#### Unit II: AR Tracking and Registration (07 Hours)
- Sensor-based Tracking: GPS, IMU, Magnetometer, Visual-inertial
- Marker-based Tracking: Fiducial Markers (ARTag, QR, AprilTag)
- Markerless Tracking: Natural Feature Tracking
- SLAM for AR: Visual SLAM (ORB-SLAM, LSD-SLAM)
- Planar Detection: Floor, Walls, Tables
- 3D Object Tracking: Model-based, Template-based
- Hand and Face Tracking: MediaPipe, Apple ARKit

#### Unit III: AR Rendering and Display (07 Hours)
- Real-time Rendering for AR: Virtual Content over Camera Feed
- Occlusion Handling: Depth-based, Model-based
- Lighting Estimation: Environment Probes, HDR Lighting
- Shadow and Reflection: Contact Shadows, Reflections
- Green Screen and Chroma Keying
- AR with 3D Models: Import, Animation, Interaction
- Video See-through AR Pipeline: Camera → Processing → Compositing

#### Unit IV: AR SDKs and Platforms (07 Hours)
- ARKit (Apple): Scene Understanding, Face Tracking, People Occlusion
- ARCore (Google): Cloud Anchors, Augmented Images, Depth API
- AR Foundation (Unity): Cross-platform AR
- Vuforia: Image Targets, Model Targets, Cylinder Targets
- Web AR: 8th Wall, AWE, WebXR
- AR Cloud: Persistent AR, Multi-user AR, Cloud Anchors

#### Unit V: Computer Vision for AR (07 Hours)
- Image Processing: Feature Detection (SIFT, SURF, ORB)
- Camera Calibration: Intrinsic/Extrinsic Parameters
- Homography and Pose Estimation
- Structure from Motion (SfM)
- Deep Learning for AR: Object Detection, Segmentation, Depth Estimation
- Neural Rendering: NeRF for Novel View Synthesis

#### Unit VI: AR Design and Interaction (07 Hours)
- AR UX Design Principles: Comfort, Safety, Context Awareness
- Spatial UI: Floating Panels, World-locked, Body-locked
- Gesture Interaction: Tap, Swipe, Pinch, Air Tap
- Voice Interaction for AR: Speech Recognition, NLP
- Gaze Interaction: Dwell, Eye Tracking
- Multi-user AR: Shared Experiences, Networking
- AR App Distribution: App Store, Enterprise Deployment

### Learning Resources

#### Textbooks
1. Dieter Schmalstieg, Tobias Hollerer, "Augmented Reality: Principles and Practice", Addison-Wesley, 2016
2. Alan B. Craig, "Understanding Augmented Reality", Morgan Kaufmann, 2013

#### Reference Books
1. Jonathan Linowes, "Augmented Reality with Unity AR Foundation", Packt, 2021
2. Daniel Wagner, "Mobile Augmented Reality", TU Graz, 2020

---

## 310704: Augmented Reality Laboratory

**Teaching Scheme:** Practical: 02 Hours/Week | **Credits:** 01 | **TW:** 25, **PR:** 25

### Laboratory Experiments

1. Set up AR development environment with AR Foundation
2. Implement marker-based AR using image tracking
3. Implement planar surface detection and place virtual objects
4. Implement AR object manipulation (move, rotate, scale)
5. Implement face tracking AR with virtual accessories
6. Build location-based AR with GPS (Pokemon Go style)
7. Implement AR occlusion using depth API
8. Implement multi-user AR with shared cloud anchors
9. Build Web AR experience using 8th Wall
10. Mini-project: Complete AR application

---

> **Official Source:** http://www.unipune.ac.in | SPPU, Pune
