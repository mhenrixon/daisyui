# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Checkbox
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Sizes"
          order 3

          def example
            Checkbox(:xs, checked: true)
            Checkbox(:sm, checked: true)
            Checkbox(:md, checked: true)
            Checkbox(:lg, checked: true)
            Checkbox(:xl, checked: true)
          end
        end
      end
    end
  end
end
