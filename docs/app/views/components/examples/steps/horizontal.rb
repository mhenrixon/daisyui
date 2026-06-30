# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Steps
        class Horizontal < Views::Components::Example
          include DaisyUI

          title "Steps"
          order 1

          def example
            Steps do |s|
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
