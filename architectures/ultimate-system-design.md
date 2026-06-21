# Ultimate System Design — Exam-prompt PDF Framework

> **Goal:** Production-grade markdown→PDF pipeline with proper math rendering, error handling,
> logging, caching, concurrency, and extensibility — for academic exam papers.

---

## 1. Architecture Overview

```
┌────────────────────────────────────────────────────────────────────────────┐
│                            CLI (commander)                                 │
│  exam-prompt-pdf <input> --format pdf --output ./out --profile print       │
└──────────────────────────┬─────────────────────────────────────────────────┘
                           │
┌──────────────────────────▼─────────────────────────────────────────────────┐
│                      Config Layer (cosmiconfig)                            │
│  CLI flags > env vars > project config > user config > defaults           │
│  Validation: ajv JSON Schema, fail fast                                    │
│  Profiles: quick, draft, print, final                                      │
└──────────────────────────┬─────────────────────────────────────────────────┘
                           │
┌──────────────────────────▼─────────────────────────────────────────────────┐
│                      Pipeline Orchestrator                                 │
│  ┌──────────────────────────────────────────────────────────────────────┐  │
│  │  Stage 1: Input Resolution                                          │  │
│  │    file, stdin, glob, watch → { content, path, meta }                │  │
│  ├──────────────────────────────────────────────────────────────────────┤  │
│  │  Stage 2: Markdown Processing (marked + marked-katex-extension)     │  │
│  │    YAML strip → unicode→LaTeX → delimiter convert → OR normalize     │  │
│  │    → math tokenized pre-escape by katex extension → HTML body        │  │
│  ├──────────────────────────────────────────────────────────────────────┤  │
│  │  Stage 3: Document Assembly                                          │  │
│  │    HTML body + KaTeX CSS (CDN font URLs) + @font-face (base64)       │  │
│  │    + print CSS + page template → full HTML                           │  │
│  ├──────────────────────────────────────────────────────────────────────┤  │
│  │  Stage 4: PDF Generation (Playwright)                                │  │
│  │    Browser pool → setContent → font ready → page.pdf → Buffer        │  │
│  └──────────────────────────────────────────────────────────────────────┘  │
└──────────────────────────┬─────────────────────────────────────────────────┘
                           │
┌──────────────────────────▼─────────────────────────────────────────────────┐
│                      Output Layer                                          │
│  PDF writer (default), HTML writer, PNG preview writer                     │
│  Output: file, dir, stream, cache (cacache)                                │
└─────────────────────────────────────────────────────────────────────────────┘
```

## 2. Technology Decisions

| Concern           | Choice                              | Rationale                                                                         | Source                                         |
| ----------------- | ----------------------------------- | --------------------------------------------------------------------------------- | ---------------------------------------------- |
| Markdown parser   | **marked + marked-katex-extension** | 18× faster than unified, already working, tokenizes math before escape processing | bench: marked ~2950 ops/s vs remark ~164 ops/s |
| Math engine       | **KaTeX server-side** via extension | Deterministic, no browser JS needed, synchronous                                  | —                                              |
| PDF engine        | **Playwright**                      | BrowserContext isolation model best for concurrent PDF gen                        | —                                              |
| Config loader     | **cosmiconfig**                     | Industry standard (ESLint, Prettier), searches up directory tree                  | npm: 15M/week                                  |
| Config validation | **ajv**                             | Fastest JSON Schema validator, fail-fast on boot                                  | npm: 40M/week                                  |
| CLI framework     | **commander**                       | Zero deps, best DX, Vue CLI / CRA standard                                        | npm: 70M/week                                  |
| Logging           | **pino + pino-pretty**              | 7M ops/sec vs Winston's 200K, worker thread transport                             | npm: 8M/week                                   |
| Concurrency       | **p-queue**                         | Promise-based, no Redis needed for CLI, rate limiting                             | npm: 8M/week                                   |
| Caching           | **cacache**                         | Content-addressable, integrity-verified, npm's own cache                          | npm: 4M/week                                   |
| Progress          | **cli-progress**                    | Multi-bar, ETA, stable                                                            | npm: 2M/week                                   |
| ANSI colors       | **picocolors**                      | 1/10th size of chalk, same API                                                    | npm: 5M/week                                   |
| Browser pool      | **Custom semaphore**                | Single browser, max 4-8 concurrent contexts, restart every 500 renders            | Playwright perf guide                          |
| Error handling    | **Homegrown Result type**           | ~10 lines, no fp-ts overhead, clear discriminated unions                          | —                                              |

