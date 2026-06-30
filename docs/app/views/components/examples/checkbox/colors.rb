# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Checkbox
        class Colors < Views::Components::Example
          include DaisyUI

          title "Colors"
          order 2

          def example
            Checkbox(:primary, checked: true)
            Checkbox(:secondary, checked: true)
            Checkbox(:accent, checked: true)
            Checkbox(:neutral, checked: true)
            Checkbox(:info, checked: true)
            Checkbox(:success, checked: true)
            Checkbox(:warning, checked: true)
            Checkbox(:error, checked: true)
          end
        end
      end
    end
  end
end
