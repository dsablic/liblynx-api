
# -*- encoding: utf-8 -*-
require File.expand_path('../lib/liblynx-api/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Denis Sablic']
  gem.email         = ['denis.sablic@gmail.com']
  gem.homepage      = 'https://github.com/dsablic/liblynx-api'
  gem.summary       = 'Ruby client for the LibLynx API'
  gem.license       = 'MIT'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'liblynx-api'
  gem.require_paths = ['lib']
  gem.version       = LibLynxAPI::VERSION

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rake', '< 11.0'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'prmd'

  gem.add_dependency 'heroics'
  gem.add_dependency 'moneta'
end
