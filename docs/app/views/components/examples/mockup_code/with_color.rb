# frozen_string_literal: true

module Views
  module Components
    module Examples
      module MockupCode
        class WithColor < Views::Components::Example
          include DaisyUI

          title "With color"
          order 5

          def example
            MockupCode(class: "bg-primary text-primary-content w-full") do
              pre { code { "can be any color!" } }
            end
          end
        end
      end
    end
  end
end
