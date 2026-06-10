require 'yaml'

module Jekyll
  module FromYamlFilter
    def from_yaml(input)
      YAML.load(input.strip)
    rescue => e
      Jekyll.logger.warn "FromYaml Filter:", "Could not parse YAML: #{e.message}"
      input
    end
  end
end

Liquid::Template.register_filter(Jekyll::FromYamlFilter)
