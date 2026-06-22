# Object Oriented Programming and Computer Graphics (PCC-202-COM) — IMP Topics 2024 Pattern

> **SPPU SE Computer Engineering | Semester III | ESE: 70 Marks, CCE: 30 Marks**
> **⚠️ Note:** 2024 Pattern subject. Predictions based on official syllabus + cross-reference with 2019 Pattern OOP PYQs.

---

## Section A — Must-Prepare IMP Topics (Unit-wise)

### Unit I: Introduction to OOP Concepts and Control Structure (9 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| Four programming paradigms (Procedural, OOP, Functional, Logic) | >70% | 2-5M | Always first question territory |
| Need of OOP over procedural programming | >70% | 5M Explain | Classic SPPU question |
| **OOP concepts — Inheritance, Polymorphism, Encapsulation, Abstraction** | >70% | 5-10M | Core topic, tested every time |
| Benefits of OOP | >70% | 2-5M List & explain | Frequently asked |
| **JVM — how Java works** | >70% | 5M Explain architecture | Key Java concept |
| Java data types — Primitive vs Reference | 50-70% | 2M Short note | Quick question |
| Control statements — if, if-else, loops | 50-70% | 5M Write program | Basic but asked |
| Java memory concepts (stack vs heap) | 50-70% | 2-5M | Good conceptual question |

### Unit II: Classes, Objects and Arrays (9 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **Class definition, field declaration, method declaration** | >70% | 5-10M Write program | Foundation of Java |
| **Constructors — types and this keyword** | >70% | 5M Explain with code | Extremely high frequency |
| **Method overloading** | >70% | 5M Explain with code | Always asked |
| Object as parameter, returning objects | >70% | 5M Write program | Important concept |
| **Arrays — declaration, creation, multidimensional** | >70% | 5M | Core topic |
| Variable-length argument lists | 50-70% | 2M Short note | Quick question |
| **Static methods and scope** | >70% | 5M Explain | Frequently tested |
| **Streams — Byte and Character streams** | 50-70% | 5M Explain with diagram | I/O is important |
| Command-line arguments | 30-50% | 2M | Lower priority |

### Unit III: Inheritance, Polymorphism, Exception Handling, Multithreading (9 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **Types of Inheritance** | >70% | 5-10M | Very high frequency |
| **Abstract classes and methods** | >70% | 5M Explain with code | Always asked |
| **Dynamic binding / Polymorphism** | >70% | 5-10M Explain | Core OOP concept |
| **Interfaces in Java** | >70% | 5M Explain with code | Very important |
| **Exception handling — try-catch-finally** | >70% | 5-10M Write code | Extremely important |
| **Throw, throws, multiple catch** | >70% | 5M Explain with code | Always asked |
| Built-in Exceptions | 50-70% | 2M List | Quick question |
| **Multi-threading — Thread class, Runnable interface** | >70% | 5-10M Write code | Very important |
| Final methods and classes | 50-70% | 2M Short note | Quick question |

### Unit IV: Graphics Primitives, Scan Conversion, Windowing and Clipping (9 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **Computer Graphics — Pixel, Resolution, Aspect Ratio, Frame Buffer** | >70% | 2-5M | Foundation of CG — always asked |
| **DDA Line Drawing Algorithm** | >70% | 5-10M Algorithm + trace | CG must-know |
| **Bresenham's Line Drawing Algorithm** | >70% | 5-10M Algorithm + trace | CG must-know |
| **DDA Circle Drawing Algorithm** | >70% | 5-10M | Important |
| **Bresenham's Circle Drawing Algorithm** | >70% | 5-10M | Very important |
| **Midpoint Circle Algorithm** | >70% | 5-10M | Very important |
| Polygon types — Convex, Concave, Complex | 50-70% | 2M | Quick question |
| **Polygon filling — Scan line, Flood fill, Seed fill** | >70% | 5-10M | Very important |
| **Cohen-Sutherland Line Clipping Algorithm** | >70% | 5-10M Algorithm + trace | Most tested clipping algo |
| **Sutherland-Hodgeman Polygon Clipping** | >70% | 5-10M Algorithm + trace | Most tested polygon clipping |
| Inside test for polygons | 50-70% | 2-5M | Secondary |

