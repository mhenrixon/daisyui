# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Avatar
        class Basic < Views::Components::Example
          include DaisyUI

          title "Avatar"
          order 1

          def example
            Avatar do
              div(class: "w-24 rounded") do
                img(src: "https://img.daisyui.com/images/profile/demo/2@94.webp")
              end
            end
          end
        end
      end
    end
  end
end
