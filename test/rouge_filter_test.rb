require "test_helper"
require "html/pipeline/rouge_filter"

class HTML::Pipeline::RougeFilterTest < Minitest::Test
  RougeFilter = HTML::Pipeline::RougeFilter

  def setup
  end

  def test_highlight_default
    filter = RougeFilter.new \
      "<pre>hello</pre>", highlight: "coffeescript"

    doc = filter.call
    assert !doc.css(".highlight-coffeescript").empty?
  end

  def test_highlight_default_will_not_override
    filter = RougeFilter.new \
      "<pre lang='ruby'>hello</pre>", highlight: "coffeescript"

    doc = filter.call
    assert doc.css(".highlight-coffeescript").empty?
    assert !doc.css(".highlight-ruby").empty?
  end

  def test_unrecognized_lexer_will_not_raise_error
    filter = RougeFilter.new \
      "<pre lang='ruby'>hello</pre>"

    assert_nothing_raised do
      filter.lexer_for("not_exist")
    end
  end
end
