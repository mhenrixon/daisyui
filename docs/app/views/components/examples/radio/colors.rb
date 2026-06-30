# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Radio
        class Colors < Views::Components::Example
          include DaisyUI

          title "Colors"
          order 2

          def example
            Radio(:primary, name: "radio-colors", checked: true)
            Radio(:secondary, name: "radio-colors")
            Radio(:accent, name: "radio-colors")
            Radio(:neutral, name: "radio-colors")
            Radio(:info, name: "radio-colors")
            Radio(:success, name: "radio-colors")
            Radio(:warning, name: "radio-colors")
            Radio(:error, name: "radio-colors")
          end
        end
      end
    end
  end
end
