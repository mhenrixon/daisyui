# frozen_string_literal: true

module Views
  module Components
    module Examples
      module AvatarGroup
        class Basic < Views::Components::Example
          include DaisyUI

          title "Avatar group"
          order 1

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
              g.avatar do
                div(class: "w-12") do
                  img(src: "https://img.daisyui.com/images/profile/demo/4@94.webp")
                end
              end
            end
          end
        end
      end
    end
  end
end
