---

**Total No. of Questions : 8**

**SEAT No. :**

**[6262]-62**

**T.E. (Computer Engineering)**

**AUGMENTED AND VIRTUAL REALITY**

**(2019 Pattern) (Semester - II) (310254(B))**

**Time : 2½ Hours]** | **[Max. Marks : 70**

---

**Instructions to the candidates:**

1. Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8.
2. Neat diagrams must be drawn wherever necessary.
3. Figures to the right indicate full marks.
4. Assume suitable data, if necessary.

---

### Unit III — Representing and Rendering the Virtual World

**Q1)** **a)** Explain the visual representation and rendering process in VR. [9]

**Visual Rendering Pipeline:** The process of generating a 2D image from a 3D virtual scene:

1. **Modeling** — Creating 3D objects (polygon meshes, NURBS, voxels)
2. **Transformation** — World, view, and projection transforms (model → world → camera → screen)
3. **Clipping** — Removing objects outside the view frustum
4. **Projection** — Perspective projection maps 3D to 2D (including stereoscopic for VR)
5. **Rasterization** — Converting primitives to pixels with interpolation
6. **Display** — Final image output to HMD with distortion correction and post-processing

**VR Specifics:** VR requires stereoscopic rendering (two viewpoints, eye-separated by ~64mm), high frame rates (90+ FPS), and low latency (<20ms) to maintain presence.

**b)** Compare geometric modeling techniques. [9]

| Technique | Description | Advantages | Disadvantages |
|---|---|---|---|
| **Polygon Meshes** | Collection of vertices, edges, and faces (usually triangles) | Simple, hardware-accelerated, widely supported | Approximates curves, requires many polygons for detail |
| **NURBS** | Non-Uniform Rational B-Splines — mathematically precise curves | Smooth surfaces, exact representation, scalable LOD | Computationally expensive, not GPU-native |
| **Voxels** | Volume elements in 3D grid | Good for organic/volumetric data, boolean operations easy | Memory-intensive, requires large storage |

---

**OR**

**Q2)** **a)** Explain aural rendering in VR. [9]

**3D Audio Techniques:**
- **Binaural Audio** — Two-microphone recording simulates natural hearing. Head-related transfer function (HRTF) filters sound based on head position and pinna shape.
- **HRTF** — Mathematical model of how sound waves interact with head and ears. Enables directional audio cues.
- **Spatial Audio** — Sound positioned in 3D space with distance attenuation, occlusion, and reverberation.

**Importance of Audio:** Audio contributes 50% of immersion. Spatial audio provides directional cues (critical for navigation), enhances presence, and can reduce VR sickness by reinforcing visual cues.

**b)** Explain haptic rendering and feedback. [9]

**Haptic Rendering:** Computing forces and tactile feedback based on user interaction with virtual objects. Requires collision detection, force response algorithms, and control systems.

| Type | Description | Examples |
|---|---|---|
| **Tactile** | Surface-level touch (texture, vibration) | Haptic gloves with vibration motors, ultrasonic surface haptics |
| **Kinesthetic** | Force feedback simulating weight, resistance, inertia | Phantom Omni, Novint Falcon, exoskeletons |
| **Force Feedback** | Active resistance/force applied to user | Steering wheels, joysticks, haptic vests |

---

### Unit IV — Interaction and Experience in VR

**Q3)** **a)** Explain UI metaphors and manipulation techniques in VR. [9]

**UI Metaphors:** 
- **Direct manipulation** — User's virtual hand directly grasps/operates objects (most intuitive)
- **Physical control** — Real-world controllers mapped to virtual tools (e.g., Vive wands)
- **Virtual control** — Virtual menus, panels, or widgets (e.g., laser pointers, radial menus)

**Manipulation Techniques:**
- **Grabbing** — Pinch, grip, proximity-based
- **Scaling** — Two-handed resize, zoom gestures
- **Rotation** — Wrist rotation, handle-based
- **Placement** — Snap-to-grid, physics-based drop

**b)** Discuss navigation techniques in VR. [8]

