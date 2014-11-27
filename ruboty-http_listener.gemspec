# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/http_listener/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-http_listener"
  spec.version       = Ruboty::HttpListener::VERSION
  spec.authors       = ["amacou"]
  spec.email         = ["amacou.abf@gmail.com"]
  spec.summary       = %q{ruboty http listener plugin}
  spec.description   = %q{ruboty http listener plugin}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ruboty", ">= 1.0.4"
  spec.add_dependency "activesupport"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
