# frozen_string_literal: true

module Views
  # The site shell. Now provided by docs-kit (Docs::Shell) so the layout/design is
  # shared with the phlex-reactive docs site and lives in one place. This subclass
  # keeps the historical `Views::Layout` name that the pages render.
  class Layout < ::Docs::Shell
  end
end
