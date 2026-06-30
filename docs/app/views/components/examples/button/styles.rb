# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Button
        class Styles < Views::Components::Example
          include DaisyUI

          title "Button styles"
          order 4

          def example
            Button(:outline) { "Outline" }
            Button(:dash) { "Dash" }
            Button(:soft) { "Soft" }
            Button(:ghost) { "Ghost" }
            Button(:link) { "Link" }
          end
        end
      end
    end
  end
end
