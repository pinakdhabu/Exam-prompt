const MERMAID_BLOCK = /```mermaid\n([\s\S]*?)```\s*/g;

function convertMermaidBlocks(md) {
  return md.replace(MERMAID_BLOCK, (_, code) => {
    return '<div class="mermaid">\n' + code.trim() + '\n</div>';
  });
}

function hasMermaid(md) {
  return MERMAID_BLOCK.test(md);
}

module.exports = { convertMermaidBlocks, hasMermaid };
