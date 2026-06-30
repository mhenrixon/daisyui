# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Diff
        class Text < Views::Components::Example
          include DaisyUI

          title "Diff text"
          order 2

          def example
            Diff(class: "aspect-16/9", tabindex: "0") do |d|
              d.item_1(role: "img", tabindex: "0") do
                div(class: "bg-primary text-primary-content grid place-content-center text-9xl font-black") do
                  "DAISY"
                end
              end
              d.item_2(role: "img") do
                div(class: "bg-base-200 grid place-content-center text-9xl font-black") { "DAISY" }
              end
              d.resizer
            end
          end
        end
      end
    end
  end
end
