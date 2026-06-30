# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Select
        class Colors < Views::Components::Example
          include DaisyUI

          title "Colors"
          order 2

          def example
            [:neutral, :primary, :secondary, :accent, :info, :success, :warning, :error].each do |color|
              Select(color) do
                option(disabled: true, selected: true) { color.to_s.capitalize }
                option { "Option A" }
                option { "Option B" }
              end
            end
          end
        end
      end
    end
  end
end
