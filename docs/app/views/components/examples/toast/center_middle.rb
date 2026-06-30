# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Toast
        class CenterMiddle < Views::Components::Example
          include DaisyUI

          title "Toast center middle"
          order 4

          def example
            Toast(:center, :middle) do
              Alert(:info) { span { "New mail arrived." } }
              Alert(:success) { span { "Message sent successfully." } }
            end
          end
        end
      end
    end
  end
end
