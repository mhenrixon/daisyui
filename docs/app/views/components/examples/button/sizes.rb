# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Button
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Button sizes"
          order 3

          def example
            Button(:xs) { "Xsmall" }
            Button(:sm) { "Small" }
            Button { "Medium" }
            Button(:lg) { "Large" }
            Button(:xl) { "Xlarge" }
          end
        end
      end
    end
  end
end
