# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Stat
        class Vertical < Views::Components::Example
          include DaisyUI

          title "Vertical"
          order 2

          def example
            Stat(:vertical, class: "shadow") do |s|
              s.item do
                s.title { "Downloads" }
                s.value { "31K" }
                s.desc { "Jan 1st - Feb 1st" }
              end
              s.item do
                s.title { "New Users" }
                s.value { "4,200" }
                s.desc { "↗︎ 400 (22%)" }
              end
              s.item do
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
