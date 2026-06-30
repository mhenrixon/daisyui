# frozen_string_literal: true

module Views
  module Components
    module Examples
      module ThemeController
        class Swap < Views::Components::Example
          include DaisyUI

          title "Theme controller using a swap"
          order 3

          def example
            ThemeController(:swap_rotate, theme_value: "synthwave") do
              span(class: "swap-off text-2xl") { "🌞" }
              span(class: "swap-on text-2xl") { "🌙" }
            end
          end
        end
      end
    end
  end
end