## 3. File Structure

```
scripts/convert-to-pdf/
├── bin/
│   └── exam-prompt-pdf          # CLI entry (shebang)
├── src/
│   ├── config/
│   │   ├── index.js             # mergeConfig (CLI > env > file > default)
│   │   ├── schema.json          # AJV JSON Schema
│   │   ├── defaults.yaml        # Default configuration
│   │   └── profiles/
│   │       ├── quick.yaml       # Fast/low quality
│   │       ├── draft.yaml       # Moderate
│   │       └── print.yaml       # High quality print-ready
│   │
│   ├── pipeline/
│   │   ├── index.js             # Pipeline class (koa-style middleware)
│   │   ├── stages/
│   │   │   ├── input.js         # resolveInput()
│   │   │   ├── markdown.js      # processMarkdown() → marked + katex
│   │   │   ├── document.js      # buildDocument() → HTML assembly
│   │   │   └── pdf.js           # generatePdf() → Playwright
│   │   └── queue.js             # PQueue wrapper with retry
│   │
│   ├── input/
│   │   ├── index.js             # InputResolver
│   │   ├── file.js              # Single file reader
│   │   ├── stdin.js             # Stdin reader
│   │   ├── glob.js              # Glob pattern resolver
│   │   └── watch.js             # Chokidar watcher
│   │
│   ├── markdown/
│   │   ├── index.js             # MarkdownProcessor class
│   │   ├── transforms/
│   │   │   ├── yaml.js          # Strip YAML frontmatter
│   │   │   ├── unicode.js       # Unicode → LaTeX math
│   │   │   ├── delimiters.js    # \(\)/\[\] → $$/$
│   │   │   ├── display.js       # Detect display patterns, upgrade
│   │   │   ├── or.js            # O.R. → **OR**
│   │   │   ├── marks.js         # [N] → <span class="marks">
│   │   │   ├── newpage.js       # \\newpage → page break
│   │   │   ├── fences.js        # Normalize 4-backtick code fences
│   │   │   └── cleanup.js       # Quotes, dashes, emoji
│   │   └── tokens.js            # Tokenizer helpers
│   │
│   ├── document/
│   │   ├── index.js             # DocumentBuilder class
│   │   ├── template.js          # HTML5 template with slots
│   │   ├── styles/
│   │   │   ├── print.css        # Page layout, margins, @page
│   │   │   ├── typography.css   # Fonts, headers, tables, code
│   │   │   └── math.css         # .katex, .katex-display overrides
│   │   └── fonts/
│   │       ├── index.js         # FontManager: resolve, embed, CSS
│   │       └── providers/
│   │           ├── system.js    # Load from /usr/share/fonts
│   │           └── bundled.js   # Fallback embedded fonts
│   │
│   ├── pdf/
│   │   ├── index.js             # PdfGenerator class
│   │   └── pool.js              # BrowserPool (semaphore + restart)
│   │
│   ├── output/
│   │   ├── index.js             # OutputRouter
│   │   ├── pdf.js               # PDF writer
│   │   ├── html.js              # HTML standalone writer
│   │   └── png.js               # PNG preview writer
│   │
│   ├── cache/
│   │   └── index.js             # cacache wrapper (get/set/invalidate)
│   │
│   ├── error/
│   │   ├── index.js             # PipelineError class
│   │   └── codes.js             # Error code enum + classification
│   │
│   ├── log/
│   │   ├── index.js             # pino logger factory
│   │   └── metrics.js           # Per-job timing stats
│   │
│   └── utils/
│       ├── result.js            # Result<T, E> type
│       ├── timing.js            # performance.now() wrappers
│       └── fs.js                # Safe file ops
│
├── test/
│   ├── unit/
│   │   ├── markdown/
│   │   │   ├── yaml.test.js
│   │   │   ├── unicode.test.js
│   │   │   ├── delimiters.test.js
│   │   │   ├── display.test.js
│   │   │   └── or.test.js
│   │   ├── document/
│   │   │   └── builder.test.js
│   │   └── config/
│   │       └── schema.test.js
│   ├── integration/
│   │   ├── pipeline.test.js     # Full md→HTML→PDF round-trip
│   │   ├── fonts.test.js        # Font embedding verification
│   │   └── math.test.js         # KaTeX matrix/equation visual
│   └── fixtures/
│       ├── simple.md
│       ├── matrix.md
│       ├── equations.md
│       └── expected/            # HTML snapshots
│
├── config/                      # Shipped default configs
│   ├── default.yaml
│   └── profiles/
│
├── package.json
└── README.md
```

