# frozen_string_literal: true

module Views
  module Components
    module Examples
      module MockupCode
        class MultiLine < Views::Components::Example
          include DaisyUI

          title "Multi line"
          order 2

          def example
            MockupCode(class: "w-full") do
              pre(data: { prefix: "$" }) { code { "npm i daisyui" } }
              pre(data: { prefix: ">" }, class: "text-warning") { code { "installing..." } }
              pre(data: { prefix: ">" }, class: "text-success") { code { "Done!" } }
            end
          end
        end
      end
    end
  end
end
