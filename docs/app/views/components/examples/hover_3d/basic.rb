# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Hover3d
        class Basic < Views::Components::Example
          include DaisyUI

          title "Hover 3D"
          order 1

          def example
            Hover3d(class: "my-12 mx-2") do
              figure(class: "max-w-100 rounded-2xl") do
                img(src: "https://img.daisyui.com/images/stock/photo-1567653418876-5bb0e566e1c2.webp", alt: "3D card")
              end
            end
          end
        end
      end
    end
  end
end
