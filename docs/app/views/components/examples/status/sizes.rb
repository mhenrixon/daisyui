# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Status
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Status sizes"
          order 2

          def example
            Status(:xs, aria_label: "status")
            Status(:sm, aria_label: "status")
            Status(:md, aria_label: "status")
            Status(:lg, aria_label: "status")
            Status(:xl, aria_label: "status")
          end
        end
      end
    end
  end
end
