# frozen_string_literal: true

module Views
  module Components
    module Examples
      module ThemeController
        class Radio < Views::Components::Example
          include DaisyUI

          title "Theme controller using radio inputs"
          order 4

          def example
            fieldset(class: "fieldset") do
              %w[default retro cyberpunk valentine aqua].each do |theme|
                label(class: "flex gap-2 cursor-pointer items-center") do
                  ThemeController(
                    theme_value: theme,
                    as: :input,
                    type: :radio,
                    name: "theme-radios",
                    class: "radio radio-sm theme-controller"
                  )
                  plain theme.capitalize
                end
              end
            end
          end
        end
      end
    end
  end
end
