# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Hero
        class WithOverlay < Views::Components::Example
          include DaisyUI

          title "Hero with overlay image"
          order 3

          def example
            Hero(
              class: "min-h-96",
              style: "background-image: url(https://img.daisyui.com/images/stock/photo-1507358522600-9f71e620c44e.webp);"
            ) do |hero|
              hero.overlay
              hero.content(class: "text-neutral-content text-center") do
                div(class: "max-w-md") do
                  h1(class: "mb-5 text-5xl font-bold") { "Hello there" }
                  p(class: "mb-5") do
                    "Provident cupiditate voluptatem et in. Quaerat fugiat ut assumenda " \
                      "excepturi exercitationem quasi. In deleniti eaque aut repudiandae et a id nisi."
                  end
                  Button(:primary) { "Get Started" }
                end
              end
            end
          end
        end
      end
    end
  end
end
