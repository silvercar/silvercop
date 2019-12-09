Gem::Specification.new do |spec|
  spec.name = 'silvercop'
  spec.version = '1.0.2'
  spec.summary = 'Silvercar RuboCop'
  spec.description = 'Code style checking for Silvercar Ruby repositories.'

  spec.homepage = 'https://github.com/silvercar/silvercop'
  spec.license = 'MIT'
  spec.authors = ['Silvercar']
  spec.email = ['opensource@silvercar.com']

  spec.files = Dir['README.md', 'LICENSE', '.rubocop.yml', 'config/*.yml', 'lib/**/*.rb']

  spec.add_dependency 'rubocop', '0.77.0'
  spec.add_dependency 'rubocop-performance', '1.5.1'
  spec.add_dependency 'rubocop-rails', '2.4.0'
  spec.add_dependency 'rubocop-thread_safety', '0.3.4'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'

  spec.required_ruby_version = '>= 2.0.0'
end
