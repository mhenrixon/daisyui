# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Calendar
        class Pikaday < Views::Components::Example
          include DaisyUI

          title "Pikaday date picker"
          order 2

          def example
            Calendar(type: :pikaday, placeholder: "Pick a date")
          end
        end
      end
    end
  end
end
