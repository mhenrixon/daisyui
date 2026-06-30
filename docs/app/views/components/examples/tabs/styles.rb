# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Tabs
        class Styles < Views::Components::Example
          include DaisyUI

          title "Tab styles"
          order 4

          def example
            div(class: "flex flex-col gap-4") do
              [nil, :box, :border, :lift].each do |style|
                args = style ? [style] : []
                Tabs(*args) do
                  a(role: :tab, class: "tab") { "Tab 1" }
                  a(role: :tab, class: "tab tab-active") { "Tab 2" }
                  a(role: :tab, class: "tab") { "Tab 3" }
                end
              end
            end
          end
        end
      end
    end
  end
end
