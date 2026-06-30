# frozen_string_literal: true

module Views
  module Components
    module Examples
      module RadialProgress
        class DifferentValues < Views::Components::Example
          include DaisyUI

          title "Different values"
          order 2

          def example
            RadialProgress(value: 0) { "0%" }
            RadialProgress(value: 20) { "20%" }
            RadialProgress(value: 60) { "60%" }
            RadialProgress(value: 80) { "80%" }
            RadialProgress(value: 100) { "100%" }
          end
        end
      end
    end
  end
end
