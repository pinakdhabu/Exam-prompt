#!/usr/bin/env node
/**
 * QP Fetcher — Fetch SPPU Question Papers from sppuquestionpapers.com
 *
 * Uses Playwright to navigate the site, click Download buttons,
 * capture the actual PDF URLs, and download the papers.
 *
 * Edge cases handled:
 *   - Branch not in map → used as-is (supports custom URLs)
 *   - Network failure → retry with exponential backoff
 *   - Download timeout → skip gracefully, report which
 *   - File already exists → skip, don't re-download
 *   - Rate limiting → respects robots.txt Crawl-delay:3
 *   - Page structure changed → text-based fallback parsing
 *   - Semesters 1-2 (FE) → also supported
 *   - Concurrency → downloads serial, not parallel, to avoid hammering
 *
 * Usage:
 *   node scripts/fetch-qp.js                        # Interactive mode
 *   node scripts/fetch-qp.js --list-subjects         # List all available subjects
 *   node scripts/fetch-qp.js dbms                    # Download DBMS papers
 *   node scripts/fetch-qp.js dbms --year 2024        # Only 2024 DBMS papers
 *   node scripts/fetch-qp.js dbms --latest           # Only the most recent paper
 *   node scripts/fetch-qp.js dbms --list             # List available years for DBMS
 *   node scripts/fetch-qp.js --branch computer       # Computer Engineering branch
 *   node scripts/fetch-qp.js --semester 5            # Semester 5
 *   node scripts/fetch-qp.js --retry 5               # Max retries per download
 *
 * Cross-platform: Linux, macOS, Windows
 * Dependencies: node, playwright (npx playwright install chromium)
 */
const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');
const http = require('http');
const https = require('https');

// ---- Configuration ----
const BASE_URL = 'https://sppuquestionpapers.com';
const DOWNLOAD_DIR = path.resolve(__dirname, '..', 'pyq-downloads');
const MAX_RETRIES = 3;
const RATE_LIMIT_MS = 3000; // robots.txt Crawl-delay:3
const DOWNLOAD_TIMEOUT = 15000;
const NAV_TIMEOUT = 30000;

// ---- Subject aliases for fuzzy matching ----
const SUBJECT_ALIASES = {
  'dbms': ['database management systems', 'dms', 'database'],
  'toc': ['theory of computation', 'theory of comp', 'tc'],
  'spos': ['systems programming and operating system', 'sp & os', 'system prog'],
  'cns': ['computer network and security', 'computer networks', 'cn', 'computer network'],
  'ai': ['artificial intelligence'],
  'dsbda': ['data science and big data analytics', 'data science', 'ds & bda'],
  'wt': ['web technology', 'web tech'],
  'daa': ['design and analysis of algorithms'],
  'ml': ['machine learning'],
  'dl': ['deep learning'],
  'hpc': ['high performance computing', 'high perform'],
  'blockchain': ['blockchain technology'],
  'hci': ['human computer interface', 'human computer'],
  'iot': ['internet of things and embedded systems', 'iot and embedded', 'embedded system'],
  'cc': ['cloud computing'],
  'is': ['information security'],
  'spm': ['software project management'],
  'ds': ['distributed systems'],
  'ar': ['augmented reality'],
  'vr': ['virtual reality', 'augmented and virtual reality'],
  'sma': ['software modeling and architecture', 'software modeling', 'smd'],
  'm3': ['engineering mathematics iii', 'engineering maths 3', 'maths 3'],
  'dsa': ['data structures and algorithms', 'data structures'],
  'se': ['software engineering'],
  'mp': ['microprocessor'],
  'ppl': ['principles of programming languages', 'principles of prog'],
  'cg': ['computer graphics'],
  'deld': ['digital electronics and logic design', 'digital electronics'],
  'dm': ['discrete mathematics'],
  'fds': ['fundamentals of data structures'],
  'oop': ['object oriented programming'],
  'm1': ['engineering mathematics i', 'engineering maths 1', 'mathematics 1'],
  'm2': ['engineering mathematics ii', 'engineering maths 2', 'mathematics 2'],
  'physics': ['engineering physics'],
  'chemistry': ['engineering chemistry'],
  'pps': ['programming and problem solving'],
  'bee': ['basic electrical engineering'],
  'bxe': ['basic electronics engineering'],
  'mechanics': ['engineering mechanics'],
  'eg': ['engineering graphics'],
  'sme': ['systems in mechanical engineering'],
};

