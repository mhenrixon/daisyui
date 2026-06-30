# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Toggle
        class Disabled < Views::Components::Example
          include DaisyUI

          title "Disabled"
          order 4

          def example
            Toggle(disabled: true)
            Toggle(disabled: true, checked: true)
          end
        end
      end
    end
  end
end
