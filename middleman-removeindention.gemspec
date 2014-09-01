# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman-removeindention/version'

Gem::Specification.new do |spec|
  spec.name          = "middleman-removeindention"
  spec.version       = Middleman::Removeindention::VERSION
  spec.authors       = ["yterajima"]
  spec.email         = ["terra@e2esound.com"]
  spec.summary       = %q{Remove Indention from build files}
  spec.description   = %q{Remove Indention from build files}
  spec.homepage      = "https://github.com/yterajima/middleman-slim"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "middleman", "~>3.3"

  spec.add_development_dependency "cucumber", "~> 1.3"
  spec.add_development_dependency "aruba", "~> 0.6"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
