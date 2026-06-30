# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Divider
        class Basic < Views::Components::Example
          include DaisyUI

          title "Divider"
          order 1

          def example
            div(class: "flex w-full flex-col") do
              div(class: "card bg-base-300 rounded-box grid h-20 place-items-center") { "content" }
              Divider { "OR" }
              div(class: "card bg-base-300 rounded-box grid h-20 place-items-center") { "content" }
            end
          end
        end
      end
    end
  end
end
