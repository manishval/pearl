source 'https://rubygems.org'

# Specify your gem's dependencies in pearl.gemspec
gemspec

gem 'rake', group: [:development, :test]

# Development dependencies
group :development do
  gem 'yard'
end

group :test do
  gem 'minitest'
  gem 'minitest-wscolor' if RUBY_VERSION >= '1.9.3'
  gem 'mocha', require: 'mocha/setup'
  gem 'simplecov', require: false
  gem 'turn'
  gem 'vcr'
  gem 'webmock', require: 'webmock/minitest'
end