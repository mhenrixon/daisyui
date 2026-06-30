# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Swap
        class Hamburger < Views::Components::Example
          include DaisyUI

          title "Hamburger button"
          order 4

          def example
            Swap(:rotate, class: "btn btn-circle") do |s|
              input(type: :checkbox)
              s.on { "✕" }
              s.off { "☰" }
            end
          end
        end
      end
    end
  end
end
