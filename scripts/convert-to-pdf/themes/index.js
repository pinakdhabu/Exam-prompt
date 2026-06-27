const fs = require('fs');
const path = require('path');

function getActiveTheme() {
  const profilePath = path.resolve(__dirname, '../../../deps/session-profile.json');
  let university = '';

  if (fs.existsSync(profilePath)) {
    try {
      const profile = JSON.parse(fs.readFileSync(profilePath, 'utf-8'));
      university = profile.university || '';
    } catch (e) {
      // Ignore parse errors and fallback
    }
  }

  // Normalize name and check for SPPU
  const normalized = university.toUpperCase().replace(/_/g, ' ');
  if (normalized.includes('SAVITRIBAI') || normalized.includes('SPPU') || normalized.includes('PUNE')) {
    return require('./sppu');
  }

  // Future universities will be loaded here:
  // if (normalized.includes('VTU') || normalized.includes('VISVESVARAYA')) { return require('./vtu'); }

  return require('./default');
}

module.exports = getActiveTheme();
