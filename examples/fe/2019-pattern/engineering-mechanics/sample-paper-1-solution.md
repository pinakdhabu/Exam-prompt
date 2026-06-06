# Engineering Mechanics — Sample Paper 1: Ideal Solution

---

## Unit III — Friction and Trusses

### Q1) [15]

**a) Laws of Coulomb friction:**

1. The frictional force always acts opposite to the direction of motion
2. Friction is independent of area of contact
3. Limiting friction is proportional to normal reaction: \(F = \mu N\)
4. Kinetic friction is less than limiting friction
5. Friction depends on the nature of surfaces in contact

**Coefficient of friction** \(\mu = F/N\) — ratio of limiting friction to normal reaction. **Angle
of repose** \(\alpha\) — the angle of inclination at which a body just begins to slide; \(\tan\alpha
= \mu\). **Angle of friction** \(\phi\) — angle between total reaction and normal reaction;
\(\tan\phi = \mu\).

**b)** Ladder \(L=5\) m, weight \(W_L=250\) N at center, man \(W_M=750\) N at distance \(x\) from
bottom.

Wall is smooth (no vertical friction), floor is rough (\(\mu=0.3\)).

For equilibrium: \(\sum F_x = 0\), \(\sum F_y = 0\), \(\sum M = 0\).

\(R_A\) (wall reaction, horizontal), \(R_B\) (floor reaction, vertical), \(F = \mu R_B\) (friction
at bottom).

\(\sum F_y = 0\): \(R_B = 250 + 750 = 1000\) N, so \(F = 0.3 \times 1000 = 300\) N

\(\sum F_x = 0\): \(R_A = F = 300\) N

Taking moment about bottom: \(300 \times 5\sin\theta = 250 \times 2.5\cos\theta + 750 \times
x\cos\theta\)

For a ladder against vertical wall: \(\tan\theta = \frac{\text{height}}{\text{distance}}\). Assuming
\(\theta = 60^\circ\):

\(300 \times 5\sin60 = 250 \times 2.5\cos60 + 750 \times x\cos60\)

\(300 \times 5 \times 0.866 = 250 \times 2.5 \times 0.5 + 750 \times x \times 0.5\)

\(1299 = 312.5 + 375x\)

\(x = \frac{1299 - 312.5}{375} = \frac{986.5}{375}\)

\[ \boxed{x = 2.63\text{ m from bottom}} \]

**c)** Symmetric Warren truss, span 6 m, height 3 m, load 10 kN at apex.

Using **method of joints**: Joint angles are \(45^\circ\) (for 3 m height, 3 m half-span).

At apex joint: Two equal inclined members carry \(10/(2\sin45) = 7.07\) kN compression.

\[ \boxed{\text{Rafter members: } 7.07\text{ kN compression; Bottom chord: } 5\text{ kN tension}} \]

---

## Unit IV — Kinematics of Particle

### Q3) [15]

**a) Equations of uniformly accelerated motion:**

1. \(v = u + at\)
2. \(s = ut + \frac{1}{2}at^2\)
3. \(v^2 = u^2 + 2as\)

where \(u\) = initial velocity, \(v\) = final velocity, \(a\) = acceleration, \(s\) = displacement,
\(t\) = time.

**b)** Stone thrown upward with \(u = 30\) m/s from tower height \(h = 50\) m.

i) **Max height above ground:** At max height, \(v = 0\). \(v^2 = u^2 - 2gh_m \implies 0 = 30^2 -
2(9.81)h_m\) \(h_m = \frac{900}{19.62} = 45.87\) m above tower

\[ \boxed{\text{Max height above ground } = 50 + 45.87 = 95.87\text{ m}} \]

ii) **Time to reach ground:** Taking downward as positive from top of tower: \(s = ut +
\frac{1}{2}gt^2\) with \(u = -30\) m/s, \(s = 50\) m: \(50 = -30t + 4.905t^2 \implies 4.905t^2 -
30t - 50 = 0\) \(t = \frac{30 \pm \sqrt{900 + 981}}{9.81} = \frac{30 \pm \sqrt{1881}}{9.81}\)

