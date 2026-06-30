# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Textarea
        class Colors < Views::Components::Example
          include DaisyUI

          title "Colors"
          order 2

          def example
            Textarea(:primary, placeholder: "Primary")
            Textarea(:secondary, placeholder: "Secondary")
            Textarea(:accent, placeholder: "Accent")
            Textarea(:neutral, placeholder: "Neutral")
            Textarea(:info, placeholder: "Info")
            Textarea(:success, placeholder: "Success")
            Textarea(:warning, placeholder: "Warning")
            Textarea(:error, placeholder: "Error")
          end
        end
      end
    end
  end
end
