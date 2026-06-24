# frozen_string_literal: true

require 'jekyll'
require 'fileutils'

module Jekyll
  module RavenUI
    class HooksManager
      class << self
        def find_repo_root(start_dir)
          dir = File.expand_path(start_dir)
          while dir != '/' && dir != '.'
            return dir if Dir.exist?(File.join(dir, '.git'))
            parent = File.expand_path('..', dir)
            break if parent == dir
            dir = parent
          end
          start_dir
        end

        def hooks_enabled?(site)
          theme_settings = site.config['theme_settings'] || {}
          hooks_settings = theme_settings['hooks'] || {}
          return false if hooks_settings['enabled'] == false
          
          # Default enabled if key is present
          true
        end

        def get_hook_setting(site, key, default = false)
          return default unless hooks_enabled?(site)
          theme_settings = site.config['theme_settings'] || {}
          hooks_settings = theme_settings['hooks'] || {}
          val = hooks_settings[key]
          val.nil? ? default : val
        end
      end
    end
  end
end

# 1. Pre-build hook: git_tags generation
Jekyll::Hooks.register :site, :after_reset do |site|
  next unless Jekyll::RavenUI::HooksManager.get_hook_setting(site, 'git_tags', false)

  Jekyll.logger.info "RavenUI:", "Executing git_tags pre-build hook..."
  repo_root = Jekyll::RavenUI::HooksManager.find_repo_root(site.source)
  output_dir = File.join(site.source, '_data')
  output_file = File.join(output_dir, 'git-tags.yml')

  # Create output directory if it doesn't exist
  FileUtils.mkdir_p(output_dir) unless Dir.exist?(output_dir)

  # Check if git is available
  if system("git --version > /dev/null 2>&1")
    rvcli_path = File.join(repo_root, 'tools', 'rvcli', 'rvcli.psd1')
    if File.exist?(rvcli_path)
      Jekyll.logger.info "RavenUI:", "Running Invoke-RvGitTags via PowerShell..."
      cmd = "pwsh -NoProfile -NonInteractive -Command \"Import-Module '#{rvcli_path}'; Invoke-RvGitTags -WorkspaceRoot '#{repo_root}' -Args '--output', '#{output_file}'\""
      success = system(cmd)
      if success
        Jekyll.logger.info "RavenUI:", "Successfully generated git-tags.yml"
      else
        Jekyll.logger.warn "RavenUI:", "Failed to run Invoke-RvGitTags via PowerShell."
      end
    else
      Jekyll.logger.warn "RavenUI:", "rvcli module not found at #{rvcli_path}."
    end
  else
    Jekyll.logger.warn "RavenUI:", "git command not found. Skipping git_tags hook."
  end
end

# 2. Post-write hooks: pagefind and minify
Jekyll::Hooks.register :site, :post_write do |site|
  # Pagefind hook
  if Jekyll::RavenUI::HooksManager.get_hook_setting(site, 'pagefind', false)
    Jekyll.logger.info "RavenUI:", "Executing pagefind post-write hook..."
    
    # Check if pagefind is available via npx
    if system("npx pagefind --version > /dev/null 2>&1")
      Jekyll.logger.info "RavenUI:", "Running Pagefind search indexer on #{site.dest}..."
      cmd = "npx pagefind --site \"#{site.dest}\""
      success = system(cmd)
      if success
        Jekyll.logger.info "RavenUI:", "Successfully built Pagefind search index."
      else
        Jekyll.logger.warn "RavenUI:", "Pagefind search indexer failed."
      end
    else
      Jekyll.logger.warn "RavenUI:", "npx pagefind is not available. Make sure Node.js and pagefind are installed."
    end
  end

  # Minify hook
  if Jekyll::RavenUI::HooksManager.get_hook_setting(site, 'minify', false)
    Jekyll.logger.info "RavenUI:", "Executing minify post-write hook..."
    repo_root = Jekyll::RavenUI::HooksManager.find_repo_root(site.source)
    minify_script = File.join(repo_root, 'tools', 'minify.ps1')

    if File.exist?(minify_script)
      Jekyll.logger.info "RavenUI:", "Running minify.ps1 on #{site.dest}..."
      cmd = "pwsh -NoProfile -NonInteractive -File \"#{minify_script}\" -TargetDir \"#{site.dest}\" -Quiet"
      success = system(cmd)
      if success
        Jekyll.logger.info "RavenUI:", "Successfully minified site HTML/CSS/JS."
      else
        Jekyll.logger.warn "RavenUI:", "Minifier script failed."
      end
    else
      Jekyll.logger.warn "RavenUI:", "Minifier script not found at #{minify_script}."
    end
  end
end
