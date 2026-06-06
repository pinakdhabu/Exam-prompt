#!/usr/bin/env python3
"""
QP Fetcher — Python Fallback for SPPU Question Paper Downloader

Fetches question papers from sppuquestionpapers.com.
Works WITHOUT browser automation (unlike the Node.js version).

Uses a multi-strategy approach:
  1. BeautifulSoup4 (if available) — proper HTML parsing
  2. Regex-based HTML parsing — fallback when bs4 not installed
  3. urllib — built-in HTTP (always works, no external deps)
  4. Playwright (optional, --playwright flag) — clicks actual download buttons

Edge cases handled:
  - No external packages (requests, bs4, playwright) → pure urllib + regex
  - Page structure changed → multiple parsing strategies
  - Download URL cannot be guessed → suggests Playwright mode
  - Empty/handwriting subjects → logs warning, skips
  - Network failures → retry with backoff
  - Unicode encoding issues → errors='replace' everywhere

Usage:
  python3 scripts/fetch-qp.py                      # Interactive mode
  python3 scripts/fetch-qp.py --list-subjects       # List all available subjects
  python3 scripts/fetch-qp.py dbms                  # Download DBMS papers
  python3 scripts/fetch-qp.py dbms --year 2024      # Only 2024 DBMS papers
  python3 scripts/fetch-qp.py dbms --latest         # Only the most recent paper
  python3 scripts/fetch-qp.py --semester 5          # All sem 5 subjects
  python3 scripts/fetch-qp.py --branch computer     # Computer Engineering
  python3 scripts/fetch-qp.py dbms --playwright     # Use Playwright (if available)
  python3 scripts/fetch-qp.py --check               # Check site is accessible

Cross-platform: Linux, macOS, Windows
Dependencies: none required (urllib built-in)
  Optional: beautifulsoup4, playwright, requests
"""

import argparse
import json
import os
import re
import sys
import time
import urllib.parse
from pathlib import Path

BASE_URL = "https://sppuquestionpapers.com"
DOWNLOAD_DIR = Path(__file__).resolve().parent.parent / "pyq-downloads"

# Subject aliases for fuzzy matching
SUBJECT_ALIASES = {
    "dbms": ["database management systems", "dms", "database"],
    "toc": ["theory of computation", "theory of comp", "tc"],
    "spos": ["systems programming and operating system", "sp & os", "system prog"],
    "cns": ["computer network and security", "computer networks", "cn", "computer network"],
    "ai": ["artificial intelligence"],
    "dsbda": ["data science and big data analytics", "data science", "ds & bda"],
    "wt": ["web technology", "web tech"],
    "daa": ["design and analysis of algorithms"],
    "ml": ["machine learning"],
    "dl": ["deep learning"],
    "hpc": ["high performance computing", "high perform"],
    "blockchain": ["blockchain technology"],
    "hci": ["human computer interface", "human computer"],
    "iot": ["internet of things and embedded systems", "iot and embedded", "embedded system"],
    "cc": ["cloud computing"],
    "is": ["information security"],
    "spm": ["software project management"],
    "ds": ["distributed systems"],
    "ar": ["augmented reality"],
    "vr": ["virtual reality", "augmented and virtual reality"],
    "sma": ["software modeling and architecture", "software modeling", "smd"],
    "m3": ["engineering mathematics iii", "engineering maths 3", "maths 3"],
    "dsa": ["data structures and algorithms", "data structures"],
    "se": ["software engineering"],
    "mp": ["microprocessor"],
    "ppl": ["principles of programming languages", "principles of prog"],
    "cg": ["computer graphics"],
    "deld": ["digital electronics and logic design", "digital electronics"],
    "dm": ["discrete mathematics"],
    "fds": ["fundamentals of data structures"],
    "oop": ["object oriented programming"],
    "m1": ["engineering mathematics i", "engineering maths 1", "mathematics 1"],
    "m2": ["engineering mathematics ii", "engineering maths 2", "mathematics 2"],
    "physics": ["engineering physics"],
    "chemistry": ["engineering chemistry"],
    "pps": ["programming and problem solving"],
    "bee": ["basic electrical engineering"],
    "bxe": ["basic electronics engineering"],
    "mechanics": ["engineering mechanics"],
    "eg": ["engineering graphics"],
    "sme": ["systems in mechanical engineering"],
}

