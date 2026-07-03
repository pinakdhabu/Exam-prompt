/**
 * Config Loader — fetches /exam/config and exposes as global SPPU_CONFIG.
 * Also converts mm values to px using a hidden measurement element.
 */
(function () {
  'use strict';

  var measureEl = null;

  function mmToPx(mm) {
    if (!measureEl) {
      measureEl = document.getElementById('measure');
    }
    if (!measureEl) return mm * 3.7795;
    measureEl.style.width = mm + 'mm';
    return measureEl.getBoundingClientRect().width;
  }

  function pxToMm(px) {
    if (!measureEl) {
      measureEl = document.getElementById('measure');
    }
    if (!measureEl) return px / 3.7795;
    measureEl.style.width = '1px';
    var onePx = measureEl.getBoundingClientRect().width;
    return px / onePx;
  }

  window.SPPU = {
    config: null,
    mmToPx: mmToPx,
    pxToMm: pxToMm,
    ready: null,

    init: function () {
      return fetch('/exam/config')
        .then(function (res) { return res.json(); })
        .then(function (cfg) {
          SPPU.config = cfg;
          SPPU.derived = {
            lineGapPx: mmToPx(cfg.lines.gap),
            writingTopPx: mmToPx(cfg.writing.top),
            writingLeftPx: mmToPx(cfg.writing.left),
            writingWidthPx: mmToPx(cfg.writing.width),
            writingHeightPx: mmToPx(cfg.writing.height),
            headerHeightPx: mmToPx(cfg.writing.headerHeight),
            pageTopPx: mmToPx(cfg.page.top),
            pageBottomPx: mmToPx(cfg.page.bottom),
            pageLeftPx: mmToPx(cfg.page.left),
            pageRightPx: mmToPx(cfg.page.right),
            linesPerPage: cfg.lines.count,
            contentPaddingTopPx: mmToPx(cfg.writing.top - cfg.page.top + cfg.writing.headerHeight),
            contentMinHeightPx: mmToPx(cfg.writing.height - cfg.writing.headerHeight),
          };
          return cfg;
        });
    }
  };
})();
