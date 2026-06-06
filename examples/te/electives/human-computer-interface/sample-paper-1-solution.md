---

**Total No. of Questions : 8**

**SEAT No. :**

**[6262]-53**

**T.E. (Computer Engineering)**

**HUMAN COMPUTER INTERFACE**

**(2019 Pattern) (Semester - I) (310245(B))**

**Time : 2½ Hours]** | **[Max. Marks : 70**

---

**Instructions to the candidates:**

1. Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8.
2. Neat diagrams must be drawn wherever necessary.
3. Figures to the right indicate full marks.
4. Assume suitable data, if necessary.

---

### Unit III — Interaction Styles and HCI in Software Process

**Q1)** **a)** Explain the concept of interaction styles in HCI. Compare the following interaction styles: command line, menu selection, form fill-in, and direct manipulation. [9]

**Interaction Styles** are the different ways in which a user communicates with a computer system. They define the **dialogue** between user and system.

**Comparison Table:**

| Parameter | Command Line | Menu Selection | Form Fill-in | Direct Manipulation |
|---|---|---|---|---|
| **Input** | Typed commands | Point-and-click | Tab/type into fields | Drag, point, click |
| **Learning** | Hard (memorize syntax) | Easy (browse options) | Moderate | Easy (intuitive) |
| **Speed** | Fast for experts | Slow (navigation) | Moderate | Fast for frequent tasks |
| **Errors** | High (typos) | Low (constrained) | Moderate | Low (visual feedback) |
| **User Type** | Expert | Novice/Intermediate | All | All |
| **Example** | Linux terminal | ATM menu | Online registration form | CAD software |

**b)** What is usability engineering? Explain the usability engineering lifecycle with a neat diagram. Describe the role of iterative design and prototyping in the software development process. [9]

**Usability Engineering** is a process for systematically achieving usability goals through user research, design, evaluation, and iteration.

**Usability Engineering Lifecycle:**
1. **Know the user** — Identify user characteristics, tasks, and environments
2. **Competitive analysis** — Study existing products
3. **Set usability goals** — Define measurable targets (time, errors, satisfaction)
4. **Participatory design** — Involve users in design
5. **Prototyping** — Create low/high-fidelity prototypes
6. **Usability testing** — Test with real users
7. **Iterative design** — Refine based on feedback
8. **Post-release evaluation** — Monitor actual usage

```
         ┌─────────────────┐
         │  Know the User   │
         └────────┬─────────┘
                  ▼
         ┌─────────────────┐
         │  Set Usability   │
         │     Goals        │
         └────────┬─────────┘
                  ▼
         ┌─────────────────┐
      ┌──│   Prototyping    │──┐
      │  └────────┬─────────┘  │
      │           ▼            │
      │  ┌─────────────────┐   │
      │  │  Usability Test  │───┘ (Iterate)
      │  └────────┬─────────┘
      │           ▼
      │  ┌─────────────────┐
      └──│  Final Design    │
         └─────────────────┘
```

**Iterative Design** is the cyclic process of prototyping, testing, analyzing, and refining a product. Each iteration improves the design based on user feedback. **Prototyping** can be low-fidelity (paper sketches) or high-fidelity (interactive mockups), enabling early user feedback before full development.

---

**OR**

**Q2)** **a)** Compare Graphical User Interface (GUI) and Web User Interface (Web UI) on the basis of: characteristics, advantages, disadvantages, and design considerations. [9]

| Parameter | GUI | Web UI |
|---|---|---|
| **Platform** | Desktop-specific | Cross-platform (browser) |
| **Installation** | Requires installation | No installation (URL) |
| **Updates** | Manual updates | Automatic (server-side) |
| **Responsiveness** | Fast (native) | Network-dependent |
| **Navigation** | Windows, menus, dialogs | Hyperlinks, tabs, breadcrumbs |
| **Controls** | Rich native widgets | HTML/CSS/JS components |
| **Offline** | Fully functional | Limited (caching required) |
| **Distribution** | Executable download | URL access |
| **Security** | Local machine security | Server-side + HTTPS |
| **State** | Application-managed | Session/Cookie-based |

**b)** What is design rationale? Explain the process of interaction design with suitable examples for a library management system. [9]

**Design Rationale** is the documentation of reasons behind design decisions, including alternatives considered and justification for the chosen approach.

