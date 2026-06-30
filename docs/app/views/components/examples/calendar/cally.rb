# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Calendar
        class Cally < Views::Components::Example
          include DaisyUI

          register_element :calendar_month

          title "Cally calendar"
          order 1

          def example
            Calendar(type: :cally, class: "bg-base-100 border border-base-300 shadow-lg rounded-box") do
              calendar_month
            end
          end
        end
      end
    end
  end
end
