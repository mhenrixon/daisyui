# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Toast
        class WithAlert < Views::Components::Example
          include DaisyUI

          title "Toast with alert inside"
          order 1

          def example
            Toast do
              Alert(:info) { span { "New message arrived." } }
            end
          end
        end
      end
    end
  end
end
