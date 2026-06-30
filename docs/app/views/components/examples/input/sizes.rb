# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Input
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Sizes"
          order 3

          def example
            Input(:xs, type: "text", placeholder: "Xsmall")
            Input(:sm, type: "text", placeholder: "Small")
            Input(:md, type: "text", placeholder: "Medium")
            Input(:lg, type: "text", placeholder: "Large")
            Input(:xl, type: "text", placeholder: "Xlarge")
          end
        end
      end
    end
  end
end
