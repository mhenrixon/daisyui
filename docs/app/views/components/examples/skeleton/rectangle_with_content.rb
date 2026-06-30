# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Skeleton
        class RectangleWithContent < Views::Components::Example
          include DaisyUI

          title "Rectangle with content"
          order 4

          def example
            div(class: "flex w-52 flex-col gap-4") do
              Skeleton(class: "h-32 w-full")
              Skeleton(class: "h-4 w-28")
              Skeleton(class: "h-4 w-full")
              Skeleton(class: "h-4 w-full")
            end
          end
        end
      end
    end
  end
end
