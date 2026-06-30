# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Label
        class Floating < Views::Components::Example
          include DaisyUI

          title "Floating label"
          order 3

          def example
            Label(:floating) do
              input(type: "text", class: "input", placeholder: "Email")
              span { "Your Email" }
            end
          end
        end
      end
    end
  end
end
