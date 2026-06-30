# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Menu
        class Basic < Views::Components::Example
          include DaisyUI

          title "Menu"
          order 1

          def example
            Menu(class: "bg-base-200 rounded-box w-56") do |m|
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
