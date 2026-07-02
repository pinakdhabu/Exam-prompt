import xml.etree.ElementTree as ET

def analyze_xml(path):
    tree = ET.parse(path)
    root = tree.getroot()
    print(f"\n--- Analysis of {path} ---")
    page1 = root.find('page')
    if page1 is None:
        print("No page found")
        return
    print(f"Page size: {page1.attrib.get('width')} x {page1.attrib.get('height')}")
    
    print("\nSample Questions (Q1):")
    for text_elem in page1.findall('text'):
        text = "".join(text_elem.itertext()).strip()
        if text.startswith("Q") or text.startswith("a)") or text.startswith("b)") or text.startswith("["):
            top = int(text_elem.attrib.get('top', 0))
            if 100 < top < 800:
                print(f"BBox: left={text_elem.attrib.get('left')} top={top}, Font: {text_elem.attrib.get('font')}, Text: {text}")

analyze_xml("/tmp/be_pdf.xml")
analyze_xml("/tmp/daa_pdf.xml")
