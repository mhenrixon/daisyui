# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Timeline
        class Vertical < Views::Components::Example
          include DaisyUI

          title "Vertical timeline with different sides"
          order 2

          EVENTS = [
            [:start, "First Macintosh computer"],
            [:end, "iMac"],
            [:start, "iPod"],
            [:end, "iPhone"],
            [:start, "Apple Watch"],
          ].freeze

          def example
            Timeline(:vertical) do |t|
              EVENTS.each_with_index do |(side, label), index|
                li do
                  hr if index.positive?
                  t.public_send(side, class: "timeline-box") { label }
                  t.middle { check_icon }
                  hr unless index == EVENTS.length - 1
                end
              end
            end
          end

          private

          def check_icon
            svg(xmlns: "http://www.w3.org/2000/svg", viewBox: "0 0 20 20", fill: "currentColor", class: "h-5 w-5") do |s|
              s.path(fill_rule: "evenodd", clip_rule: "evenodd",
                     d: "M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 " \
                        "4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z")
            end
          end
        end
      end
    end
  end
end
