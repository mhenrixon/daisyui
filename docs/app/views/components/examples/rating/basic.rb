# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Rating
        class Basic < Views::Components::Example
          include DaisyUI

          title "Rating"
          order 1

          def example
            Rating do
              input(type: :radio, name: "rating-1", class: "mask mask-star", aria_label: "1 star")
              input(type: :radio, name: "rating-1", class: "mask mask-star", aria_label: "2 star", checked: true)
              input(type: :radio, name: "rating-1", class: "mask mask-star", aria_label: "3 star")
              input(type: :radio, name: "rating-1", class: "mask mask-star", aria_label: "4 star")
              input(type: :radio, name: "rating-1", class: "mask mask-star", aria_label: "5 star")
            end
          end
        end
      end
    end
  end
end
