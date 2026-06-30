# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Card
        class Border < Views::Components::Example
          include DaisyUI

          title "Card with a card-border"
          order 3

          def example
            Card(:border, class: "bg-base-100 w-96") do |c|
              c.body do
                c.title { "Card Title" }
                p { "A card component has a figure, a body part, and inside body there are title and actions parts" }
                c.actions(class: "justify-end") do
                  Button(:primary) { "Buy Now" }
                end
              end
            end
          end
        end
      end
    end
  end
end
