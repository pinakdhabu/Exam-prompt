/**
 * Page Manager — creates and manages multiple A4 pages.
 * Each page is a <div class="page"> with ruled background and its own header.
 */
(function () {
  'use strict';

  var pages = [];
  var container = null;

  function init() {
    container = document.getElementById('editor').parentElement;
    pages = [];
    var existingPages = container.querySelectorAll('.page');
    if (existingPages.length === 0) {
      addPage();
    } else {
      for (var i = 0; i < existingPages.length; i++) {
        pages.push(existingPages[i]);
      }
    }
  }

  function addPage(pageNum) {
    var cfg = SPPU.config;
    var page = document.createElement('div');
    page.className = 'page';
    page.setAttribute('data-page', pages.length + 1);

    page.innerHTML =
      '<div class="page-ruled"></div>' +
      '<div class="page-margin-line"></div>' +
      '<div class="page-header">' +
        '<div class="qno-area">' +
          '<div class="qno-label">Q.No.</div>' +
          '<div class="qno-box" contenteditable="true">1</div>' +
        '</div>' +
        '<div class="marks-area">' +
          '<table class="marks-tbl"><tr>' +
          '<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>' +
          '</tr><tr>' +
          '<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>' +
          '</tr></table>' +
        '</div>' +
        '<div class="std-info">' +
          '<span>Name: <span class="info-ul" contenteditable="true">______________________</span></span>' +
          '<span style="margin-left:8mm">Roll No: <span class="info-ul" contenteditable="true">______________________</span></span>' +
        '</div>' +
      '</div>' +
      '<div class="page-content" contenteditable="true" spellcheck="false"></div>';

    container.appendChild(page);
    pages.push(page);
    return page;
  }

  function getPages() {
    return pages;
  }

  function getPageContent(pageIndex) {
    if (pageIndex < 0 || pageIndex >= pages.length) return '';
    var content = pages[pageIndex].querySelector('.page-content');
    return content ? content.innerHTML : '';
  }

  function setPageContent(pageIndex, html) {
    if (pageIndex < 0 || pageIndex >= pages.length) return;
    var content = pages[pageIndex].querySelector('.page-content');
    if (content) content.innerHTML = html;
  }

  function pageCount() {
    return pages.length;
  }

  window.SPPU = window.SPPU || {};
  window.SPPU.pageManager = {
    init: init,
    addPage: addPage,
    getPages: getPages,
    getPageContent: getPageContent,
    setPageContent: setPageContent,
    pageCount: pageCount,
  };
})();
