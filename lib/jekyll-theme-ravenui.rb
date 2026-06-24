# frozen_string_literal: true

require "jekyll"
require "jekyll-theme-ravenui/version"

# Load theme plugins
require_relative "../_plugins/from_yaml"
require_relative "../_plugins/runtime_metadata"
require_relative "../_plugins/og_image_generator"
require_relative "../_plugins/component_tag"
require_relative "../_plugins/path_tags"
require_relative "../_plugins/hooks"

module RavenUI
end
