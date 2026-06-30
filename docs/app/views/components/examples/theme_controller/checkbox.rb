# frozen_string_literal: true

module Views
  module Components
    module Examples
      module ThemeController
        class Checkbox < Views::Components::Example
          include DaisyUI

          title "Theme controller using a checkbox"
          order 1

          def example
            ThemeController(theme_value: "synthwave", class: "checkbox theme-controller")
          end
        end
      end
    end
  end
end
