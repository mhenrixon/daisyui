# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Toast
        class EndBottom < Views::Components::Example
          include DaisyUI

          title "Toast end (bottom)"
          order 2

          def example
            Toast(:end) do
              Alert(:info) { span { "New mail arrived." } }
              Alert(:success) { span { "Message sent successfully." } }
            end
          end
        end
      end
    end
  end
end
