# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Kbd
        class FunctionKeys < Views::Components::Example
          include DaisyUI

          title "Function keys"
          order 5

          def example
            Kbd { "⌘" }
            Kbd { "⌥" }
            Kbd { "⇧" }
            Kbd { "⌃" }
          end
        end
      end
    end
  end
end
