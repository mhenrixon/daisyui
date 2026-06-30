# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Indicator
        class Status < Views::Components::Example
          include DaisyUI

          title "Status indicator"
          order 4

          def example
            Indicator do |indicator|
              indicator.item(class: "status status-success")
              div(class: "bg-base-300 grid h-32 w-32 place-items-center") { "content" }
            end
          end
        end
      end
    end
  end
end
