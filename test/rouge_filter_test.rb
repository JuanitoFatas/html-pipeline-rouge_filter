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

  def test_highlight_with_ruby
    filter = RougeFilter.new \
      "<pre lang='ruby'>hello</pre>"

    assert_equal %(<pre class="highlight"><code><span class="n">hello</span></code></pre>), filter.highlight_with(Rouge::Lexers::Ruby, "hello").chomp
  end

  def test_default_css_class
    filter = RougeFilter.new \
      "<pre lang='ruby'>hello</pre>"

    assert_equal "highlight", filter.default_css_class
  end

  def test_default_css_class_can_be_specified_by_context
    filter = RougeFilter.new \
      "<pre lang='ruby'>hello</pre>", css_class: "superlight"

    assert_equal "superlight", filter.default_css_class
  end

  def test_line_numbers
    filter = RougeFilter.new \
      "<pre lang='ruby'>hello</pre>"

    assert_equal false, filter.line_numbers
  end

  def test_line_numbers_can_be_specified_by_context
    filter = RougeFilter.new \
      "<pre lang='ruby'>hello</pre>", line_numbers: true

    assert_equal true, filter.line_numbers
  end

  def test_default_formatter
    filter = RougeFilter.new \
      "<pre lang='ruby'>hello</pre>"

    assert_kind_of Rouge::Formatters::HTML, filter.formatter
  end

  def test_default_lexer
    filter = RougeFilter.new \
      "<pre lang='ruby'>hello</pre>"

    assert_equal Rouge::Lexers::PlainText, filter.lexer_for("not-exist")
  end

  def test_lexer_can_be_specified
    filter = RougeFilter.new \
      "<pre lang='ruby'>hello</pre>"

    assert_kind_of Rouge::Lexers::Shell, filter.lexer_for("shell")
  end
end
