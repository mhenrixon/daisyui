# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Swap
        class Rotate < Views::Components::Example
          include DaisyUI

          title "Swap with rotate effect"
          order 2

          def example
            Swap(:rotate, class: "text-4xl") do |s|
              input(type: :checkbox)
              s.on { "🌞" }
              s.off { "🌚" }
            end
          end
        end
      end
    end
  end
end
