# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Card
        class Side < Views::Components::Example
          include DaisyUI

          title "Card with image on side"
          order 4

          def example
            Card(:side, class: "bg-base-100 shadow-sm") do |c|
              figure do
                img(src: "https://img.daisyui.com/images/stock/photo-1635805737707-575885ab0820.webp", alt: "Movie")
              end
              c.body do
                c.title { "New movie is released!" }
                p { "Click the button to watch on Jetflix app." }
                c.actions(class: "justify-end") do
                  Button(:primary) { "Watch" }
                end
              end
            end
          end
        end
      end
    end
  end
end
