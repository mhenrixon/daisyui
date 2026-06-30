# frozen_string_literal: true

module Views
  module Components
    module Examples
      module MockupCode
        class WithoutPrefix < Views::Components::Example
          include DaisyUI

          title "Without prefix"
          order 4

          def example
            MockupCode(class: "w-full") do
              pre { code { "without prefix" } }
            end
          end
        end
      end
    end
  end
end
