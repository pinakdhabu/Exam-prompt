function stripYaml(md) {
  return md.replace(/^---\n[\s\S]*?\n---\n*/, (match) => {
    // Only strip if content looks like YAML (has lines with word: value pattern)
    const body = match.replace(/^---\n|\n---\n*$/g, '');
    return /^\w[\w\/]*: /.test(body) ? '' : match;
  });
}

module.exports = { stripYaml };
