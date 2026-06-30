# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Navbar
        class WithMenu < Views::Components::Example
          include DaisyUI

          title "Navbar with menu and submenu"
          order 4

          def example
            Navbar(class: "bg-base-100 shadow-sm") do |n|
              n.start do
                a(class: "btn btn-ghost text-xl") { "daisyUI" }
              end
              n.end do
                Menu(:horizontal, class: "px-1") do |m|
                  m.item { a { "Link" } }
                  m.submenu(:collapsible) do |s|
                    s.title { "Parent" }
                    s.item { a { "Link 1" } }
                    s.item { a { "Link 2" } }
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
