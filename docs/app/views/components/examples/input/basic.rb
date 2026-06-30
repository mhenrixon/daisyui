# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Input
        class Basic < Views::Components::Example
          include DaisyUI

          title "Input"
          order 1

          def example
            Input(type: "text", placeholder: "Type here")
          end
        end
      end
    end
  end
end
