# frozen_string_literal: true

module Views
  module Docs
    # The base class for a hand-authored doc page. Provided by docs-kit
    # (::Docs::Page): renders the page body inside the shared shell with a
    # consistent masthead, via the class-level title/eyebrow DSL and #content.
    # This subclass keeps the historical `Views::Docs::Page` name.
    class Page < ::Docs::Page
    end
  end
end
