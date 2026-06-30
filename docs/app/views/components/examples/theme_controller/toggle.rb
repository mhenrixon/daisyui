# frozen_string_literal: true

module Views
  module Components
    module Examples
      module ThemeController
        class Toggle < Views::Components::Example
          include DaisyUI

          title "Theme controller using a toggle"
          order 2

          def example
            ThemeController(theme_value: "synthwave", class: "toggle theme-controller")
          end
        end
      end
    end
  end
end
