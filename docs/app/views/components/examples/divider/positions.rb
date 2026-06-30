# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Divider
        class Positions < Views::Components::Example
          include DaisyUI

          title "Divider in different positions"
          order 3

          def example
            div(class: "flex w-full flex-col") do
              Divider(:start) { "Start" }
              Divider { "Default" }
              Divider(:end) { "End" }
            end
          end
        end
      end
    end
  end
end
