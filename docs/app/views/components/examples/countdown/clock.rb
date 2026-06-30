# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Countdown
        class Clock < Views::Components::Example
          include DaisyUI

          title "Clock countdown"
          order 2

          def example
            Countdown(class: "font-mono text-2xl") do
              span(style: "--value:10;", aria_live: "polite", aria_label: "10") { "10" }
              plain "h "
              span(style: "--value:24;", aria_live: "polite", aria_label: "24") { "24" }
              plain "m "
              span(style: "--value:59;", aria_live: "polite", aria_label: "59") { "59" }
              plain "s"
            end
          end
        end
      end
    end
  end
end
