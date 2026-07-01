# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Alert
        class Warning < Views::Components::Example
          include DaisyUI

          title "Warning color"
          order 4

          def example
            Alert(:warning) do
              DocsUI::Icon("triangle-alert", class: "h-6 w-6 shrink-0 stroke-current")
              span { "Warning: Invalid email address!" }
            end
          end
        end
      end
    end
  end
end
