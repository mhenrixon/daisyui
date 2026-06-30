# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Collapse
        class Plain < Views::Components::Example
          include DaisyUI

          title "Collapse without border and background color"
          order 4

          def example
            Collapse(tabindex: 0) do |c|
              c.title(class: "font-semibold") { "How do I create an account?" }
              c.content(class: "text-sm") do
                p { %(Click the "Sign Up" button in the top right corner and follow the registration process.) }
              end
            end
          end
        end
      end
    end
  end
end
