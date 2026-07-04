# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Timeline
        class Colorful < Views::Components::Example
          include DaisyUI

          title "Timeline with colorful lines"
          order 4

          def example
            Timeline do |t|
              li do
                t.start(class: "timeline-box") { "First Macintosh computer" }
                t.middle { check_icon("text-primary") }
                hr(class: "bg-primary")
              end
              li do
                hr(class: "bg-primary")
                t.middle { check_icon("text-primary") }
                t.end(class: "timeline-box") { "iMac" }
                hr(class: "bg-primary")
              end
              li do
                hr(class: "bg-primary")
                t.start(class: "timeline-box") { "iPod" }
                t.middle { check_icon }
                hr
              end
              li do
                hr
                t.middle { check_icon }
                t.end(class: "timeline-box") { "iPhone" }
                hr
              end
              li do
                hr
                t.start(class: "timeline-box") { "Apple Watch" }
                t.middle { check_icon }
              end
            end
          end

          private

          def check_icon(color = nil)
            svg(xmlns: "http://www.w3.org/2000/svg", viewBox: "0 0 20 20", fill: "currentColor",
                class: ["h-5 w-5", color].compact.join(" ")) do |s|
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
