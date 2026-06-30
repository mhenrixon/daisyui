# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Stat
        class Centered < Views::Components::Example
          include DaisyUI

          title "Centered items"
          order 3

          def example
            Stat(class: "shadow") do |s|
              s.item(class: "place-items-center") do
                s.title { "Downloads" }
                s.value { "31K" }
                s.desc { "From January 1st to February 1st" }
              end
              s.item(class: "place-items-center") do
                s.title { "Users" }
                s.value(class: "text-secondary") { "4,200" }
                s.desc(class: "text-secondary") { "↗︎ 40 (2%)" }
              end
              s.item(class: "place-items-center") do
                s.title { "New Registers" }
                s.value { "1,200" }
                s.desc { "↘︎ 90 (14%)" }
              end
            end
          end
        end
      end
    end
  end
end
