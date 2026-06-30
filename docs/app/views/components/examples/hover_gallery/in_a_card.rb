# frozen_string_literal: true

module Views
  module Components
    module Examples
      module HoverGallery
        class InACard < Views::Components::Example
          include DaisyUI

          title "Hover Gallery in a card"
          order 2

          def example
            Card(:sm, class: "bg-base-200 max-w-60 shadow") do |c|
              HoverGallery do
                img(src: "https://img.daisyui.com/images/stock/daisyui-hat-1.webp")
                img(src: "https://img.daisyui.com/images/stock/daisyui-hat-2.webp")
                img(src: "https://img.daisyui.com/images/stock/daisyui-hat-3.webp")
                img(src: "https://img.daisyui.com/images/stock/daisyui-hat-4.webp")
              end
              c.body do
                c.title(class: "flex justify-between") do
                  plain "daisyUI Hat"
                  span(class: "font-normal") { "$25" }
                end
                p { "High Quality classic cap hat with stitch logo" }
              end
            end
          end
        end
      end
    end
  end
end
