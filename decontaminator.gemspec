# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'decontaminator/version'

Gem::Specification.new do |spec|
  spec.name = 'decontaminator'
  spec.version = Decontaminator::VERSION
  spec.authors = ['Jakub Pawlowicz', 'Matthew MacLeod']
  spec.email = %w(jakub@altmetric.com matt@matt-m.co.uk)
  spec.summary = %q{HTML sanitizer using lightweight Oga HTML parser.}
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0")
  spec.test_files = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'oga', '~> 1.2.0'
end
