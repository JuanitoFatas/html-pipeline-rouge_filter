source "https://rubygems.org"

# Specify your gem's dependencies in twemoji.gemspec
gemspec

group :development do
  gem "rake"
  gem "bundler"
  gem "pry"
end

group :test do
  gem "minitest", ">= 5.5"

  if RUBY_VERSION < "2.2.2"
    gem "activesupport", "< 5.0.0", require: false
  end

  if RUBY_VERSION < "2.1.0"
    gem "nokogiri", "< 1.7.0", require: false
  end
end
