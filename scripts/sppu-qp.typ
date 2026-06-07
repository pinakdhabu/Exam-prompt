// SPPU Question Paper Template for Typst v0.14
// Professional formatting matching official SPPU papers
// Times New Roman + native math rendering
// Research-backed: based on Typst Universe best practices for exam templates

#let sppu_qp(
  title: "",
  time: "2.5 Hours",
  marks: "70",
  body: []
) = {
  // Page layout
  set page(
    paper: "a4",
    margin: (top: 20mm, bottom: 25mm, left: 18mm, right: 18mm),
    numbering: "1",
    number-align: center,
  )

  // Font: Times New Roman with fallback
  set text(font: ("Times New Roman", "Cambria Math", "DejaVu Serif"), size: 12pt)

  // Paragraph: justified, consistent spacing
  set par(justify: true, leading: 0.45em, first-line-indent: 0pt)
  set heading(numbering: none)

  // Seat Number Box
  align(right, box(
    width: 120pt, height: 20pt,
    stroke: 1.5pt + black,
    inset: 4pt,
    align(center + horizon, text(size: 9pt)[Seat No.])
  ))
  v(-4pt)

  // QP Header
  align(center, text(size: 14pt, weight: "bold", title))
  align(center, text(size: 11pt)[Time: #time    Total Marks: #marks])
  line(length: 100%, stroke: 1pt + black)
  v(6pt)

  // Body
  body

  // Disclaimer
  v(24pt)
  line(length: 100%, stroke: 0.5pt + gray)
  set text(size: 9pt, fill: gray)
  align(center)[
    *DISCLAIMER* \
    This question paper was generated using Artificial Intelligence \
    for educational and practice purposes only. \
    It is not an official question paper and is not affiliated with, \
    endorsed by, approved by, or associated with Savitribai Phule \
    Pune University (SPPU).
  ]
}

// Right-aligned marks badge: [16] pushed to right margin
#let marks_badge(n) = {
  h(1fr); text(size: 10pt, weight: "regular")[\[#n\]]
}

// Main question heading: Q1) Q2) etc.
// Uses pagebreak(weak:true) to prevent orphaned questions at page end
#let main_question(number, body) = {
  pagebreak(weak: true)
  v(6pt)
  text(weight: "bold", size: 12pt)[#number)]
  body
}

// OR separator — centered
#let or_block = {
  v(6pt)
  align(center, text(weight: "bold", fill: gray)[— OR —])
  v(6pt)
}

// Sub-question: a) b) c) with right-aligned marks
// body is passed directly (not wrapped in [#body]) to preserve h(1fr) spacing
#let sub_question(label, body) = {
  grid(
    columns: (auto, 1fr),
    gutter: 4pt,
    [#text(weight: "bold")[#label)]],
    body
  )
  v(2pt)
}
