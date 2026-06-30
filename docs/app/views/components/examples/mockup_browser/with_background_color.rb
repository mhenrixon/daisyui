# frozen_string_literal: true

module Views
  module Components
    module Examples
      module MockupBrowser
        class WithBackgroundColor < Views::Components::Example
          include DaisyUI

          title "Browser mockup with background color"
          order 2

          def example
            MockupBrowser(class: "border border-base-300 w-full") do |mockup|
              mockup.toolbar do
                div(class: "input") { "https://daisyui.com" }
              end
              div(class: "bg-base-200 grid place-content-center h-80") { "Hello!" }
            end
          end
        end
      end
    end
  end
end
