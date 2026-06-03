#!/usr/bin/env python3
"""
Extract text from PDF using PyPDF2 or pypdf (whichever is available).
Usage: python3 pdf-extract.py <input.pdf> <output.txt>
"""
import sys

input_pdf = sys.argv[1]
output_txt = sys.argv[2]

try:
    import PyPDF2
    with open(input_pdf, 'rb') as f:
        reader = PyPDF2.PdfReader(f)
        text = ''
        for page in reader.pages:
            text += (page.extract_text() or '') + '\n'
except ImportError:
    import pypdf
    with open(input_pdf, 'rb') as f:
        reader = pypdf.PdfReader(f)
        text = ''
        for page in reader.pages:
            text += (page.extract_text() or '') + '\n'

with open(output_txt, 'w', encoding='utf-8') as f:
    f.write(text)

print(f"Extracted {len(text)} characters from {input_pdf}")
