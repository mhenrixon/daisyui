# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Modal
        class TapOutside < Views::Components::Example
          include DaisyUI

          title "Closes when clicked outside"
          order 2

          def example
            Button(modal: "modal_outside") { "Open modal" }
            Modal(:tap_outside_to_close, id: "modal_outside") do |m|
              m.body do
                h3(class: "text-lg font-bold") { "Hello!" }
                p(class: "py-4") { "Press ESC key or click outside to close" }
              end
            end
          end
        end
      end
    end
  end
end
