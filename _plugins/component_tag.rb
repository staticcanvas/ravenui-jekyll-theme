# frozen_string_literal: true

require 'jekyll'

module Jekyll
  module ComponentTagUtils
    ATTR_REGEXP = /(?:\w+\s*=\s*(?:"[^"]*"|'[^']*'|[\w\.-]+))/o

    def parse_markup(markup, context)
      markup = markup.strip
      
      # Check if first word is the component name (does not contain '=')
      first_word = markup.split(/\s+/).first
      if first_word && !first_word.include?('=')
        component_name = first_word
        remaining_markup = markup[first_word.length..-1].strip
      else
        component_name = nil
        remaining_markup = markup
      end
      
      attributes = {}
      remaining_markup.scan(ATTR_REGEXP) do |attr|
        key, val_string = attr.split('=', 2).map(&:strip)
        
        # Strip quotes if present
        if (val_string.start_with?('"') && val_string.end_with?('"')) ||
           (val_string.start_with?("'") && val_string.end_with?("'"))
          attributes[key] = val_string[1..-2]
        elsif val_string == 'true'
          attributes[key] = true
        elsif val_string == 'false'
          attributes[key] = false
        elsif val_string =~ /^\d+$/
          attributes[key] = val_string.to_i
        elsif val_string =~ /^\d+\.\d+$/
          attributes[key] = val_string.to_f
        else
          # Resolve variable in context
          attributes[key] = context[val_string]
        end
      end
      
      component_name ||= attributes['component'] || attributes['type']
      [component_name, attributes]
    end

    def find_template(site, component_name)
      includes_dir = File.join(site.source, '_includes')
      paths = [
        File.join(includes_dir, 'comps', "#{component_name}.html"),
        File.join(includes_dir, 'core', "#{component_name}.html"),
        File.join(includes_dir, "#{component_name}.html")
      ]
      paths.find { |path| File.exist?(path) }
    end
  end

  # {% rd component="card" title="title" %} or {% rd card title="title" %} (Block Tag)
  class ComponentTag < Liquid::Block
    include ComponentTagUtils

    def initialize(tag_name, markup, parse_context)
      super
      @markup = markup
    end

    def render(context)
      block_content = super(context).strip
      
      component_name, attributes = parse_markup(@markup, context)
      return "<!-- Error: component name not specified in rd tag -->" if component_name.nil?
      
      attributes['content'] = block_content unless block_content.empty?

      site = context.registers[:site]
      return "<!-- Error: Jekyll site not found in context registers -->" if site.nil?

      template_path = find_template(site, component_name)
      if template_path.nil?
        return "<!-- Error: Component '#{component_name}' template not found -->"
      end

      template_content = File.read(template_path)

      context.stack({ 'include' => attributes }) do
        if site.respond_to?(:liquid_renderer)
          site.liquid_renderer.file(template_path).parse(template_content).render(context)
        else
          Liquid::Template.parse(template_content).render(context)
        end
      end
    end
  end

  # {% rdi component="badge" text="text" %} or {% rdi badge text="text" %} (Inline Tag)
  class ComponentInlineTag < Liquid::Tag
    include ComponentTagUtils

    def initialize(tag_name, markup, parse_context)
      super
      @markup = markup
    end

    def render(context)
      component_name, attributes = parse_markup(@markup, context)
      return "<!-- Error: component name not specified in rdi tag -->" if component_name.nil?

      site = context.registers[:site]
      return "<!-- Error: Jekyll site not found in context registers -->" if site.nil?

      template_path = find_template(site, component_name)
      if template_path.nil?
        return "<!-- Error: Component '#{component_name}' template not found -->"
      end

      template_content = File.read(template_path)

      context.stack({ 'include' => attributes }) do
        if site.respond_to?(:liquid_renderer)
          site.liquid_renderer.file(template_path).parse(template_content).render(context)
        else
          Liquid::Template.parse(template_content).render(context)
        end
      end
    end
  end
end

Liquid::Template.register_tag('rd', Jekyll::ComponentTag)
Liquid::Template.register_tag('rdi', Jekyll::ComponentInlineTag)
