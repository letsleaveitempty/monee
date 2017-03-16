lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monee/version'

Gem::Specification.new do |spec|
  spec.name        = 'monee'
  spec.version     = Monee::VERSION
  spec.files       = Dir['lib/**/*.rb', 'spec/**/*.rb']
  spec.authors     = ['Anita Jaszewska']
  spec.email       = ['anita.jaszewska@gmail.com']
  spec.summary     = 'Monee: The Money converter.'
  spec.description = 'The simplest money converter.'
  spec.homepage    = 'https://github.com/letsleaveitempty/monee'
  spec.license     = 'MIT'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rspec', '~> 3.4'
end
