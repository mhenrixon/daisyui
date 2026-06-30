# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Badge
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Badge sizes"
          order 3

          def example
            Badge(:xs) { "Xsmall" }
            Badge(:sm) { "Small" }
            Badge(:md) { "Medium" }
            Badge(:lg) { "Large" }
            Badge(:xl) { "Xlarge" }
          end
        end
      end
    end
  end
end
