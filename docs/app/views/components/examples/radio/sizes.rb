# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Radio
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Sizes"
          order 3

          def example
            Radio(:xs, name: "radio-sizes", checked: true)
            Radio(:sm, name: "radio-sizes", checked: true)
            Radio(:md, name: "radio-sizes", checked: true)
            Radio(:lg, name: "radio-sizes", checked: true)
            Radio(:xl, name: "radio-sizes", checked: true)
          end
        end
      end
    end
  end
end
