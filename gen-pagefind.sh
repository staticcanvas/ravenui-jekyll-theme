#!/bin/bash
# 🌑 RAVENUI: Search Index Generation
echo "🟦 Building site for indexing..."
bundle exec jekyll build --trace
echo "🟩 Generating Pagefind index..."
npx pagefind --site _site
