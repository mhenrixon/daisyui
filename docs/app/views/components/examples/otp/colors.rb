# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Otp
        class Colors < Views::Components::Example
          include DaisyUI

          title "Colors"
          order 4

          def example
            Otp(:primary, digits: 4)
            Otp(:secondary, digits: 4)
            Otp(:accent, digits: 4)
            Otp(:success, digits: 4)
            Otp(:warning, digits: 4)
            Otp(:error, digits: 4)
          end
        end
      end
    end
  end
end
