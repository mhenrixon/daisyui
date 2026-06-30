# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Diff
        class Basic < Views::Components::Example
          include DaisyUI

          title "Diff"
          order 1

          def example
            Diff(class: "aspect-16/9", tabindex: "0") do |d|
              d.item_1(role: "img", tabindex: "0") do
                img(alt: "daisy", src: "https://img.daisyui.com/images/stock/photo-1560717789-0ac7c58ac90a.webp")
              end
              d.item_2(role: "img") do
                img(alt: "daisy", src: "https://img.daisyui.com/images/stock/photo-1560717789-0ac7c58ac90a-blur.webp")
              end
              d.resizer
            end
          end
        end
      end
    end
  end
end
