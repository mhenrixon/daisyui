# frozen_string_literal: true

module Views
  module Components
    module Examples
      module FormControl
        class WithHelperText < Views::Components::Example
          include DaisyUI

          title "With helper text"
          order 2

          def example
            FormControl(class: "w-full max-w-xs") do
              label(class: "label") { "Your email" }
              Input(type: "email", class: "w-full", placeholder: "email@example.com")
              span(class: "label") { "We'll never share your email." }
            end
          end
        end
      end
    end
  end
end
