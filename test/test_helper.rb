require 'rubygems'
require 'bundler'
Bundler.require :test

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'pearl'

# Support files
Dir["#{File.expand_path(File.dirname(__FILE__))}/support/*.rb"].each do |file|
  require file
end

# VCR
VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
end

class Pearl::TestCase < MiniTest::Unit::TestCase
  include ::ClientMacros
end