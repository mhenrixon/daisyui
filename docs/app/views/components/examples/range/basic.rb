# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Range
        class Basic < Views::Components::Example
          include DaisyUI

          title "Range"
          order 1

          def example
            Range(min: 0, max: 100, value: 40)
          end
        end
      end
    end
  end
end