### Unit V: 2D, 3D Transformations and Projections (9 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **2D Translation, Scaling, Rotation** | >70% | 10M Derivation + numerical | Most important in this unit |
| **Rotation about arbitrary point** | >70% | 10M Derivation | Classic exam problem |
| **Shear transformation (2D)** | >70% | 5-10M | Important |
| **3D Transformations** — Translation, Scaling, Rotation | >70% | 5-10M | Extension of 2D |
| Rotation about arbitrary axis (3D) | 50-70% | 5M | Less common but important |
| **Parallel Projections — Orthographic, Oblique** | >70% | 5M Explain with diagrams | Important |
| **Perspective Projections — 1, 2, 3 vanishing points** | >70% | 5-10M | Very important |
| Isometric, Diametric, Trimetric projections | 50-70% | 2-5M | Quick comparison |

---

## Section B — High-Yield Diagram Topics

| Unit | Diagram Topic | Key Labels |
|------|---------------|------------|
| III | Class hierarchy — types of inheritance | Super/sub class |
| IV | Line drawing — DDA vs Bresenham comparison | Pixels, decision parameter |
| IV | Cohen-Sutherland — outcodes | Region codes (4-bit) |
| IV | Polygon clipping — Sutherland-Hodgeman | Clipped polygon |
| V | 2D Transformation matrices | 3×3 homogeneous |
| V | 3D Transformation matrices | 4×4 homogeneous |
| V | Parallel vs Perspective projection | Vanishing points, projection plane |
| I | JVM Architecture | Class Loader, Bytecode Verifier, JIT |

---

## Section C — IMP Questions by Marks

### 2-Mark Questions
1. Define polymorphism. Give its types.
2. What is the difference between abstract class and interface?
3. What is JVM? Why is Java platform independent?
4. Define resolution and pixel in computer graphics.
5. What is dynamic binding?
6. What is the role of the 'this' keyword in Java?
7. Define method overloading.
8. What are the types of inheritance in Java?
9. What is a frame buffer?
10. Differentiate between byte stream and character stream.

### 5-Mark Questions
1. Explain OOP concepts with examples.
2. Explain constructors with types and a program.
3. Explain exception handling with try-catch-finally.
4. Explain multi-threading in Java with a program.
5. Explain DDA line drawing algorithm with example.
6. Compare DDA and Bresenham's line drawing algorithms.
7. Explain Cohen-Sutherland line clipping algorithm.
8. Explain flood fill and seed fill algorithms.
9. Explain 2D translation and scaling with matrix representation.
10. Compare parallel and perspective projections.

### 10-Mark Questions
1. Write a Java program demonstrating inheritance, polymorphism, and dynamic binding.
2. Explain Bresenham's line drawing algorithm with a complete numerical example.
3. Explain Bresenham's circle drawing algorithm with numerical.
4. Explain Sutherland-Hodgeman polygon clipping algorithm with example.
5. Derive 2D rotation matrix for rotation about an arbitrary point (x_r, y_r).
6. Explain 2D transformations — translation, scaling, rotation, shear — with matrix representations and numerical.
7. Explain exception handling types — checked, unchecked, user-defined — with code.
8. Write a Java program using interfaces to demonstrate polymorphism.

---

## Section D — Cross-Unit Question Prediction

| Units | Combined Topic | Likely Format |
|-------|----------------|---------------|
| III + V | OOP design for CG class hierarchy (Point, Shape, Transform) | 5M Design |
| I + III | Polymorphism in OOP + its implementation in Java | 5-10M |
| IV + V | Clipping after transformation in a graphics pipeline | 5-10M |
| II + III | Arrays of objects + inheritance | 5M Program |

---

## Section E — Preparation Strategy

### Unit Priority
1. **Unit III** (Inheritance, Polymorphism, Exceptions, Threading) — Heaviest, most varied
2. **Unit V** (2D/3D Transformations) — High-scoring numericals
3. **Unit IV** (Scan Conversion, Clipping) — Algorithm-heavy, high scoring
4. **Unit I** (OOP Concepts, Java basics) — Foundation, easy marks
5. **Unit II** (Classes, Objects, Arrays) — Moderate, program-based

### Key Strategy
- **OOP units (I-III):** Focus on writing clean Java code snippets. Practice exception handling + multithreading programs.
- **CG units (IV-V):** Focus on algorithms with numerical traces. Practice drawing matrices for transformations.
