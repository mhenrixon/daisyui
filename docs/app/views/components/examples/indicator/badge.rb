# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Indicator
        class Badge < Views::Components::Example
          include DaisyUI

          title "Badge as indicator"
          order 1

          def example
            Indicator do |indicator|
              indicator.item(class: "badge badge-primary") { "New" }
              div(class: "bg-base-300 grid h-32 w-32 place-items-center") { "content" }
            end
          end
        end
      end
    end
  end
end
