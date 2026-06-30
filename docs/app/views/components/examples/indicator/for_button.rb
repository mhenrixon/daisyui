# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Indicator
        class ForButton < Views::Components::Example
          include DaisyUI

          title "Indicator for button"
          order 2

          def example
            Indicator do |indicator|
              indicator.item(class: "badge badge-secondary") { "12" }
              Button { "inbox" }
            end
          end
        end
      end
    end
  end
end
