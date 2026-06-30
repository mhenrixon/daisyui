# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Progress
        class Indeterminate < Views::Components::Example
          include DaisyUI

          title "Indeterminate (without value)"
          order 4

          def example
            Progress(class: "w-56")
          end
        end
      end
    end
  end
end
