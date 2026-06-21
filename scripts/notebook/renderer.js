class NotebookHtmlRenderer {
  constructor({ title, headerLink } = {}) {
    this.title = title || 'Handwritten Notes';
    this.headerLink = headerLink || '';
  }

  render(markdownHtml) {
    return '<!DOCTYPE html><html lang="en"><head><meta charset="utf-8">'
      + '<title>' + this.title + '</title>'
      + '<link rel="preconnect" href="https://fonts.googleapis.com">'
      + '<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400;600;700&display=swap" rel="stylesheet">'
      + '<style>' + this._buildCSS() + '</style></head><body>'
      + this._buildHeader()
      + '<div class="page"><div class="page-content">'
      + markdownHtml
      + '</div></div>'
      + '</body></html>';
  }

  _buildHeader() {
    return '<div class="fixed-header">'
      + '<span>📓 ' + this.title + '</span>'
      + (this.headerLink ? '<span><a href="' + this.headerLink + '">' + this.headerLink.replace(/^https?:\/\//, '') + '</a></span>' : '')
      + '</div>';
  }

  _buildCSS() {
    return `
      @page{size:A4;margin:0}
      *{margin:0;padding:0;box-sizing:border-box}
      body{
        font-family:'Caveat','Segoe Print',cursive;
        font-size:18px;line-height:1.75;
        color:#222;background:#fff8f0;padding:0
      }
      .page{
        width:210mm;min-height:297mm;
        padding:60px 50px 50px 55px;
        position:relative;
        background:
          repeating-linear-gradient(#fff8f0,#fff8f0 27px,#d4d9e6 27px,#d4d9e6 28px);
        background-attachment:local;
        break-after:page
      }
      .page::before{
        content:'';position:absolute;top:0;left:42px;
        width:2px;height:100%;background:#f0c0c0;opacity:.6
      }
      .page::after{
        content:'';position:absolute;top:0;left:44px;
        width:1px;height:100%;background:#f0c0c0;opacity:.4
      }
      .fixed-header{
        position:fixed;top:0;left:0;right:0;height:44px;z-index:100;
        background:#1a1aff;color:#fff;
        font-family:'Caveat',cursive;font-size:16px;
        padding:8px 50px 8px 55px;
        display:flex;align-items:center;justify-content:space-between;
        box-shadow:0 2px 6px rgba(0,0,0,.15)
      }
      .fixed-header a{color:#ffd700;text-decoration:none}
      .page-content{padding-top:10px}
      h1{
        font-size:30px;font-weight:700;color:#1a1aff;
        margin:16px 0 8px 0;
        border-bottom:2px solid #1a1aff;padding-bottom:2px
      }
      h2{font-size:24px;font-weight:600;color:#1a1aff;margin:14px 0 6px 0}
      h3{font-size:20px;font-weight:600;color:#1a1aff;margin:10px 0 4px 0}
      p{margin:4px 0}
      .hl{color:#cc0000;font-weight:600}
      .ul{text-decoration:underline;text-decoration-color:#1a1aff;text-underline-offset:3px}
      ul,ol{margin:4px 0 4px 28px}
      li{margin:2px 0}
      ul>li{list-style-type:'→ '}
      ul>li>ul>li{list-style-type:'◦ '}
      table{
        width:100%;border-collapse:collapse;margin:8px 0;
        font-family:'Caveat',cursive;font-size:16px
      }
      th{
        border-bottom:2px solid #1a1aff;padding:4px 8px;
        text-align:left;font-weight:700;color:#1a1aff
      }
      td{border-bottom:1px solid #bbb;padding:3px 8px}
      tr:last-child td{border-bottom:1px solid #999}
      code{
        font-family:'Caveat',cursive;background:#e8e4f0;
        padding:1px 6px;border-radius:3px;font-size:17px
      }
      .diagram{text-align:center;margin:12px 0}
      .diagram svg,.diagram img{
        max-width:90%;border:1px solid #ddd;
        border-radius:4px;padding:8px;background:#fff
      }
      .diagram-caption{font-size:15px;color:#666;margin-top:2px;font-style:italic}
      blockquote{
        margin:8px 0 8px 24px;padding:4px 12px;
        border-left:3px solid #1a1aff;color:#444;font-size:17px
      }
      hr{border:none;border-top:1px dashed #bbb;margin:12px 0}
      .formula{text-align:center;margin:8px 0;font-size:20px;color:#1a1aff}
      .todo{list-style:none;margin-left:4px}
      .todo li::before{content:'☐ ';color:#1a1aff}
      .todo li.done::before{content:'☑ ';color:#1a1aff}
      pre{
        background:#f4f4f4;border:1px solid #ddd;
        padding:8px 10px;font-size:15px;line-height:1.4;
        overflow-x:auto;white-space:pre-wrap;margin:6px 0;
        font-family:'Caveat',cursive
      }
      strong{color:#1a1aff}
      em{color:#666}
    `;
  }
}

module.exports = { NotebookHtmlRenderer };
