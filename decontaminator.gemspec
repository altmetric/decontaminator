require File.expand_path('../lib/decontaminator/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name = 'decontaminator'
  spec.version = Decontaminator::VERSION
  spec.authors = ['Matthew MacLeod', 'Paul Mucur', 'Jakub Pawlowicz']
  spec.email = %w(matt@matt-m.co.uk mudge@mudge.name jakub@altmetric.com)
  spec.homepage = 'https://github.com/altmetric/decontaminator'
  spec.summary = %q{HTML sanitizer using lightweight Oga HTML parser.}
  spec.license = 'MIT'
  spec.description = 'Ruby HTML sanitizer based on a lightweight Oga parser.'

  spec.files = %w(README.md LICENSE.txt) + Dir['lib/**/*.rb']
  spec.test_files = Dir['spec/**/*.rb']

  spec.add_dependency('oga', '~> 1.3')
end
