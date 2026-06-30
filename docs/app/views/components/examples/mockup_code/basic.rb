# frozen_string_literal: true

module Views
  module Components
    module Examples
      module MockupCode
        class Basic < Views::Components::Example
          include DaisyUI

          title "Mockup code with line prefix"
          order 1

          def example
            MockupCode(class: "w-full") do
              pre(data: { prefix: "$" }) { code { "npm i daisyui" } }
            end
          end
        end
      end
    end
  end
end
