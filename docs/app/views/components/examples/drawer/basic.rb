# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Drawer
        class Basic < Views::Components::Example
          include DaisyUI

          title "Drawer"
          order 1

          # A self-contained drawer (fixed height so it lives inside the preview
          # box rather than taking over the page). Click "Open drawer" to toggle.
          def example
            Drawer(id: "example-drawer", class: "h-64 rounded-box border border-base-300") do |drawer|
              drawer.toggle
              drawer.content(class: "flex items-center justify-center") do
                drawer.button(class: "btn btn-primary") { "Open drawer" }
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
