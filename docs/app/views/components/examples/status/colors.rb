# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Status
        class Colors < Views::Components::Example
          include DaisyUI

          title "Status with colors"
          order 3

          def example
            Status(:primary, aria_label: "status")
            Status(:secondary, aria_label: "status")
            Status(:accent, aria_label: "status")
            Status(:neutral, aria_label: "status")
            Status(:info, aria_label: "info")
            Status(:success, aria_label: "success")
            Status(:warning, aria_label: "warning")
            Status(:error, aria_label: "error")
          end
        end
      end
    end
  end
end
