# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Collapse
        class Arrow < Views::Components::Example
          include DaisyUI

          title "Collapse with arrow icon"
          order 1

          def example
            Collapse(:arrow, tabindex: 0, class: "bg-base-100 border border-base-300") do |c|
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
