# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Range
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Sizes"
          order 3

          def example
            Range(:xs, min: 0, max: 100, value: 30)
            Range(:sm, min: 0, max: 100, value: 40)
            Range(:md, min: 0, max: 100, value: 50)
            Range(:lg, min: 0, max: 100, value: 60)
            Range(:xl, min: 0, max: 100, value: 70)
          end
        end
      end
    end
  end
end
