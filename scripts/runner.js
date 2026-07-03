const cp = require('child_process');
const path = require('path');

const scriptDir = __dirname;
const scriptName = process.argv[2];
const args = process.argv.slice(3);

if (!scriptName) {
  console.error('Usage: node scripts/runner.js <script-name> [args...]');
  process.exit(1);
}

const isWin = process.platform === 'win32';
const cmd = isWin ? 'powershell' : 'bash';
const ext = isWin ? 'ps1' : 'sh';
const scriptPath = path.join(scriptDir, `${scriptName}.${ext}`);

const convertedArgs = args.map(a => {
  if (!isWin) return a;
  if (a.startsWith('--')) {
    const kebab = a.slice(2);
    const pascal = kebab.replace(/-([a-z])/g, (_, c) => c.toUpperCase());
    return '-' + pascal.charAt(0).toUpperCase() + pascal.slice(1);
  }
  return a;
});

const cmdArgs = isWin
  ? ['-ExecutionPolicy', 'Bypass', '-File', scriptPath, ...convertedArgs]
  : [scriptPath, ...convertedArgs];

const result = cp.spawnSync(cmd, cmdArgs, {
  stdio: 'inherit',
  shell: true,
});

process.exit(result.status ?? 1);
