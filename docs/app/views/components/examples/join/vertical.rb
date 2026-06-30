# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Join
        class Vertical < Views::Components::Example
          include DaisyUI

          title "Group items vertically"
          order 2

          def example
            Join(:vertical) do
              Button(class: "join-item") { "Button" }
              Button(class: "join-item") { "Button" }
              Button(class: "join-item") { "Button" }
            end
          end
        end
      end
    end
  end
end
