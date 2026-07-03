class NotebookHtmlRenderer {
  constructor({ title, headerLink } = {}) {
    this.title = title || 'Answer Sheet';
    this.headerLink = headerLink || '';
  }

  render(markdownHtml) {
    return '<!DOCTYPE html><html lang="en"><head><meta charset="utf-8">'
      + '<title>' + this.title + '</title>'
      + '<link href="https://fonts.googleapis.com/css2?family=Kalam:wght@300;400;700&family=Patrick+Hand&family=Handlee&display=swap" rel="stylesheet">'
      + '<style>' + this._buildCSS() + '</style></head>'
      + '<body>'
      + '<div class="ruled-bg"></div>'
      + '<div class="margin-line"></div>'
      + this._buildHeader()
      + '<div class="content">'
      + markdownHtml
      + '</div>'
      + '</body></html>';
  }

  _buildHeader() {
    return '<div class="qno-area">'
      + '<div class="qno-label">Q.No.</div>'
      + '<div class="qno-box">1</div>'
      + '</div>'
      + '<div class="marks-area">'
      + '<table class="marks-tbl"><tr>'
      + '<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>'
      + '</tr><tr>'
      + '<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>'
      + '</tr></table>'
      + '</div>'
      + '<div class="std-info">'
      + '<span>Name: <span class="info-ul">______________________</span></span>'
      + '<span style="margin-left:8mm">Roll No: <span class="info-ul">______________________</span></span>'
      + '</div>';
  }

  _buildCSS() {
    return `
      :root{
        --paper:#fcfdff;
        --ink:#1f4fb5;
        --ruled:#707070;
        --margin:#606060;
        --blue:#67bfe5;
        --line-gap:7.5mm;
        --line-h:28.3px;
        --line-w:0.45px;
        --margin-w:0.5px;
        --font-size:18px;
        --header-h:20mm;
        --writing-top:28mm;
        --writing-left:12mm;
        --writing-w:188mm;
        --writing-h:257mm;
        --margin-line-x:22mm;
        --page-top:12mm;
        --page-bot:12mm;
        --page-left:10mm;
        --page-right:10mm;
        --qbox-w:11mm;
        --qbox-h:7mm;
        --qno-y:22mm;
        --qno-x:2mm;
        --marks-y:4mm;
        --marks-w:72mm
      }
      @page{size:A4;margin:0}
      *{margin:0;padding:0;box-sizing:border-box}
      html,body{margin:0;padding:0}
      body{
        position:relative;
        font-family:'Kalam','Patrick Hand','Handlee',sans-serif;
        font-size:var(--font-size);line-height:var(--line-h);
        word-spacing:0.25px;
        text-rendering:geometricPrecision;
        -webkit-font-smoothing:antialiased;
        color:var(--ink);background:var(--paper);
        padding:var(--page-top) var(--page-right) var(--page-bot) var(--page-left)
      }
      .ruled-bg{
        position:fixed;top:0;left:0;right:0;bottom:0;z-index:0;
        background:repeating-linear-gradient(
          transparent 0,
          transparent calc(var(--line-gap) - var(--line-w)),
          var(--ruled) calc(var(--line-gap) - var(--line-w)),
          var(--ruled) var(--line-gap)
        );
        background-position:0 calc(var(--writing-top) + 1mm - var(--line-gap));
        background-repeat:repeat;
        pointer-events:none
      }
      .margin-line{
        position:fixed;top:0;left:var(--margin-line-x);
        width:var(--margin-w);height:100%;z-index:0;
        background:var(--margin);
        opacity:0.7;
        pointer-events:none
      }
      .qno-area{
        position:absolute;z-index:1;
        left:calc(var(--writing-left) + var(--qno-x));
        top:var(--qno-y)
      }
      .qno-label{
        font-size:9pt;color:#555;line-height:5mm
      }
      .qno-box{
        width:var(--qbox-w);height:var(--qbox-h);
        border:0.5px solid #555;
        display:flex;align-items:center;justify-content:center;
        font-size:10pt;color:var(--ink);font-weight:700
      }
      .marks-area{
        position:absolute;z-index:1;
        top:var(--marks-y);right:var(--page-right);
        width:var(--marks-w)
      }
      .marks-tbl{
        width:100%;border-collapse:collapse
      }
      .marks-tbl td{
        border:0.5px solid #555;padding:0;
        height:5.5mm
      }
      .std-info{
        position:absolute;z-index:1;
        top:var(--qno-y);left:calc(var(--writing-left) + var(--qno-x) + var(--qbox-w) + 4mm);
        font-size:10pt;color:var(--ink);font-weight:600;
        line-height:6mm
      }
      .info-ul{
        font-family:'Courier New',monospace;letter-spacing:1px;
        color:#bbb;font-size:9pt;font-weight:400
      }
      .content{
        position:relative;z-index:1;
        padding:calc(var(--writing-top) - var(--page-top) + var(--header-h)) 0 0 calc(var(--writing-left) - var(--page-left));
        min-height:calc(var(--writing-h) - var(--header-h))
      }
      h1{
        font-size:20pt;font-weight:700;color:var(--ink);
        margin:15mm 0 0 0;line-height:calc(var(--line-h) * 2);
        border-bottom:1.5px solid var(--blue);
        text-align:center
      }
      h2{
        font-size:15pt;font-weight:600;color:var(--ink);
        margin:7.5mm 0 0 0;line-height:var(--line-h)
      }
      h3{
        font-size:13pt;font-weight:600;color:var(--ink);
        margin:3.75mm 0 0 0;line-height:var(--line-h)
      }
      p{margin:0}
      ul,ol{margin:0 0 0 7.5mm}
      li{margin:0}
      ul>li{list-style-type:'\\2022 '}
      table.content-tbl{
        width:100%;border-collapse:collapse;margin:7.5mm 0
      }
      table.content-tbl th{
        border:0.5px solid var(--blue);padding:0.3mm 2mm;
        background:#eef8ff;color:var(--ink);font-weight:700;text-align:left;font-size:90%
      }
      table.content-tbl td{
        border:0.5px solid #d0d0d0;padding:0.3mm 2mm;font-size:95%
      }
      code{
        font-family:'Kalam','Patrick Hand',sans-serif;
        background:#eef8ff;padding:0 3px;border-radius:2px;font-size:95%
      }
      .diagram{text-align:center;margin:7.5mm 0}
      .diagram svg,.diagram img{
        max-width:85%;border:0.5px solid #d0d0d0;
        border-radius:2px;padding:4px;background:#fff
      }
      .diagram-caption{font-size:10pt;color:#888;font-style:italic}
      blockquote{
        margin:0 0 0 7.5mm;padding:0 3mm;
        border-left:2px solid #bbb;color:#888
      }
      hr{border:none;border-top:0.5px dashed #bbb;margin:7.5mm 0}
      pre{
        background:#f4f8fe;border:0.5px solid #d0d0d0;
        padding:1.5mm 2.5mm;font-size:90%;line-height:var(--line-h);
        overflow-x:auto;white-space:pre-wrap;margin:7.5mm 0;
        font-family:'Kalam','Patrick Hand',sans-serif
      }
      strong{color:var(--ink)}
      em{color:#888;font-style:italic}
      @media print{
        body{background:var(--paper)}
        .ruled-bg,.margin-line{position:fixed}
      }
    `;
  }
}

module.exports = { NotebookHtmlRenderer };
