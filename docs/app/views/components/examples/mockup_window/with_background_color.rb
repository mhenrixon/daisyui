# frozen_string_literal: true

module Views
  module Components
    module Examples
      module MockupWindow
        class WithBackgroundColor < Views::Components::Example
          include DaisyUI

          title "Window mockup with background color"
          order 2

          def example
            MockupWindow(class: "bg-base-100 border border-base-300") do
              div(class: "grid place-content-center h-80") { "Hello!" }
            end
          end
        end
      end
    end
  end
end
