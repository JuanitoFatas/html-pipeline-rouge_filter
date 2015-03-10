require "bundler/setup"
require "html/pipeline"
require "minitest/autorun"

module TestHelpers
  def assert_nothing_raised
    yield
  end
end

Minitest::Test.send(:include, TestHelpers)
