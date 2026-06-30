# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Tooltip
        class Basic < Views::Components::Example
          include DaisyUI

          title "Tooltip"
          order 1

          def example
            Tooltip(tip: "hello") do
              Button { "Hover me" }
            end
          end
        end
      end
    end
  end
end
