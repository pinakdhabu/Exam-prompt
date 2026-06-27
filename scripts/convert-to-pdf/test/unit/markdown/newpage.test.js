const test = require('node:test');
const assert = require('node:assert');
const { convertNewpage } = require('../../../src/transforms/newpage');

test('convertNewpage transform', () => {
  const input = `Page 1\n\\newpage\nPage 2`;
  const expected = `Page 1\n<div style="page-break-before: always;"></div>\nPage 2`;
  assert.strictEqual(convertNewpage(input), expected);
});
