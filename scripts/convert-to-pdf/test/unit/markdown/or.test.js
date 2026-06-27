const test = require('node:test');
const assert = require('node:assert');
const { normalizeOr } = require('../../../src/transforms/or');

test('normalizeOr transform', () => {
  assert.strictEqual(normalizeOr('OR'), '**OR**');
  assert.strictEqual(normalizeOr('O.R.'), '**OR**');
  assert.strictEqual(normalizeOr('**OR**'), '**OR**');
  assert.strictEqual(normalizeOr('**O. R.**'), '**OR**');
  assert.strictEqual(normalizeOr('Normal text'), 'Normal text');
});
