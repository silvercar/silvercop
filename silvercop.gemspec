Gem::Specification.new do |spec|
  spec.name = 'silvercop'
  spec.version = '1.2.0'
  spec.summary = 'Silvercar RuboCop'
  spec.description = 'Code style checking for Silvercar Ruby repositories.'

  spec.homepage = 'https://github.com/silvercar/silvercop'
  spec.license = 'MIT'
  spec.authors = ['Silvercar']
  spec.email = ['opensource@silvercar.com']

  spec.files = Dir['README.md', 'LICENSE', '.rubocop.yml', 'config/*.yml', 'lib/**/*.rb']

  spec.add_dependency 'rubocop', '1.48.0'
  spec.add_dependency 'rubocop-performance', '1.20.1'
  spec.add_dependency 'rubocop-rails', '2.23.1'
  spec.add_dependency 'rubocop-rake', '0.6.0'
  spec.add_dependency 'rubocop-rspec', '2.25.0'
  spec.add_dependency 'rubocop-thread_safety', '0.5.1'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'

  spec.required_ruby_version = '>= 2.0.0'
end