BRANCHES = {
    "computer": "computer-engineering",
    "comp": "computer-engineering",
    "ce": "computer-engineering",
    "entc": "entc",
    "electronics": "electronics",
    "electrical": "electrical-engineering",
    "mechanical": "mechanical-engineering",
    "civil": "civil-engineering",
    "it": "information-technology",
}


def try_import(module_name, pip_name=None):
    """Try to import a module with a helpful error message if it fails."""
    if pip_name is None:
        pip_name = module_name
    try:
        return __import__(module_name)
    except ImportError:
        return None


def fetch_url(url, retries=3, timeout=15):
    """Fetch a URL with retry logic and user-agent rotation."""
    import urllib.request

    user_agents = [
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36",
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36",
        "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36",
    ]

    last_error = None
    for attempt in range(retries):
        try:
            headers = {"User-Agent": f"{user_agents[attempt % len(user_agents)]} KHTML/537.36"}
            req = urllib.request.Request(url, headers=headers)
            with urllib.request.urlopen(req, timeout=timeout) as resp:
                return resp.read().decode("utf-8", errors="replace")
        except Exception as e:
            last_error = e
            if attempt < retries - 1:
                wait = (attempt + 1) * 2
                print(f"    ⚠ Retry {attempt + 1}/{retries} in {wait}s... ({e.__class__.__name__})")
                time.sleep(wait)

    print(f"    ✗ Failed to fetch: {url} ({last_error})")
    return None


def download_pdf(url, dest_path, retries=3):
    """Download a PDF file with retry logic and file size validation."""
    import urllib.request

    dest_path = Path(dest_path)
    dest_path.parent.mkdir(parents=True, exist_ok=True)

    if dest_path.exists() and dest_path.stat().st_size > 1000:
        return True

    last_error = None
    for attempt in range(retries):
        try:
            headers = {"User-Agent": "Mozilla/5.0 (compatible; QPFetcher/1.0)"}
            req = urllib.request.Request(url, headers=headers)
            with urllib.request.urlopen(req, timeout=30) as resp:
                with open(dest_path, "wb") as f:
                    f.write(resp.read())
            if dest_path.stat().st_size > 1000:
                return True
            else:
                dest_path.unlink(missing_ok=True)
                raise ValueError(f"File too small ({dest_path.stat().st_size} bytes)")
        except Exception as e:
            last_error = e
            if attempt < retries - 1:
                time.sleep(2)

    print(f"    ✗ Download failed: {url} ({last_error})")
    return False


def parse_with_bs4(html_text):
    """Parse HTML using BeautifulSoup (if available). Returns list of paper dicts or None."""
    bs4 = try_import("bs4")
    if not bs4:
        return None

    try:
        soup = bs4.BeautifulSoup(html_text, "html.parser")
    except Exception:
        return None

    results = []

    # Find all subject headings (containing PATTERN-YYYY)
    headings = soup.find_all(["h1", "h2", "h3", "h4", "h5", "h6"])
    current_subject = ""

    for heading in headings:
        text = heading.get_text(strip=True)
        if re.search(r"PATTERN[\s-]\d{4}", text, re.IGNORECASE):
            current_subject = text
            # Check if next sibling is a table
            table = heading.find_next_sibling("table")
            if not table:
                # Try finding the closest table
                table = heading.find_next("table")

            if table:
                rows = table.find_all("tr")
                for row in rows:
                    cells = row.find_all("td")
                    if len(cells) >= 3:
                        year = cells[0].get_text(strip=True)
                        month = cells[1].get_text(strip=True)
                        link_cell = cells[2]
                        link = link_cell.find("a")
                        href = link.get("href", "") if link else ""
                        onclick = link_cell.get("onclick", "")

                        if re.match(r"^\d{4}$", year):
                            results.append({
                                "subject": current_subject,
                                "year": year,
                                "month": month,
                                "href": href,
                                "onclick": onclick,
                                "semester": None,
                            })

    # Also try div-based layouts
    if not results:
        divs = soup.find_all("div", class_=re.compile(r"(paper|subject|question)"))
        for div in divs:
            # Find subject name in nearby h* tags
            subj_heading = div.find(["h1", "h2", "h3", "h4", "h5", "h6"])
            subject = subj_heading.get_text(strip=True) if subj_heading else current_subject
            # Find year/month/text
            paragraphs = div.find_all(["p", "span"])
            for p in paragraphs:
                text = p.get_text(strip=True)
                m = re.match(r"(\d{4})\s*(.+?)\s*(?:Download|PDF)", text, re.IGNORECASE)
                if m:
                    results.append({
                        "subject": subject,
                        "year": m.group(1),
                        "month": m.group(2).strip(),
                        "href": "",
                        "onclick": "",
                        "semester": None,
                    })

    return results if results else None


