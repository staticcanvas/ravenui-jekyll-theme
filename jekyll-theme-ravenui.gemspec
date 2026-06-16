# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-ravenui"
  spec.version       = File.read(File.expand_path("VERSION", __dir__)).strip
  spec.authors       = ["staticcanvas"]
  spec.email         = ["sgkens@gmail.com"]

  spec.summary       = "A professional, high-contrast Jekyll theme for technical documentation."
  spec.description   = "A professional, component-heavy Jekyll theme optimized for technical documentation, featuring three pluggable client search providers, dynamic layouts, and a reusable UI component library."
  spec.homepage      = "https://gitlab.com/staticcanvas/ravenui-jekyll-theme"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.dirname(__FILE__)) do
    `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(_data|_includes|_layouts|_plugins|_sass|assets|bin|lib|tools|LICENSE|README|VERSION|rvcli\.ps1)}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["rvcli"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jekyll", "~> 4.3"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.17"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.8"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.4"
end
