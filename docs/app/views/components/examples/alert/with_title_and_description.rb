# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Alert
        class WithTitleAndDescription < Views::Components::Example
          include DaisyUI

          title "With title and description"
          order 9

          def example
            Alert(:vertical, responsive: { sm: :horizontal }) do
              render ::Docs::Icon.new("info", class: "stroke-info h-6 w-6 shrink-0")
              div do
                h3(class: "font-bold") { "New message!" }
                div(class: "text-xs") { "You have 1 unread message" }
              end
              Button(:sm) { "See" }
            end
          end
        end
      end
    end
  end
end
