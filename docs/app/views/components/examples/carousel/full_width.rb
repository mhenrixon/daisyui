# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Carousel
        class FullWidth < Views::Components::Example
          include DaisyUI

          title "Carousel with full width items"
          order 4

          IMAGES = %w[
            https://img.daisyui.com/images/stock/photo-1559703248-dcaaec9fab78.webp
            https://img.daisyui.com/images/stock/photo-1565098772267-60af42b81ef2.webp
            https://img.daisyui.com/images/stock/photo-1572635148818-ef6fd45eb394.webp
          ].freeze

          def example
            Carousel(class: "rounded-box w-64") do |c|
              IMAGES.each do |src|
                c.item(class: "w-full") do
                  img(src:, class: "w-full", alt: "Carousel image")
                end
              end
            end
          end
        end
      end
    end
  end
end
