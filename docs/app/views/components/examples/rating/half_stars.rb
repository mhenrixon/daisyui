# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Rating
        class HalfStars < Views::Components::Example
          include DaisyUI

          title "Half stars"
          order 4

          def example
            Rating(:lg, :half) do
              input(type: :radio, name: "rating-4", class: "rating-hidden")
              input(type: :radio, name: "rating-4", class: "mask mask-star-2 mask-half-1 bg-green-500", aria_label: "0.5 star")
              input(type: :radio, name: "rating-4", class: "mask mask-star-2 mask-half-2 bg-green-500", aria_label: "1 star")
              input(type: :radio, name: "rating-4", class: "mask mask-star-2 mask-half-1 bg-green-500", aria_label: "1.5 star", checked: true)
              input(type: :radio, name: "rating-4", class: "mask mask-star-2 mask-half-2 bg-green-500", aria_label: "2 star")
              input(type: :radio, name: "rating-4", class: "mask mask-star-2 mask-half-1 bg-green-500", aria_label: "2.5 star")
              input(type: :radio, name: "rating-4", class: "mask mask-star-2 mask-half-2 bg-green-500", aria_label: "3 star")
              input(type: :radio, name: "rating-4", class: "mask mask-star-2 mask-half-1 bg-green-500", aria_label: "3.5 star")
              input(type: :radio, name: "rating-4", class: "mask mask-star-2 mask-half-2 bg-green-500", aria_label: "4 star")
              input(type: :radio, name: "rating-4", class: "mask mask-star-2 mask-half-1 bg-green-500", aria_label: "4.5 star")
              input(type: :radio, name: "rating-4", class: "mask mask-star-2 mask-half-2 bg-green-500", aria_label: "5 star")
            end
          end
        end
      end
    end
  end
end
