# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Fab
        class SpeedDial < Views::Components::Example
          include DaisyUI

          title "FAB and speed dial with labels"
          order 2

          def example
            Fab do
              div(tabindex: 0, role: :button, class: "btn btn-lg btn-circle btn-primary") { "F" }
              div do
                plain "Label A "
                Button(:lg, :circle) { "A" }
              end
              div do
                plain "Label B "
                Button(:lg, :circle) { "B" }
              end
              div do
                plain "Label C "
                Button(:lg, :circle) { "C" }
              end
            end
          end
        end
      end
    end
  end
end
