require "html/pipeline/rouge_filter/version"
require "html/pipeline/filter"

require "rouge"

require "active_support/core_ext/string/inflections"

module HTML
  class Pipeline
    class RougeFilter < Filter
      def call
        doc.search("pre").each do |node|
          default   = must_str(context[:highlight])
          next unless lang = node["lang"] || default
          next unless lexer = lexer_for(lang)
          node.css("br").each { |br| br.replace("\n") } if replace_br
          text = node.inner_text
          html = highlight_with(lexer, text)
          next if html.nil?

          if (node = node.replace(html).first)
            klass = node["class"]
            klass = [klass, "#{default_css_class}-#{lang}"].compact.join(" ")
            node["class"] = klass
          end
        end

        doc
      end

      def highlight_with(lexer, text)
        formatter.format(lexer.lex(text))
      end

      def default_css_class
        must_str(context[:css_class]) || "highlight"
      end

      def line_numbers
        context[:line_numbers] || false
      end

      def replace_br
        context[:replace_br] || false
      end

      def formatter(css_class: default_css_class)
        Rouge::Formatters::HTMLLegacy.new(css_class: css_class,
                                    line_numbers: line_numbers)
      end

      def lexer_for(lang)
        Rouge::Lexer.find_fancy(lang) || Rouge::Lexers::PlainText
      end

      private

        def must_str(text)
          text && text.to_s
        end
    end
  end
end
