# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Rating
        class StarColor < Views::Components::Example
          include DaisyUI

          title "Star with custom color"
          order 2

          def example
            Rating do
              input(type: :radio, name: "rating-2", class: "mask mask-star-2 bg-orange-400", aria_label: "1 star")
              input(type: :radio, name: "rating-2", class: "mask mask-star-2 bg-orange-400", aria_label: "2 star", checked: true)
              input(type: :radio, name: "rating-2", class: "mask mask-star-2 bg-orange-400", aria_label: "3 star")
              input(type: :radio, name: "rating-2", class: "mask mask-star-2 bg-orange-400", aria_label: "4 star")
              input(type: :radio, name: "rating-2", class: "mask mask-star-2 bg-orange-400", aria_label: "5 star")
            end
          end
        end
      end
    end
  end
end
