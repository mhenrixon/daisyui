# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Indicator
        class Positions < Views::Components::Example
          include DaisyUI

          title "Indicator at bottom center"
          order 3

          def example
            Indicator do |indicator|
              indicator.item(:bottom, :center, class: "badge badge-secondary")
              div(class: "bg-base-300 grid h-32 w-32 place-items-center") { "content" }
            end
          end
        end
      end
    end
  end
end