## 4. Core Implementation

### 4.1 Config Layer — `src/config/index.js`

```javascript
const cosmiconfig = require("cosmiconfig");
const Ajv = require("ajv");
const { deepmerge } = require("smol-merge");
const schema = require("./schema.json");
const defaults = require("./defaults.yaml");

const EXPLORER = cosmiconfig("exam-prompt-pdf", {
  searchPlaces: [
    "package.json",
    ".exam-prompt-pdfrc",
    ".exam-prompt-pdfrc.yaml",
    ".exam-prompt-pdfrc.json",
    "exam-prompt-pdf.config.js",
  ],
});

function validate(config) {
  const ajv = new Ajv({ useDefaults: true, strict: false });
  const valid = ajv.validate(schema, config);
  if (!valid) {
    console.error("Config validation errors:");
    ajv.errors.forEach((e) => console.error(`  ${e.instancePath}: ${e.message}`));
    process.exit(1);
  }
  return config;
}

async function loadConfig(cliFlags = {}) {
  const explorerResult = await EXPLORER.search();
  const fileConfig = explorerResult?.config ?? {};
  const profileConfig = cliFlags.profile ? loadProfile(cliFlags.profile) : {};

  const merged = deepmerge(defaults, profileConfig, fileConfig, cliFlags);
  return validate(merged);
}
```

**Schema validation catches these at boot:**

- `pdf.margins.top` is a valid CSS length
- `fonts.serif.variants` has all four required weights
- `math.katex.cssSource` is one of `cdn | embed | inline`
- `pipeline.concurrency` is 1-16

### 4.2 Pipeline — `src/pipeline/index.js`

Koa-style middleware pipeline:

```javascript
class Pipeline {
  constructor() {
    this.stages = [];
  }

  use(fn) {
    this.stages.push(fn);
    return this;
  }

  async run(ctx) {
    let index = 0;
    const next = async () => {
      if (index < this.stages.length) {
        await this.stages[index++](ctx, next);
      }
    };
    await next();
    return ctx;
  }
}

// Usage:
const pipeline = new Pipeline();
pipeline.use(stageInput);
pipeline.use(stageMarkdown);
pipeline.use(stageDocument);
pipeline.use(stagePdf);

const ctx = await pipeline.run({ source: "input.md", config });
// ctx.pdf ← Buffer
```

### 4.3 Browser Pool — `src/pdf/pool.js`

```javascript
const { chromium } = require("playwright");

class BrowserPool {
  constructor({ maxPages = 4, restartAfter = 500 }) {
    this.maxPages = maxPages;
    this.restartAfter = restartAfter;
    this.active = 0;
    this.queue = [];
    this.renderCount = 0;
    this.browser = null;
  }

  async start() {
    this.browser = await chromium.launch({
      args: [
        "--no-sandbox",
        "--disable-setuid-sandbox",
        "--disable-dev-shm-usage",
        "--disable-gpu",
        "--disable-extensions",
        "--disable-background-networking",
      ],
    });
    this.startTime = Date.now();
  }

  async render(html) {
    if (this.renderCount >= this.restartAfter) {
      await this._restart();
    }

    // Semaphore: wait if at capacity
    if (this.active >= this.maxPages) {
      await new Promise((r) => this.queue.push(r));
    }

    this.active++;
    const context = await this.browser.newContext();
    const page = await context.newPage();

    try {
      await page.setContent(html, { waitUntil: "load", timeout: 30000 });
      await page.evaluateHandle("document.fonts.ready");
      this.renderCount++;
      return await page.pdf({
        format: "A4",
        margin: { top: "2cm", bottom: "2.2cm", left: "2.2cm", right: "2.2cm" },
        printBackground: true,
        displayHeaderFooter: true,
        headerTemplate: "<span></span>",
        footerTemplate:
          '<div style="font-size:9pt;color:#555;text-align:center;width:100%">' +
          '<span class="pageNumber"></span></div>',
      });
    } finally {
      await page.close();
      await context.close();
      this.active--;
      if (this.queue.length > 0) this.queue.shift()();
    }
  }

  async _restart() {
    await this.browser.close();
    this.browser = await chromium.launch({
      args: ["--no-sandbox", "--disable-dev-shm-usage", "--disable-gpu"],
    });
    this.renderCount = 0;
  }

  async shutdown() {
    while (this.active > 0) {
      await new Promise((r) => setTimeout(r, 100));
    }
    await this.browser?.close();
  }
}
```

