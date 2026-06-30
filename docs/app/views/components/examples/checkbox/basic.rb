# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Checkbox
        class Basic < Views::Components::Example
          include DaisyUI

          title "Checkbox"
          order 1

          def example
            Checkbox(checked: true)
          end
        end
      end
    end
  end
end
