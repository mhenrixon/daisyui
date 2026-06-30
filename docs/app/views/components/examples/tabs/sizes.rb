# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Tabs
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Tab sizes"
          order 5

          def example
            { xs: "Xsmall", sm: "Small", md: "Medium", lg: "Large", xl: "Xlarge" }.each do |size, label|
              Tabs(:lift, size) do
                a(role: :tab, class: "tab") { label }
                a(role: :tab, class: "tab tab-active") { label }
                a(role: :tab, class: "tab") { label }
              end
            end
          end
        end
      end
    end
  end
end
