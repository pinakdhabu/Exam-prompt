# Computer Graphics — Sample Paper 1 — Ideal Solution

---

## Q1) 2D, 3D Transformations and Projections

### a) Orthographic vs Isometric projection

| Basis            | Orthographic Projection                          | Isometric Projection                                     |
| ---------------- | ------------------------------------------------ | -------------------------------------------------------- |
| View angles      | Projection plane perpendicular to view direction | Projection plane makes equal angles (120°) with all axes |
| Depth perception | No depth — all dimensions equally scaled         | Provides 3D depth with equal foreshortening              |
| Uses             | Engineering drawings, blueprints                 | Technical illustrations, assembly diagrams               |
| Distortion       | No perspective distortion                        | All three axes equally foreshortened                     |

Thus, orthographic projection preserves exact dimensions while isometric projection provides visual
depth.

### b) Transformation matrices

**3D Translation** using homogeneous coordinates (4×4 matrix):

```
T(dx, dy, dz) = | 1  0  0  dx |
                | 0  1  0  dy |
                | 0  0  1  dz |
                | 0  0  0   1 |
```

**3D Rotation about X-axis** by angle θ:

```
Rx(θ) = | 1    0      0    0 |
        | 0  cosθ  −sinθ   0 |
        | 0  sinθ   cosθ   0 |
        | 0    0      0    1 |
```

Thus, homogeneous coordinates enable unified matrix representation of all transformations.

### c) Rotation of square by 45° about A(1,0)

**Step 1**: Translate A to origin: T(−1, 0) **Step 2**: Rotate by 45°: R(45°) **Step 3**: Translate
back: T(1, 0)

For vertex B(0,0):

- After T(−1,0): (−1, 0)
- After R(45°): (−0.707, −0.707)
- After T(1,0): (0.293, −0.707)

For vertex C(0,1):

- After T(−1,0): (−1, 1)
- After R(45°): (−1.414, 0)
- After T(1,0): (−0.414, 0)

For vertex D(1,1):

- After T(−1,0): (0, 1)
- After R(45°): (−0.707, 0.707)
- After T(1,0): (0.293, 0.707)

**Answer: A'(1,0), B'(0.293, −0.707), C'(−0.414, 0), D'(0.293, 0.707)**

---

## Q3) Light, Colour, Shading and Hidden Surfaces

### a) Backface detection and removal

**Backface detection** identifies polygon faces that face away from the viewer and are thus
invisible. A polygon is a backface if the dot product of its surface normal N and the view direction
vector V is positive (N·V > 0).

**Algorithm:**

1. Compute the surface normal N using cross product of polygon edges
2. Compute the view direction vector V from the polygon to the camera
3. If N·V > 0, the polygon is a backface and can be culled

Thus, backface culling reduces rendering workload by eliminating invisible faces.

### b) Point source vs Diffuse illumination

| Aspect             | Point Source                         | Diffuse (Ambient) Illumination      |
| ------------------ | ------------------------------------ | ----------------------------------- |
| Direction          | Light from a specific point in space | Light from all directions uniformly |
| Shadow             | Produces sharp shadows               | No shadows                          |
| Intensity fall-off | Follows inverse square law           | Constant throughout scene           |
| Real-world example | Light bulb, flashlight               | Overcast sky light                  |

Thus, combining both illumination types creates realistic scenes with ambient fill and directional
highlights.

### c) RGB vs HSV color models

| Basis          | RGB                         | HSV                                 |
| -------------- | --------------------------- | ----------------------------------- |
| Components     | Red, Green, Blue (additive) | Hue, Saturation, Value (perceptual) |
| Representation | Cube coordinates            | Cylindrical coordinates             |
| Intuitiveness  | Hardware-oriented           | Human-oriented                      |
| Uses           | Displays, cameras           | Image editing, color picking        |

Thus, RGB is suitable for display hardware while HSV enables intuitive color manipulation.

---

## Q5) Curves and Fractals

### a) Interpolation and approximation

**Interpolation** generates a curve that passes through all given data points exactly. Example:
Lagrange interpolation, cubic spline interpolation.

