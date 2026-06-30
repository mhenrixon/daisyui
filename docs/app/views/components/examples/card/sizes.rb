# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Card
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Card sizes"
          order 6

          def example
            [:xs, :sm, :md, :lg, :xl].each do |size|
              Card(size, class: "w-96 bg-base-100 shadow-sm") do |c|
                c.body do
                  c.title { "#{size.to_s.capitalize} Card" }
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
end
