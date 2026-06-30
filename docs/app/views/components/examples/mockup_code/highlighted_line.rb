# frozen_string_literal: true

module Views
  module Components
    module Examples
      module MockupCode
        class HighlightedLine < Views::Components::Example
          include DaisyUI

          title "Highlighted line"
          order 3

          def example
            MockupCode(class: "w-full") do
              pre(data: { prefix: "1" }) { code { "npm i daisyui" } }
              pre(data: { prefix: "2" }) { code { "installing..." } }
              pre(data: { prefix: "3" }, class: "bg-warning text-warning-content") { code { "Error!" } }
            end
          end
        end
      end
    end
  end
end
