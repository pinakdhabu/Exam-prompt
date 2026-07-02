const fs = require('fs');
const { marked } = require('marked');
const { MarkdownProcessor } = require('./scripts/convert-to-pdf/markdown');
const { HtmlRenderer } = require('./scripts/convert-to-pdf/renderer');

const raw = fs.readFileSync('examples/be/sem-7/design-and-analysis-of-algorithms/sample-paper-2.md', 'utf-8');
const processor = new MarkdownProcessor();
const processedMd = processor.process(raw);
const htmlBody = marked.parse(processedMd, { breaks: false, gfm: true });
const renderer = new HtmlRenderer(processor.hasMath);
const html = renderer.render(htmlBody);

console.log(html.substring(html.indexOf('**Q1)'), html.indexOf('**Q2)')));
// Wait, the regex already replaced **Q1) a)** so it won't be **Q1)
// Let's just print the Q1 and b) parts
const lines = html.split('\n');
lines.forEach(l => {
    if (l.includes('Q1)') || l.includes('b)')) console.log(l);
});
