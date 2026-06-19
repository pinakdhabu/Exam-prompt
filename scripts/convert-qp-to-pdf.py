#!/usr/bin/env python3
"""
Convert Markdown question papers to QP-styled PDF.
"""
import markdown
import weasyprint
import os
import sys
import re

HTML_TEMPLATE = """<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<style>
  @page {{
    size: A4;
    margin: 1.8cm 2cm 2cm 2cm;
    @bottom-center {{
      content: counter(page);
      font-family: 'DejaVu Serif', 'Times New Roman', serif;
      font-size: 9pt;
      color: #555;
    }}
  }}

  body {{
    font-family: 'DejaVu Serif', 'Times New Roman', 'Georgia', serif;
    font-size: 11pt;
    line-height: 1.55;
    color: #000;
  }}

  h1 {{
    font-size: 15pt;
    font-weight: bold;
    color: #000;
    text-align: center;
    margin: 6px 0;
    padding: 0;
    border: none;
    text-transform: uppercase;
    letter-spacing: 1pt;
  }}

  h2 {{
    font-size: 12pt;
    font-weight: bold;
    color: #000;
    text-align: center;
    margin: 4px 0;
    padding: 0;
    border: none;
    text-decoration: underline;
  }}

  h3 {{
    font-size: 11.5pt;
    font-weight: bold;
    color: #000;
    margin: 12px 0 4px 0;
    padding: 0;
    border: none;
  }}

  h4 {{
    font-size: 11pt;
    font-weight: bold;
    color: #000;
    margin: 8px 0 2px 0;
    padding: 0;
  }}

  p {{
    margin: 2px 0;
    text-align: justify;
  }}

  strong {{ font-weight: bold; }}

  hr {{
    border: none;
    border-top: 1px solid #666;
    margin: 12px 0;
  }}

  table {{
    width: 100%;
    border-collapse: collapse;
    margin: 8px 0;
    font-size: 10pt;
  }}

  th {{
    background: #e8e8e8;
    color: #000;
    padding: 4px 8px;
    text-align: left;
    font-weight: bold;
    border: 1px solid #999;
  }}

  td {{
    padding: 4px 8px;
    border: 1px solid #bbb;
  }}

  tr:nth-child(even) {{ background: #f8f8f8; }}

  pre {{
    background: #f5f5f5;
    border: 1px solid #ccc;
    padding: 6px 10px;
    font-family: 'DejaVu Sans Mono', 'Courier New', monospace;
    font-size: 8pt;
    line-height: 1.3;
    white-space: pre-wrap;
    page-break-inside: avoid;
  }}

  code {{
    font-family: 'DejaVu Sans Mono', 'Courier New', monospace;
    font-size: 9pt;
  }}

  ul, ol {{ margin: 3px 0; padding-left: 20px; }}
  li {{ margin: 1px 0; }}

  blockquote {{
    margin: 6px 0;
    padding: 4px 10px;
    border-left: 3px solid #666;
    background: #f9f9f9;
  }}

  .constants-box {{
    border: 1px solid #444;
    padding: 6px 10px;
    margin: 8px 0;
    background: #f5f5f5;
  }}

  .course-info {{
    text-align: center;
    font-size: 10.5pt;
    margin: 4px 0;
    line-height: 1.6;
  }}

  .end-mark {{
    text-align: center;
    font-weight: bold;
    margin: 20px 0;
    letter-spacing: 2pt;
  }}
</style>
</head>
<body>
{content}
</body>
</html>"""


def preprocess_math(md_content):
    def replace_display_math(match):
        return _tex_to_html(match.group(1), display=True)

    def replace_inline_math(match):
        return _tex_to_html(match.group(1), display=False)

    md_content = re.sub(r'\$\$([\s\S]*?)\$\$', replace_display_math, md_content)
    md_content = re.sub(r'\\\[([\s\S]*?)\\\]', replace_display_math, md_content)
    md_content = re.sub(r'\$([^\n$]+?)\$', replace_inline_math, md_content)
    md_content = re.sub(r'\\\(([^)]+?)\\\)', replace_inline_math, md_content)
    return md_content


