# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Menu
        class CollapsibleSubmenu < Views::Components::Example
          include DaisyUI

          title "Collapsible submenu"
          order 6

          def example
            Menu(class: "bg-base-200 rounded-box w-56") do |m|
              m.item { a { "Item 1" } }
              m.submenu(:collapsible, :open) do |s|
                s.title { "Parent" }
                s.item { a { "Submenu 1" } }
                s.item { a { "Submenu 2" } }
              end
              m.item { a { "Item 3" } }
            end
          end
        end
      end
    end
  end
end
