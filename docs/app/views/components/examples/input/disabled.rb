# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Input
        class Disabled < Views::Components::Example
          include DaisyUI

          title "Disabled"
          order 5

          def example
            Input(type: "text", placeholder: "You can't touch this", disabled: true)
          end
        end
      end
    end
  end
end
