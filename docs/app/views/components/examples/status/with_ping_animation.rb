# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Status
        class WithPingAnimation < Views::Components::Example
          include DaisyUI

          title "With ping animation"
          order 4

          def example
            div(class: "inline-grid *:[grid-area:1/1]") do
              Status(:error, class: "animate-ping")
              Status(:error)
            end
            plain " Server is down"
          end
        end
      end
    end
  end
end
