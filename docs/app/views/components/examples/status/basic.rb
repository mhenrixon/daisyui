# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Status
        class Basic < Views::Components::Example
          include DaisyUI

          title "Status"
          order 1

          def example
            Status()
          end
        end
      end
    end
  end
end
