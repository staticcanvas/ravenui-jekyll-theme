/**
 * rd-heading-anchors.mjs — RavenUI Heading Anchor Link Injector
 * Version: 1.0.0
 *
 * Injects a '#' anchor link after the text of each heading that has an id.
 * Headings inside .rd-hero (the page title block) are excluded.
 *
 * Config (read from <body> data attributes, set by Liquid at build time):
 *   data-headings-always-visible="true|false"
 *     When true, anchors are always visible rather than hover-only.
 */

export function setupHeadingAnchors(contentArea) {
  if (!contentArea) return;

  const alwaysVisible = document.body.dataset.headingsAlwaysVisible === 'true';
  const headings = contentArea.querySelectorAll('h1, h2, h3, h4, h5, h6');

  headings.forEach(heading => {
    if (!heading.id) return;
    if (heading.tagName === 'H1' && heading.closest('.rd-hero')) return;
    if (heading.querySelector('.rd-heading-anchor')) return;

    const anchor       = document.createElement('a');
    anchor.className   = 'rd-heading-anchor';
    if (alwaysVisible) anchor.classList.add('always-visible');
    anchor.href        = `#${heading.id}`;
    anchor.ariaLabel   = 'Link to this section';
    anchor.textContent = '#';
    heading.appendChild(anchor);
  });
}
