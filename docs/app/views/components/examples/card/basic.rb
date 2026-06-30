# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Card
        class Basic < Views::Components::Example
          include DaisyUI

          title "Card"
          order 1

          def example
            Card(class: "bg-base-100 w-96 shadow-sm") do |c|
              figure do
                img(src: "https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp", alt: "Shoes")
              end
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
