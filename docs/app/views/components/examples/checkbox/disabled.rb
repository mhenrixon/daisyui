# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Checkbox
        class Disabled < Views::Components::Example
          include DaisyUI

          title "Disabled"
          order 4

          def example
            Checkbox(disabled: true)
            Checkbox(disabled: true, checked: true)
          end
        end
      end
    end
  end
end
