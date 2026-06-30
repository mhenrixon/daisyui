# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Rating
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Sizes"
          order 5

          def example
            [:xs, :sm, :md, :lg, :xl].each_with_index do |size, group|
              name = "rating-size-#{group}"
              Rating(size) do
                (1..5).each do |star|
                  input(
                    type: :radio,
                    name: name,
                    class: "mask mask-star-2 bg-orange-400",
                    aria_label: "#{star} star",
                    checked: star == 2
                  )
                end
              end
            end
          end
        end
      end
    end
  end
end
