# frozen_string_literal: true

module Views
  module Components
    module Examples
      module FileInput
        class Colors < Views::Components::Example
          include DaisyUI

          title "Colors"
          order 2

          def example
            FileInput(:primary)
            FileInput(:secondary)
            FileInput(:accent)
            FileInput(:neutral)
            FileInput(:info)
            FileInput(:success)
            FileInput(:warning)
            FileInput(:error)
          end
        end
      end
    end
  end
end
