# frozen_string_literal: true

module Views
  module Components
    module Examples
      module FileInput
        class Disabled < Views::Components::Example
          include DaisyUI

          title "Disabled"
          order 5

          def example
            FileInput(disabled: true)
          end
        end
      end
    end
  end
end
