# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Progress
        class Primary < Views::Components::Example
          include DaisyUI

          title "Primary color"
          order 2

          def example
            Progress(:primary, value: 0, max: 100, class: "w-56")
            Progress(:primary, value: 10, max: 100, class: "w-56")
            Progress(:primary, value: 40, max: 100, class: "w-56")
            Progress(:primary, value: 70, max: 100, class: "w-56")
            Progress(:primary, value: 100, max: 100, class: "w-56")
          end
        end
      end
    end
  end
end
