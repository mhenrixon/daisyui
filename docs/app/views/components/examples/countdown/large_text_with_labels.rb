# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Countdown
        class LargeTextWithLabels < Views::Components::Example
          include DaisyUI

          title "Large text with labels"
          order 4

          def example
            div(class: "flex gap-5") do
              div do
                Countdown(class: "font-mono text-4xl") do
                  span(style: "--value:15;", aria_live: "polite", aria_label: "15") { "15" }
                end
                plain "days"
              end
              div do
                Countdown(class: "font-mono text-4xl") do
                  span(style: "--value:10;", aria_live: "polite", aria_label: "10") { "10" }
                end
                plain "hours"
              end
              div do
                Countdown(class: "font-mono text-4xl") do
                  span(style: "--value:24;", aria_live: "polite", aria_label: "24") { "24" }
                end
                plain "min"
              end
              div do
                Countdown(class: "font-mono text-4xl") do
                  span(style: "--value:59;", aria_live: "polite", aria_label: "59") { "59" }
                end
                plain "sec"
              end
            end
          end
        end
      end
    end
  end
end
