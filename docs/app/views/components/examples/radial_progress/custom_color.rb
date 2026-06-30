# frozen_string_literal: true

module Views
  module Components
    module Examples
      module RadialProgress
        class CustomColor < Views::Components::Example
          include DaisyUI

          title "Custom color"
          order 3

          def example
            RadialProgress(:primary_outline, value: 70) { "70%" }
          end
        end
      end
    end
  end
end
