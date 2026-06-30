# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Chat
        class WithImage < Views::Components::Example
          include DaisyUI

          title "Chat with image"
          order 4

          def example
            messages = [
              "It was said that you would, destroy the Sith, not join them.",
              "It was you who would bring balance to the Force",
              "Not leave it in Darkness",
            ]
            messages.each do |message|
              Chat(:start) do |c|
                c.image(class: "avatar") do
                  div(class: "w-10 rounded-full") do
                    img(src: "https://img.daisyui.com/images/profile/demo/kenobee@192.webp", alt: "Obi-Wan Kenobi")
                  end
                end
                c.bubble { message }
              end
            end
          end
        end
      end
    end
  end
end
