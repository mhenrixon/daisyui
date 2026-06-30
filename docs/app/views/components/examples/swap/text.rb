# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Swap
        class Text < Views::Components::Example
          include DaisyUI

          title "Swap text"
          order 1

          def example
            Swap do |s|
              input(type: :checkbox)
              s.on { "ON" }
              s.off { "OFF" }
            end
          end
        end
      end
    end
  end
end
