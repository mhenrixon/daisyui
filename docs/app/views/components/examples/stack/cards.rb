# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Stack
        class Cards < Views::Components::Example
          include DaisyUI

          title "Stacked cards"
          order 2

          def example
            Stack do
              Card(class: "shadow-md bg-base-100") do |card|
                card.body do
                  card.title { "Notification 1" }
                  p { "You have 3 unread messages. Tap here to see." }
                end
              end
              Card(class: "shadow-md bg-base-100") do |card|
                card.body do
                  card.title { "Notification 2" }
                  p { "You have 3 unread messages. Tap here to see." }
                end
              end
              Card(class: "shadow-md bg-base-100") do |card|
                card.body do
                  card.title { "Notification 3" }
                  p { "You have 3 unread messages. Tap here to see." }
                end
              end
            end
          end
        end
      end
    end
  end
end
