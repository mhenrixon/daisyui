# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Swap
        class Flip < Views::Components::Example
          include DaisyUI

          title "Swap with flip effect"
          order 3

          def example
            Swap(:flip, class: "text-4xl") do |s|
              input(type: :checkbox)
              s.on { "😈" }
              s.off { "😇" }
            end
          end
        end
      end
    end
  end
end
