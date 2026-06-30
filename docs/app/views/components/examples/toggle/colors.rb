# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Toggle
        class Colors < Views::Components::Example
          include DaisyUI

          title "Colors"
          order 2

          def example
            Toggle(:primary, checked: true)
            Toggle(:secondary, checked: true)
            Toggle(:accent, checked: true)
            Toggle(:neutral, checked: true)
            Toggle(:info, checked: true)
            Toggle(:success, checked: true)
            Toggle(:warning, checked: true)
            Toggle(:error, checked: true)
          end
        end
      end
    end
  end
end
