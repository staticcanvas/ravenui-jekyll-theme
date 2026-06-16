require 'cgi'
require 'fileutils'

module Jekyll
  class OgImageGenerator < Generator
    safe true
    priority :lowest

    def generate(site)
      # Skip in safe mode or if disabled in config
      return if site.safe
      return if site.config['theme_settings'] && site.config['theme_settings']['og_image'] && site.config['theme_settings']['og_image']['enabled'] == false

      # Create directory for OG images inside site source (destined for compilation)
      og_dir = File.join(site.source, 'assets/img/og')
      FileUtils.mkdir_p(og_dir) unless File.directory?(og_dir)

      # Generate for standard pages
      site.pages.each do |page|
        next unless page.output_ext == '.html'
        next if page.data['image'] || page.data['og_image']
        
        generate_svg(og_dir, page)
      end

      # Generate for posts
      site.posts.docs.each do |post|
        next if post.data['image'] || post.data['og_image']
        generate_svg(og_dir, post)
      end
    end

    private

    def generate_svg(og_dir, item)
      title = item.data['title'] || item.basename_without_ext.to_s.capitalize
      
      # Extract category/tag details
      category = (item.data['categories'] || item.data['tags'] || []).first || 'Documentation'
      date = item.respond_to?(:date) ? item.date.strftime('%B %d, %Y') : nil

      # Limit title length to prevent overflow in SVG
      display_title = title.length > 50 ? "#{title[0...47]}..." : title
      
      # CGI escape for safe SVG XML output
      display_title = CGI.escapeHTML(display_title)
      category = CGI.escapeHTML(category.to_s.upcase)
      date_text = date ? CGI.escapeHTML(date) : "RAVENUI SYSTEM"

      svg_content = <<~SVG
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 630" width="1200" height="630">
          <defs>
            <style>
              .category { font-family: system-ui, -apple-system, sans-serif; font-weight: 600; fill: #00ff9d; letter-spacing: 4px; }
              .title { font-family: Georgia, serif; font-weight: 700; fill: #ffffff; }
              .footer-text { font-family: system-ui, -apple-system, sans-serif; fill: #66667f; }
              .brand { font-family: system-ui, -apple-system, sans-serif; font-weight: 600; fill: #ffffff; letter-spacing: 2px; }
            </style>
          </defs>
          
          <!-- Background -->
          <rect width="100%" height="100%" fill="#0a0a0f"/>
          
          <!-- Geometric Grid Patterns -->
          <g opacity="0.04">
            <line x1="0" y1="0" x2="1200" y2="630" stroke="#00ff9d" stroke-width="4"/>
            <line x1="0" y1="630" x2="1200" y2="0" stroke="#00ff9d" stroke-width="4"/>
            <circle cx="600" cy="315" r="400" fill="none" stroke="#00ff9d" stroke-width="2"/>
            <circle cx="600" cy="315" r="200" fill="none" stroke="#00ff9d" stroke-width="2"/>
          </g>

          <!-- Elegant Borders -->
          <rect x="20" y="20" width="1160" height="590" rx="12" fill="none" stroke="#1f1f2e" stroke-width="3"/>
          <rect x="25" y="25" width="1150" height="580" rx="10" fill="none" stroke="#00ff9d" stroke-width="1" stroke-opacity="0.2"/>

          <!-- Category Badge Area -->
          <text x="80" y="130" class="category" font-size="24">#{category}</text>

          <!-- Large Post/Page Title -->
          <text x="80" y="300" class="title" font-size="64">#{display_title}</text>

          <!-- Divider -->
          <line x1="80" y1="460" x2="1120" y2="460" stroke="#1f1f2e" stroke-width="2"/>
          
          <!-- Date/Tagline -->
          <text x="80" y="520" class="footer-text" font-size="20">#{date_text}</text>
          
          <!-- Theme Signature -->
          <text x="1120" y="520" class="brand" font-size="20" text-anchor="end">RAVENUI</text>
        </svg>
      SVG

      # Generate safe slug-like filename
      filename = item.url.gsub('/', '-').gsub('.html', '').gsub(/^-|-$/, '')
      filename = 'index' if filename.empty?
      
      filepath = File.join(og_dir, "#{filename}.svg")
      File.write(filepath, svg_content)
      
      # Assign both image and og_image to page data to hook into jekyll-seo-tag
      item.data['image'] = "/assets/img/og/#{filename}.svg"
      item.data['og_image'] = "/assets/img/og/#{filename}.svg"
    end
  end
end
