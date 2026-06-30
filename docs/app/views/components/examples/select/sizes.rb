# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Select
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Sizes"
          order 3

          def example
            { xs: "Xsmall", sm: "Small", md: "Medium", lg: "Large", xl: "Xlarge" }.each do |size, label|
              Select(size) do
                option(disabled: true, selected: true) { label }
                option { "#{label} Apple" }
                option { "#{label} Orange" }
                option { "#{label} Tomato" }
              end
            end
          end
        end
      end
    end
  end
end
