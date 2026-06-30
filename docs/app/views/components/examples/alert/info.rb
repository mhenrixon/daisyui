# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Alert
        class Info < Views::Components::Example
          include DaisyUI

          title "Info color"
          order 2

          def example
            Alert(:info) do
              render Views::Icon.new("info", class: "h-6 w-6 shrink-0 stroke-current")
              span { "New software update available." }
            end
          end
        end
      end
    end
  end
end
