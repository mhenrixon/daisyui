# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Progress
        class Basic < Views::Components::Example
          include DaisyUI

          title "Progress"
          order 1

          def example
            Progress(value: 0, max: 100, class: "w-56")
            Progress(value: 10, max: 100, class: "w-56")
            Progress(value: 40, max: 100, class: "w-56")
            Progress(value: 70, max: 100, class: "w-56")
            Progress(value: 100, max: 100, class: "w-56")
          end
        end
      end
    end
  end
end