**Interaction Design Process:**
1. **Requirements gathering** — Interview librarians and students
2. **Task analysis** — Identify: search books, issue, return, reserve
3. **Conceptual design** — Define system metaphor (digital library)
4. **Prototyping** — Create wireframes for search and checkout
5. **Evaluation** — Test with 5 users, measure task completion time
6. **Implementation** — Develop the interface

**Example — Library Management System:**
- **Task:** Student searches for a book
- **Interaction:** Type title in search bar → View results → Click book → See availability → Reserve
- **Design Decision:** Use search with auto-complete (reduces typing errors) instead of browse-by-category (slower for known items)

---

### Unit IV — Usability Evaluation and Universal Design

**Q3)** **a)** Explain the DECIDE framework for usability evaluation. Describe each component of the framework with an example. [9]

The **DECIDE framework** provides a structured approach for planning and conducting usability evaluations.

| Letter | Component | Description | Example (E-commerce checkout) |
|---|---|---|---|
| **D** | **Determine** the goals | What to evaluate and why | Evaluate checkout completion rate |
| **E** | **Explore** the questions | Specific questions to answer | Can users find the checkout button? |
| **C** | **Choose** evaluation methods | Select appropriate methods | Think-aloud protocol + heuristic evaluation |
| **I** | **Identify** practical issues | Resources, schedule, equipment | Need 5 participants, 30 min each |
| **D** | **Decide** evaluation concerns | Ethics, privacy, data handling | Get consent, anonymize data |
| **E** | **Evaluate**, interpret, present | Analyze data and report findings | 80% completed in <3 min, 2 usability issues found |

**b)** What is heuristic evaluation? Explain Nielsen's ten usability heuristics with examples for each. [8]

**Heuristic Evaluation** is a usability inspection method where experts evaluate an interface against established usability principles (heuristics).

**Nielsen's Ten Heuristics:**
1. **Visibility of system status** — Keep users informed (loading indicator)
2. **Match between system and real world** — Use familiar terms (shopping cart icon)
3. **User control and freedom** — Undo/Redo, exit (Cancel button)
4. **Consistency and standards** — Same actions same results (Ctrl+C for copy)
5. **Error prevention** — Prevent errors before they occur (confirm before delete)
6. **Recognition rather than recall** — Minimize memory load (dropdown menus)
7. **Flexibility and efficiency of use** — Shortcuts for experts (keyboard shortcuts)
8. **Aesthetic and minimalist design** — No irrelevant information
9. **Help users recognize, diagnose, recover from errors** — Clear error messages
10. **Help and documentation** — Easy-to-search help system

---

**OR**

**Q4)** **a)** Explain the GOMS model in detail. Apply the GOMS model to an e-shopping cart checkout process and estimate the execution time. [9]

**GOMS Model** (Goals, Operators, Methods, Selection rules) is a quantitative model for predicting task execution time:

- **Goals** — What the user wants to accomplish
- **Operators** — Basic actions (keystroke, mouse click, mental act)
- **Methods** — Sequences of operators to achieve goals
- **Selection rules** — Choosing between alternative methods

**Keystroke-Level Model operators and times:**
- **K** — Keystroke (0.28 sec for average typist)
- **P** — Point with mouse (1.1 sec)
- **B** — Button press/release (0.1 sec)
- **H** — Home hands to device (0.4 sec)
- **M** — Mental preparation (1.35 sec)

**Example — E-shopping checkout:**
```
Goal: Complete checkout
Method: 
M (think: click checkout)   1.35s
P (point to checkout button) 1.10s
B (click)                   0.10s
M (think: enter email)      1.35s
H (home to keyboard)        0.40s
K (type email: 15 chars)    4.20s
P (point to next field)     1.10s
B (click)                   0.10s
K (type password: 8 chars)  2.24s
P (point to pay button)     1.10s
B (click)                   0.10s
                           -------
Total: ~13.04 seconds
```

**b)** What are the principles of universal design? Explain multi-modal interaction and diversity considerations in interface design. [8]

**Seven Principles of Universal Design:**
1. **Equitable use** — Useful for people with diverse abilities
2. **Flexibility in use** — Accommodates a wide range of preferences
3. **Simple and intuitive** — Easy to understand regardless of experience
4. **Perceptible information** — Communicates necessary information effectively
5. **Tolerance for error** — Minimizes hazards and adverse consequences
6. **Low physical effort** — Can be used comfortably with minimum fatigue
7. **Size and space for approach and use** — Appropriate size for reach and manipulation

