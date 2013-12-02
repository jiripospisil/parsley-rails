# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parsley-rails/version'

Gem::Specification.new do |gem|
  gem.name          = "parsley-rails"
  gem.version       = Parsley::Rails::VERSION
  gem.authors       = ["Jiri Pospisil"]
  gem.email         = ["mekishizufu@gmail.com"]
  gem.description   = %q{Parsley.js bundled for Rails Asset Pipeline}
  gem.summary       = %q{Parsley.js bundled for Rails Asset Pipeline}
  gem.homepage      = "https://github.com/mekishizufu/parsley-rails"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]

  gem.add_dependency("railties", ">= 3.0.0")
end