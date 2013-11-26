# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gem/print/version'

Gem::Specification.new do |spec|
  spec.name          = "gem-print"
  spec.version       = Gem::Print::VERSION
  spec.authors       = ["Benjamin Fleischer", "Vikram Dighe"]
  spec.email         = ["github@benjaminfleischer.com", "krazylegz32@gmail.com"]
  spec.description   = %q{gem print [your gem here]}
  spec.summary       = %q{concats and highlights the specified gem files}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
