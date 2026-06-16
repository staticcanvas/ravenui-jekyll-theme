# frozen_string_literal: true

require 'jekyll'

module Jekyll
  class RuntimeMetadataGenerator < Generator
    safe true
    priority :lowest

    def generate(site)
      active_gems = {}
      if defined?(Gem) && Gem.respond_to?(:loaded_specs)
        Gem.loaded_specs.each do |name, spec|
          # Capture all Jekyll plugins, themes, and other relevant gems
          if name.start_with?('jekyll-') || name == 'github-pages' || name == 'webrick'
            active_gems[name] = spec.version.to_s
          end
        end
      end

      local_plugins = []
      plugins_dir = File.join(site.source, '_plugins')
      if Dir.exist?(plugins_dir)
        Dir.glob(File.join(plugins_dir, '*.rb')).each do |file|
          local_plugins << File.basename(file)
        end
      end

      metadata = {
        'jekyll' => Jekyll::VERSION,
        'ruby' => RUBY_VERSION,
        'ruby_platform' => RUBY_PLATFORM,
        'bundler' => defined?(Bundler) ? Bundler::VERSION : nil,
        'plugins' => active_gems,
        'local_plugins' => local_plugins
      }

      site.config['runtime_metadata'] = metadata

      Jekyll.logger.info 'RuntimeMetadata:', "Injected Jekyll #{metadata['jekyll']}, Ruby #{metadata['ruby']}"
    end
  end
end
