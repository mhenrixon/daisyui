# frozen_string_literal: true

module Views
  # A syntax-highlighted code block. Provided by docs-kit (Docs::Code), which
  # inlines its Rouge theme (configured in config/initializers/docs_kit.rb) so no
  # separate rouge stylesheet asset is needed. This subclass keeps the historical
  # `Views::Code` name the doc pages and example views render.
  class Code < ::Docs::Code
  end
end
