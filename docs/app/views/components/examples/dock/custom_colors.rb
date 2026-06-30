# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Dock
        class CustomColors < Views::Components::Example
          include DaisyUI

          title "Dock with custom colors"
          order 3

          def example
            Dock(class: "bg-neutral text-neutral-content") do |d|
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
