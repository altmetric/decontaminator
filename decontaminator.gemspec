require_relative 'lib/decontaminator/version'

Gem::Specification.new do |spec|
  spec.name = 'decontaminator'
  spec.version = Decontaminator::VERSION
  spec.authors = ['Matthew MacLeod', 'Paul Mucur', 'Jakub Pawlowicz']
  spec.email = %w(jakub@altmetric.com matt@matt-m.co.uk)
  spec.summary = %q{HTML sanitizer using lightweight Oga HTML parser.}
  spec.license = 'MIT'

  spec.files = %w(README.md LICENSE.txt) + Dir['lib/**/*.rb']
  spec.test_files = Dir['spec/**/*.rb']

  spec.add_dependency('oga', '~> 1.3')
end
