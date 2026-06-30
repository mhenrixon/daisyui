# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Badge
        class Colors < Views::Components::Example
          include DaisyUI

          title "Badge with colors"
          order 2

          def example
            Badge(:primary) { "Primary" }
            Badge(:secondary) { "Secondary" }
            Badge(:accent) { "Accent" }
            Badge(:neutral) { "Neutral" }
            Badge(:info) { "Info" }
            Badge(:success) { "Success" }
            Badge(:warning) { "Warning" }
            Badge(:error) { "Error" }
          end
        end
      end
    end
  end
end
