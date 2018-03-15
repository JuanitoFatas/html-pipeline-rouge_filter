# Please use [HTML::Pipeline's builtin `SyntaxHighlightFilter`](https://github.com/jch/html-pipeline/blob/a84d7fa441d545fc3bdd43d5003af67c53cfd2b8/lib/html/pipeline/syntax_highlight_filter.rb) instead.

**This repository is no longer actively maintained.**

## HTML::Pipeline::RougeFilter [![Build Status](https://travis-ci.org/JuanitoFatas/html-pipeline-rouge_filter.svg)](https://travis-ci.org/JuanitoFatas/html-pipeline-rouge_filter)

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

You can specify following options in
[context](https://github.com/jch/html-pipeline#examples) hash:

`line_numbers`: Line numbers will be displayed if set to true.

`replace_br`: `<br>` tags in the code will be replaced with new line characters (`\n`) if set to true.

## Contributing

1. Fork it ( https://github.com/juanitofatas/html-pipeline-rouge_filter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License, Contributor's Guidelines and Code of Conduct

This project is open source under the MIT license, which means you have full access to the source code and can modify
it to fit your own needs.

This project subscribes to the
[Moya Contributors Guidelines](https://github.com/Moya/contributors/blob/master/Community.md) which TLDR: means we give
out push access easily and often.

Contributors subscribe to the [Contributor Code of Conduct](http://contributor-covenant.org/version/1/4/) based on
the [Contributor Covenant](http://contributor-covenant.org) version 1.4.
