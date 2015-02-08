require "test_helper"
require "html/pipeline/rouge_filter"

class HTML::Pipeline::RougeFilterTest < Minitest::Test
  RougeFilter = HTML::Pipeline::RougeFilter

  def setup
  end

  def test_version
    assert_equal HTML_Pipeline::RougeFilter::VERSION, "0.0.1"
  end
end
