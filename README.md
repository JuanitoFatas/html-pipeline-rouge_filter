# HTML::Pipeline::RougeFilter [![Build Status](https://travis-ci.org/JuanitoFatas/html-pipeline-rouge_filter.svg)](https://travis-ci.org/JuanitoFatas/html-pipeline-rouge_filter)

[Rouge](https://github.com/jneen/rouge) integration for [HTML::Pipeline](https://github.com/jch/html-pipeline).

This RubyGem requires Ruby 2.0+.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'html-pipeline-rouge_filter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install html-pipeline-rouge_filter

## Usage

```ruby
require 'html/pipeline'
require 'html/pipeline/rouge_filter'

pipeline = HTML::Pipeline.new [
  HTML::Pipeline::MarkdownFilter,
  HTML::Pipeline::RougeFilter
]

result = pipeline.call <<-CODE.gsub(/^\s*/,'')

    ```ruby
    def foo
      puts "foo"
    end
    ```

    CODE

puts result[:output]
```

Prints (without the linebreaks):

```html
<pre class="highlight highlight-ruby">
  <code>
    <span class="k">def</span>
    <span class="nf">foo</span>
    <span class="nb">puts</span>
    <span class="s2">"foo"</span>
    <span class="k">end</span>
  </code>
</pre>
```

You can specify line numbers via `line_numbers` option in
[context](https://github.com/jch/html-pipeline#examples) hash.

## Contributing

1. Fork it ( https://github.com/juanitofatas/html-pipeline-rouge_filter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
