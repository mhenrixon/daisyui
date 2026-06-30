# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Modal
        class CustomWidth < Views::Components::Example
          include DaisyUI

          title "Custom width"
          order 4

          def example
            Button(modal: "modal_wide") { "Open modal" }
            Modal(id: "modal_wide") do |m|
              m.body(class: "w-11/12 max-w-5xl") do
                h3(class: "text-lg font-bold") { "Hello!" }
                p(class: "py-4") { "Click the button below to close" }
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
