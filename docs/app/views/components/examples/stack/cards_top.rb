# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Stack
        class CardsTop < Views::Components::Example
          include DaisyUI

          title "Stacked cards (top direction)"
          order 3

          def example
            Stack(:top, class: "size-28") do
              Card(class: "border-base-content bg-base-100 border text-center") do |card|
                card.body { "A" }
              end
              Card(class: "border-base-content bg-base-100 border text-center") do |card|
                card.body { "B" }
              end
              Card(class: "border-base-content bg-base-100 border text-center") do |card|
                card.body { "C" }
              end
            end
          end
        end
      end
    end
  end
end
