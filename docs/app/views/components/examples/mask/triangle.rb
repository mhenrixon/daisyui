# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Mask
        class Triangle < Views::Components::Example
          include DaisyUI

          title "Triangle (pointing top)"
          order 4

          def example
            Mask(
              :triangle,
              as: :img,
              src: "https://img.daisyui.com/images/stock/photo-1567653418876-5bb0e566e1c2.webp"
            )
          end
        end
      end
    end
  end
end
