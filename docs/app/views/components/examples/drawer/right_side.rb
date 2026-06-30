# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Drawer
        class RightSide < Views::Components::Example
          include DaisyUI

          title "Drawer that opens from the right"
          order 2

          def example
            Drawer(:end, id: "example-drawer-end", class: "h-64 rounded-box border border-base-300") do |drawer|
              drawer.toggle
              drawer.content(class: "flex items-center justify-center") do
                drawer.button(class: "btn btn-primary") { "Open from right" }
              end
              drawer.side do
                drawer.overlay
                Menu(class: "bg-base-200 min-h-full w-56 p-4") do |menu|
                  menu.item { a { "Sidebar Item 1" } }
                  menu.item { a { "Sidebar Item 2" } }
                end
              end
            end
          end
        end
      end
    end
  end
end
