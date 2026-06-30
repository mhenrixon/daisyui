# frozen_string_literal: true

module Views
  module Components
    module Examples
      module FileInput
        class Ghost < Views::Components::Example
          include DaisyUI

          title "Ghost style"
          order 4

          def example
            FileInput(:ghost)
          end
        end
      end
    end
  end
end
