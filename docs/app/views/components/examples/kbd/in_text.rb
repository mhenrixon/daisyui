# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Kbd
        class InText < Views::Components::Example
          include DaisyUI

          title "In text"
          order 3

          def example
            p do
              plain "Press "
              Kbd(:sm) { "F" }
              plain " to pay respects."
            end
          end
        end
      end
    end
  end
end
