# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Countdown
        class LargeTextWith2Digits < Views::Components::Example
          include DaisyUI

          title "Large text with 2 digits"
          order 3

          def example
            Countdown(class: "font-mono text-6xl") do
              span(style: "--value:59; --digits: 2;", aria_live: "polite", aria_label: "59") { "59" }
            end
          end
        end
      end
    end
  end
end
