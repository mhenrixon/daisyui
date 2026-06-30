# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Otp
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Sizes"
          order 3

          def example
            Otp(:xs, digits: 4)
            Otp(:sm, digits: 4)
            Otp(:md, digits: 4)
            Otp(:lg, digits: 4)
            Otp(:xl, digits: 4)
          end
        end
      end
    end
  end
end
