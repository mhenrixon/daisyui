# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Navbar
        class WithIcons < Views::Components::Example
          include DaisyUI

          title "Navbar with icon at start and end"
          order 3

          def example
            Navbar(class: "bg-base-100 shadow-sm") do |n|
              n.start(class: "flex-none") do
                button(class: "btn btn-square btn-ghost") { "☰" }
              end
              n.center(class: "flex-1") do
                a(class: "btn btn-ghost text-xl") { "daisyUI" }
              end
              n.end(class: "flex-none") do
                button(class: "btn btn-square btn-ghost") { "⋯" }
              end
            end
          end
        end
      end
    end
  end
end
