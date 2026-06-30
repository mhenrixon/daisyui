# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Menu
        class WithTitle < Views::Components::Example
          include DaisyUI

          title "Menu with title"
          order 3

          def example
            Menu(class: "bg-base-200 rounded-box w-56") do |m|
              m.title { "Title" }
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
