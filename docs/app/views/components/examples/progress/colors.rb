# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Progress
        class Colors < Views::Components::Example
          include DaisyUI

          title "Progress with colors"
          order 3

          def example
            Progress(:neutral, value: 40, max: 100, class: "w-56")
            Progress(:primary, value: 40, max: 100, class: "w-56")
            Progress(:secondary, value: 40, max: 100, class: "w-56")
            Progress(:accent, value: 40, max: 100, class: "w-56")
            Progress(:info, value: 40, max: 100, class: "w-56")
            Progress(:success, value: 40, max: 100, class: "w-56")
            Progress(:warning, value: 40, max: 100, class: "w-56")
            Progress(:error, value: 40, max: 100, class: "w-56")
          end
        end
      end
    end
  end
end
