# frozen_string_literal: true

module Views
  module Components
    module Examples
      module MockupPhone
        class WithColorAndWallpaper < Views::Components::Example
          include DaisyUI

          title "With color and wallpaper"
          order 2

          def example
            MockupPhone(class: "border-[#ff8938]") do |mockup|
              mockup.camera
              mockup.display do
                img(alt: "wallpaper", src: "https://img.daisyui.com/images/stock/453966.webp")
              end
            end
          end
        end
      end
    end
  end
end
