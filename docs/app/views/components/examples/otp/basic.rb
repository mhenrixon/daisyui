# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Otp
        class Basic < Views::Components::Example
          include DaisyUI

          title "OTP input"
          order 1

          def example
            Otp(digits: 4)
          end
        end
      end
    end
  end
end
