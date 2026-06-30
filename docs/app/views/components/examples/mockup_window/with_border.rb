# frozen_string_literal: true

module Views
  module Components
    module Examples
      module MockupWindow
        class WithBorder < Views::Components::Example
          include DaisyUI

          title "Window mockup with border"
          order 1

          def example
            MockupWindow(class: "border border-base-300 w-full") do
              div(class: "grid place-content-center border-t border-base-300 h-80") { "Hello!" }
            end
          end
        end
      end
    end
  end
end
