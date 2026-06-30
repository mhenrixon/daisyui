# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Steps
        class WithDataContent < Views::Components::Example
          include DaisyUI

          title "Steps with data-content"
          order 4

          def example
            Steps do |s|
              s.step(:neutral, data: { content: "?" }) { "Step 1" }
              s.step(:neutral, data: { content: "!" }) { "Step 2" }
              s.step(:neutral, data: { content: "✓" }) { "Step 3" }
              s.step(:neutral, data: { content: "✕" }) { "Step 4" }
              s.step(:neutral, data: { content: "★" }) { "Step 5" }
              s.step(:neutral, data: { content: "●" }) { "Step 6" }
            end
          end
        end
      end
    end
  end
end
