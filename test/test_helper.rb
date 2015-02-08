require "bundler/setup"
require "html/pipeline"
require "minitest/autorun"

module TestHelpers
end

Minitest::Test.send(:include, TestHelpers)
