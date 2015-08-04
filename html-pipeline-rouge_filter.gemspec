# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'html/pipeline/rouge_filter/version'

Gem::Specification.new do |spec|
  spec.name          = "html-pipeline-rouge_filter"
  spec.version       = HTML_Pipeline::RougeFilter::VERSION
  spec.authors       = ["Juanito Fatas"]
  spec.email         = ["katehuang0320@gmail.com"]
  spec.summary       = %q{Rouge integration with html-pipeline.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/juanitofatas/html-pipeline-rouge_filter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "html-pipeline", ">= 1.11"
  spec.add_dependency "rouge", "~> 1.8"
  spec.add_dependency "activesupport"

  spec.required_ruby_version = "~> 2.0"
end