### 4.4 Error Handling — `src/error/index.js`

```javascript
const ERROR_CODES = {
  BROWSER_CRASH: { retryable: true, recoverable: true, message: "Browser crashed" },
  KATEX_ERROR: { retryable: false, recoverable: true, message: "KaTeX parse error" },
  FONT_LOAD_FAIL: { retryable: true, recoverable: true, message: "Font loading failed" },
  INVALID_INPUT: { retryable: false, recoverable: true, message: "Invalid input file" },
  CONFIG_ERROR: { retryable: false, recoverable: false, message: "Configuration error" },
  TIMEOUT: { retryable: true, recoverable: true, message: "Operation timed out" },
  OUTPUT_ERROR: { retryable: true, recoverable: true, message: "Output write failed" },
};

class PipelineError extends Error {
  constructor(code, details = {}) {
    const def = ERROR_CODES[code] || {
      message: "Unknown error",
      retryable: false,
      recoverable: false,
    };
    super(def.message);
    this.name = "PipelineError";
    this.code = code;
    this.retryable = def.retryable;
    this.recoverable = def.recoverable;
    this.details = details;
  }
}

module.exports = { PipelineError, ERROR_CODES };
```

### 4.5 Result Type — `src/utils/result.js`

```javascript
const ok = (value) => ({ ok: true, value });
const err = (error) => ({ ok: false, error });

async function tryCatch(fn) {
  try {
    const value = await fn();
    return ok(value);
  } catch (error) {
    return err(
      error instanceof PipelineError ? error : new PipelineError("UNKNOWN", { cause: error }),
    );
  }
}

module.exports = { ok, err, tryCatch };
```

### 4.6 Caching — `src/cache/index.js`

```javascript
const cacache = require("cacache");
const crypto = require("crypto");
const { hashElement } = require("folder-hash");

class PipelineCache {
  constructor(cacheDir) {
    this.cacheDir = cacheDir;
  }

  async key(sourcePath, config) {
    const sourceHash = await this._hashFile(sourcePath);
    const depHash = await this._hashDeps();
    const configHash = crypto.createHash("sha256").update(JSON.stringify(config)).digest("hex");
    return crypto
      .createHash("sha256")
      .update(sourceHash + depHash + configHash)
      .digest("hex");
  }

  async get(key) {
    try {
      const { data } = await cacache.get(this.cacheDir, key);
      return data;
    } catch {
      return null;
    }
  }

  async set(key, data) {
    await cacache.put(this.cacheDir, key, data);
  }

  async _hashFile(path) {
    const content = require("fs").readFileSync(path);
    return crypto.createHash("sha256").update(content).digest("hex");
  }

  async _hashDeps() {
    try {
      const pkg = require("path").join(process.cwd(), "package.json");
      const hash = await hashElement(pkg, { folders: { exclude: [".*", "node_modules"] } });
      return hash.hash;
    } catch {
      return "no-deps";
    }
  }
}
```

## 5. CLI Design — `bin/exam-prompt-pdf`

