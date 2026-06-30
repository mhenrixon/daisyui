# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Modal
        class Responsive < Views::Components::Example
          include DaisyUI

          title "Responsive"
          order 5

          def example
            Button(modal: "modal_responsive") { "Open modal" }
            Modal(:bottom, id: "modal_responsive", responsive: { sm: :middle }) do |m|
              m.body do
                h3(class: "text-lg font-bold") { "Hello!" }
                p(class: "py-4") { "Press ESC key or click the button below to close" }
                m.action do |a|
                  a.close_button { "Close" }
                end
              end
            end
          end
        end
      end
    end
  end
end
