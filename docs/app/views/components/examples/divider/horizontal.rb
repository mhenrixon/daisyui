# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Divider
        class Horizontal < Views::Components::Example
          include DaisyUI

          title "Divider horizontal"
          order 2

          def example
            div(class: "flex w-full") do
              div(class: "card bg-base-300 rounded-box grid h-20 grow place-items-center") { "content" }
              Divider(:horizontal) { "OR" }
              div(class: "card bg-base-300 rounded-box grid h-20 grow place-items-center") { "content" }
            end
          end
        end
      end
    end
  end
end
