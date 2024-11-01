# frozen_string_literal: true

version = File.read(File.expand_path('VERSION', __dir__)).strip

Gem::Specification.new do |spec|
  spec.name          = 'slippers'
  spec.version       = version
  spec.authors       = ['Delon Newman']
  spec.email         = ['contact@delonnewman.name']

  spec.summary       = 'A nice pair of Ruby slippers'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/delonnewman/slippers'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}#changelog"

  spec.files = %w[README.md]

  spec.add_dependency 'rack'
  spec.add_dependency 'erubi'
  spec.add_dependency 'method_source'
  spec.add_dependency 'puma'
  spec.add_dependency 'zeitwerk'
end
