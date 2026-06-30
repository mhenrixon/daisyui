# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Steps
        class Vertical < Views::Components::Example
          include DaisyUI

          title "Vertical steps"
          order 2

          def example
            Steps(:vertical) do |s|
              s.step(:primary) { "Register" }
              s.step(:primary) { "Choose plan" }
              s.step { "Purchase" }
              s.step { "Receive Product" }
            end
          end
        end
      end
    end
  end
end