**Multi-modal Interaction** involves multiple input/output channels: visual, auditory, haptic, speech, gesture. Users can choose the mode that suits their context (e.g., voice input while driving).

**Diversity Considerations:** Age (elderly need larger fonts), disability (screen readers for blind), culture (color meanings vary), language, technical literacy.

---

### Unit V — HCI Paradigms

**Q5)** **a)** Explain the evolution of HCI paradigms from time-sharing to agent-based interaction. Discuss how each paradigm influenced modern interface design. [9]

**Evolution of HCI Paradigms:**

1. **Time-sharing (1960s)** — Multiple users share a mainframe via terminals. Influence: multi-user systems, remote access.

2. **Video Display Units (1970s)** — CRT displays replace teletypes. Influence: visual feedback, real-time interaction.

3. **Programming Toolkits (1980s)** — Libraries and APIs for UI development. Influence: rapid prototyping, reusable components.

4. **Personal Computing (1980s)** — One user, one machine. Influence: desktop metaphor, WIMP interface.

5. **Metaphor (1980s-90s)** — Desktop, trash, folders. Influence: intuitive learning, reduced cognitive load.

6. **Hypertext (1990s)** — Non-linear linked information. Influence: World Wide Web, navigation.

7. **Cooperative Work (1990s-00s)** — Multi-user collaboration. Influence: Google Docs, Slack, version control.

8. **Agent-based (2000s-present)** — Intelligent assistants. Influence: Siri, Alexa, chatbots, predictive interfaces.

**b)** What is ubiquitous computing? Explain sensor-based and context-aware interaction with real-world applications. [9]

**Ubiquitous Computing (Ubicomp)** — Mark Weiser's vision of computing seamlessly integrated into the environment, accessible anywhere, anytime through any device.

**Key Characteristics:**
- Invisible computing (devices fade into background)
- Distributed, mobile, and embedded
- Proactive, context-aware

**Sensor-based Interaction:**
- **Proximity sensors** — Phone screen turns off when near ear
- **Accelerometers** — Auto-rotation of screen
- **GPS** — Location-based services
- **Light sensors** — Auto-brightness adjustment

**Context-aware Applications:**
- **Smart homes** — Lights turn on when you enter a room
- **Health monitoring** — Fitbit tracks steps, heart rate
- **Navigation** — Google Maps reroutes based on traffic
- **Retail** — Beacon-triggered offers in stores

---

**OR**

**Q6)** **a)** Explain the role of natural language processing in HCI. Describe the five-stage search model with a detailed example. [9]

**Natural Language Processing (NLP)** enables computers to understand, interpret, and generate human language, making HCI more natural and accessible.

**Five-Stage Search Model (Marchionini):**
1. **Problem recognition** — User realizes need for information (e.g., "Find the cheapest flight to Mumbai")
2. **Problem definition** — Formalize the query ("Compare flight prices from Pune to Mumbai for next Friday")
3. **Search system selection** — Choose tool (Google Flights, IRCTC, MakeMyTrip)
4. **Query formulation** — Translate into system language ("Pune → Mumbai, 15 Dec, 1 adult")
5. **Results evaluation** — Scan, refine, or stop (Click cheapest option, or modify search)

**NLP in Search:**
- Speech-to-text for voice search
- Query understanding (entities, intent, sentiment)
- Results summarization and ranking

**b)** Explain pattern recognition in HCI. Discuss the role of machine learning in gesture and speech recognition systems. [9]

**Pattern Recognition** in HCI is the automated identification of patterns in user input or behavior, enabling intuitive interaction.

**Machine Learning Role:**
- **Gesture Recognition:** ML models (CNN, HMM) classify hand/body movements from sensor data (camera, accelerometer). E.g., swipe to delete, pinch to zoom.
- **Speech Recognition:** ML models (DNN, RNN, Transformer) convert audio to text. E.g., Google Assistant, Siri.

**Process:**
1. Data collection (sensor samples, audio recordings)
2. Feature extraction (MFCC for speech, skeleton joints for gestures)
3. Model training (labeled data → classification model)
4. Real-time inference (streaming prediction)

**Challenges:** Variability across users, environmental noise, real-time performance requirements.

