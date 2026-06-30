# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Chat
        class Full < Views::Components::Example
          include DaisyUI

          title "Chat with image, header and footer"
          order 5

          def example
            Chat(:start) do |c|
              c.image(class: "avatar") do
                div(class: "w-10 rounded-full") do
                  img(src: "https://img.daisyui.com/images/profile/demo/kenobee@192.webp", alt: "Obi-Wan Kenobi")
                end
              end
              c.header do
                plain "Obi-Wan Kenobi"
                time(class: "text-xs opacity-50") { "12:45" }
              end
              c.bubble { "You were the Chosen One!" }
              c.footer(class: "opacity-50") { "Delivered" }
            end
            Chat(:end) do |c|
              c.image(class: "avatar") do
                div(class: "w-10 rounded-full") do
                  img(src: "https://img.daisyui.com/images/profile/demo/anakeen@192.webp", alt: "Anakin")
                end
              end
              c.header do
                plain "Anakin"
                time(class: "text-xs opacity-50") { "12:46" }
              end
              c.bubble { "I hate you!" }
              c.footer(class: "opacity-50") { "Seen at 12:46" }
            end
          end
        end
      end
    end
  end
end
