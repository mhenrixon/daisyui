# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Divider
        class Colors < Views::Components::Example
          include DaisyUI

          title "Divider with colors"
          order 4

          def example
            div(class: "flex w-full flex-col") do
              Divider { "Default" }
              Divider(:neutral) { "Neutral" }
              Divider(:primary) { "Primary" }
              Divider(:secondary) { "Secondary" }
              Divider(:accent) { "Accent" }
              Divider(:success) { "Success" }
              Divider(:warning) { "Warning" }
              Divider(:info) { "Info" }
              Divider(:error) { "Error" }
            end
          end
        end
      end
    end
  end
end
