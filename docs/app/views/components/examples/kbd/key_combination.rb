# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Kbd
        class KeyCombination < Views::Components::Example
          include DaisyUI

          title "Key combination"
          order 4

          def example
            Kbd { "ctrl" }
            plain " + "
            Kbd { "shift" }
            plain " + "
            Kbd { "del" }
          end
        end
      end
    end
  end
end
