# frozen_string_literal: true

module Views
  module Components
    module Examples
      module AvatarGroup
        class WithCounter < Views::Components::Example
          include DaisyUI

          title "Avatar group with counter"
          order 2

          def example
            AvatarGroup(class: "-space-x-6") do |g|
              g.avatar do
                div(class: "w-12") do
                  img(src: "https://img.daisyui.com/images/profile/demo/1@94.webp")
                end
              end
              g.avatar do
                div(class: "w-12") do
                  img(src: "https://img.daisyui.com/images/profile/demo/2@94.webp")
                end
              end
              g.avatar do
                div(class: "w-12") do
                  img(src: "https://img.daisyui.com/images/profile/demo/3@94.webp")
                end
              end
              g.avatar(:placeholder) do
                div(class: "bg-neutral text-neutral-content w-12") do
                  span { "+99" }
                end
              end
            end
          end
        end
      end
    end
  end
end
