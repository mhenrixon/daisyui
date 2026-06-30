# frozen_string_literal: true

require "rouge"

module Views
  # A syntax-highlighted code block for the docs (and demo panels). Rouge does the
  # highlighting; an optional filename/label sits in a title bar like a real docs
  # code sample. Self-contained: it injects its own Rouge theme CSS so no separate
  # stylesheet asset is required.
  #
  #   render Views::Code.new(ruby_source)                        # ruby, no title
  #   render Views::Code.new(erb, lexer: :erb, filename: "...")  # labelled
  class Code < Phlex::HTML
    THEME = Rouge::Themes::Monokai
    FORMATTER = Rouge::Formatters::HTML.new

    LEXERS = {
      ruby: Rouge::Lexers::Ruby,
      erb: Rouge::Lexers::ERB,
      html: Rouge::Lexers::HTML,
      javascript: Rouge::Lexers::Javascript,
      shell: Rouge::Lexers::Shell,
      yaml: Rouge::Lexers::YAML,
      plaintext: Rouge::Lexers::PlainText,
    }.freeze

    def initialize(source, lexer: :ruby, filename: nil)
      @source = source.to_s.strip
      @lexer = lexer
      @filename = filename
    end

    def view_template
      style { highlight_css }
      div(class: "not-prose my-4 overflow-hidden rounded-box border border-base-300 bg-base-300/40") do
        title_bar if @filename
        div(class: "code-highlight overflow-x-auto p-4 text-sm leading-relaxed") do
          pre { raw(safe(FORMATTER.format(lexer.lex(@source)))) }
        end
      end
    end

    private

    def title_bar
      div(class: "flex items-center gap-2 border-b border-base-300 bg-base-300/60 px-4 py-2") do
        render Views::Icon.new("file-code", class: "size-3.5 opacity-60")
        span(class: "font-mono text-xs opacity-70") { @filename }
      end
    end

    def lexer
      (LEXERS[@lexer] || Rouge::Lexers::PlainText).new
    end

    def highlight_css
      # Static Rouge theme CSS — no user input. Phlex safe(), not html_safe.
      raw(safe(<<~CSS))
        #{THEME.render(scope: '.code-highlight')}
        .code-highlight { background: #272822; }
        .code-highlight pre { margin: 0; white-space: pre-wrap; word-break: break-word; }
      CSS
    end
  end
end
