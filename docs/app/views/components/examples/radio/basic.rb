# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Radio
        class Basic < Views::Components::Example
          include DaisyUI

          title "Radio"
          order 1

          def example
            Radio(name: "radio-1", checked: true)
            Radio(name: "radio-1")
          end
        end
      end
    end
  end
end
