# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Select
        class Basic < Views::Components::Example
          include DaisyUI

          title "Select"
          order 1

          def example
            Select do
              option(disabled: true, selected: true) { "Pick a color" }
              option { "Crimson" }
              option { "Amber" }
              option { "Velvet" }
            end
          end
        end
      end
    end
  end
end
