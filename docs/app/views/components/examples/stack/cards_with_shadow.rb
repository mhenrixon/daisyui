# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Stack
        class CardsWithShadow < Views::Components::Example
          include DaisyUI

          title "Stacked cards with shadow"
          order 4

          def example
            Stack do
              Card(class: "bg-base-200 text-center shadow-md") do |card|
                card.body { "A" }
              end
              Card(class: "bg-base-200 text-center shadow") do |card|
                card.body { "B" }
              end
              Card(class: "bg-base-200 text-center shadow-sm") do |card|
                card.body { "C" }
              end
            end
          end
        end
      end
    end
  end
end
