# frozen_string_literal: true

module Views
  module Components
    module Examples
      module FormControl
        class Basic < Views::Components::Example
          include DaisyUI

          title "Form control"
          order 1

          def example
            FormControl(class: "w-full max-w-xs") do
              label(class: "label") { "What is your name?" }
              Input(type: "text", class: "w-full", placeholder: "Type here")
            end
          end
        end
      end
    end
  end
end
