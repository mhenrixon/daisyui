# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Dock
        class Basic < Views::Components::Example
          include DaisyUI

          title "Dock"
          order 1

          def example
            Dock do |d|
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
