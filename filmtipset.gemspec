# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "filmtipset/version"

Gem::Specification.new do |gem|
  gem.required_ruby_version = '>= 1.9.3'

  gem.name          = "filmtipset"
  gem.version       = Filmtipset::VERSION
  gem.authors       = ["Peter Hellberg"]
  gem.email         = ["peter@c7.se"]
  gem.summary       = "API client for the Filmtipset API (requires access key)"
  gem.homepage      = "https://github.com/peterhellberg/skatteverket"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "bundler",  "~> 1.3"
  gem.add_development_dependency "rake",     "~> 10.0"
  gem.add_development_dependency "minitest", "~> 5.0"

  gem.post_install_message = "\nYou need an access key in order to " +
                             "use this gem.\n\n    Required setup: " +
                             "Filmtipset.access_key = 'your_access_key'\n\n"
end
