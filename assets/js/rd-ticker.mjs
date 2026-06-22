/**
 * rd-ticker.mjs — RavenUI Numeric Ticker / Count-Up Animation
 * Version: 1.0.0
 *
 * Observes elements with [data-ticker-value], .rd-metric-value, or .rd-counter
 * and animates them from 0 to their value using a cubic ease-out curve when
 * they scroll into view.
 */

export function setupNumericTickers() {
  if (!('IntersectionObserver' in window)) return;

  const observer = new IntersectionObserver((entries, obs) => {
    entries.forEach(entry => {
      if (!entry.isIntersecting) return;
      const el = entry.target;
      obs.unobserve(el);

      const text = (el.getAttribute('data-ticker-value') || el.innerText).trim();
      // Match: optional prefix, numeric core (digits/dots/commas/minus), optional suffix
      const match = text.match(/^([^0-9.-]*)([0-9.,-]+)(.*)$/);
      if (!match) return;

      const prefix  = match[1] || '';
      const rawNum  = match[2].replace(/,/g, '');
      const suffix  = match[3] || '';
      const num     = parseFloat(rawNum);
      if (isNaN(num)) return;

      const DURATION  = 1200; // ms
      const startTime = performance.now();

      function update(currentTime) {
        const elapsed  = currentTime - startTime;
        const progress = Math.min(elapsed / DURATION, 1);
        // Cubic ease-out: 1 - (1 - x)³
        const ease     = 1 - Math.pow(1 - progress, 3);
        const current  = ease * num;

        let formatted;
        if (rawNum.includes('.')) {
          const decimals = rawNum.split('.')[1].length;
          formatted = current.toFixed(decimals);
        } else {
          formatted = Math.floor(current).toString();
        }

        if (match[2].includes(',')) {
          const parts = formatted.split('.');
          parts[0]    = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ',');
          formatted   = parts.join('.');
        }

        el.innerText = prefix + formatted + suffix;

        if (progress < 1) {
          requestAnimationFrame(update);
        } else {
          el.innerText = text;
          el.classList.add('rd-ticker-complete');
        }
      }
      requestAnimationFrame(update);
    });
  }, { threshold: 0.1 });

  document.querySelectorAll('[data-ticker-value], .rd-metric-value, .rd-counter')
    .forEach(el => observer.observe(el));
}
