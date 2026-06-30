# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Badge
        class Styles < Views::Components::Example
          include DaisyUI

          title "Badge styles"
          order 4

          def example
            Badge(:soft, :primary) { "Soft" }
            Badge(:outline, :secondary) { "Outline" }
            Badge(:dash, :accent) { "Dash" }
            Badge(:ghost) { "Ghost" }
          end
        end
      end
    end
  end
end
