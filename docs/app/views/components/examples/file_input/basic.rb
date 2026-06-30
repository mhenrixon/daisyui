# frozen_string_literal: true

module Views
  module Components
    module Examples
      module FileInput
        class Basic < Views::Components::Example
          include DaisyUI

          title "File input"
          order 1

          def example
            FileInput()
          end
        end
      end
    end
  end
end
