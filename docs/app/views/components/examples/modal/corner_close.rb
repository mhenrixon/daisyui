# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Modal
        class CornerClose < Views::Components::Example
          include DaisyUI

          title "Close button at corner"
          order 3

          def example
            Button(modal: "modal_corner") { "Open modal" }
            Modal(id: "modal_corner") do |m|
              m.body do
                m.close_button(:sm, :circle, :ghost, class: "absolute right-2 top-2") { "✕" }
                h3(class: "text-lg font-bold") { "Hello!" }
                p(class: "py-4") { "Press ESC key or click on ✕ button to close" }
              end
            end
          end
        end
      end
    end
  end
end
