# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Modal
        class Basic < Views::Components::Example
          include DaisyUI

          title "Dialog modal"
          order 1

          def example
            Button(modal: "modal_dialog") { "Open modal" }
            Modal(id: "modal_dialog") do |m|
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
