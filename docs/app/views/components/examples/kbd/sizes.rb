# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Kbd
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Kbd sizes"
          order 2

          def example
            Kbd(:xs) { "Xsmall" }
            Kbd(:sm) { "Small" }
            Kbd(:md) { "Medium" }
            Kbd(:lg) { "Large" }
            Kbd(:xl) { "Xlarge" }
          end
        end
      end
    end
  end
end
