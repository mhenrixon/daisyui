# frozen_string_literal: true

module Views
  module Components
    module Examples
      module RadialProgress
        class Basic < Views::Components::Example
          include DaisyUI

          title "Radial progress"
          order 1

          def example
            RadialProgress(value: 70) { "70%" }
          end
        end
      end
    end
  end
end
