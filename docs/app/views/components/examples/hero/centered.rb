# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Hero
        class Centered < Views::Components::Example
          include DaisyUI

          title "Centered hero"
          order 1

          def example
            Hero(class: "bg-base-200 min-h-96") do |hero|
              hero.content(class: "text-center") do
                div(class: "max-w-md") do
                  h1(class: "text-5xl font-bold") { "Hello there" }
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
