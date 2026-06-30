# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Toggle
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Sizes"
          order 3

          def example
            Toggle(:xs, checked: true)
            Toggle(:sm, checked: true)
            Toggle(:md, checked: true)
            Toggle(:lg, checked: true)
            Toggle(:xl, checked: true)
          end
        end
      end
    end
  end
end
