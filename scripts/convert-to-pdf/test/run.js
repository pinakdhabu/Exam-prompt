const fs = require('fs');
const path = require('path');
const { run } = require('node:test');
const { spec } = require('node:test/reporters');

function getTestFiles(dir) {
  let files = [];
  if (!fs.existsSync(dir)) return files;
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  for (const entry of entries) {
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      files = files.concat(getTestFiles(fullPath));
    } else if (entry.isFile() && entry.name.endsWith('.test.js')) {
      files.push(fullPath);
    }
  }
  return files;
}

const testDir = path.join(__dirname, 'unit');
const testFiles = getTestFiles(testDir);

if (testFiles.length === 0) {
  console.log('No tests found in ' + testDir);
  process.exit(0);
}

run({ files: testFiles })
  .compose(new spec())
  .pipe(process.stdout);
