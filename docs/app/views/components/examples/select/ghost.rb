# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Select
        class Ghost < Views::Components::Example
          include DaisyUI

          title "Ghost (no background)"
          order 4

          def example
            Select(:ghost) do
              option(disabled: true, selected: true) { "Pick a font" }
              option { "Inter" }
              option { "Poppins" }
              option { "Raleway" }
            end
          end
        end
      end
    end
  end
end