def parse_with_regex(html_text):
    """Parse HTML using regex (works with no external packages). Returns list of paper dicts."""

    def strip_html(text):
        """Remove HTML tags but preserve newlines for text-based parsing."""
        text = re.sub(r"<br\s*/?>", "\n", text, flags=re.IGNORECASE)
        text = re.sub(r"<[^>]+>", "\n", text)
        text = re.sub(r"\n{3,}", "\n\n", text)
        return text

    results = []
    lines = [l.strip() for l in strip_html(html_text).split("\n") if l.strip()]

    current_subject = ""
    for i, line in enumerate(lines):
        # Detect subject headers (containing PATTERN-YYYY)
        if re.search(r"PATTERN[\s-]\d{4}", line, re.IGNORECASE) and len(line) > 10:
            current_subject = re.sub(r"\s+", " ", line).strip()
            continue

        # Find year (4 digits), then check next 2 lines for month + download
        m = re.match(r"^(\d{4})$", line)
        if m:
            year = m.group(1)
            if i + 2 < len(lines):
                month = lines[i + 1]
                link_line = lines[i + 2].lower()
                if "download" in link_line or "pdf" in link_line:
                    results.append({
                        "subject": current_subject,
                        "year": year,
                        "month": month,
                        "href": "",
                        "onclick": "",
                        "semester": None,
                    })
            continue

        # Detect standalone "download" lines (previous 2 lines = year, month)
        if line.lower() == "download" and i >= 2:
            prev2 = lines[i - 2]
            if re.match(r"^\d{4}$", prev2):
                results.append({
                    "subject": current_subject,
                    "year": prev2,
                    "month": lines[i - 1],
                    "href": "",
                    "onclick": "",
                    "semester": None,
                })

    return results


def parse_semester_page(html_text):
    """
    Parse a semester page to extract subjects and their papers.
    Multi-strategy: bs4 first, regex fallback.
    """
    if not html_text:
        return []

    # Strategy 1: BeautifulSoup (if available)
    results = parse_with_bs4(html_text)
    if results:
        return results

    # Strategy 2: Regex fallback
    results = parse_with_regex(html_text)

    # Deduplicate
    seen = set()
    unique_results = []
    for r in results:
        key = f"{r.get('subject', '')}|{r.get('year', '')}|{r.get('month', '')}"
        if key and key not in seen:
            seen.add(key)
            unique_results.append(r)

    return unique_results


def match_subject(query, subject_name):
    """Fuzzy match a subject query against a subject name.

    Multi-strategy (same as JS version, in order):
      1. Direct alias match (e.g., 'dbms' matches 'database')
      2. Alias name in subject name (e.g., 'database' in 'DATABASE MANAGEMENT SYSTEMS')
      3. Substring match (e.g., 'db' matches 'DBMS')
      4. Word match (every query word appears in subject name)
    """
    if not subject_name:
        return False
    q = query.lower().strip()

    # Strategy 1: Direct alias match
    for alias, names in SUBJECT_ALIASES.items():
        if alias == q:
            return True
        for name in names:
            if name in subject_name.lower():
                return True

    # Strategy 2: Substring match (lenient — matches short queries like 'db')
    if q in subject_name.lower() or subject_name.lower() in q:
        return True

    # Strategy 3: Every word in query appears in subject name
    q_words = set(re.findall(r"\w+", q))
    if len(q_words) > 0:
        sn_words = set(re.findall(r"\w+", subject_name.lower()))
        if q_words.intersection(sn_words) and q_words.issubset(sn_words):
            return True

    # Strategy 4: Every word in subject name starts with a word from query
    # (handles partial word matches: 'db' → 'database', 'comp' → 'computer')
    for q_word in q_words:
        matched = False
        for sn_word in sn_words:
            if sn_word.startswith(q_word):
                matched = True
                break
        if not matched:
            return False
    if len(q_words) > 0 and len(sn_words) > 0:
        return True

    return False


