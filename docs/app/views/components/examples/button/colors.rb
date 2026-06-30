# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Button
        class Colors < Views::Components::Example
          include DaisyUI

          title "Buttons with colors"
          order 2

          def example
            Button(:neutral) { "Neutral" }
            Button(:primary) { "Primary" }
            Button(:secondary) { "Secondary" }
            Button(:accent) { "Accent" }
            Button(:info) { "Info" }
            Button(:success) { "Success" }
            Button(:warning) { "Warning" }
            Button(:error) { "Error" }
          end
        end
      end
    end
  end
end