**Walking-Based:**
- **Real walking** — User physically walks in tracked space (requires large area)
- **Redirected walking** — Virtual paths subtly rotated to keep user within tracking bounds
- **Room-scale** — Natural movement within a defined physical area

**Steering-Based:**
- **Gaze-directed** — Move toward where user looks
- **Pointing/Teleport** — Point to destination and instant travel
- **Torso-directed** — Direction based on body orientation (reduces sickness)

---

**OR**

**Q4)** **a)** What is immersion and presence in VR? [9]

**Immersion:** Objective measure of how fully a VR system replaces real-world sensory input. Determined by technical fidelity (FOV, resolution, tracking quality, audio, haptics).

**Presence:** Subjective psychological feeling of "being there" in the virtual environment. Factors affecting presence:

| Factor | Impact | Ideal Value |
|---|---|---|
| **Field of View** | Wider FOV = higher presence | 110°+ horizontal |
| **Resolution** | Sharper image = more believable | 4K+ per eye |
| **Latency** | Lower = less disorienting | <20ms motion-to-photon |
| **Update Rate** | Smoother motion = more comfortable | 90Hz+ |
| **Tracking Fidelity** | Accurate 1:1 movement | 6-DOF, sub-mm accuracy |

**b)** Explain VR sickness and mitigation. [8]

**Causes:**
- **Vection** — Illusion of self-motion when visually moving but physically stationary
- **Sensory Conflict** — Vestibular system says "still" while vision says "moving" (main cause)
- **Latency** — Mismatch between head movement and visual update
- **Accommodation-Vergence Conflict** — Eyes focus at screen distance but converge at virtual depth

**Mitigation Techniques:**
- Maintain 90+ FPS with <20ms latency
- Reduce FOV during artificial movement (tunneling/vignetting)
- Use teleportation instead of smooth locomotion
- Add a static reference (cockpit, nose, reticle)
- Limit acceleration/deceleration
- Keep user seated for non-walking experiences

---

### Unit V — Augmented Reality

**Q5)** **a)** Explain AR fundamentals and compare AR, VR, MR. [9]

**Augmented Reality:** Overlays digital content onto the real world in real-time. Combines real and virtual, is interactive, and registers in 3D.

| Feature | VR | AR | MR |
|---|---|---|---|
| **Environment** | Fully virtual | Real world enhanced | Virtual objects interact with real |
| **Immersion** | Complete | Partial | Mixed |
| **Real World** | Fully blocked | Visible | Visible with interaction |
| **Devices** | HMD (Quest, Index) | Phone/glasses (HoloLens) | HoloLens, Magic Leap |
| **Examples** | Beat Saber, VR Chat | Pokemon Go, IKEA Place | Microsoft Mesh |

**b)** Depth cues in AR. [9]

**Monocular Cues:** Occlusion, relative size, linear perspective, texture gradient, shading, aerial perspective.

**Binocular Cues:** Stereopsis (disparity between left/right eye images), convergence (eye muscle tension).

**Registration Problem:** Virtual content must align perfectly with real world. **Latency** causes swimming/drift. Solutions: high-frequency tracking, predictive filtering, time-stamped sensor fusion.

---

**OR**

**Q6)** **a)** AR hardware components and HMD comparison. [9]

**AR Hardware Components:**
- **Sensors** — Camera(s), IMU (accelerometer, gyroscope, magnetometer), depth sensor, GPS
- **Processor** — CPU + GPU + DSP for real-time computer vision
- **Display** — Optical see-through (combiner) or video see-through (cameras + screens)

| Feature | Optical See-Through | Video See-Through |
|---|---|---|
| **Real-world view** | Direct (natural) | Camera feed |
| **Field of View** | Limited (HoloLens 2: 52°) | Wider (varies with camera) |
| **Latency** | Natural (no camera lag) | Camera + processing lag |
| **Resolution** | Real world = natural | Limited by camera resolution |
| **Occlusion** | Hard (transparent overlays) | Easier (pixel-level blending) |
| **Examples** | Microsoft HoloLens, Magic Leap | Varjo XR-3, phone AR |

