# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Avatar
        class PresenceIndicator < Views::Components::Example
          include DaisyUI

          title "Avatar with presence indicator"
          order 3

          def example
            Avatar(:online) do
              div(class: "w-24 rounded-full") do
                img(src: "https://img.daisyui.com/images/profile/demo/1@94.webp")
              end
            end
            Avatar(:offline) do
              div(class: "w-24 rounded-full") do
                img(src: "https://img.daisyui.com/images/profile/demo/2@94.webp")
              end
            end
          end
        end
      end
    end
  end
end
