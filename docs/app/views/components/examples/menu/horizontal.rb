# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Menu
        class Horizontal < Views::Components::Example
          include DaisyUI

          title "Horizontal menu"
          order 5

          def example
            Menu(:horizontal, class: "bg-base-200 rounded-box") do |m|
              m.item { a { "Item 1" } }
              m.item { a { "Item 2" } }
              m.item { a { "Item 3" } }
            end
          end
        end
      end
    end
  end
end
