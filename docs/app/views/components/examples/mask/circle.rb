# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Mask
        class Circle < Views::Components::Example
          include DaisyUI

          title "Circle"
          order 1

          def example
            Mask(
              :circle,
              as: :img,
              src: "https://img.daisyui.com/images/stock/photo-1567653418876-5bb0e566e1c2.webp"
            )
          end
        end
      end
    end
  end
end
