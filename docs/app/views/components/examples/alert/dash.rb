# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Alert
        class Dash < Views::Components::Example
          include DaisyUI

          title "Dash style"
          order 8

          def example
            Alert(:info, :dash) { span { "12 unread messages. Tap to see." } }
            Alert(:success, :dash) { span { "Your purchase has been confirmed!" } }
            Alert(:warning, :dash) { span { "Warning: Invalid email address!" } }
            Alert(:error, :dash) { span { "Error! Task failed successfully." } }
          end
        end
      end
    end
  end
end
