# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Range
        class Colors < Views::Components::Example
          include DaisyUI

          title "Colors"
          order 2

          def example
            Range(:neutral, min: 0, max: 100, value: 40)
            Range(:primary, min: 0, max: 100, value: 40)
            Range(:secondary, min: 0, max: 100, value: 40)
            Range(:accent, min: 0, max: 100, value: 40)
            Range(:info, min: 0, max: 100, value: 40)
            Range(:success, min: 0, max: 100, value: 40)
            Range(:warning, min: 0, max: 100, value: 40)
            Range(:error, min: 0, max: 100, value: 40)
          end
        end
      end
    end
  end
end
