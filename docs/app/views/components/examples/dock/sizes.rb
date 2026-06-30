# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Dock
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Dock sizes"
          order 2

          def example
            [:xs, :sm, :md, :lg, :xl].each do |size|
              Dock(size) do |d|
                button do
                  span { "🏠" }
                  d.label { "Home" }
                end
                button(class: "dock-active") do
                  span { "📥" }
                  d.label { "Inbox" }
                end
                button do
                  span { "⚙️" }
                  d.label { "Settings" }
                end
              end
            end
          end
        end
      end
    end
  end
end
