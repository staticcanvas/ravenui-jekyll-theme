---
layout: default
title: Search Integration
output-title: true
tags: [search, pagefind, lyra, algolia]
description: Blazing fast search integrations supporting Pagefind WASM, Lyra/Orama client-side search, and Algolia hosted search.
enable_search: true
---
Zero-Dark provides native integration for three distinct search paths, allowing you to choose the perfect search solution for your documentation footprint.

🟦 **Search Providers At A Glance**
- **Pagefind WASM (Default):** Indexes your static build locally and queries it using a client-side WebAssembly engine.
- **Lyra/Orama Client JS:** A zero-dependency, client-side full-text search engine querying a compiled JSON index.
- **Algolia Hosted Search:** A hosted search service suited for large-scale enterprise documentation.

---

## **Configuration**

To select and configure your search provider, update the `theme_settings.search` block in your `_config.yml`:

```yaml
theme_settings:
  search:
    provider: pagefind            # options: pagefind, lyra, algolia
    use_cdn: true                 # load search library assets via CDN vs local files
    algolia:
      app_id: "your_app_id"
      api_key: "your_search_only_api_key"
      index_name: "your_index_name"
```

---

## **Pagefind WASM Search**

Pagefind is a high-performance search library that runs entirely in the browser.

### **How it Works**
Pagefind works by pre-indexing your static files after the Jekyll build. It generates a small WASM search index that is downloaded by the client only when they start searching.

- **Zero Server Overhead:** No database or backend required.
- **Instant Results:** Search millions of words in milliseconds.
- **Low Bandwidth:** The index is split into small chunks, only downloading what is needed.

### **Indexing Workflow**
To generate or update the Pagefind search database, you must run the indexer on your compiled site directory:

#### **1. Build your site**
```bash
bundle exec jekyll build
```

#### **2. Run the indexer**
```bash
npx pagefind --site _site
```

#### **3. Automated Script**
We include a `gen-pagefind.sh` script in the root directory to simplify this process:
```bash
./gen-pagefind.sh
```

---

## **Lyra/Orama Client-Side Search**

For environments where WebAssembly is not available or you want a lightweight client-side search, the Lyra/Orama integration is the ideal choice.

### **How it Works**
1. Jekyll compiles all pages and posts into a `/search-index.json` endpoint during build.
2. The search client fetches this JSON index and performs multi-word keyword matching and relevance scoring.
3. Matching terms are highlighted in the results panel automatically.

### **Asset Delivery**
- **CDN Mode (`use_cdn: true`):** Dynamically imports `@orama/orama` from the jsDelivr CDN.
- **Local Mode (`use_cdn: false`):** Runs the lightweight `zd-search-local.js` client offline with zero external network requests.

---

## **Algolia Hosted Search**

Algolia provides robust, scalable hosted search capabilities with advanced relevance tuning.

### **Setup Requirements**
To use Algolia, you must configure your API keys under the `theme_settings.search.algolia` block:

1. **`app_id`**: Your Algolia application identifier.
2. **`api_key`**: Your search-only API key (do not expose your Admin/Write API key).
3. **`index_name`**: The target search index name.

### **Indexing Data**
You can use a Jekyll plugin (such as `jekyll-algolia`) or a script to push your post/page index JSON to Algolia's servers during your deployment pipeline.

---

## **Asset Delivery Modes**

Zero-Dark allows you to control how search library assets (JS and CSS) are fetched.

### **CDN Mode (`use_cdn: true`)**
Loads the latest vendor libraries from high-speed global CDNs. This is recommended for production environments to minimize your host's bandwidth.

### **Local Mode (`use_cdn: false`)**
Loads assets locally from your own domain. This is essential for:
- Self-hosted offline sites
- Intranets behind strict firewalls
- Compliance with corporate data governance policies

---

## **Page-Level Search Configuration**

By default, search indexing in Zero-Dark is **opt-in** to prevent utility pages, templates, layouts, and index files from polluting search results.

To make a page, post, or document searchable, you must explicitly set `enable_search: true` in its YAML front matter:

```yaml
---
layout: default
title: My Documentation Page
enable_search: true
---
```

This property is automatically evaluated:
- **Local/Lyra/Algolia Search**: Only documents with `enable_search: true` are compiled into `/search-index.json`.
- **Pagefind WASM Search**: Layouts will automatically append the `data-pagefind-ignore` attribute to the `<body>` tag of any document where `enable_search` is not `true`, preventing Pagefind from indexing the page content.

