# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Radio
        class Disabled < Views::Components::Example
          include DaisyUI

          title "Disabled"
          order 4

          def example
            Radio(name: "radio-disabled", disabled: true, checked: true)
            Radio(name: "radio-disabled", disabled: true)
          end
        end
      end
    end
  end
end
