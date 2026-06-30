# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Mask
        class Star < Views::Components::Example
          include DaisyUI

          title "Star"
          order 2

          def example
            Mask(
              :star,
              as: :img,
              src: "https://img.daisyui.com/images/stock/photo-1567653418876-5bb0e566e1c2.webp"
            )
          end
        end
      end
    end
  end
end
