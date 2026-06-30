# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Dropdown
        class Placement < Views::Components::Example
          include DaisyUI

          title "Dropdown placement"
          order 2

          def example
            Dropdown(:top) do |d|
              d.button { "Top" }
              d.menu(class: "bg-base-100 rounded-box z-1 w-52 p-2 shadow-sm") do |m|
                m.item { a { "Item 1" } }
                m.item { a { "Item 2" } }
              end
            end
            Dropdown(:bottom) do |d|
              d.button { "Bottom" }
              d.menu(class: "bg-base-100 rounded-box z-1 w-52 p-2 shadow-sm") do |m|
                m.item { a { "Item 1" } }
                m.item { a { "Item 2" } }
              end
            end
            Dropdown(:left) do |d|
              d.button { "Left" }
              d.menu(class: "bg-base-100 rounded-box z-1 w-52 p-2 shadow-sm") do |m|
                m.item { a { "Item 1" } }
                m.item { a { "Item 2" } }
              end
            end
            Dropdown(:right) do |d|
              d.button { "Right" }
              d.menu(class: "bg-base-100 rounded-box z-1 w-52 p-2 shadow-sm") do |m|
                m.item { a { "Item 1" } }
                m.item { a { "Item 2" } }
              end
            end
          end
        end
      end
    end
  end
end
