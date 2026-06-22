/**
 * rd-code-utils.mjs — RavenUI Code Block Utilities
 * Version: 1.0.0
 *
 * Provides two utilities for fenced code blocks rendered by Jekyll/Rouge:
 *   1. Copy-to-clipboard button (COPY / COPIED feedback).
 *   2. Language label badge injected as a data-lang attribute (styled via CSS).
 *
 * Config (read from <body> data attributes, set by Liquid at build time):
 *   data-code-copy="true|false"   — enable copy buttons
 *   data-code-lang="true|false"   — enable language labels
 *   data-code-lang-style="badge"  — CSS styling variant (currently unused in JS)
 */

export function setupCodeBlocks() {
  const body       = document.body;
  const codeCopy   = body.dataset.codeCopy   === 'true';
  const codeLang   = body.dataset.codeLang   === 'true';

  document.querySelectorAll('div.highlight').forEach(block => {
    // Guard: skip if already decorated
    if (block.querySelector('.rd-copy-btn')) return;

    // ── Copy Button ────────────────────────────────────────────────────────
    if (codeCopy) {
      const btn       = document.createElement('button');
      btn.className   = 'rd-copy-btn';
      btn.textContent = 'COPY';

      btn.addEventListener('click', () => {
        const codeEl = block.querySelector('code');
        const code   = codeEl ? codeEl.innerText : block.innerText;
        navigator.clipboard.writeText(code).then(() => {
          btn.textContent = 'COPIED';
          btn.classList.add('copied');
          setTimeout(() => {
            btn.textContent = 'COPY';
            btn.classList.remove('copied');
          }, 2000);
        });
      });

      block.appendChild(btn);
    }

    // ── Language Label ─────────────────────────────────────────────────────
    if (codeLang) {
      // Prefer existing data-lang attribute; then walk up to .highlighter-rouge
      if (!block.getAttribute('data-lang') || block.getAttribute('data-lang') === 'code') {
        const parent    = block.closest('.highlighter-rouge');
        const langClass = parent
          ? Array.from(parent.classList).find(c => c.startsWith('language-'))
          : null;

        if (langClass) {
          block.setAttribute('data-lang', langClass.replace('language-', ''));
        } else {
          const pre         = block.querySelector('pre');
          const preLangCls  = pre
            ? Array.from(pre.classList).find(c => c.startsWith('language-'))
            : null;
          block.setAttribute('data-lang', preLangCls
            ? preLangCls.replace('language-', '')
            : 'text');
        }
      }
    }
  });
}
