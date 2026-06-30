# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Fab
        class Basic < Views::Components::Example
          include DaisyUI

          title "A single FAB"
          order 1

          def example
            Fab do
              Button(:lg, :circle, :primary) { "F" }
            end
          end
        end
      end
    end
  end
end
