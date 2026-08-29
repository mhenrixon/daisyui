# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Tooltip
        class Popover < Views::Components::Example
          include DaisyUI

          title "Viewport-aware popover"
          order 6

          def example
            div(class: "flex w-full justify-between overflow-hidden p-2") do
              Tooltip(:popover, tip: "The tooltip remains visible at the left viewport edge", popover_id: "left_edge_tooltip") do
                Button { "Left edge" }
              end

              Tooltip(:popover, tip: "The tooltip remains visible at the right viewport edge", popover_id: "right_edge_tooltip") do
                Button { "Right edge" }
              end
            end
          end
        end
      end
    end
  end
end
