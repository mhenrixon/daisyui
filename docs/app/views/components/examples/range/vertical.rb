# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Range
        class Vertical < Views::Components::Example
          include DaisyUI

          title "Vertical"
          order 4

          def example
            Range(:vertical, :primary, min: 0, max: 100, value: 40)
          end
        end
      end
    end
  end
end