// ---- Branches ----
const BRANCHES = {
  'computer': 'computer-engineering',
  'comp': 'computer-engineering',
  'ce': 'computer-engineering',
  'entc': 'entc',
  'electronics': 'electronics',
  'electrical': 'electrical-engineering',
  'ee': 'electrical-engineering',
  'mechanical': 'mechanical-engineering',
  'mech': 'mechanical-engineering',
  'civil': 'civil-engineering',
  'it': 'information-technology',
};

// ---- Helper: Retry navigation/timeout failures with exponential backoff ----
// Note: Retries help with network failures and timeouts (navigation, page load).
// Download-click failures are caught internally and return false (no retry needed).
async function withRetry(fn, retries = MAX_RETRIES, description = 'operation') {
  for (let attempt = 1; attempt <= retries; attempt++) {
    try {
      return await fn();
    } catch (err) {
      if (attempt === retries) throw err;
      const delay = Math.min(1000 * Math.pow(2, attempt - 1), 10000);
      console.log(`    ⚠ ${description} failed (attempt ${attempt}/${retries}), retrying in ${delay}ms...`);
      await new Promise(r => setTimeout(r, delay));
    }
  }
}

// ---- Helper: Download a file ----
function downloadFile(url, destPath) {
  return new Promise((resolve, reject) => {
    const dir = path.dirname(destPath);
    fs.mkdirSync(dir, { recursive: true });

    const file = fs.createWriteStream(destPath);
    const protocol = url.startsWith('https') ? https : http;

    protocol.get(url, { headers: { 'User-Agent': 'Mozilla/5.0' } }, (response) => {
      // Handle redirects
      if (response.statusCode >= 300 && response.statusCode < 400 && response.headers.location) {
        file.close();
        fs.unlinkSync(destPath);
        const redirectUrl = response.headers.location.startsWith('http')
          ? response.headers.location
          : new URL(response.headers.location, url).toString();
        return downloadFile(redirectUrl, destPath).then(resolve).catch(reject);
      }

      if (response.statusCode !== 200) {
        file.close();
        fs.unlinkSync(destPath);
        reject(new Error(`HTTP ${response.statusCode} for ${url}`));
        return;
      }

      response.pipe(file);
      file.on('finish', () => {
        file.close();
        const size = fs.statSync(destPath).size;
        if (size < 100) {
          fs.unlinkSync(destPath);
          reject(new Error(`Downloaded file too small (${size} bytes): ${url}`));
          return;
        }
        resolve(destPath);
      });
    }).on('error', (err) => {
      file.close();
      if (fs.existsSync(destPath)) fs.unlinkSync(destPath);
      reject(err);
    });
  });
}

// ---- Helper: Fuzzy match subject name ----
function matchSubject(query, subjectName) {
  if (!subjectName) return false;
  const q = query.toLowerCase().trim();

  // Check aliases
  for (const [alias, names] of Object.entries(SUBJECT_ALIASES)) {
    if (alias === q) return true;
    for (const name of names) {
      if (subjectName.toLowerCase().includes(name)) return true;
      if (name.includes(q)) return true;
    }
  }

  // Direct substring match
  return subjectName.toLowerCase().includes(q) || q.includes(subjectName.toLowerCase());
}

