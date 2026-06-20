function convertNewpage(md) {
  return md.replace(/\\newpage/g, '<div style="page-break-before: always;"></div>');
}

module.exports = { convertNewpage };
