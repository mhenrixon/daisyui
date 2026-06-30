# frozen_string_literal: true

module Views
  module Components
    module Examples
      module HoverGallery
        class Basic < Views::Components::Example
          include DaisyUI

          title "Hover Gallery"
          order 1

          def example
            HoverGallery(class: "max-w-60") do
              img(src: "https://img.daisyui.com/images/stock/daisyui-hat-1.webp")
              img(src: "https://img.daisyui.com/images/stock/daisyui-hat-2.webp")
              img(src: "https://img.daisyui.com/images/stock/daisyui-hat-3.webp")
              img(src: "https://img.daisyui.com/images/stock/daisyui-hat-4.webp")
            end
          end
        end
      end
    end
  end
end
