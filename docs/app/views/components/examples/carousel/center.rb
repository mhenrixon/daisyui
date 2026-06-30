# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Carousel
        class Center < Views::Components::Example
          include DaisyUI

          title "Snap to center"
          order 2

          IMAGES = %w[
            https://img.daisyui.com/images/stock/photo-1559703248-dcaaec9fab78.webp
            https://img.daisyui.com/images/stock/photo-1565098772267-60af42b81ef2.webp
            https://img.daisyui.com/images/stock/photo-1572635148818-ef6fd45eb394.webp
            https://img.daisyui.com/images/stock/photo-1494253109108-2e30c049369b.webp
          ].freeze

          def example
            Carousel(:center, class: "rounded-box") do |c|
              IMAGES.each do |src|
                c.item do
                  img(src:, alt: "Carousel image")
                end
              end
            end
          end
        end
      end
    end
  end
end
