# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Badge
        class Basic < Views::Components::Example
          include DaisyUI

          title "Badge"
          order 1

          def example
            Badge { "Badge" }
          end
        end
      end
    end
  end
end
