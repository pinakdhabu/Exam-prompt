# SPPU Question Paper Layout Specification (2019 Pattern)

This specification defines the strict layout and typographic rules to generate PDFs matching the official Savitribai Phule Pune University (SPPU) examination papers.

---

## 1. Document Geometry & Page Size

* **Page Size:** A4 Portrait (`595 x 842` pt).
* **Margins:**
  * Top: `24 mm` (approx. `68 pt`)
  * Bottom: `24 mm` (approx. `68 pt`)
  * Left: `25 mm` (approx. `71 pt`)
  * Right: `17 mm` (approx. `48 pt`)
* **Color Palette:** Pure black and white text only (`#000000`). No colored decorative bars or background accents.

---

## 2. Page Header Block (Page 1 Only)

The header block uses a strict grid structure to align elements precisely:

### Row 1
```
Total No. of Questions : 8                         SEAT No. : [ | | | | | | | | ]
```
* **Total No. of Questions : X]** is left-aligned in Times Bold (`12 pt`).
* **SEAT No. :** is right-aligned in Times Bold (`12 pt`), followed by a 9-slot border grid box (width `135 px`, height `18 px` total; built using 9 inline `15x18 px` table cells with solid borders).

### Row 2
```
PD4505                                              [Total No. of Pages : 2
```
* **Paper Code** (e.g., `PD4505`): Left-aligned in Times Bold (`16 pt`).
* **Total No. of Pages : Y** (e.g., `[Total No. of Pages : 2`): Right-aligned in Times Regular (`12 pt`).

### Row 3 (Paper Identifier Centered)
```
[6404]-1
```
* **Paper Identifier:** Centered, Times Bold (`16 pt`).

### Row 4 (Main Course Title Blocks - Centered)
```
B.E. (Automobile)
AUTOMOTIVE TESTING & CERTIFICATION
(2019 Pattern) (Semester – VII) (416481)
```
* **Department/Program Line:** Centered, Times Bold (`14 pt`).
* **Subject/Course Title:** Centered, Times Bold (`14 pt`), capitalized (`text-transform: uppercase`).
* **Pattern/Semester Info Line:** Centered, Times Bold (`14 pt`), unified on a single line.

### Row 5 (Time & Max Marks)
```
Time : 2½ Hours                                           [Max. Marks : 70
```
* **Time Info:** Left-aligned, Times Bold (`12 pt`). Vulcan fraction `½` used for half hours.
* **Max Marks:** Right-aligned, Times Bold (`12 pt`), format: `[Max. Marks : 70`.

---

## 3. Instructions Candidates Block

```
Instructions to the candidates:
  1)  Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8.
  2)  Neat diagrams must be drawn wherever necessary.
  3)  Figures to the right side indicate full marks.
  4)  Assume suitable data if necessary.
```
* **Heading:** Bold Italic Times (`12 pt`).
* **List Items:** Regular Italic Times (`12 pt`). Numbered with closing parenthesis `)`.
* **Question Numbers in text:** Any references like `Q.1` or `Q.2` inside the text should be formatted as bold-italic (`<strong><em>Q.1</em></strong>`).

---

## 4. Page Layout Flow & Separators

* **Separators:** There are **NO horizontal separation lines** (`<hr>` tags are hidden) separating questions, units, or instructions. Spacing is maintained using margins and paragraph padding.
* **Page Break:** A page break is forced after Q4.
* **P.T.O. Indicator:** At the bottom right of Page 1 (under instructions/questions flow), print `P.T.O.` in regular italic Times (`12 pt`), right-aligned.

---

## 5. Question Block Formatting

Questions follow a strict indent structure:

### 5.1 Main Question (e.g. Q1)
```
Q1) a) Explain the test procedure of Coast Down Test.                 [9]
```
* **Formatting:** `Q1)` is bold-italic Times (`12 pt`, class `.q-label`), while the sub-letter `a)` and content text are regular weight.
* **Indents:** Left-aligned with no indent relative to page margin (`x = 70.8 pt`).
* **Marks:** Right-aligned absolutely on the right edge of the page flow (`position: absolute; right: 0;`), enclosed in brackets like `[9]`. Never wrap marks to the next line.

### 5.2 Sub-Questions (e.g. b, c)
```
    b) Explain the following.                                          [9]
```
* **Formatting:** Regular weight Times (`12 pt`). No bold or italic.
* **Indents:** Indented by `28.4 pt` (`x = 99.2 pt` relative to body margin).

### 5.3 Nested Lists (e.g. i, ii)
```
       i)   Split-mu
       ii)  External noise track
```
* **Formatting:** Regular weight Times (`12 pt`).
* **Indents:** Indented by `56.8 pt` (`x = 127.6 pt` relative to body margin).

### 5.4 Continuation Lines
Any text wrapping to the second line of a main question or sub-question must align cleanly at `x = 127.6 pt` (offset `56.8 pt` relative to body margin).

---

## 6. Centered "OR" Block

Between consecutive alternative questions:
```
b) ...

                                     OR

Q2) a) ...
```
* Centered on page, Times Bold (`12 pt`).
* Spaced out with margins above and below.

---

## 7. Footer Block

The footer template appears at the bottom of pages:
* **Bottom-Left:** Paper identifier (e.g. `[6404]-1`), Times Bold (`17 pt`).
* **Bottom-Center:** Page number (e.g. `2`), Times Regular (`12 pt`).
* **Bottom-Center (End of Paper page 2+):** Center-aligned page registration symbol block `ⓘ ⓘ ⓘ ⓘ` printed below the final question block.

---

## 8. Typography Summary

* **Body Text:** Times New Roman (`12 pt` / `10.5 pt` PDF point scaling).
* **Line Height:** `1.4` (approx. `16.6 pt` baseline distance).
* **Paragraph spacing:** `4-6 pt`.
* **Main Question Label (`Q1)`):** Bold Italic (`12 pt`).
* **Marks (`[9]`):** Bold (`12 pt`), absolutely positioned right.
* **Instructions List:** Italic (`12 pt`).
