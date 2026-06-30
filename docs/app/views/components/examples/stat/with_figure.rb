# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Stat
        class WithFigure < Views::Components::Example
          include DaisyUI

          title "Stat with icons"
          order 4

          def example
            Stat(class: "shadow") do |s|
              s.item do
                s.figure(class: "text-primary") { heart_icon }
                s.title { "Total Likes" }
                s.value(class: "text-primary") { "25.6K" }
                s.desc { "21% more than last month" }
              end
              s.item do
                s.figure(class: "text-secondary") { bolt_icon }
                s.title { "Page Views" }
                s.value(class: "text-secondary") { "2.6M" }
                s.desc { "21% more than last month" }
              end
            end
          end

          private

          def heart_icon
            svg(xmlns: "http://www.w3.org/2000/svg", fill: "none", viewBox: "0 0 24 24",
                class: "inline-block h-8 w-8 stroke-current") do |s|
                  s.path(stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2",
                         d: "M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 " \
                            "00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z")
                end
          end

          def bolt_icon
            svg(xmlns: "http://www.w3.org/2000/svg", fill: "none", viewBox: "0 0 24 24",
                class: "inline-block h-8 w-8 stroke-current") do |s|
                  s.path(stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2",
                         d: "M13 10V3L4 14h7v7l9-11h-7z")
                end
          end
        end
      end
    end
  end
end
