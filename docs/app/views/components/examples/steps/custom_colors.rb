# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Steps
        class CustomColors < Views::Components::Example
          include DaisyUI

          title "Steps with custom colors"
          order 3

          def example
            Steps do |s|
              s.step(:info) { "Fly to moon" }
              s.step(:info) { "Shrink the moon" }
              s.step(:info) { "Grab the moon" }
              s.step(:error, data: { content: "?" }) { "Sit on toilet" }
            end
          end
        end
      end
    end
  end
end
