# frozen_string_literal: true

module Views
  module Components
    module Examples
      module MockupBrowser
        class WithBorder < Views::Components::Example
          include DaisyUI

          title "Browser mockup with border"
          order 1

          def example
            MockupBrowser(class: "border border-base-300 w-full") do |mockup|
              mockup.toolbar do
                div(class: "input") { "https://daisyui.com" }
              end
              div(class: "grid place-content-center border-t border-base-300 h-80") { "Hello!" }
            end
          end
        end
      end
    end
  end
end
