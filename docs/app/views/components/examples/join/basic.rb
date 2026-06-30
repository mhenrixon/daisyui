# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Join
        class Basic < Views::Components::Example
          include DaisyUI

          title "Join"
          order 1

          def example
            Join do
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
