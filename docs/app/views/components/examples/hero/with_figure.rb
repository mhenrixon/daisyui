# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Hero
        class WithFigure < Views::Components::Example
          include DaisyUI

          title "Hero with figure"
          order 2

          def example
            Hero(class: "bg-base-200 min-h-96") do |hero|
              hero.content(class: "flex-col lg:flex-row") do
                img(
                  src: "https://img.daisyui.com/images/stock/photo-1635805737707-575885ab0820.webp",
                  class: "max-w-sm rounded-lg shadow-2xl"
                )
                div do
                  h1(class: "text-5xl font-bold") { "Box Office News!" }
                  p(class: "py-6") do
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
