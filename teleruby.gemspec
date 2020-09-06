# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'teleruby'
  spec.version       = '1.5.1'
  spec.authors       = ['Solomon Boloshe(Lee Crey)']
  spec.email         = ['SolomonMail835@gmail.com']
  spec.summary       = %q{Simple ruby wrapper for Telegram bot}
  spec.description   = %q{Lightweight ruby wrapper for Telegram bot.}
  spec.homepage      = 'https://rubygems.org/gems/hedase'
  spec.files         = Dir.glob('lib/*.rb') + ['teleruby.gemspec']
  spec.require_paths = ['lib']
  spec.license       = 'GPLv3+'
  spec.date          = '2020-09-05'
  spec.required_ruby_version = '>= 2.3.0'
  spec.add_runtime_dependency 'faraday', '~> 1.0', '>= 1.0.0'
  spec.add_runtime_dependency 'json', '~> 2.3', '>= 2.3.0'

  spec.metadata = {
    'source_code_uri' => 'https://github.com/SolomonBoloshe116/teleruby'
  }

  lib = File.expand_path("./lib/", __FILE__)
  $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
end
