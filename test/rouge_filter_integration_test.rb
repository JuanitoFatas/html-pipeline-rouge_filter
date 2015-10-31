require "test_helper"
require "html/pipeline/rouge_filter"
require "action_view"

class HTML::Pipeline::RougeFilterIntegrationTest < Minitest::Test
  def markdownify(content)
    pipeline_context = { gfm: true, asset_root: "public/images" }
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::SanitizationFilter,
      HTML::Pipeline::RougeFilter,
      HTML::Pipeline::MentionFilter,
      HTML::Pipeline::EmojiFilter,
    ], pipeline_context
    pipeline.call(content)[:output].to_s.html_safe
  end

  # https://github.com/JuanitoFatas/html-pipeline-rouge_filter/issues/4
  def test_bug_report_issues_4
    assert_equal \
      IO.read("test/fixtures/output.html"),
      markdownify(IO.read("test/fixtures/input.md"))
  end
end
