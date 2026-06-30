# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Join
        class RadioButtons < Views::Components::Example
          include DaisyUI

          title "Join radio inputs with button style"
          order 3

          def example
            Join do
              input(class: "join-item btn", type: "radio", name: "options", aria_label: "Radio 1")
              input(class: "join-item btn", type: "radio", name: "options", aria_label: "Radio 2")
              input(class: "join-item btn", type: "radio", name: "options", aria_label: "Radio 3")
            end
          end
        end
      end
    end
  end
end
