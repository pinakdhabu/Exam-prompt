#!/usr/bin/env node
/**
 * scripts/diagram-gen.js — Universal Diagram Generator
 *
 * Renders diagrams from Markdown files using:
 *   - Mermaid (via @mermaid-js/mermaid-cli)
 *   - D2 (via d2 CLI)
 *   - Graphviz DOT (via dot CLI)
 *
 * Usage:
 *   node scripts/diagram-gen.js <input.md>                # Render all diagrams in MD file
 *   node scripts/diagram-gen.js <input.md> --watch        # Watch mode
 *   node scripts/diagram-gen.js --code '...mermaid...'    # Render from code string
 *   node scripts/diagram-gen.js --list-formats            # List supported diagram types
 *
 * Output: Generated SVGs + updated MD with img tags
 */

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// === Config ===
const OUTPUT_DIR = '_diagrams';  // relative to input file directory
const MERMAID_CLI = 'npx @mermaid-js/mermaid-cli';

// === Diagram Type Detection ===
const DIAGRAM_TYPES = {
  mermaid: {
    patterns: [
      /```mermaid\s*\n([\s\S]*?)```/g,
      /```mmd\s*\n([\s\S]*?)```/g
    ],
    extension: '.mmd',
    render: renderMermaid,
    description: 'Mermaid — flowcharts, sequence diagrams, class diagrams, mind maps, Gantt, etc.'
  },
  d2: {
    patterns: [
      /```d2\s*\n([\s\S]*?)```/g
    ],
    extension: '.d2',
    render: renderD2,
    description: 'D2 — declarative diagrams for cloud architecture, networks, flowcharts'
  },
  dot: {
    patterns: [
      /```dot\s*\n([\s\S]*?)```/g,
      /```graphviz\s*\n([\s\S]*?)```/g
    ],
    extension: '.gv',
    render: renderDot,
    description: 'Graphviz DOT — directed/undirected graphs, trees, automata'
  }
};

// === Helpers ===
function ensureDir(dir) {
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
}

function tempFile(content, ext) {
  const tmp = path.join('/tmp', `diagram-gen-${Date.now()}-${Math.random().toString(36).slice(2)}${ext}`);
  fs.writeFileSync(tmp, content, 'utf-8');
  return tmp;
}

function slugify(text, index) {
  return text
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '')
    .slice(0, 40) || `diagram-${index}`;
}

// === Renderers ===

function renderMermaid(code, outputSvg) {
  const mmdFile = tempFile(code, '.mmd');
  try {
    execSync(
      `${MERMAID_CLI} -i "${mmdFile}" -o "${outputSvg}" --backgroundColor white --width 1200 2>&1`,
      { stdio: 'pipe', timeout: 30000 }
    );
    return true;
  } catch (e) {
    console.error(`  MERMAID ERROR: ${e.message.split('\n')[0]}`);
    return false;
  } finally {
    if (fs.existsSync(mmdFile)) fs.unlinkSync(mmdFile);
    // Also clean up the generated .pdf if it exists
    const pdfFile = mmdFile.replace('.mmd', '.pdf');
    if (fs.existsSync(pdfFile)) fs.unlinkSync(pdfFile);
  }
}

function renderD2(code, outputSvg) {
  const d2File = tempFile(code, '.d2');
  try {
    execSync(
      `d2 --theme 300 --pad 16 "${d2File}" "${outputSvg}" 2>&1`,
      { stdio: 'pipe', timeout: 30000 }
    );
    return true;
  } catch (e) {
    console.error(`  D2 ERROR: ${e.message.split('\n')[0]}`);
    return false;
  } finally {
    if (fs.existsSync(d2File)) fs.unlinkSync(d2File);
  }
}

function renderDot(code, outputSvg) {
  const dotFile = tempFile(code, '.gv');
  try {
    execSync(
      `dot -Tsvg "${dotFile}" -o "${outputSvg}" 2>&1`,
      { stdio: 'pipe', timeout: 30000 }
    );
    return true;
  } catch (e) {
    console.error(`  DOT ERROR: ${e.message.split('\n')[0]}`);
    return false;
  } finally {
    if (fs.existsSync(dotFile)) fs.unlinkSync(dotFile);
  }
}

