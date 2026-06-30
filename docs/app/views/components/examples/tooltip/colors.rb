# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Tooltip
        class Colors < Views::Components::Example
          include DaisyUI

          title "Tooltip with colors"
          order 4

          def example
            Tooltip(:primary, :open, tip: "primary") { Button(:primary) { "Primary" } }
            Tooltip(:secondary, :open, tip: "secondary") { Button(:secondary) { "Secondary" } }
            Tooltip(:accent, :open, tip: "accent") { Button(:accent) { "Accent" } }
            Tooltip(:info, :open, tip: "info") { Button(:info) { "Info" } }
            Tooltip(:success, :open, tip: "success") { Button(:success) { "Success" } }
            Tooltip(:warning, :open, tip: "warning") { Button(:warning) { "Warning" } }
            Tooltip(:error, :open, tip: "error") { Button(:error) { "Error" } }
          end
        end
      end
    end
  end
end
