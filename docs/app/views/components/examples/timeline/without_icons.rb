# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Timeline
        class WithoutIcons < Views::Components::Example
          include DaisyUI

          title "Timeline without icons"
          order 3

          EVENTS = [
            [:start, "First Macintosh computer"],
            [:end, "iMac"],
            [:start, "iPod"],
            [:end, "iPhone"],
            [:start, "Apple Watch"],
          ].freeze

          def example
            Timeline do |t|
              EVENTS.each_with_index do |(side, label), index|
                li do
                  hr if index.positive?
                  t.public_send(side, class: "timeline-box") { label }
                  hr unless index == EVENTS.length - 1
                end
              end
            end
          end
        end
      end
    end
  end
end