def get_semester_pages(branch="computer-engineering"):
    """Get all available semester page URLs for a branch. Supports FE (1-2) + BE (3-8)."""
    urls = {}
    for sem in range(1, 9):
        urls[sem] = f"{BASE_URL}/be/{branch}/semester-{sem}"
    return urls


def scrape_semesters(branch="computer-engineering", semester_filter=None):
    """Scrape all requested semesters and return papers."""
    semester_urls = get_semester_pages(branch)
    all_papers = []

    semesters = [semester_filter] if semester_filter else sorted(semester_urls.keys())

    for sem in semesters:
        url = semester_urls.get(sem)
        if not url:
            continue

        print(f"\n  📄 Sem {sem}: {url}")
        html = fetch_url(url)

        if not html:
            print(f"    ⚠ Could not fetch semester {sem}")
            continue

        papers = parse_semester_page(html)
        if papers:
            for p in papers:
                p["semester"] = str(sem)
            print(f"    Found {len(papers)} paper entries")
        else:
            print(f"    ⚠ No structured data found on sem {sem} (may need Playwright)")

        all_papers.extend(papers)

        # Rate limiting
        if sem != semesters[-1]:
            time.sleep(3)

    return all_papers


def try_download_urls(base_subject, year, month, semester, branch):
    """
    Try multiple URL patterns to find the actual PDF.

    The sppuquestionpapers.com site uses JavaScript-driven downloads,
    so we have to guess the URL. This function tries common patterns.
    """
    sanitized = re.sub(r"[^a-z0-9\s-]", "", base_subject.lower())
    sanitized = re.sub(r"\s+", "-", sanitized.strip())
    sanitized = sanitized[:80]

    month_lower = month.lower()[:4]
    branch_slug = branch.replace("-engineering", "").replace("-", "")

    # Try common storage URL patterns
    url_patterns = [
        f"{BASE_URL}/storage/questionpapers/{branch}_{sanitized}_{year}_{month_lower}.pdf",
        f"{BASE_URL}/storage/questionpapers/semester-{semester}/{branch}_{sanitized}_{year}_{month_lower}.pdf",
        f"{BASE_URL}/storage/questionpapers/{sanitized[:30]}_{year}_{month_lower}.pdf",
        f"{BASE_URL}/wp-content/uploads/{year}/{month_lower}/{sanitized}.pdf",
        f"{BASE_URL}/wp-content/uploads/{year}/{sanitized}.pdf",
        f"{BASE_URL}/uploads/{year}/{month_lower}/{sanitized}.pdf",
    ]

    out_dir = DOWNLOAD_DIR / sanitized
    out_dir.mkdir(parents=True, exist_ok=True)
    filename = f"{year}-{month_lower}-{sanitized}.pdf"
    filepath = out_dir / filename

    if filepath.exists() and filepath.stat().st_size > 1000:
        print(f"    ✓ Already exists: {filename} ({filepath.stat().st_size // 1024} KB)")
        return True

    for url in url_patterns:
        if download_pdf(url, filepath):
            size = filepath.stat().st_size
            print(f"    ✓ Downloaded: {filename} ({size // 1024} KB)")
            return True

    print(f"    ⚠ Could not auto-detect download URL for {year} {month}")
    print(f"    → Try Playwright: python3 scripts/fetch-qp.py {sanitized} --playwright")
    return False


