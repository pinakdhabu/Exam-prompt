# Engineering Physics (2024 Pattern) — Sample Paper 1: Ideal Solution

---

## Q1) Multiple Choice Questions [10]

a) **Option (ii) Electric current injection** — Semiconductor laser uses **forward bias current**
for population inversion.

b) **Option (ii) Refractive indices** — \(NA = \sqrt{n_1^2 - n_2^2}\) where \(n_1, n_2\) are core
and cladding refractive indices.

c) **Option (ii) Mass and velocity** — \(\lambda = h/(mv)\) depends on momentum.

d) **Option (ii)** \(2\mu t\cos r = (2n+1)\lambda/2\) — condition for constructive interference in
reflected system from thin film.

e) **Option (i) Positive** — \(R_H = 1/(pq)\) for p-type (holes as majority carriers).

f) **Option (ii) Complete Meissner effect** — Type I exhibits perfect diamagnetism below \(H_c\).

g) **Option (ii) 1.1 eV** — Silicon band gap at room temperature.

---

## Unit I — Fundamentals of Photonics

### Q2) [12]

**a) CO₂ laser:** Gas laser using CO₂, N₂, and He mixture.

**Construction:** Discharge tube with mirrors at ends (one fully reflective, one partially).
**Working:** Electrical discharge excites N₂ molecules (metastable), which transfer energy to CO₂
molecules by collision. CO₂ molecules undergo lasing transition between vibrational-rotational
energy levels (10.6 μm wavelength). Helium helps depopulate lower level and cool the gas.

**Applications:** industrial cutting/welding, surgery, LIDAR.

**b) Numerical aperture (NA)** of step-index fiber:

Consider a ray entering fiber core at angle \(\theta_a\). By **Snell's law** at air-core interface:
\[n_0\sin\theta_a = n_1\sin\theta_r\]

For total internal reflection at core-cladding interface: \(\sin\phi_c = n_2/n_1\) where \(\phi_c =
90^\circ - \theta_r\)

**Acceptance angle** \(\theta_a\): \[\sin\theta_a = \sqrt{n_1^2 - n_2^2}\]

**Numerical Aperture:** \(NA = \sin\theta_a = \sqrt{n_1^2 - n_2^2}\)

**Acceptance cone:** The cone of half-angle \(\theta_a\) within which incident rays are guided.

---

## Unit II — Quantum Physics

### Q4) [12]

**a) Schrödinger's time independent equation:**

From **time-dependent equation**: \(-\frac{\hbar^2}{2m}\frac{\partial^2\psi}{\partial x^2} + V\psi =
i\hbar\frac{\partial\psi}{\partial t}\)

Let \(\psi(x,t) = \psi(x)e^{-iEt/\hbar}\). Substituting: \[-\frac{\hbar^2}{2m}\frac{d^2\psi}{dx^2} +
V\psi = E\psi\]

Rearranging: \(\frac{d^2\psi}{dx^2} + \frac{2m}{\hbar^2}(E-V)\psi = 0\)

This is the **time-independent Schrödinger equation**.

**b)** Potential well width \(L = 4\) Å \(= 4\times10^{-10}\) m.

**Ground state energy** (\(n=1\)): \(E_1 = \frac{h^2}{8mL^2}\)

\[E_1 = \frac{(6.63\times10^{-34})^2}{8 \times 9.1\times10^{-31} \times (4\times10^{-10})^2} =
\frac{4.396\times10^{-67}}{1.165\times10^{-48}}\] \[= 3.77\times10^{-19}\text{ J} = 2.36\text{ eV}\]

Energy from \(n=2\) to \(n=1\): \[\Delta E = E_2 - E_1 = (4-1)E_1 = 3 \times 2.36 = 7.08\text{ eV} =
1.134\times10^{-18}\text{ J}\]

Wavelength: \(\lambda = \frac{hc}{\Delta E} = \frac{6.63\times10^{-34} \times
3\times10^8}{1.134\times10^{-18}}\)

\[ \boxed{\lambda = 175.4\text{ nm (UV region)}} \]

---

## Unit III — Wave Optics

### Q6) [12]

**a) Thin film interference:**

When light is incident on a thin film of thickness \(t\) and refractive index \(\mu\), the path
difference between two reflected rays is: \[\Delta = 2\mu t\cos r\]

where \(r\) is the angle of refraction. An additional path difference of \(\lambda/2\) occurs due to
phase reversal at the upper surface (air-to-film).

**Condition for maxima (bright) in reflected system:** \[2\mu t\cos r =
(2n+1)\frac{\lambda}{2},\quad n=0,1,2,\ldots\]

**Condition for minima (dark) in reflected system:** \[2\mu t\cos r = n\lambda\]

**b) Malus law:** When plane polarized light passes through an analyzer, the intensity of
transmitted light varies as \(\cos^2\theta\), where \(\theta\) is the angle between transmission
axes: \[I = I_0\cos^2\theta\]

Given unpolarized light \(I_0\) through first polarizer: \(I_1 = I_0/2\). Through second polarizer
at \(60^\circ\): \(I_2 = I_1\cos^2 60 = (I_0/2)(1/2)^2\)

\[ \boxed{I_2 = I_0/8} \]

---

## Unit V — Physics of Nanoparticles & Superconductivity

### Q10) [12]

**a) Quantum confinement:** When a material's size is reduced to the nanoscale (comparable to
**exciton Bohr radius**), charge carriers are confined spatially. This leads to:

- **Discrete energy levels** (like particle in a box) instead of continuous bands
- **Increase in band gap** with decreasing size — size-tunable optical properties
- **Blue shift** in absorption/emission spectra as particle size decreases

**b) Meissner effect:** Complete expulsion of magnetic flux from the interior of a superconductor
when cooled below \(T_c\) in the presence of a magnetic field. This demonstrates **perfect
diamagnetism** (\(\chi = -1\)).

**Type I vs Type II:**

| Basis                    | Type I                      | Type II                                             |
| ------------------------ | --------------------------- | --------------------------------------------------- |
| **Meissner effect**      | Complete up to \(H_c\)      | Complete up to \(H*{c1}\), partial up to \(H*{c2}\) |
| **Magnetization**        | Abrupt transition           | Gradual (vortex state)                              |
| **Critical temperature** | Low (typically <10 K)       | Higher (up to ~130 K)                               |
| **Applications**         | Not practical (low \(H_c\)) | High-field magnets, SQUIDs                          |
| **Examples**             | Pb, Hg, Sn                  | YBCO, NbTi, Nb₃Sn                                   |

═══════════════════════════════════════════════════════ EXAMINER COMMENTARY Why this scores full
marks: Complete derivations (NA, Schrödinger, thin film). Numerical calculations show all steps.
Tables for comparison (SC types). Key terms bolded. Mermaid diagrams referenced.

Common Deductions:

- Missing phase change condition (\(\lambda/2\)) in thin film interference
- Incorrect units in energy/wavelength calculations
- Confusing Type I and Type II superconductor properties
- Not specifying acceptance angle formula

Time Budget: Q1: 10 min | Q2/Q3: 20 min | Q4/Q5: 20 min | Q6/Q7: 20 min | Q8/Q9: 20 min | Q10/Q11:
20 min ═══════════════════════════════════════════════════════
