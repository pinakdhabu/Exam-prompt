/**
 * Editor — contenteditable controller.
 * Listens for input, triggers reflow when content exceeds page capacity.
 */
(function () {
  'use strict';

  var editor = null;
  var debounceTimer = null;

  function init() {
    editor = document.getElementById('editor');
    if (!editor) return;

    editor.addEventListener('input', onInput);
    editor.addEventListener('keydown', onKeydown);

    document.getElementById('add-page').addEventListener('click', function () {
      SPPU.pageManager.addPage();
    });

    document.getElementById('toggle-print').addEventListener('click', function () {
      window.print();
    });
  }

  function onInput() {
    clearTimeout(debounceTimer);
    debounceTimer = setTimeout(reflow, 150);
  }

  function onKeydown(e) {
    if (e.key === 'Tab') {
      e.preventDefault();
      document.execCommand('insertText', false, '    ');
    }
  }

  function reflow() {
    if (!editor) return;
    var html = editor.innerHTML;
    var pages = SPPU.layout.splitIntoPages(html);

    var pm = SPPU.pageManager;
    var existingPages = pm.getPages();

    for (var i = 0; i < pages.length; i++) {
      if (i >= existingPages.length) {
        pm.addPage();
      }
      pm.setPageContent(i, pages[i]);
    }

    for (var j = existingPages.length - 1; j >= pages.length; j--) {
      existingPages[j].remove();
    }
  }

  window.SPPU = window.SPPU || {};
  window.SPPU.editor = {
    init: init,
    reflow: reflow,
    getContent: function () {
      return editor ? editor.innerHTML : '';
    },
  };
})();
