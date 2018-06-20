require File.expand_path('../lib/decontaminator/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name = 'decontaminator'
  spec.version = Decontaminator::VERSION
  spec.authors = ['Matthew MacLeod', 'Paul Mucur', 'Jakub Pawlowicz', 'Anna Klimas']
  spec.email = 'support@altmetric.com'
  spec.homepage = 'https://github.com/altmetric/decontaminator'
  spec.summary = %q{HTML sanitizer using lightweight Oga HTML parser.}
  spec.license = 'MIT'
  spec.description = 'Ruby HTML sanitizer based on a lightweight Oga parser.'

  spec.files = %w(README.md LICENSE.txt) + Dir['lib/**/*.rb']
  spec.test_files = Dir['spec/**/*.rb']

  spec.add_dependency('oga', '>= 1.3', '< 3.0')
end
