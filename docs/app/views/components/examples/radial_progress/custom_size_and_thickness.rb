# frozen_string_literal: true

module Views
  module Components
    module Examples
      module RadialProgress
        class CustomSizeAndThickness < Views::Components::Example
          include DaisyUI

          title "Custom size and custom thickness"
          order 4

          def example
            RadialProgress(value: 70, size: "12rem", thickness: "2px") { "70%" }
            RadialProgress(value: 70, size: "12rem", thickness: "2rem") { "70%" }
          end
        end
      end
    end
  end
end