**b)** AR tracking technologies. [9]

| Technology | How It Works | Pros | Cons |
|---|---|---|---|
| **Magnetic** | Magnetic field sensors | No line-of-sight | Interference from metal |
| **Optical (marker)** | Camera detects fiducial markers (QR, ArUco) | Accurate, cheap | Requires visible markers |
| **GPS** | Satellite positioning | Works outdoors, large scale | Low accuracy (<5m), indoor fails |
| **Hybrid** | Combines multiple sensors (IMU + vision + GPS) | Robust, accurate | Complex calibration |

---

### Unit VI — AR Software and Mobile AR

**Q7)** **a)** AR development tools: ARKit, ARCore, Vuforia. [9]

| Feature | ARKit (Apple) | ARCore (Google) | Vuforia (PTC) |
|---|---|---|---|
| **Platform** | iOS | Android, iOS | Cross-platform |
| **Tracking** | Visual-inertial odometry | Motion tracking (IMU + camera) | Image, object, model targets |
| **Environment** | Scene understanding, people occlusion | Depth API, Augmented Images | Ground plane, VuMarks |
| **Lighting** | Environment probe, HDR | Light estimation | Ambient light estimation |
| **Anchors** | ARAnchor | Anchor, Augmented Image | VuMark, Image Target |

**b)** Marker-based vs markerless AR. SLAM. [8]

| Feature | Marker-Based | Markerless |
|---|---|---|
| **Reference** | Pre-defined image/pattern | Natural features in environment |
| **Setup** | Print/display markers | None (just start app) |
| **Robustness** | Very stable | Depends on scene texture |
| **Use Case** | Product visualization, education | Navigation, large-scale AR |

**SLAM (Simultaneous Localization and Mapping):** Enables markerless AR by building a map of the environment while tracking the device's position within it. Key components:
- Feature extraction (ORB, SIFT, SURF)
- Landmark matching and loop closure
- Pose optimization (bundle adjustment)

---

**OR**

**Q8)** **a)** Mobile AR application development process. [9]

**Steps (ARKit example):**
1. **Scene setup** — Create ARSCNView, configure ARWorldTrackingConfiguration
2. **Plane detection** — Enable horizontal/vertical plane detection
3. **Hit testing** — Convert screen touch to 3D world position
4. **Anchor placement** — Add ARAnchor at detected position
5. **Content rendering** — Attach 3D models (SCNNode) to anchors
6. **Interaction** — Gesture recognizers for tap, pinch, rotate
7. **Lighting** — Environment probes for realistic lighting
8. **Feedback** — Visual + haptic feedback for interactions

**b)** Short notes (any two): [8]

**i) Industrial Applications of AR:**
- Remote assistance (Technicians guided by experts via AR annotations)
- Assembly guidance (Step-by-step overlay on workpieces)
- Quality inspection (Defect detection with overlays)
- Training (Safe, simulated equipment operation)

**ii) Medical Applications of VR:**
- Surgical simulation (Practice complex procedures risk-free)
- Pain management (Distraction therapy for burn patients)
- Phobia treatment (Exposure therapy in controlled environments)
- Anatomy education (3D exploration of human body)

**iii) AR in Education and Training:**
- Interactive textbooks (3D models pop up from pages)
- Virtual labs (Chemistry experiments without physical materials)
- Field trips (Historical reconstructions at actual locations)
- Language learning (Real-world objects labeled in target language)

---

---

## Examiner Commentary

This paper comprehensively covers the AR/VR syllabus: VR rendering (visual, aural, haptic pipelines), VR interaction and experience (manipulation, navigation, immersion, cybersickness), AR fundamentals (registration, depth cues, optical vs video see-through), and AR development (ARKit, ARCore, SLAM, mobile AR). The comparison tables (geometric models, AR vs VR vs MR, optical vs video see-through, tracking technologies) test analytical skills, while application-focused questions assess practical understanding.
