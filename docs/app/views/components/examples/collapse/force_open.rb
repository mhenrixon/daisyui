# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Collapse
        class ForceOpen < Views::Components::Example
          include DaisyUI

          title "Collapse force open"
          order 3

          def example
            Collapse(:open, tabindex: 0, class: "bg-base-100 border border-base-300") do |c|
              c.title(class: "font-semibold") { "I have collapse-open class" }
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
