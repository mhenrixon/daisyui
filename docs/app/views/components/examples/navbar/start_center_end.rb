# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Navbar
        class StartCenterEnd < Views::Components::Example
          include DaisyUI

          title "Navbar with start, center and end"
          order 2

          def example
            Navbar(class: "bg-base-100 shadow-sm") do |n|
              n.start do
                a(class: "btn btn-ghost text-xl") { "daisyUI" }
              end
              n.center do
                Menu(:horizontal, class: "px-1") do |m|
                  m.item { a { "Home" } }
                  m.item { a { "About" } }
                  m.item { a { "Contact" } }
                end
              end
              n.end do
                a(class: "btn") { "Button" }
              end
            end
          end
        end
      end
    end
  end
end
