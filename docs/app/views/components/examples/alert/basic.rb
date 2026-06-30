# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Alert
        class Basic < Views::Components::Example
          include DaisyUI

          title "Alert"
          order 1

          def example
            Alert do
              render Views::Icon.new("info", class: "stroke-info h-6 w-6 shrink-0")
              span { "12 unread messages. Tap to see." }
            end
          end
        end
      end
    end
  end
end
