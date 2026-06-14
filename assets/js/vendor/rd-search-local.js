/**
 * 🌑 RavenUI - Zero-Dependency Local Client Search Engine
 * Highly optimized client-side full-text search with relevance ranking,
 * text excerpt extraction, and keyword highlighting.
 */

class RDSearchLocal {
  constructor(documents) {
    this.documents = documents || [];
  }

  /**
   * Performs a search query across document titles, descriptions, and content.
   * @param {string} query The search query string.
   * @returns {Array} List of matched documents with scoring and highlights.
   */
  search(query) {
    if (!query) return [];
    
    // Normalize and tokenize search query
    const terms = query.toLowerCase()
      .trim()
      .split(/\s+/)
      .filter(Boolean);
      
    if (terms.length === 0) return [];

    const results = [];

    for (const doc of this.documents) {
      let score = 0;
      const titleLower = (doc.title || '').toLowerCase();
      const descLower = (doc.description || '').toLowerCase();
      const contentLower = (doc.content || '').toLowerCase();

      let matchedAll = true;

      for (const term of terms) {
        let termScore = 0;

        if (titleLower.includes(term)) {
          // Exact title match gets highest priority
          termScore += 10;
          if (titleLower.startsWith(term)) termScore += 5; // Bonus for starting with term
        }
        if (descLower.includes(term)) {
          termScore += 5;
        }
        if (contentLower.includes(term)) {
          termScore += 1;
        }

        // If any term of the multi-word query is not found, exclude document (AND search)
        if (termScore === 0) {
          matchedAll = false;
          break;
        }

        score += termScore;
      }

      if (matchedAll && score > 0) {
        // Generate snippet and highlights
        const rawContent = doc.content || doc.description || '';
        const excerpt = this.generateExcerpt(rawContent, terms);
        const highlightedTitle = this.highlightText(doc.title || '', terms);

        results.push({
          title: highlightedTitle,
          url: doc.url,
          excerpt: excerpt,
          score: score
        });
      }
    }

    // Sort results by relevance score descending
    return results.sort((a, b) => b.score - a.score);
  }

  /**
   * Generates a context snippet around the first matched search term.
   */
  generateExcerpt(text, terms, maxLength = 160) {
    if (!text) return '';
    const textLower = text.toLowerCase();
    
    let firstIndex = 0;
    for (const term of terms) {
      const idx = textLower.indexOf(term);
      if (idx !== -1) {
        firstIndex = idx;
        break;
      }
    }

    // Centered window around first match
    let start = Math.max(0, firstIndex - 40);
    let end = Math.min(text.length, start + maxLength);

    // Align start/end to word boundaries
    if (start > 0) {
      const spaceIdx = text.indexOf(' ', start);
      if (spaceIdx !== -1 && spaceIdx < firstIndex) {
        start = spaceIdx + 1;
      }
    }

    let snippet = text.substring(start, end);
    if (start > 0) snippet = '...' + snippet;
    if (end < text.length) snippet = snippet + '...';

    return this.highlightText(snippet, terms);
  }

  /**
   * Wraps matching terms in highlight tags.
   */
  highlightText(text, terms) {
    if (!text) return '';
    let highlighted = text;
    
    // Sort terms by length descending to prevent shorter terms from overriding longer nested ones
    const sortedTerms = [...terms].sort((a, b) => b.length - a.length);

    for (const term of sortedTerms) {
      const escapedTerm = term.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
      const regex = new RegExp(`(${escapedTerm})`, 'gi');
      // Wrap with a mark tag that matches the pagefind style
      highlighted = highlighted.replace(regex, '<mark class="rd-search-highlight">$1</mark>');
    }
    
    return highlighted;
  }
}

window.RDSearchLocal = RDSearchLocal;
