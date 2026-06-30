# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Input
        class Ghost < Views::Components::Example
          include DaisyUI

          title "Ghost style"
          order 4

          def example
            Input(:ghost, type: "text", placeholder: "Type here")
          end
        end
      end
    end
  end
end