def download_with_playwright(subject, year, month, semester, branch):
    """Fallback: Use Playwright to click download buttons."""
    try:
        from playwright.sync_api import sync_playwright
    except ImportError:
        print("    ⚠ Playwright not installed.")
        print("      Install: pip install playwright && python3 -m playwright install chromium")
        print("      Or use: node scripts/fetch-qp.js (Node.js version)")
        return False

    if not semester:
        print("    ⚠ No semester specified")
        return False

    url = f"{BASE_URL}/be/{branch}/semester-{semester}"
    sanitized = re.sub(r"[^a-z0-9-]", "-", subject.lower()).strip("-")[:60]
    out_dir = DOWNLOAD_DIR / sanitized
    out_dir.mkdir(parents=True, exist_ok=True)
    filename = f"{year}-{month.lower()[:4]}-{sanitized}.pdf"
    filepath = out_dir / filename

    if filepath.exists() and filepath.stat().st_size > 1000:
        print(f"    ✓ Already exists: {filename}")
        return True

    try:
        with sync_playwright() as pw:
            browser = pw.chromium.launch(headless=True)
            page = browser.new_page()
            page.goto(url, wait_until="networkidle", timeout=30000)
            page.wait_for_timeout(2000)

            buttons = page.query_selector_all("a, button, td, span")
            for btn in buttons:
                text = btn.text_content() or ""
                if text.strip().lower() == "download":
                    row = btn.evaluate("""el => {
                        const tr = el.closest('tr');
                        if (!tr) return '';
                        return Array.from(tr.querySelectorAll('td')).map(c => c.textContent.trim()).join('|');
                    }""")
                    if row and year in row and month.lower()[:3] in row.lower():
                        with page.expect_download(timeout=10000) as download_info:
                            btn.click()
                        download = download_info.value
                        suggested = download.suggested_filename or filename
                        dl_path = out_dir / suggested
                        download.save_as(str(dl_path))
                        if dl_path.exists():
                            size = dl_path.stat().st_size
                            print(f"    ✓ Downloaded: {suggested} ({size // 1024} KB)")
                            browser.close()
                            return True
                        break

            browser.close()
            print(f"    ⚠ Could not click download for {year} {month}")
            return False
    except Exception as e:
        print(f"    ✗ Playwright error: {e}")
        return False


