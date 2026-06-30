# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Button
        class Basic < Views::Components::Example
          include DaisyUI

          title "Button"
          order 1

          def example
            Button { "Button" }
          end
        end
      end
    end
  end
end
