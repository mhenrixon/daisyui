# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Alert
        class Success < Views::Components::Example
          include DaisyUI

          title "Success color"
          order 3

          def example
            Alert(:success) do
              DocsUI::Icon("circle-check", class: "h-6 w-6 shrink-0 stroke-current")
              span { "Your purchase has been confirmed!" }
            end
          end
        end
      end
    end
  end
end
