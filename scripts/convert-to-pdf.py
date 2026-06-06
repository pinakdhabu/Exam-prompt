#!/usr/bin/env python3
"""
Convert Markdown files to PDF using markdown + weasyprint.
Works on: Linux, macOS, Windows (WSL)

Usage:
  python3 scripts/convert-to-pdf.py <input.md> [output.pdf]

If output.pdf is omitted, saves to pdf_output/<input-name>.pdf

Dependencies:
  pip install markdown weasyprint
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
    margin: 2cm 2.2cm;
    @bottom-center {{
      content: counter(page);
      font-family: 'Segoe UI', 'Calibri', sans-serif;
      font-size: 9pt;
      color: #888;
    }}
  }}

  body {{
    font-family: 'Segoe UI', 'Calibri', 'DejaVu Sans', sans-serif;
    font-size: 10.5pt;
    line-height: 1.6;
    color: #1a1a1a;
  }}

  h1 {{
    font-size: 18pt;
    color: #0d3b66;
    border-bottom: 3px solid #0d3b66;
    padding-bottom: 6px;
    margin-top: 0;
    page-break-before: avoid;
    page-break-after: avoid;
  }}

  h2 {{
    font-size: 14pt;
    color: #1b5a8c;
    border-bottom: 1px solid #cde0f0;
    padding-bottom: 4px;
    margin-top: 28px;
    page-break-before: avoid;
    page-break-after: avoid;
  }}

  h3 {{
    font-size: 12pt;
    color: #2c5f2d;
    margin-top: 20px;
    page-break-before: avoid;
    page-break-after: avoid;
  }}

  h4 {{
    font-size: 11pt;
    color: #444;
    margin-top: 16px;
    page-break-before: avoid;
    page-break-after: avoid;
  }}

  p {{ margin: 6px 0; text-align: justify; }}
  strong {{ color: #0d3b66; }}

  table {{
    width: 100%;
    border-collapse: collapse;
    margin: 12px 0;
    font-size: 9.5pt;
    page-break-inside: avoid;
  }}

  th {{
    background: #0d3b66;
    color: white;
    padding: 7px 10px;
    text-align: left;
    font-weight: 600;
  }}

  td {{
    padding: 6px 10px;
    border: 1px solid #d0d7de;
  }}

  tr:nth-child(even) {{ background: #f6f8fa; }}

  pre {{
    background: #0d1117;
    color: #e6edf3;
    padding: 12px 14px;
    border-radius: 6px;
    font-family: 'Cascadia Code', 'Fira Code', 'Consolas', monospace;
    font-size: 8.5pt;
    line-height: 1.45;
    overflow-x: auto;
    white-space: pre-wrap;
    word-break: break-word;
    page-break-inside: avoid;
  }}

  code {{
    font-family: 'Cascadia Code', 'Fira Code', 'Consolas', monospace;
    font-size: 9pt;
  }}

  p > code, li > code {{
    background: #eef1f5;
    padding: 1px 5px;
    border-radius: 3px;
    color: #c7254e;
  }}

  ul, ol {{ margin: 6px 0; padding-left: 22px; }}
  li {{ margin: 3px 0; }}

  hr {{
    border: none;
    border-top: 1px dashed #bbb;
    margin: 20px 0;
  }}

  blockquote {{
    margin: 10px 0;
    padding: 8px 14px;
    border-left: 4px solid #0d3b66;
    background: #f0f6fb;
    page-break-inside: avoid;
  }}

  img {{ max-width: 100%; }}
</style>
</head>
<body>
{content}
</body>
</html>"""


def convert_md_to_pdf(md_path, pdf_path):
    with open(md_path, "r", encoding="utf-8") as f:
        md_content = f.read()

    md_content = md_content.replace("\U0001f31f", "")

    html_body = markdown.markdown(
        md_content,
        extensions=[
            "markdown.extensions.tables",
            "markdown.extensions.fenced_code",
            "markdown.extensions.codehilite",
            "markdown.extensions.toc",
            "markdown.extensions.smarty",
        ],
    )

    html = HTML_TEMPLATE.format(content=html_body)
    doc = weasyprint.HTML(string=html)
    doc.write_pdf(pdf_path)
    return True


def main():
    if len(sys.argv) < 2:
        print("Usage: python3 scripts/convert-to-pdf.py <input.md> [output.pdf]")
        print("")
        print("Examples:")
        print("  python3 scripts/convert-to-pdf.py notes.md")
        print("  python3 scripts/convert-to-pdf.py notes.md output.pdf")
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
