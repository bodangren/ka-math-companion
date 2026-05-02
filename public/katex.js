// KaTeX Integration Module
// Handles math rendering via Elm ports

(function() {
  'use strict';

  // KaTeX will be loaded from CDN
  var katex = window.katex;

  // Initialize KaTeX if not already loaded
  function ensureKatex(callback) {
    if (katex) {
      callback();
      return;
    }

    // Load KaTeX from CDN
    var link = document.createElement('link');
    link.rel = 'stylesheet';
    link.href = 'https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.css';
    document.head.appendChild(link);

    var script = document.createElement('script');
    script.src = 'https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.js';
    script.onload = function() {
      katex = window.katex;
      callback();
    };
    script.onerror = function() {
      console.error('Failed to load KaTeX');
      callback();
    };
    document.head.appendChild(script);
  }

  // Render inline math: $...$
  function renderInlineMath(latex, element) {
    try {
      katex.render(latex, element, {
        throwOnError: false,
        displayMode: false
      });
    } catch (e) {
      element.textContent = latex;
    }
  }

  // Render display math: $$...$$
  function renderDisplayMath(latex, element) {
    try {
      katex.render(latex, element, {
        throwOnError: false,
        displayMode: true
      });
    } catch (e) {
      element.textContent = latex;
    }
  }

  // Process text content for math expressions
  function processMathInElement(element) {
    if (!element) return;

    var walker = document.createTreeWalker(
      element,
      NodeFilter.SHOW_TEXT,
      null,
      false
    );

    var textNodes = [];
    var node;
    while (node = walker.nextNode()) {
      textNodes.push(node);
    }

    textNodes.forEach(function(textNode) {
      var text = textNode.textContent;
      var parent = textNode.parentNode;

      // Skip already processed nodes
      if (parent.classList.contains('katex-wrapper')) return;

      // Check for display math first: $$...$$
      var displayMatch = text.match(/\$\$([\s\S]+?)\$\$/g);
      if (displayMatch) {
        displayMatch.forEach(function(expr) {
          var latex = expr.slice(2, -2);
          var wrapper = document.createElement('span');
          wrapper.className = 'katex-wrapper katex-display';
          renderDisplayMath(latex, wrapper);
          parent.insertBefore(wrapper, textNode);
        });
        parent.removeChild(textNode);
        return;
      }

      // Check for inline math: $...$
      var inlineMatch = text.match(/\$([^\$]+)\$/g);
      if (inlineMatch) {
        inlineMatch.forEach(function(expr) {
          var latex = expr.slice(1, -1);
          var wrapper = document.createElement('span');
          wrapper.className = 'katex-wrapper katex-inline';
          renderInlineMath(latex, wrapper);
          parent.insertBefore(wrapper, textNode);
        });
        parent.removeChild(textNode);
        return;
      }
    });
  }

  // Elm port: receive math rendering commands
  window.katexApp = window.katexApp || {};

  window.katexApp.renderMath = function(id, latex, displayMode) {
    var element = document.getElementById(id);
    if (!element) {
      console.warn('KaTeX: Element not found:', id);
      return;
    }

    ensureKatex(function() {
      if (displayMode) {
        renderDisplayMath(latex, element);
      } else {
        renderInlineMath(latex, element);
      }
    });
  };

  window.katexApp.processElement = function(id) {
    var element = document.getElementById(id);
    ensureKatex(function() {
      processMathInElement(element);
    });
  };

  // Auto-process on page load if element has data-katex attribute
  document.addEventListener('DOMContentLoaded', function() {
    var elements = document.querySelectorAll('[data-katex]');
    ensureKatex(function() {
      elements.forEach(function(el) {
        processMathInElement(el);
      });
    });
  });
})();