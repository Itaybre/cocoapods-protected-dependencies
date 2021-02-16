# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-protected-private/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-protected-private'
  spec.version       = CocoapodsProtectedPrivate::VERSION
  spec.authors       = ['itay']
  spec.email         = ['itay@itaysoft.com']
  spec.description   = 'CocoaPods is vulnerable to duplicated Pods in Private and Public repos, this plugin provides a way to prevent a dependency from using a different source'
  spec.summary       = 'Protect your project from being vulnerable to Dependency Confusion'
  spec.homepage      = 'https://github.com/itaybre/cocoapods-protected-private'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'cocoapods-core','~> 1.8'
  spec.add_dependency 'cocoapods','~> 1.8'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', "~> 12.3"
end
