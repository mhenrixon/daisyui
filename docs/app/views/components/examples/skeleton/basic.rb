# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Skeleton
        class Basic < Views::Components::Example
          include DaisyUI

          title "Skeleton"
          order 1

          def example
            Skeleton(class: "h-32 w-32")
          end
        end
      end
    end
  end
end