def _tex_to_html(tex, display=False):
    tex = tex.strip()

    subs = {
        '\\times': '×', '\\cdot': '·', '\\alpha': 'α', '\\beta': 'β',
        '\\gamma': 'γ', '\\delta': 'δ', '\\epsilon': 'ε', '\\varepsilon': 'ε',
        '\\mu': 'μ', '\\pi': 'π', '\\rho': 'ρ', '\\sigma': 'σ',
        '\\omega': 'ω', '\\Omega': 'Ω', '\\lambda': 'λ', '\\tau': 'τ',
        '\\theta': 'θ', '\\phi': 'φ', '\\Phi': 'Φ', '\\infty': '∞',
        '\\partial': '∂', '\\rightarrow': '→', '\\leftarrow': '←',
        '\\Rightarrow': '⇒', '\\Leftarrow': '⇐', '\\approx': '≈',
        '\\neq': '≠', '\\leq': '≤', '\\geq': '≥', '\\propto': '∝',
        '\\circ': '°', '\\bullet': '•', '\\ldots': '…', '\\cdots': '···',
        '\\prime': '′', '\\sqrt': '√', '\\hat': '^', '\\bar': '¯',
        '\\vec': '→', '\\_': '_',
    }

    for cmd, uc in subs.items():
        tex = tex.replace(cmd, uc)

    tex = re.sub(r'\\text\{([^}]*)\}', r'\1', tex)
    tex = re.sub(r'\\dfrac\{([^}]*)\}\{([^}]*)\}', r'<sup>\1</sup>⁄<sub>\2</sub>', tex)
    tex = re.sub(r'\\frac\{([^}]*)\}\{([^}]*)\}', r'<sup>\1</sup>⁄<sub>\2</sub>', tex)
    tex = re.sub(r'\^{([^}]*)}', r'<sup>\1</sup>', tex)
    tex = re.sub(r'\^([a-zA-Z0-9])', r'<sup>\1</sup>', tex)
    tex = re.sub(r'\_\{([^}]*)\}', r'<sub>\1</sub>', tex)
    tex = re.sub(r'\_([a-zA-Z0-9])', r'<sub>\1</sub>', tex)
    tex = re.sub(r'\\mid', ' | ', tex)

    if display:
        return f'<div style="text-align:center;margin:6px 0;">{tex}</div>'
    return f'<span>{tex}</span>'


def convert_md_to_pdf(md_path, pdf_path):
    with open(md_path, "r", encoding="utf-8") as f:
        md_content = f.read()

    md_content = re.sub(r'\U0001f31f', '', md_content)
    md_content = re.sub(r'\\newpage', '<div style="page-break-before: always;"></div>', md_content)

    md_content = preprocess_math(md_content)

    html_body = markdown.markdown(
        md_content,
        extensions=[
            "markdown.extensions.tables",
            "markdown.extensions.fenced_code",
            "markdown.extensions.codehilite",
            "markdown.extensions.toc",
        ],
    )

    html = HTML_TEMPLATE.format(content=html_body)
    doc = weasyprint.HTML(string=html)
    doc.write_pdf(pdf_path)
    return True


def main():
    if len(sys.argv) < 2:
        print("Usage: python3 scripts/convert-qp-to-pdf.py <input.md> [output.pdf]")
        print("")
        print("Examples:")
        print("  python3 scripts/convert-qp-to-pdf.py paper.md")
        print("  python3 scripts/convert-qp-to-pdf.py input.md output.pdf")
        sys.exit(1)

    md_path = os.path.abspath(sys.argv[1])
    if not os.path.exists(md_path):
        print(f"ERROR: Input file not found: {md_path}")
        sys.exit(1)

    if len(sys.argv) >= 3:
        pdf_path = os.path.abspath(sys.argv[2])
    else:
        pdf_dir = os.path.join(os.path.dirname(md_path), "pdf_output")
        os.makedirs(pdf_dir, exist_ok=True)
        pdf_name = os.path.basename(md_path).replace(".md", ".pdf")
        pdf_path = os.path.join(pdf_dir, pdf_name)

    os.makedirs(os.path.dirname(pdf_path), exist_ok=True)

    print(f"Converting: {os.path.basename(md_path)} -> {os.path.basename(pdf_path)}")
    convert_md_to_pdf(md_path, pdf_path)
    print(f"  Saved to: {pdf_path}")


if __name__ == "__main__":
    main()
