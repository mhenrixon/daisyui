# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Label
        class Input < Views::Components::Example
          include DaisyUI

          title "Label for input"
          order 1

          def example
            Label(:input) do |l|
              l.text("https://")
              input(type: "text", class: "grow", placeholder: "URL")
            end
          end
        end
      end
    end
  end
end