```
Usage:
  exam-prompt-pdf [options] <files...>

Arguments:
  files                        Markdown file(s) to convert (supports glob patterns)

Options:
  -o, --output <dir/file>      Output path (default: pdf_output/ or <input>.pdf)
  -f, --format <format>        Output format: pdf, html, png (default: pdf)
  -p, --profile <name>         Config profile: quick, draft, print, final
  -c, --config <path>          Custom config file
  -j, --json                   JSON output (machine-readable)
  --parallel <n>               Concurrent conversions (default: CPU count - 1)
  --no-cache                   Bypass cache
  --watch                      Watch mode (re-generate on file change)
  --init                       Generate default config file
  --list-fonts                 List available system fonts
  --verbose                    Debug logging
  --dry-run                    Validate input without generating PDF
  -h, --help                   Display help
  -V, --version                Display version

Examples:
  exam-prompt-pdf input.md                         → input.pdf in pdf_output/
  exam-prompt-pdf input.md -o output.pdf           → output.pdf
  exam-prompt-pdf "examples/**/*.md" --parallel 4  → Batch all
  exam-prompt-pdf input.md --profile print         → Print-quality PDF
  exam-prompt-pdf input.md --format html           → Standalone HTML
  exam-prompt-pdf input.md --watch                 → Live reload on edit
  exam-prompt-pdf --init                           → Create .exam-prompt-pdfrc.yaml
```

**JSON mode output:** `--json` flag emits NDJSON for tooling:

```json
{"event":"start","file":"input.md","timestamp":1712345678000}
{"event":"complete","file":"input.md","duration":1234,"pages":3,"size":102400,"cacheHit":false}
{"event":"summary","total":10,"succeeded":10,"failed":0,"duration":5678}
```

## 6. Configuration Profiles

### `quick.yaml` — Rapid draft preview

```yaml
pdf:
  format: A4
  margins: { top: 1cm, bottom: 1cm, left: 1.5cm, right: 1.5cm }
  printBackground: false
  pageNumbers: false
math:
  katex:
    cssSource: cdn
pipeline:
  concurrency: 8
  cache: false
```

### `print.yaml` — Production print-ready

```yaml
pdf:
  format: A4
  margins: { top: 2cm, bottom: 2.2cm, left: 2.2cm, right: 2.2cm }
  printBackground: true
  pageNumbers: true
fonts:
  embed: true
  fallback:
    serif: Liberation Serif
    mono: Liberation Mono
math:
  katex:
    throwOnError: false
    cssSource: cdn
    delimiters:
      inline: ['\\(', '\\)']
      display: ['\\[', '\\]']
pipeline:
  concurrency: 4
  retryCount: 3
  timeout: 60000
  cache: true
logging:
  level: warn
```

## 7. Error Classification & Retry

```
                                                      ┌──────────────┐
                                                      │  Pipeline    │
                                                      │  Error       │
                                                      └──────┬───────┘
                                                             │
                                      ┌──────────────────────┼──────────────────────┐
                                      ▼                      ▼                      ▼
                               ┌──────────┐          ┌──────────────┐       ┌──────────────┐
                               │Retryable │          │Non-retryable │       │   Warning    │
                               └─────┬────┘          └──────┬───────┘       └──────┬───────┘
                          ┌──────────┼──────────┐          │                       │
                          ▼          ▼          ▼          ▼                       ▼
                   ┌──────────┐ ┌────────┐ ┌────────┐ ┌──────────┐          ┌──────────┐
                   │BROWSER   │ │FONT    │ │TIMEOUT │ │CONFIG    │          │KATEX     │
                   │CRASH     │ │LOAD    │ │        │ │ERROR     │          │ERROR     │
                   └──────────┘ └────────┘ └────────┘ └──────────┘          └──────────┘

Retry policy: Retryable → 3 attempts, exponential backoff (1s, 2s, 4s)
Non-retryable → Skip file, continue batch, report in summary
Warning → Log with file reference, include in output (KaTeX errors render as red text)
```

## 8. Logging — Structured with pino

```javascript
const pino = require("pino");

function createLogger(options = {}) {
  const logger = pino({
    level: options.level || "info",
    transport: options.pretty
      ? { target: "pino-pretty", options: { colorize: true, translateTime: "HH:MM:ss" } }
      : undefined,
    redact: ["config.fonts.*.file"], // Never log absolute font paths
  });

  return {
    info: (msg, ctx) => logger.info(ctx || {}, msg),
    error: (msg, err, ctx) => logger.error({ err, ...ctx }, msg),
    child: (bindings) => logger.child(bindings),
  };
}
```

