# frozen_string_literal: true

module Views
  module Components
    module Examples
      module TextRotate
        class Basic < Views::Components::Example
          include DaisyUI

          title "Text Rotate"
          order 1

          def example
            TextRotate(class: "text-7xl font-title") do
              span { "DESIGN" }
              span { "DEVELOP" }
              span { "DEPLOY" }
              span { "SCALE" }
              span { "MAINTAIN" }
              span { "REPEAT" }
            end
          end
        end
      end
    end
  end
end
