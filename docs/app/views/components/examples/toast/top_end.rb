# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Toast
        class TopEnd < Views::Components::Example
          include DaisyUI

          title "Toast top end"
          order 5

          def example
            Toast(:top, :end) do
              Alert(:info) { span { "New mail arrived." } }
              Alert(:success) { span { "Message sent successfully." } }
            end
          end
        end
      end
    end
  end
end
