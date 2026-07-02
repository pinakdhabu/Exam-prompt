import sys
import json
try:
    import fitz # PyMuPDF
except ImportError:
    import subprocess
    subprocess.check_call([sys.executable, '-m', 'pip', 'install', 'PyMuPDF'])
    import fitz

def analyze_pdf(pdf_path):
    doc = fitz.open(pdf_path)
    page = doc[0]
    words = page.get_text("words")
    blocks = page.get_text("dict")["blocks"]

    print(f"--- Analysis of {pdf_path} ---")
    print(f"Page size: {page.rect}")

    print("\nHeader/Top Elements:")
    for b in blocks:
        if "lines" in b:
            for l in b["lines"]:
                for s in l["spans"]:
                    # Print elements in the top 300 points
                    if s["bbox"][1] < 300:
                        print(f"BBox: {[round(x, 1) for x in s['bbox']]}, Font: {s['font']} {round(s['size'],1)}, Text: {s['text'].strip()}")

    print("\nSample Questions (Q1):")
    for b in blocks:
        if "lines" in b:
            for l in b["lines"]:
                for s in l["spans"]:
                    text = s["text"].strip()
                    if text.startswith("Q") or text.startswith("a)") or text.startswith("b)") or text.startswith("["):
                        if 300 < s["bbox"][1] < 700:
                            print(f"BBox: {[round(x, 1) for x in s['bbox']]}, Font: {s['font']} {round(s['size'],1)}, Text: {text}")

analyze_pdf("B.E ( 2019 PATTERN ).pdf")
analyze_pdf("daa-sample-paper-2.pdf")
