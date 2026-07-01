# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Alert
        class Error < Views::Components::Example
          include DaisyUI

          title "Error color"
          order 5

          def example
            Alert(:error) do
              render ::Docs::Icon.new("circle-x", class: "h-6 w-6 shrink-0 stroke-current")
              span { "Error! Task failed successfully." }
            end
          end
        end
      end
    end
  end
end
