# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pearl/version'

Gem::Specification.new do |spec|
  spec.name          = "pearl"
  spec.version       = Pearl::VERSION
  spec.authors       = ["Manish Valechha"]
  spec.email         = ["manishval@hotmail.com"]
  spec.description   = "Command line interface for DigitalOcean's API"
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.executables   = pearl

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
