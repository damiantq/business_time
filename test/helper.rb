require 'minitest/autorun'
require 'minitest/rg'
require "minitest/reporters"

if ENV["COV"]
  require 'simplecov'
  SimpleCov.start
end

require 'thread'
if RUBY_VERSION >= '1.9'
  require 'time'
  require 'date'
  require 'active_support/time'
else
  require 'active_support'
  require 'active_support/core_ext'
end

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'business_time'

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new, Minitest::Reporters::ProgressReporter.new]

MiniTest::Spec.class_eval do
  after do
    BusinessTime::Config.send(:reset)
    Time.zone = nil
  end
end
