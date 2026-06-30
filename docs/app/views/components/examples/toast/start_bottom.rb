# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Toast
        class StartBottom < Views::Components::Example
          include DaisyUI

          title "Toast start (bottom)"
          order 3

          def example
            Toast(:start) do
              Alert(:info) { span { "New mail arrived." } }
              Alert(:success) { span { "Message sent successfully." } }
            end
          end
        end
      end
    end
  end
end
