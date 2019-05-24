Gem::Specification.new do |spec|
  spec.name = 'silvercop'
  spec.version = '1.0.0'
  spec.summary = 'Silvercar RuboCop'
  spec.description = 'Code style checking for Silvercar Ruby repositories.'

  spec.homepage = 'https://github.com/silvercar/silvercop'
  spec.license = 'MIT'
  spec.authors = ['Silvercar']
  spec.email = ['opensource@silvercar.com']

  spec.files = Dir['README.md', 'LICENSE', 'config/*.yml', 'lib/**/*.rb']

  spec.add_dependency 'rubocop', '0.68.1'
  spec.add_dependency 'rubocop-performance', '1.2.0'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'

  spec.required_ruby_version = '>= 2.0.0'
end
