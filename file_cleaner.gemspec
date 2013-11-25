# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'file_cleaner/version'

Gem::Specification.new do |spec|
  spec.name          = "file-cleaner"
  spec.version       = FileCleaner::VERSION
  spec.authors       = ["Arturo Pie"]
  spec.email         = ["arturotd08@yahoo.ca"]
  spec.description   = %q{Filters out lines of files}
  spec.summary       = %q{This library filters lines or group of lines from a file by using regular expressions and ranges.}
  spec.homepage      = "https://github.com/arturopie/file-cleaner"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
end
