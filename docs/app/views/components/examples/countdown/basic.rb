# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Countdown
        class Basic < Views::Components::Example
          include DaisyUI

          title "Countdown"
          order 1

          def example
            Countdown do
              span(style: "--value:59;", aria_live: "polite", aria_label: "59") { "59" }
            end
          end
        end
      end
    end
  end
end
