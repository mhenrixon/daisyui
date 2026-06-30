# frozen_string_literal: true

require "rouge"

module Views
  module Examples
    # Syntax-highlights a source snippet with Rouge. Self-styled (injects its own
    # theme CSS), so it drops cleanly into a demo tab. Used for the Call-site and
    # Component-source tabs.
    class Code < Phlex::HTML
      THEME = Rouge::Themes::Monokai
      FORMATTER = Rouge::Formatters::HTML.new

      def initialize(source, lexer: :ruby)
        @source = source
        @lexer = lexer
      end

      def view_template
        style { highlight_css }
        div(class: "highlight rounded-box overflow-x-auto text-xs leading-relaxed") do
          pre do
            # Rouge's HTML output is trusted markup; Phlex's safe() (not Rails'
            # html_safe) marks it renderable. The source is our own code we read.
            raw(safe(FORMATTER.format(lexer.lex(@source))))
          end
        end
      end

      private

      def lexer
        case @lexer
        when :ruby   then Rouge::Lexers::Ruby.new
        when :erb    then Rouge::Lexers::ERB.new
        when :html   then Rouge::Lexers::HTML.new
        when :shell  then Rouge::Lexers::Shell.new
        else raise ArgumentError, "unsupported lexer: #{@lexer}"
        end
      end

      def highlight_css
        # Static Rouge theme CSS — no user input. Phlex safe(), not html_safe.
        raw(safe(<<~CSS))
          #{THEME.render(scope: '.highlight')}
          .highlight { background:#272822; padding:0.75rem; }
          .highlight pre { margin:0; white-space:pre-wrap; word-break:break-word; }
        CSS
      end
    end
  end
end
