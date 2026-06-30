# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Dropdown
        class Basic < Views::Components::Example
          include DaisyUI

          title "Dropdown"
          order 1

          def example
            Dropdown do |d|
              d.button { "Click" }
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
