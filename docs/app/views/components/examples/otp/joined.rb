# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Otp
        class Joined < Views::Components::Example
          include DaisyUI

          title "Joined with 6 digits"
          order 2

          def example
            Otp(:joined, digits: 6)
          end
        end
      end
    end
  end
end