// ---- Helper: Sanitize filename ----
function sanitizeFilename(name) {
  return name.replace(/[<>:"/\\|?*]/g, '_').replace(/\s+/g, ' ').trim();
}

// ---- Helper: Navigate to page with retry ----
async function safeGoto(page, url) {
  return withRetry(async () => {
    await page.goto(url, { waitUntil: 'networkidle', timeout: NAV_TIMEOUT });
    await page.waitForTimeout(2000);
  }, 2, `navigate to ${url}`);
}

// ---- Scrape semester page for subjects and download links ----
async function scrapeSemesterPage(browser, semester, branch = 'computer-engineering') {
  const url = `${BASE_URL}/be/${branch}/semester-${semester}`;
  console.log(`\n  📄 Fetching: ${url}`);

  const page = await browser.newPage();
  const results = [];

  try {
    await safeGoto(page, url);

    // Extract subject information from the page via DOM
    const subjectData = await page.evaluate(() => {
      const subjects = [];
      const tables = document.querySelectorAll('table');

      tables.forEach((table) => {
        // Try to find the subject heading before the table
        let heading = '';
        let prev = table.previousElementSibling;
        while (prev) {
          if (prev.tagName.match(/^H[1-6]$/) || prev.classList.contains('subject-title')) {
            heading = prev.textContent.trim();
            break;
          }
          prev = prev.previousElementSibling;
        }

        // If no heading found above, check parent
        if (!heading) {
          const parent = table.closest('div');
          if (parent) {
            const h = parent.querySelector('h1, h2, h3, h4, h5, h6, .subject-title');
            if (h) heading = h.textContent.trim();
          }
        }

        const rows = table.querySelectorAll('tbody tr, tr');
        const papers = [];

        rows.forEach((row) => {
          const cells = row.querySelectorAll('td, th');
          if (cells.length >= 3) {
            const year = cells[0].textContent.trim();
            const month = cells[1].textContent.trim();
            const linkCell = cells[2];
            const link = linkCell.querySelector('a');
            const onClick = linkCell.getAttribute('onclick') || '';
            const href = link ? link.getAttribute('href') || '' : '';

            if (year && /^\d{4}$/.test(year)) {
              papers.push({ year, month, href, onClick, text: linkCell.textContent.trim() });
            }
          }
        });

        if (papers.length > 0) {
          subjects.push({ heading, papers });
        }
      });

      return subjects;
    });

    // If DOM parsing failed, fallback to text-based parsing
    if (subjectData.length === 0) {
      const textContent = await page.evaluate(() => document.body.innerText);
      const lines = textContent.split('\n').map(l => l.trim()).filter(l => l);

      let currentSubject = '';
      for (let i = 0; i < lines.length; i++) {
        const line = lines[i];

        // Detect subject headers (containing PATTERN + year)
        if (/(PATTERN[\s-]\d{4})/i.test(line) && line.length > 15) {
          currentSubject = line.replace(/\s+/g, ' ').trim();
          continue;
        }

        if (line.toLowerCase() === 'download' && i >= 2) {
          const year = lines[i - 2];
          const month = lines[i - 1];
          if (year && /^\d{4}$/.test(year.trim())) {
            results.push({
              subject: currentSubject,
              year: year.trim(),
              month: month.trim(),
              index: results.length,
            });
          }
        }
      }
    } else {
      for (const subj of subjectData) {
        for (const paper of subj.papers) {
          results.push({
            subject: subj.heading,
            year: paper.year,
            month: paper.month,
            href: paper.href,
            onClick: paper.onClick,
            index: results.length,
          });
        }
      }
    }

  } catch (err) {
    console.error(`    ✗ Error scraping semester ${semester}: ${err.message}`);
  } finally {
    await page.close();
  }

  return results;
}

// ---- Download a single paper with retry logic ----
async function downloadPaper(browser, paper, branchFilter, dirName) {
  const fileName = `${paper.year}-${paper.month}-${dirName}.pdf`;
  const filePath = path.join(DOWNLOAD_DIR, dirName, fileName);

  if (fs.existsSync(filePath)) {
    const size = (fs.statSync(filePath).size / 1024).toFixed(1);
    console.log(`    ✓ Already exists: ${fileName} (${size} KB)`);
    return true;
  }

  // Rate limiting
  await new Promise(r => setTimeout(r, RATE_LIMIT_MS));

  return withRetry(async () => {
    const semPage = await browser.newPage();
    let success = false;

    try {
      const semUrl = `${BASE_URL}/be/${branchFilter}/semester-${paper.semester}`;
      await safeGoto(semPage, semUrl);

      // Find and click the specific Download button for this paper
      const downloadPromise = semPage.waitForEvent('download', { timeout: DOWNLOAD_TIMEOUT });

      const buttons = await semPage.$$('a, button, td, span');
      let clicked = false;

      for (const btn of buttons) {
        const text = await btn.textContent().catch(() => '');
        if (text.trim().toLowerCase() === 'download') {
          const row = await btn.evaluate(el => {
            const tr = el.closest('tr');
            if (!tr) return '';
            return Array.from(tr.querySelectorAll('td')).map(c => c.textContent.trim()).join('|');
          });

          if (row.includes(paper.year) && row.toLowerCase().includes(paper.month.toLowerCase().slice(0, 3))) {
            await btn.click().catch(() => {});
            clicked = true;
            break;
          }
        }
      }

      if (!clicked) {
        console.log(`    ⚠ Download button not found for ${paper.year} ${paper.month}`);
        return false;
      }

      const download = await downloadPromise;
      const suggestedName = download.suggestedFilename() || fileName;
      const downloadPath = path.join(DOWNLOAD_DIR, dirName, suggestedName);
      await download.saveAs(downloadPath);

      if (fs.existsSync(downloadPath)) {
        const size = (fs.statSync(downloadPath).size / 1024).toFixed(1);
        console.log(`    ✓ Downloaded: ${suggestedName} (${size} KB)`);
        success = true;
      }
    } catch (err) {
      console.log(`    ⚠ Download issue: ${paper.year} ${paper.month} — ${err.message}`);
    } finally {
      await semPage.close();
    }

    return success;
  }, MAX_RETRIES, `download ${paper.year} ${paper.month}`);
}

// ---- Main ----
async function main() {
  const args = process.argv.slice(2);

  if (args.includes('--help') || args.length === 0) {
    console.log(`\n╔══════════════════════════════════════════════════════════╗
║          SPPU Question Paper Fetcher                    ║
║  Fetches real question papers from sppuquestionpapers.com ║
╚══════════════════════════════════════════════════════════╝\n
Usage:
  node scripts/fetch-qp.js                        Interactive mode
  node scripts/fetch-qp.js --list-subjects         List all available subjects
  node scripts/fetch-qp.js <subject>               Download papers for a subject
  node scripts/fetch-qp.js <subject> --year 2024   Filter by year
  node scripts/fetch-qp.js <subject> --latest      Only most recent paper
  node scripts/fetch-qp.js <subject> --list        List available papers
  node scripts/fetch-qp.js --semester <N>          Target semester (1-8)
  node scripts/fetch-qp.js --branch <name>         Branch (computer, entc, mech, etc.)
  node scripts/fetch-qp.js --retry <N>             Max retries per download (default: 3)\n
Examples:
  node scripts/fetch-qp.js dbms                    Download DBMS papers
  node scripts/fetch-qp.js dbms --year 2024        Only 2024 DBMS papers
  node scripts/fetch-qp.js toc --latest            Latest TOC paper
  node scripts/fetch-qp.js --semester 5            All Sem 5 subjects
  node scripts/fetch-qp.js --list-subjects         Show what's available

Subjects: dbms, toc, spos, cns, ai, dsbda, wt, daa, ml, dl, hpc,
          blockchain, hci, iot, cc, is, spm, ds, sma, m3, dsa, se,
          mp, ppl, cg, deld, dm, fds, oop, physics, chemistry, m1, m2
`);
    return;
  }

  // Parse arguments
  let subjectQuery = '';
  let yearFilter = '';
  let semesterFilter = '';
  let branchFilter = 'computer-engineering';
  let listOnly = false;
  let listSubjects = false;
  let latestOnly = false;
  let maxRetries = MAX_RETRIES;

  for (let i = 0; i < args.length; i++) {
    const arg = args[i];
    if (arg === '--semester' && args[i + 1]) { semesterFilter = args[++i]; }
    else if (arg === '--retry' && args[i + 1]) {
      maxRetries = parseInt(args[++i], 10) || MAX_RETRIES;
    }
    else if (arg === '--year' && args[i + 1]) { yearFilter = args[++i]; }
    else if (arg === '--branch' && args[i + 1]) {
      const branchKey = args[++i].toLowerCase();
      branchFilter = BRANCHES[branchKey] || branchKey; // fallback: use as-is if not in map
    }
    else if (arg === '--list') { listOnly = true; }
    else if (arg === '--list-subjects') { listSubjects = true; }
    else if (arg === '--latest') { latestOnly = true; }
    else if (!arg.startsWith('--')) { subjectQuery = arg; }
  }

  console.log('');
  console.log('╔══════════════════════════════════════════════════════════╗');
  console.log('║          SPPU Question Paper Fetcher                    ║');
  console.log('╚══════════════════════════════════════════════════════════╝');
  console.log('');

  // Check Playwright, launch browser
  let browser;
  try {
    browser = await withRetry(() => chromium.launch({ headless: true }), 2, 'launch browser');
  } catch (err) {
    console.error('✗ Playwright/Chromium not available.');
    console.error('  Run: npx playwright install chromium');
    console.error('  Or: npm install && npx playwright install chromium');
    process.exit(1);
  }

  try {
    // Determine semester range (1-8 supported, default 3-8 for BE)
    const semesterDefaults = branchFilter.includes('fe') || branchFilter.includes('first') ?
      ['1', '2'] : ['3', '4', '5', '6', '7', '8'];
    const semestersToScan = semesterFilter ? [semesterFilter] : semesterDefaults;

    // Scrape each semester (sequential to respect rate limits)
    const allPapers = [];
    for (const sem of semestersToScan) {
      const papers = await scrapeSemesterPage(browser, sem, branchFilter);
      allPapers.push(...papers.map(p => ({ ...p, semester: sem })));
    }

    if (listSubjects) {
      const subjects = [...new Set(allPapers.map(p => p.subject))].filter(Boolean).sort();
      console.log('\n  Available Subjects:\n');
      for (const subj of subjects) {
        const count = allPapers.filter(p => p.subject === subj).length;
        const sems = [...new Set(allPapers.filter(p => p.subject === subj).map(p => p.semester))];
        console.log(`    ${subj}`);
        console.log(`    └─ ${count} papers across sem ${sems.join(', ')}`);
        console.log('');
      }
      return;
    }

    if (subjectQuery) {
      let matchingPapers = allPapers.filter(p => matchSubject(subjectQuery, p.subject));
      if (yearFilter) matchingPapers = matchingPapers.filter(p => p.year === yearFilter);

      // Deduplicate
      const seen = new Set();
      matchingPapers = matchingPapers.filter(p => {
        const key = `${p.subject}|${p.year}|${p.month}`;
        if (seen.has(key)) return false;
        seen.add(key);
        return true;
      });

      if (matchingPapers.length === 0) {
        console.log(`  ✗ No papers found for "${subjectQuery}"`);
        console.log('    Try: node scripts/fetch-qp.js --list-subjects');
        return;
      }

      // Group by subject
      const bySubject = {};
      for (const paper of matchingPapers) {
        if (!bySubject[paper.subject]) bySubject[paper.subject] = [];
        bySubject[paper.subject].push(paper);
      }

      for (const [subject, papers] of Object.entries(bySubject)) {
        console.log(`\n  📚 ${subject}`);
        console.log(`  ${'─'.repeat(50)}`);

        if (listOnly) {
          for (const p of papers) {
            console.log(`    [Sem ${p.semester}] ${p.year} ${p.month}`);
          }
          continue;
        }

        const papersToDownload = latestOnly ? [papers[papers.length - 1]] : papers;
        const dirName = sanitizeFilename(subject.split('(')[0].trim().toLowerCase().replace(/\s+/g, '-'));
        fs.mkdirSync(path.join(DOWNLOAD_DIR, dirName), { recursive: true });

        console.log(`    Downloading to: pyq-downloads/${dirName}`);

        // Download sequentially — each download:
        //   - Respects Crawl-delay:3 between requests
        //   - Retries navigation failures (network blips)
        //   - Single attempt for actual download-click (JS-driven, retries don't help)
        let downloaded = 0;
        let failed = 0;
        for (const paper of papersToDownload) {
          const ok = await downloadPaper(browser, paper, branchFilter, dirName);
          if (ok) downloaded++; else failed++;
        }

        console.log(`    Result: ${downloaded} downloaded, ${failed} failed`);
      }

      console.log('');
      console.log(`  ${'─'.repeat(50)}`);
      console.log(`  ✅ Download directory: pyq-downloads/`);
      console.log('');
    } else {
      const subjectCount = [...new Set(allPapers.map(p => p.subject))].filter(Boolean).length;
      const paperCount = allPapers.length;
      console.log(`  Found ${paperCount} papers across ${subjectCount} subjects\n`);
      if (!semesterFilter) {
        console.log('  Tip: Specify a subject to download:');
        console.log('    node scripts/fetch-qp.js dbms');
        console.log('    node scripts/fetch-qp.js --list-subjects');
        console.log('');
      }
    }

  } catch (err) {
    console.error(`\n  ✗ Error: ${err.message}`);
    if (err.stack) console.error(err.stack.split('\n').slice(0, 3).join('\n'));
    console.error('  See --help for usage information.');
  } finally {
    if (browser) await browser.close();
  }

  console.log('');
}

main().catch(err => {
  console.error('Fatal error:', err.message);
  process.exit(1);
});
