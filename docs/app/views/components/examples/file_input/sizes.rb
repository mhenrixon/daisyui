# frozen_string_literal: true

module Views
  module Components
    module Examples
      module FileInput
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Sizes"
          order 3

          def example
            FileInput(:xs)
            FileInput(:sm)
            FileInput(:md)
            FileInput(:lg)
            FileInput(:xl)
          end
        end
      end
    end
  end
end
