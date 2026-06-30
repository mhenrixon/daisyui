# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Tooltip
        class Placement < Views::Components::Example
          include DaisyUI

          title "Placement (top, bottom, left, right)"
          order 3

          def example
            Tooltip(:top, tip: "top") { Button { "Top" } }
            Tooltip(:bottom, tip: "bottom") { Button { "Bottom" } }
            Tooltip(:left, tip: "left") { Button { "Left" } }
            Tooltip(:right, tip: "right") { Button { "Right" } }
          end
        end
      end
    end
  end
end
