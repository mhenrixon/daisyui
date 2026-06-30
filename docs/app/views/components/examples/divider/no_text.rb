# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Divider
        class NoText < Views::Components::Example
          include DaisyUI

          title "Divider with no text"
          order 5

          def example
            div(class: "flex w-full flex-col") do
              div(class: "card bg-base-300 rounded-box grid h-20 place-items-center") { "content" }
              div(class: "card bg-base-300 rounded-box grid h-20 place-items-center") { "content" }
            end
          end
        end
      end
    end
  end
end
