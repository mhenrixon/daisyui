# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Input
        class Colors < Views::Components::Example
          include DaisyUI

          title "Colors"
          order 2

          def example
            Input(:neutral, type: "text", placeholder: "Neutral")
            Input(:primary, type: "text", placeholder: "Primary")
            Input(:secondary, type: "text", placeholder: "Secondary")
            Input(:accent, type: "text", placeholder: "Accent")
            Input(:info, type: "text", placeholder: "Info")
            Input(:success, type: "text", placeholder: "Success")
            Input(:warning, type: "text", placeholder: "Warning")
            Input(:error, type: "text", placeholder: "Error")
          end
        end
      end
    end
  end
end
