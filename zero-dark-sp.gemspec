# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "zero-dark-sp"
  spec.version       = File.read("VERSION").strip
  spec.authors       = ["staticcanvas"]
  spec.email         = ["sgkens@gmail.com"]

  spec.summary       = "A professional, high-contrast Jekyll theme for technical documentation."
  spec.description   = "A clean, efficient Jekyll theme optimized for readability and long-form technical content."
  spec.homepage      = "https://gitlab.com/staticcanvas/zero-dark-sp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(_data|_includes|_layouts|_sass|assets|LICENSE|README|VERSION)}) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jekyll", "~> 4.3"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.17"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.8"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.4"
end
