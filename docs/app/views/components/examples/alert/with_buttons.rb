# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Alert
        class WithButtons < Views::Components::Example
          include DaisyUI

          title "With buttons (responsive)"
          order 10

          def example
            Alert(:vertical, responsive: { sm: :horizontal }) do
              render Views::Icon.new("info", class: "stroke-info h-6 w-6 shrink-0")
              span { "we use cookies for no reason." }
              div do
                Button(:sm) { "Deny" }
                Button(:sm, :primary) { "Accept" }
              end
            end
          end
        end
      end
    end
  end
end
