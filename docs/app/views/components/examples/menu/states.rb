# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Menu
        class States < Views::Components::Example
          include DaisyUI

          title "Menu with active and disabled items"
          order 4

          def example
            Menu(class: "bg-base-200 rounded-box w-56") do |m|
              m.item { a { "Enabled item" } }
              m.item { a(class: "menu-active") { "Active item" } }
              m.item(:disabled) { a { "Disabled item" } }
            end
          end
        end
      end
    end
  end
end
