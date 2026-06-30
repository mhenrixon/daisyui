# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Carousel
        class Vertical < Views::Components::Example
          include DaisyUI

          title "Vertical carousel"
          order 5

          IMAGES = %w[
            https://img.daisyui.com/images/stock/photo-1559703248-dcaaec9fab78.webp
            https://img.daisyui.com/images/stock/photo-1565098772267-60af42b81ef2.webp
            https://img.daisyui.com/images/stock/photo-1572635148818-ef6fd45eb394.webp
            https://img.daisyui.com/images/stock/photo-1494253109108-2e30c049369b.webp
          ].freeze

          def example
            Carousel(:vertical, class: "rounded-box h-96") do |c|
              IMAGES.each do |src|
                c.item(class: "h-full") do
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
