# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Navbar
        class Basic < Views::Components::Example
          include DaisyUI

          title "Navbar with title only"
          order 1

          def example
            Navbar(class: "bg-base-100 shadow-sm") do |_n|
              a(class: "btn btn-ghost text-xl") { "daisyUI" }
            end
          end
        end
      end
    end
  end
end