// === Process All Diagrams in a File ===
function processFile(inputPath, _options = {}) {
  const inputFile = path.resolve(inputPath);
  if (!fs.existsSync(inputFile)) {
    console.error(`ERROR: File not found: ${inputFile}`);
    process.exit(1);
  }

  const content = fs.readFileSync(inputFile, 'utf-8');
  const baseDir = path.dirname(inputFile);
  const diagDir = path.join(baseDir, OUTPUT_DIR);
  ensureDir(diagDir);

  let result = content;
  let totalRendered = 0;
  let totalFailed = 0;
  let diagramIndex = 0;

  for (const [typeName, typeConfig] of Object.entries(DIAGRAM_TYPES)) {
    for (const pattern of typeConfig.patterns) {
      let match;
      // Reset lastIndex
      pattern.lastIndex = 0;

      while ((match = pattern.exec(result)) !== null) {
        const code = match[1].trim();
        if (!code) continue;

        diagramIndex++;
        const name = slugify(code.split('\n')[0], diagramIndex);
        const svgFile = path.join(diagDir, `${name}-${typeName}-${diagramIndex}.svg`);
        const relPath = path.join(OUTPUT_DIR, `${name}-${typeName}-${diagramIndex}.svg`);

        process.stdout.write(`  [${diagramIndex}] ${typeName}: rendering "${name}"... `);

        const success = typeConfig.render(code, svgFile);

        if (success && fs.existsSync(svgFile)) {
          const svgSize = fs.statSync(svgFile).size;
          const alt = `${typeName} diagram: ${name}`;

          // Replace the code block with an image tag
          const oldBlock = match[0];
          const imgTag = `<p align="center"><img src="${relPath}" alt="${alt}" width="100%"/></p>\n\n<!-- ${typeName} source:\n\`\`\`${typeName}\n${code}\n\`\`\` -->\n`;
          result = result.replace(oldBlock, imgTag);

          console.log(`✅ ${(svgSize / 1024).toFixed(1)} KB`);
          totalRendered++;
        } else {
          console.log('❌ FAILED');
          totalFailed++;
        }
      }
    }
  }

  // Write updated markdown
  const ext = path.extname(inputFile);
  const base = path.basename(inputFile, ext);
  const outputFile = path.join(baseDir, `${base}-with-diagrams${ext}`);
  fs.writeFileSync(outputFile, result, 'utf-8');

  console.log(`\n📊 Summary: ${totalRendered} rendered, ${totalFailed} failed`);
  console.log(`   Output: ${outputFile}`);
  console.log(`   SVGs:   ${diagDir}/`);

  return { totalRendered, totalFailed, outputFile };
}

// === Watch Mode ===
function watchFile(inputPath) {
  console.log(`👀 Watching: ${inputPath}`);
  console.log('   Press Ctrl+C to stop\n');

  processFile(inputPath);

  fs.watch(inputPath, (eventType) => {
    if (eventType === 'change') {
      console.log(`\n🔄 File changed, re-rendering...\n`);
      processFile(inputPath);
    }
  });
}

// === Main ===
function main() {
  const args = process.argv.slice(2);

  if (args.includes('--list-formats') || args.includes('--formats')) {
    console.log('\n📐 Supported Diagram Formats:\n');
    for (const [name, config] of Object.entries(DIAGRAM_TYPES)) {
      console.log(`  ${name.padEnd(10)} ${config.description}`);
    }
    console.log('\nDependencies:');
    console.log('  mermaid:  npm install -g @mermaid-js/mermaid-cli  (or npx)');
    console.log('  d2:       curl -fsSL https://d2lang.com/install.sh | sh');
    console.log('  dot:      sudo apt install graphviz  (or brew install graphviz)');
    console.log('');
    process.exit(0);
  }

  if (args.includes('--code')) {
    const codeIdx = args.indexOf('--code');
    const code = args[codeIdx + 1];
    if (!code) {
      console.error('ERROR: --code requires a diagram code string');
      process.exit(1);
    }

    // Auto-detect type from code content
    let typeName = 'mermaid'; // default
    if (code.includes('->>') || code.includes('->')) typeName = 'mermaid';
    else if (code.includes('->')) typeName = 'd2';

    const tmpFile = tempFile(`\`\`\`${typeName}\n${code}\n\`\`\``, '.md');
    processFile(tmpFile);
    if (fs.existsSync(tmpFile)) fs.unlinkSync(tmpFile);
    process.exit(0);
  }

  const inputFile = args[0];
  if (!inputFile) {
    console.log('\n📐 Universal Diagram Generator\n');
    console.log('Usage:');
    console.log('  node scripts/diagram-gen.js <input.md>                  Render all diagrams');
    console.log('  node scripts/diagram-gen.js <input.md> --watch          Watch for changes');
    console.log('  node scripts/diagram-gen.js --code "<mermaid code>"     Render from string');
    console.log('  node scripts/diagram-gen.js --list-formats              List supported formats');
    console.log('');
    console.log('Supported formats: mermaid, d2, graphviz/dot');
    console.log('');
    console.log('Example:');
    console.log('  node scripts/diagram-gen.js examples/notes.md');
    console.log('  node scripts/diagram-gen.js README.md --watch');
    console.log('');
    process.exit(1);
  }

  if (args.includes('--watch')) {
    watchFile(inputFile);
  } else {
    processFile(inputFile);
  }
}

if (require.main === module) {
  main();
}

module.exports = { processFile, DIAGRAM_TYPES };
