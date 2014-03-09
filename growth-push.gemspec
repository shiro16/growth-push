# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'growth_push/version'

Gem::Specification.new do |spec|
  spec.name          = "growth-push"
  spec.version       = GrowthPush::VERSION
  spec.authors       = ["shiro16"]
  spec.email         = ["nyanyanyawan24@gmail.com"]
  spec.summary       = %q{Access for SIROK's GrowthPush API.}
  spec.description   = %q{Access for SIROK's GrowthPush API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "multi_json",     "~> 1.3.7"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec",   "~> 2.14.1"
  spec.add_development_dependency "webmock", "~> 1.13.0"
  spec.add_development_dependency "pry",     "~> 0.9.12.2"
end
