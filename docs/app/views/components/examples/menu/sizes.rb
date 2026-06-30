# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Menu
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Menu sizes"
          order 2

          def example
            { xs: "Xsmall", sm: "Small", md: "Medium", lg: "Large", xl: "Xlarge" }.each do |size, label|
              Menu(size, class: "bg-base-200 rounded-box w-56") do |m|
                m.item { a { "#{label} 1" } }
                m.item { a { "#{label} 2" } }
              end
            end
          end
        end
      end
    end
  end
end
