# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Toggle
        class Basic < Views::Components::Example
          include DaisyUI

          title "Toggle"
          order 1

          def example
            Toggle(checked: true)
          end
        end
      end
    end
  end
end
