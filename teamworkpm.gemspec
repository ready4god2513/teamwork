# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'teamwork/version'

Gem::Specification.new do |spec|
  spec.name          = "teamworkpm"
  spec.version       = Teamwork::VERSION
  spec.authors       = [" Brandon Hansen"]
  spec.email         = ["bh@jesusculture.com"]
  spec.description   = "A Ruby wrapper to the Teamwork PM API"
  spec.summary       = "A Ruby wrapper to the Teamwork PM API"
  spec.homepage      = "http://teamwork.com/"
  spec.license       = "MIT"

  spec.files = %w(LICENSE README.md Rakefile teamworkpm.gemspec)
  spec.files += Dir.glob("lib/**/*.rb")
  spec.files += Dir.glob("spec/**/*")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday', "~> 0.8"
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'htmlentities', "~> 4.3"
  spec.add_dependency 'multi_json', '~> 1.8'
  spec.add_dependency 'multipart-post'

  spec.add_development_dependency 'dotenv', '~> 0.9', '>= 0.9.0'
end