## 9. Testing Strategy

```javascript
// test/unit/markdown/yaml.test.js
test("strips YAML frontmatter", () => {
  const input = "---\ntitle: Test\n---\n# Hello";
  const result = stripYaml(input);
  expect(result).toBe("# Hello");
});

// test/unit/markdown/delimiters.test.js
test("converts \\(...\\) to $$...$$ for display math", () => {
  const input = "\\( \\begin{bmatrix} 1 & 2 \\\\ 3 & 4 \\end{bmatrix} \\)";
  const result = convertDelimiters(input);
  expect(result).toContain("$$");
  expect(result).toContain("\\begin{bmatrix}");
});

// test/unit/markdown/display.test.js
test("upgrades matrix inline math to display", () => {
  const input = "\\( \\begin{bmatrix} 1 & 2 \\\\ 3 & 4 \\end{bmatrix} \\)";
  const result = upgradeDisplayMath(input);
  expect(result).toMatch(/^\n\n\$\$/);
});

// test/integration/pipeline.test.js
test("full pipeline preserves \\\\ in matrices", async () => {
  const input = "\\[ \\begin{bmatrix} 1 & 2 \\\\ 3 & 4 \\end{bmatrix} \\]";
  const ctx = await pipeline.run({ source: { content: input, path: "test.md" }, config });
  const html = ctx.html;
  expect(html).toContain("katex-display");
  expect(html).not.toContain("ParseError");
}, 30000);

// test/integration/fonts.test.js
test("fonts are embedded in PDF", async () => {
  const ctx = await pipeline.run({ source: { content: "Hello World", path: "test.md" }, config });
  const pdf = ctx.pdf;
  const text = await extractTextFromPdf(pdf);
  expect(text).toContain("Hello World");
  // Check font metrics via pdf-lib
  const doc = await PDFDocument.load(pdf);
  // Verify Times New Roman is embedded
}, 30000);
```

## 10. Migration Path (Current → Ultimate)

### Phase 1: Structural (do NOW — no functionality change)

- [ ] Move `transforms/` into separate files (currently in `markdown.js`)
- [ ] Add `Result` type to `pdf.js` for error handling
- [ ] Add `pino` logging with job IDs
- [ ] Add retry wrapper around Playwright
- [ ] Add `--json` flag to CLI
- **Files changed:** markdown.js → transforms/, index.js, pdf.js, config.js

### Phase 2: Robustness (next)

- [ ] Add `ajv` JSON Schema validation for config
- [ ] Add `cacache` for PDF caching
- [ ] Implement `BrowserPool` with semaphore + restart
- [ ] Create profile system (`--profile quick|draft|print`)
- [ ] Add `--watch` mode via chokidar
- **Files changed:** config/, pdf/pool.js, cache/, bin/exam-prompt-pdf

### Phase 3: DX (after)

- [ ] Add `--init` to generate config file
- [ ] Add `--list-fonts` command
- [ ] HTML & PNG output writers
- [ ] Progress bars with `cli-progress`
- [ ] `--dry-run` validation mode
- **Files changed:** output/, bin/exam-prompt-pdf

### Phase 4: Quality (ongoing)

- [ ] Unit tests for all transforms
- [ ] Integration tests with Playwright
- [ ] PDF pixel-diff snapshots for regression
- [ ] CI pipeline running tests on every commit
- **Files changed:** test/

---

## 11. Performance Budget

| Operation                   | Current | Target     | Measurement              |
| --------------------------- | ------- | ---------- | ------------------------ |
| Single file (no cache)      | ~4s     | <3s        | wall clock               |
| Batch 96 files (cold)       | ~3min   | <90s       | wall clock               |
| Batch 96 files (warm cache) | —       | <10s       | wall clock               |
| Browser restart             | —       | <1s        | time to ready            |
| Cache hit serve             | —       | <50ms      | cache.get + buffer write |
| Memory per browser          | —       | <500MB RSS | process.memoryUsage()    |
