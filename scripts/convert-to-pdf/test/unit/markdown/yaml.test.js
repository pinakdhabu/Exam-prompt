const test = require('node:test');
const assert = require('node:assert');
const { stripYaml } = require('../../../src/transforms/yaml');

test('stripYaml transform', () => {
  const inputWithYaml = `---\nname: test-skill\ndescription: A test description\n---\n# Header\nContent here`;
  const expectedWithoutYaml = `# Header\nContent here`;
  assert.strictEqual(stripYaml(inputWithYaml), expectedWithoutYaml);

  const inputWithoutYaml = `# Header\nContent here`;
  assert.strictEqual(stripYaml(inputWithoutYaml), inputWithoutYaml);

  const inputWithFakeYaml = `---\nThis is not YAML since it has no colons\n---\n# Header`;
  assert.strictEqual(stripYaml(inputWithFakeYaml), inputWithFakeYaml);
});
