# Notebook Aesthetic — Formatting Rules

## Overview
Converts Markdown to an HTML page styled as handwritten notebook notes, then exports to PDF (A4). Designed for revision notes, study summaries, and quick reference sheets that mimic physical notebook pages.

## Page Structure

### Page Size & Margins
- A4 (210mm × 297mm)
- Left margin: 55px (includes 10px for red margin line)
- Right margin: 50px
- Top margin: 60px (below fixed header)
- Bottom margin: 50px

### Ruled Background
- Light cream/tan paper color (`#fff8f0`)
- Horizontal ruled lines every 28px (measured from top of content area)
- Line color: subtle blue-gray (`#d4d9e6`), 1px height
- Left red margin line: 2px wide, `#f0c0c0`, at 42px from left edge
- Secondary red margin line: 1px wide, `#f0c0c0` (opacity 0.4), at 44px from left edge
- The ruled lines must align with text baselines (line-height matches ruled spacing)

### Fixed Header
- Height: 44px
- Background: `#1a1aff` (blue ink)
- Text: white, Caveat font
- Content: left side shows title/noun, right side shows link/URL
- Shadow: `0 2px 6px rgba(0,0,0,0.15)`
- Appears on every page (via `position: fixed`)

## Typography

### Font
- Primary: `Caveat` (Google Font, weights 400/600/700)
- Fallback: `'Segoe Print', cursive`
- Base size: 18px
- Line height: 1.75 (28px — matches ruled line spacing)

### Headings
- H1: 30px, bold, blue (`#1a1aff`), underlined with 2px blue border
- H2: 24px, semibold, blue
- H3: 20px, semibold, blue
- All headings: aligned left, not centered

### Body Text
- Color: `#222` (near-black, softer than pure black for handwriting feel)
- Indentation: none (zero text-indent)
- Paragraph spacing: 4px margin top/bottom

## Color Scheme

| Use | Color | Hex |
|-----|-------|-----|
| Headings | Blue ink | `#1a1aff` |
| Body | Near-black | `#222` |
| Highlights | Red ink | `#cc0000` |
| Background | Cream paper | `#fff8f0` |
| Ruled lines | Blue-gray | `#d4d9e6` |
| Margin line | Pink/red | `#f0c0c0` |
| Header bg | Blue ink | `#1a1aff` |
| Header text | White | `#fff` |
| Header link | Gold | `#ffd700` |
| Table borders | Gray | `#bbb`, `#999` |
| Blockquote border | Blue ink | `#1a1aff` |

## Typography Markers

### Highlights & Ink Effects
- **`<span class="highlight">`** — Red ink (`#cc0000`, font-weight 600). Use for key terms, important concepts, exam tips
- **`<span class="underline">`** — Blue underline (`#1a1aff`, offset 3px). Use for book titles, foreign words, emphasis
- **`<span class="strikethrough">`** — Red strikethrough. Use for crossed-out items, corrections

### Lists
- Unordered: `→` prefix (→ item), sub-items use `◦` prefix
- Ordered: Standard 1., 2., 3. with blue color
- To-do lists: `☐` unchecked, `☑` done — blue color

## Tables

### Style
- No outer border
- No vertical borders (thin-line notebook style)
- Header row: 2px bottom border in blue ink
- Data rows: 1px bottom border in gray
- Last row: 1px bottom border in darker gray
- Font: Caveat, 16px
- Cell padding: 4px 8px vertical, 3px 8px horizontal
- Text align: left

### Structure
- Markdown tables render directly to `<table>`
- First row becomes `<th>`, rest become `<td>`

## Diagrams & Images

### SVG Diagrams
- Use inline SVG for simple diagrams (architecture, graphs, trees)
- Centered via `<div class="diagram">`
- SVG: `max-width: 90%`, centered
- Border: 1px solid `#ddd`, rounded corners 4px
- Background: white
- Text in SVG should use Caveat font for consistency

### PNG Images
- Use `<img>` with same `.diagram` wrapper
- Same styling as SVG diagrams

### Captions
- `<div class="diagram-caption">` below each diagram
- Font: Caveat italic, 15px, gray (`#666`)

## Other Elements

### Blockquotes
- Left border: 3px solid blue ink
- Left margin: 24px
- Padding: 4px 12px
- Color: `#444`, slightly muted
- Font size: 17px

### Horizontal Rules
- Dashed line (`1px dashed #bbb`)
- Margin: 12px 0

### Inline Code
- Font: Caveat (not monospace — handwriting consistency)
- Background: `#e8e4f0` (light lavender)
- Padding: 1px 6px
- Border radius: 3px

### Formulas
- Centered block via `<div class="formula">`
- Font size: 20px
- Color: blue ink
- Use Unicode math symbols (→, ⊆, ⊇, ∪, ∩, etc.) or inline HTML for simple formulas
- For complex formulas, use SVG renderings

## Export Rules

### PDF Export (Playwright)
- Use `page.pdf()` with `format: 'A4'`
- `printBackground: true` (rules background is essential)
- `displayHeaderFooter: false` (notebook has its own fixed header)
- No `@page` margins (page padding handles spacing)
- `preferCSSPageSize: true`

### Page Breaks
- `.page` div with `break-after: page`
- Each `.page` represents one notebook page
- Content overflows naturally within page; start new `.page` for new sections

## File Structure

```
scripts/
  notebook-to-pdf.js        — CLI entry: markdown → notebook HTML → PDF
  notebook/
    renderer.js              — NotebookHtmlRenderer class
    NOT EBOOK_FORMATTING_RULES.md  — This file
examples/
  notebook/
    sample-notebook.html     — Standalone example HTML
```

## Markdown → Notebook Pipeline

```
input.md
  → MarkdownProcessor (shared, same transforms as exam-paper)
    → marked.parse()
      → NotebookHtmlRenderer.render(htmlBody)
        → Playwright page.setContent(html)
          → page.pdf() → output.pdf
```

### Differences from Exam-Paper Pipeline
1. Uses `NotebookHtmlRenderer` instead of `HtmlRenderer`
2. Caveat font instead of TNR/Caskaydia
3. Ruled background instead of plain white
4. Blue/red ink colors instead of black
5. Fixed header instead of page number footer
6. No KaTeX math rendering (formulas use Unicode or SVG)
7. No strict page margins (CSS handles spacing)
8. No ANSWER BOX styling
9. No mark number spans