\[ \boxed{t = 7.48\text{ s}} \]

iii) **Velocity on striking ground:** \(v = u + gt = -30 + 9.81 \times 7.48\)

\[ \boxed{v = 43.4\text{ m/s downward}} \]

**c) Curvilinear motion:** A particle moving along a curved path. Position given by \(\vec{r} =
x\hat{i} + y\hat{j}\). Velocity \(\vec{v} = \dot{x}\hat{i} + \dot{y}\hat{j}\). Acceleration
\(\vec{a} = \ddot{x}\hat{i} + \ddot{y}\hat{j}\). Each rectangular component is analyzed
independently.

---

## Unit V — Kinetics of Particle

### Q5) [15]

**a) Newton's second law:** The rate of change of momentum is proportional to the impressed force
and takes place in the direction of the force. \(F = ma\) (for constant mass)

**Derivation:** \(F \propto \frac{d}{dt}(mv) = m\frac{dv}{dt} = ma\) (for \(m\) constant). With
appropriate units, \(F = ma\).

**b)** Block mass \(m = 10\) kg, incline \(30^\circ\), \(\mu = 0.2\).

Forces along incline: \(mg\sin30 - \mu mg\cos30 = ma\) \(a = g(\sin30 - \mu\cos30) = 9.81(0.5 - 0.2
\times 0.866)\) \(a = 9.81(0.5 - 0.1732) = 9.81 \times 0.3268\)

\[ \boxed{a = 3.206\text{ m/s}^2} \]

Distance in 4 s: \(s = \frac{1}{2}at^2 = \frac{1}{2} \times 3.206 \times 16\)

\[ \boxed{s = 25.65\text{ m}} \]

**c) Work-energy principle:** The work done by the resultant force on a particle equals the change
in its kinetic energy. \(W = \int F\,ds = \int ma\,ds = \int m\frac{dv}{dt}\,ds = \int mv\,dv =
\frac{1}{2}m(v^2 - u^2) = \Delta KE\)

---

## Unit VI

### Q7) [15]

**a) Centroid of composite T-section:** Flange \(100\times20\) mm, web \(80\times20\) mm.

Taking bottom of web as reference: | Part | Area \(A\) | \(y\) (from bottom) | \(Ay\) |
|---|---|---|---| | Flange | \(100\times20=2000\) | \(80+10=90\) | \(180000\) | | Web |
\(80\times20=1600\) | \(40\) | \(64000\) | | **Total** | **3600** | | **244000** |

\(\bar{y} = \frac{\sum Ay}{\sum A} = \frac{244000}{3600}\)

\[ \boxed{\bar{y} = 67.78\text{ mm from bottom}} \]

**b) Parallel axis theorem:** \(I\_{XX} = I_G + A d^2\) — MI about any axis equals MI about parallel
centroidal axis plus \(Ad^2\).

**Perpendicular axis theorem:** \(I_z = I_x + I_y\) — For a lamina, polar MI equals sum of
rectangular MIs about perpendicular axes.

**c)** Rectangle \(200\times100\) mm about centroidal axes: \(I\_{xx} = \frac{bh^3}{12} =
\frac{200\times100^3}{12} = \frac{200\times10^6}{12}\)

\[ \boxed{I*{xx} = 16.67\times10^6\text{ mm}^4,\quad I*{yy} = \frac{100\times200^3}{12} =
66.67\times10^6\text{ mm}^4} \]

═══════════════════════════════════════════════════════ EXAMINER COMMENTARY Why this scores full
marks: Free body diagrams described for ladder problem. ALL steps shown in projectile/numerical
problems. Equations stated before substitution. Centroid calculation with table format. Key theorems
bolded.

Common Deductions:

- Not drawing FBD for ladder/truss problems (big deduction)
- Skipping sign conventions in kinematics
- Missing units in moment of inertia calculations
- Confusing centroid and center of gravity

Time Budget: Q1/Q2: 22 min | Q3/Q4: 22 min | Q5/Q6: 22 min | Q7/Q8: 22 min | Review: 12 min
═══════════════════════════════════════════════════════
