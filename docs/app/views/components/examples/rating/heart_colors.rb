# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Rating
        class HeartColors < Views::Components::Example
          include DaisyUI

          title "Heart with multiple colors"
          order 3

          def example
            Rating(class: "gap-1") do
              input(type: :radio, name: "rating-3", class: "mask mask-heart bg-red-400", aria_label: "1 star")
              input(type: :radio, name: "rating-3", class: "mask mask-heart bg-orange-400", aria_label: "2 star", checked: true)
              input(type: :radio, name: "rating-3", class: "mask mask-heart bg-yellow-400", aria_label: "3 star")
              input(type: :radio, name: "rating-3", class: "mask mask-heart bg-lime-400", aria_label: "4 star")
              input(type: :radio, name: "rating-3", class: "mask mask-heart bg-green-400", aria_label: "5 star")
            end
          end
        end
      end
    end
  end
end
