# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Fab
        class Flower < Views::Components::Example
          include DaisyUI

          title "FAB flower and speed dial"
          order 5

          def example
            Fab(:flower) do
              div(tabindex: 0, role: :button, class: "btn btn-lg btn-circle btn-success") { "F" }
              Button(:circle, :lg, class: "fab-main-action") { "M" }
              Button(:lg, :circle) { "A" }
              Button(:lg, :circle) { "B" }
              Button(:lg, :circle) { "C" }
              Button(:lg, :circle) { "D" }
            end
          end
        end
      end
    end
  end
end