---

### Unit VI — HCI for Mobile and Handheld Devices

**Q7)** **a)** Discuss the anatomy of mobile applications. Explain different navigation patterns: toolbars, drawers, and tap-to-reveal with examples. [9]

**Mobile Application Anatomy:**
- **Status bar** — Time, battery, signal
- **Navigation bar** — App-level navigation
- **Content area** — Main information display
- **Bottom bar/Tab bar** — Primary app sections
- **Toolbar** — Action buttons

**Navigation Patterns:**

| Pattern | Description | Example |
|---|---|---|
| **Toolbar** | Persistent bar with action icons at top/bottom | Gmail compose, search |
| **Drawer (Hamburger menu)** | Slide-out menu from left | Facebook, LinkedIn |
| **Tap-to-reveal** | Hidden options revealed on tap | More options (...), long-press context menu |
| **Bottom navigation** | 3-5 top-level destinations | Instagram (Home, Search, Reels, Shop, Profile) |
| **Tabs** | Segmented controls for sub-sections | WhatsApp (Chats, Status, Calls) |

**b)** What are multi-touch gestures? Explain accessibility considerations for mobile interfaces. Discuss kiosk and 10-foot interfaces. [8]

**Multi-touch Gestures:** Interactions using two or more fingers simultaneously:
- **Pinch** — Zoom in/out
- **Rotate** — Rotate object
- **Two-finger scroll** — Scroll in list
- **Long press** — Context menu
- **Swipe** — Delete, navigate back

**Accessibility Considerations:**
- **Visual:** Sufficient contrast, scalable text, TalkBack/VoiceOver
- **Motor:** Larger touch targets (minimum 48dp), gesture alternatives
- **Auditory:** Captions, vibration feedback
- **Cognitive:** Simple layouts, clear labels, consistent navigation

**Kiosk Interfaces:** Public touchscreens (ATMs, ticketing). Design for: short sessions, standing users, diverse population, no keyboard, durability.

**10-foot Interfaces:** TV/console interfaces viewed from ~10 feet. Design for: large text, minimal detail, D-pad navigation, high contrast.

---

**OR**

**Q8)** **a)** Write short notes on any three of the following: i) Automotive user interfaces ii) Audible interfaces iii) Mobile form factors iv) Accessibility guidelines for mobile apps [9]

**i) Automotive User Interfaces:**
- Voice-controlled (reduce distraction)
- Steering wheel controls, heads-up display (HUD)
- Large touch targets (min 1 inch)
- Minimal visual demand, haptic feedback
- Regulations restrict complex interactions while driving

**ii) Audible Interfaces:**
- Voice-based interaction (phone menus, smart speakers)
- No visual component — pure auditory
- Design challenges: no persistent display, linear navigation
- Examples: IVR systems, Alexa Skills, podcasts navigation

**iii) Mobile Form Factors:**
- Smartphones (5-7" screens), tablets (8-13")
- Foldables, phablets, wearables
- Design must adapt to: one-handed use, pocketability, battery life
- Orientation changes (portrait vs landscape)

**b)** Evaluate the design of a mobile banking application using heuristic evaluation. List at least 5 heuristics and potential violations. [8]

**Heuristic Evaluation of Mobile Banking App:**

| Heuristic | Potential Violation | Severity |
|---|---|---|
| **Visibility of system status** | No loading indicator during fund transfer | 3 (Major) |
| **Match with real world** | Uses jargon "NEFT/RTGS" without explanation | 2 (Minor) |
| **User control and freedom** | No cancel during transaction processing | 4 (Catastrophic) |
| **Consistency** | Logout button in different locations across screens | 2 (Minor) |
| **Error prevention** | No confirmation before transferring to new beneficiary | 3 (Major) |
| **Recognition vs recall** | 16-digit account number must be re-entered each time | 2 (Minor) |
| **Aesthetic design** | Cluttered dashboard with redundant information | 1 (Cosmetic) |

**Severity Scale:** 0 (don't agree) to 4 (usability catastrophe)

---

---

## Examiner Commentary

This paper comprehensively covers HCI evaluation methods (DECIDE, GOMS, heuristics), interaction paradigms, and mobile interface design. Numerical application through GOMS modeling tests analytical skills. The paper balances theoretical knowledge with practical application to real-world interfaces.
