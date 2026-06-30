# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Avatar
        class Rounded < Views::Components::Example
          include DaisyUI

          title "Avatar rounded"
          order 2

          def example
            Avatar do
              div(class: "w-24 rounded-xl") do
                img(src: "https://img.daisyui.com/images/profile/demo/3@94.webp")
              end
            end
            Avatar do
              div(class: "w-24 rounded-full") do
                img(src: "https://img.daisyui.com/images/profile/demo/4@94.webp")
              end
            end
          end
        end
      end
    end
  end
end
