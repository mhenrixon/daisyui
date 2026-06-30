# frozen_string_literal: true

module Views
  module Components
    module Examples
      module RadialProgress
        class WithBackgroundAndBorder < Views::Components::Example
          include DaisyUI

          title "With background color and border"
          order 5

          def example
            RadialProgress(:primary, value: 70, class: "border-4") { "70%" }
          end
        end
      end
    end
  end
end
