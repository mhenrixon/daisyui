# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Megamenu
        class WideWithMenus < Views::Components::Example
          include DaisyUI

          title "Megamenu with wide popovers and horizontal menus"
          order 2

          def example
            Megamenu(:wide, class: "p-2 border border-base-300") do |m|
              m.active_indicator

              button(popovertarget: "mm-wide-1") { "One" }
              div(id: "mm-wide-1", popover: true) do
                Menu(:horizontal) do |menu|
                  menu.item { a { "Enterprise" } }
                  menu.item { a { "CRM software" } }
                  menu.item { a { "Security" } }
                  menu.item { a { "Consulting" } }
                end
              end

              button(popovertarget: "mm-wide-2") { "Two" }
              div(id: "mm-wide-2", popover: true) do
                Menu(:horizontal) do |menu|
                  menu.item { a { "AI infrastructure" } }
                  menu.item { a { "Image generation" } }
                  menu.item { a { "MCP servers" } }
                end
              end

              button(popovertarget: "mm-wide-3") { "Three" }
              div(id: "mm-wide-3", popover: true) do
                Menu(:horizontal) do |menu|
                  menu.item { a { "Cloud computing" } }
                  menu.item { a { "Storage solutions" } }
                  menu.item { a { "Database services" } }
                end
              end
            end
          end
        end
      end
    end
  end
end
