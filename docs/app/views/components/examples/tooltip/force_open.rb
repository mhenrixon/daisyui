# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Tooltip
        class ForceOpen < Views::Components::Example
          include DaisyUI

          title "Force open"
          order 2

          def example
            Tooltip(:open, tip: "hello") do
              Button { "Press" }
            end
          end
        end
      end
    end
  end
end
