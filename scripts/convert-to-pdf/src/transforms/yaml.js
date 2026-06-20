function stripYaml(md) {
  return md.replace(/^---[\s\S]*?---\n*/, '');
}

module.exports = { stripYaml };