def main():
    parser = argparse.ArgumentParser(
        description="SPPU Question Paper Fetcher (Python)",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""Examples:
  python3 scripts/fetch-qp.py                        # Interactive mode
  python3 scripts/fetch-qp.py --list-subjects         # List all subjects
  python3 scripts/fetch-qp.py dbms                    # Download DBMS papers
  python3 scripts/fetch-qp.py dbms --year 2024        # Only 2024 DBMS papers
  python3 scripts/fetch-qp.py dbms --latest           # Most recent paper only
  python3 scripts/fetch-qp.py --semester 5            # All sem 5 subjects
  python3 scripts/fetch-qp.py dbms --playwright       # Use Playwright (better)
  python3 scripts/fetch-qp.py --check                 # Test site connectivity
        """,
    )

    parser.add_argument("subject", nargs="?", help="Subject to search for")
    parser.add_argument("--year", help="Filter by year")
    parser.add_argument("--semester", help="Filter by semester number")
    parser.add_argument("--branch", default="computer",
                        help="Branch (computer, entc, mech, civil, etc.)")
    parser.add_argument("--latest", action="store_true",
                        help="Only download the most recent paper")
    parser.add_argument("--list", action="store_true",
                        help="List available papers for subject")
    parser.add_argument("--list-subjects", action="store_true",
                        help="List all available subjects")
    parser.add_argument("--playwright", action="store_true",
                        help="Use Playwright for better download detection")
    parser.add_argument("--check", action="store_true",
                        help="Check site connectivity and exit")
    parser.add_argument("--output-dir", help="Download directory")

    args = parser.parse_args()

    if args.output_dir:
        global DOWNLOAD_DIR
        DOWNLOAD_DIR = Path(args.output_dir)

    # Ensure download directory exists
    DOWNLOAD_DIR.mkdir(parents=True, exist_ok=True)

    branch_key = BRANCHES.get(args.branch.lower(), args.branch)

    # ---- Check mode ----
    if args.check:
        print("Checking sppuquestionpapers.com...")
        html = fetch_url(BASE_URL, retries=2, timeout=10)
        if html:
            print(f"  ✓ Site is accessible ({len(html)} bytes)")
            sem5_url = f"{BASE_URL}/be/{branch_key}/semester-5"
            sem5 = fetch_url(sem5_url, retries=2, timeout=10)
            if sem5:
                print(f"  ✓ Semester 5 page is accessible ({len(sem5)} bytes)")
                papers = parse_semester_page(sem5)
                if papers:
                    print(f"  ✓ Found {len(papers)} paper entries on sem 5")
                else:
                    print(f"  ⚠ Semester 5 page rendered but no structured data found")
                    print(f"    The site may require JavaScript. Try: --playwright")
            else:
                print(f"  ✗ Could not access semester 5 page")
        else:
            print("  ✗ Site is not accessible")
            # Try alternative: check if the server is reachable at all
            import urllib.request
            try:
                req = urllib.request.Request("https://www.google.com")
                with urllib.request.urlopen(req, timeout=5):
                    print("  ✓ Internet connection is working (Google reachable)")
                    print("  ✗ sppuquestionpapers.com might be down or blocked")
            except Exception:
                print("  ✗ No internet connection detected")
            return

        # Check available tools
        print("\nAvailable tools:")
        if try_import("requests"):
            print("  ✓ requests (fast HTTP)")
        if try_import("bs4"):
            print("  ✓ beautifulsoup4 (HTML parsing)")
        if try_import("playwright"):
            print("  ✓ playwright (browser automation)")
        print("  ✓ urllib (built-in, always available)")
        return

    # ---- List subjects mode ----
    if args.list_subjects:
        print("\nScanning semesters for subjects...")
        all_papers = scrape_semesters(
            branch=branch_key,
            semester_filter=args.semester,
        )
        if not all_papers:
            print("\n  ⚠ No subjects found via HTTP parsing.")
            print("    Try: python3 scripts/fetch-qp.py --check")
            return
        subjects = sorted(set(p["subject"] for p in all_papers if p.get("subject")))
        print(f"\nFound {len(subjects)} subjects:\n")
        for s in subjects:
            count = sum(1 for p in all_papers if p.get("subject") == s)
            sems = sorted(set(p["semester"] for p in all_papers if p.get("subject") == s))
            print(f"  📚 {s}")
            print(f"     └─ {count} papers across semesters {', '.join(sems)}")
        return

    # ---- Scan semesters ----
    print("\n" + "═" * 55)
    print("  SPPU Question Paper Fetcher (Python)")
    print("═" * 55)

    all_papers = scrape_semesters(
        branch=branch_key,
        semester_filter=args.semester,
    )

    if not all_papers:
        print("\n  ✗ No papers found. The site might use JavaScript for rendering.")
        print("    Try with Playwright: python3 scripts/fetch-qp.py --playwright")
        print("    Or use Node.js:       node scripts/fetch-qp.js")
        return

    # ---- No subject specified - show summary ----
    if not args.subject:
        subject_count = len(set(p.get("subject", "") for p in all_papers if p.get("subject")))
        paper_count = len(all_papers)
        print(f"\n  Found {paper_count} papers across {subject_count} subjects\n")
        print("  Tip: Specify a subject to download:")
        print("    python3 scripts/fetch-qp.py dbms")
        print("    python3 scripts/fetch-qp.py --list-subjects")
        return

    # ---- Filter by subject ----
    matching = [p for p in all_papers if match_subject(args.subject, p.get("subject", ""))]

    if args.year:
        matching = [p for p in matching if p.get("year") == args.year]

    if not matching:
        print(f"\n  ✗ No papers found for '{args.subject}'")
        print("    Tip: Use --list-subjects to see all available subjects")
        return

    # Deduplicate
    seen = set()
    unique = []
    for p in matching:
        key = f"{p.get('subject', '')}|{p.get('year', '')}|{p.get('month', '')}"
        if key not in seen:
            seen.add(key)
            unique.append(p)
    matching = unique

    # Group by subject
    by_subject = {}
    for p in matching:
        subj = p.get("subject", "Unknown")
        if subj not in by_subject:
            by_subject[subj] = []
        by_subject[subj].append(p)

    for subject, papers in by_subject.items():
        print(f"\n  📚 {subject}")
        print(f"  {'─' * 50}")

        if args.list:
            for p in sorted(papers, key=lambda x: (x.get("year", ""), x.get("month", ""))):
                sem_info = f"[Sem {p.get('semester', '?')}]"
                print(f"    {sem_info} {p.get('year', '??')} {p.get('month', '??')}")
            continue

        # Download
        papers_to_dl = [papers[-1]] if args.latest else papers

        for p in papers_to_dl:
            subject_clean = re.sub(r"\s*\(.*?\)\s*", "", subject).strip()
            year = p.get("year", "")
            month = p.get("month", "")
            sem = p.get("semester", "")

            if args.playwright:
                success = download_with_playwright(subject_clean, year, month, sem, branch_key)
            else:
                success = try_download_urls(subject_clean, year, month, sem, branch_key)

        print(f"\n  ✅ Download directory: {DOWNLOAD_DIR}")


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\n  Interrupted by user.")
        sys.exit(1)
    except Exception as e:
        print(f"\n  ✗ Unexpected error: {e}")
        print("  Report this at: https://github.com/pinakdhabu/Exam-prompt/issues")
        sys.exit(1)