**Approximation** generates a curve that passes near the data points without necessarily passing
through them. Example: Bezier curves, B-Spline curves.

Thus, interpolation is used when exact data point matching is required, while approximation provides
smoother control.

### b) Blending function for B-Spline curve

**B-Spline blending functions** are piecewise polynomials that define how control points influence
the curve. The B-Spline curve is defined as:

P(t) = Σᵢ Nᵢ,ₖ(t) · Pᵢ

where Nᵢ,ₖ(t) is the k-th order **blending function** defined recursively:

- Nᵢ,₁(t) = 1 if tᵢ ≤ t < tᵢ₊₁, else 0
- Nᵢ,ₖ(t) = ((t − tᵢ)/(tᵢ₊ₖ₋₁ − tᵢ)) · Nᵢ,ₖ₋₁(t) + ((tᵢ₊ₖ − t)/(tᵢ₊ₖ − tᵢ₊₁)) · Nᵢ₊₁,ₖ₋₁(t)

Properties: Local control, Cᵏ⁻² continuity, convex hull property.

### c) Fractals and Triadic Koch curve

**Fractals** are geometric shapes that exhibit **self-similarity** at different scales. They are
generated by recursively applying a pattern.

**Triadic Koch curve** construction:

1. Start with a line segment (initiator)
2. Divide into 3 equal parts
3. Replace the middle third with an equilateral triangle (without base)
4. Repeat for each new segment

After infinite iterations, the Koch curve has infinite length but finite area, with fractal
dimension D = log 4 / log 3 ≈ 1.2619.

---

## Q7) Animation and Gaming

### a) Segment deletion

A **segment** is a named collection of graphics primitives stored in a **segment table**. Deletion
of a segment removes all primitives associated with it from display.

```cpp
// Segment table structure:
// | Segment ID | Attributes | Primitives List | Visibility |
// |------------|-------------|-----------------|------------|
// | 1          | visible     | line, circle    | on         |

// deleteSegment(id) removes all primitives of segment id
// and updates the segment table
```

### b) Morphing

**Morphing** is the smooth transformation of one image or shape into another through a sequence of
intermediate frames. Applications: movie special effects, medical imaging, face aging simulation.

### c) NVIDIA workstation block diagram

```
+------------------+     +------------------+
|    CPU Core      |<--->|    GPU (CUDA)    |
|  (Intel/AMD)     |     |  Thousands of    |
|   Multi-core     |     |  CUDA Cores      |
+--------+---------+     +--------+---------+
         |                        |
         v                        v
+--------+---------+     +--------+---------+
|   System Memory   |     |  Video Memory   |
|     (DDR RAM)     |     |   (GDDR VRAM)   |
+-------------------+     +------------------+
         |                        |
         +----------+-------------+
                    v
          +--------+---------+
          |   Storage (SSD)  |
          +------------------+
```

Thus, NVIDIA workstations use parallel GPU cores with dedicated high-bandwidth VRAM for accelerated
graphics and compute workloads.

---

═══════════════════════════════════════════════════════ EXAMINER COMMENTARY

Why this scores full marks:

- Transformation problem solved step-by-step with intermediate coordinates
- Backface detection explained with dot product criterion
- Color model comparison in table format with real-world applications
- B-Spline blending function shown with recursive definition
- Koch curve fractal dimension mathematically derived
- Hardware block diagram with labeled components

Common Deductions:

- Not showing 3D rotation matrix derivation
- Confusing projection types (parallel vs perspective)
- Missing intermediate coordinate calculations for transformation problems
- Not explaining the recursive nature of fractal generation
- Incomplete comparison tables (less than 3 rows)

Time Budget:

- Q1 (18 marks): 42 min → Q1a: 12 min, Q1b: 12 min, Q1c: 18 min
- Q3 (17 marks): 40 min → Q3a: 14 min, Q3b: 12 min, Q3c: 14 min
- Q5 (18 marks): 42 min → Q5a: 10 min, Q5b: 16 min, Q5c: 16 min
- Q7 (17 marks): 40 min → Q7a: 15 min, Q7b: 8 min, Q7c: 17 min

═══════════════════════════════════════════════════════
