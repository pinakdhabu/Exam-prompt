/**
 * Layout Engine — line-based measurement and page-break splitting.
 * Uses hidden #measure element for accurate height calculation.
 * Binary search finds optimal split point when content exceeds 34 lines.
 */
(function () {
  'use strict';

  var measureEl = null;

  function getMeasureEl() {
    if (!measureEl) {
      measureEl = document.getElementById('measure');
    }
    return measureEl;
  }

  /**
   * Measure how many lines a DOM fragment occupies.
   */
  function measureLines(fragment) {
    var el = getMeasureEl();
    if (!el) return 0;
    el.innerHTML = '';
    el.appendChild(fragment.cloneNode(true));
    var height = el.getBoundingClientRect().height;
    var lineGap = SPPU.derived.lineGapPx;
    return Math.ceil(height / lineGap);
  }

  /**
   * Measure height in px of a DOM node's innerHTML.
   */
  function measureHeight(html) {
    var el = getMeasureEl();
    if (!el) return 0;
    el.innerHTML = html;
    return el.getBoundingClientRect().height;
  }

  /**
   * Split content into page-sized chunks.
   * Each page gets at most linesPerPage lines.
   * Splits at block boundaries (p, h1, h2, h3, ul, ol, table, pre, blockquote, hr).
   */
  function splitIntoPages(contentHtml) {
    var linesPerPage = SPPU.derived.linesPerPage;
    var wrapper = document.createElement('div');
    wrapper.innerHTML = contentHtml;

    var blocks = Array.from(wrapper.children);
    var pages = [];
    var currentPage = [];
    var currentLines = 0;

    for (var i = 0; i < blocks.length; i++) {
      var block = blocks[i];
      var frag = document.createDocumentFragment();
      frag.appendChild(block.cloneNode(true));
      var blockLines = measureLines(frag);

      if (currentLines + blockLines > linesPerPage && currentPage.length > 0) {
        pages.push(currentPage.map(function (b) { return b.outerHTML; }).join(''));
        currentPage = [];
        currentLines = 0;
      }

      currentPage.push(block);
      currentLines += blockLines;
    }

    if (currentPage.length > 0) {
      pages.push(currentPage.map(function (b) { return b.outerHTML; }).join(''));
    }

    return pages.length > 0 ? pages : [''];
  }

  /**
   * Binary search for the optimal split point within a block
   * that exceeds the remaining lines on the current page.
   */
  function binarySplitBlock(blockHtml, remainingLines) {
    var el = getMeasureEl();
    el.innerHTML = blockHtml;
    var children = Array.from(el.childNodes);

    if (children.length <= 1) {
      return { first: blockHtml, rest: '' };
    }

    var lo = 0;
    var hi = children.length;
    var best = 0;

    while (lo <= hi) {
      var mid = Math.floor((lo + hi) / 2);
      var frag = document.createDocumentFragment();
      for (var j = 0; j < mid; j++) {
        frag.appendChild(children[j].cloneNode(true));
      }
      var lines = measureLines(frag);
      if (lines <= remainingLines) {
        best = mid;
        lo = mid + 1;
      } else {
        hi = mid - 1;
      }
    }

    var firstParts = children.slice(0, best).map(function (c) { return c.outerHTML || c.textContent; }).join('');
    var restParts = children.slice(best).map(function (c) { return c.outerHTML || c.textContent; }).join('');

    return { first: firstParts, rest: restParts };
  }

  window.SPPU = window.SPPU || {};
  window.SPPU.layout = {
    measureLines: measureLines,
    measureHeight: measureHeight,
    splitIntoPages: splitIntoPages,
    binarySplitBlock: binarySplitBlock,
  };
})();
