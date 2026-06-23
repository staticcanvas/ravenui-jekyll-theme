# frozen_string_literal: true

require 'jekyll'

module Jekyll
  class AssetPathTag < Liquid::Tag
    def initialize(tag_name, markup, parse_context)
      super
      @markup = markup.strip
    end

    def render(context)
      return "" if @markup.empty?

      # Resolve path from context or use as literal
      path = resolve_value(@markup, context)
      return "" if path.nil? || path.empty?

      # Ensure single leading slash
      path = "/#{path}" unless path.start_with?('/')

      # For assets, auto-inject /assets if not present
      if @tag_name == 'rd_asset' && !path.start_with?('/assets/')
        path = "/assets#{path}"
      end

      # Resolve against baseurl
      site = context.registers[:site]
      return path if site.nil?

      baseurl = site.config['baseurl'] || ''
      
      # Clean path resolution
      if baseurl.end_with?('/') && path.start_with?('/')
        "#{baseurl}#{path[1..-1]}"
      else
        "#{baseurl}#{path}"
      end
    end

    private

    def resolve_value(markup, context)
      # Check if quoted string literal
      if (markup.start_with?('"') && markup.end_with?('"')) ||
         (markup.start_with?("'") && markup.end_with?("'"))
        markup[1..-2]
      else
        # Attempt context lookup (e.g., page.url, site.theme_settings.logo.path)
        resolved = context[markup]
        resolved ? resolved.to_s : markup
      end
    end
  end
end

Liquid::Template.register_tag('rd_url', Jekyll::AssetPathTag)
Liquid::Template.register_tag('rd_asset', Jekyll::AssetPathTag)
