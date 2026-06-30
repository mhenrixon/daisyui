# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Label
        class InputAtEnd < Views::Components::Example
          include DaisyUI

          title "Label at the end"
          order 2

          def example
            Label(:input) do |l|
              input(type: "text", class: "grow", placeholder: "index")
              l.text(".php")
            end
          end
        end
      end
    end
  end
end
