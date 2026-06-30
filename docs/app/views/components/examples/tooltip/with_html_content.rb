# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Tooltip
        class WithHtmlContent < Views::Components::Example
          include DaisyUI

          title "With HTML content"
          order 5

          def example
            Tooltip(:open) do |t|
              t.content do
                div { "You can use any element as the content of the tooltip" }
                span(class: "text-primary text-lg font-black") { "daisyUI" }
              end
              Button { "Hover me" }
            end
          end
        end
      end
    end
  end
end
