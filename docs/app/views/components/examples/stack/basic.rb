# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Stack
        class Basic < Views::Components::Example
          include DaisyUI

          title "Three divs in a stack"
          order 1

          def example
            Stack(class: "h-20 w-32") do
              div(class: "bg-primary text-primary-content grid place-content-center rounded-box") { "1" }
              div(class: "bg-accent text-accent-content grid place-content-center rounded-box") { "2" }
              div(class: "bg-secondary text-secondary-content grid place-content-center rounded-box") { "3" }
            end
          end
        end
      end
    end
  end
end
