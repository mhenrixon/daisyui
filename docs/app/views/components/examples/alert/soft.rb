# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Alert
        class Soft < Views::Components::Example
          include DaisyUI

          title "Soft style"
          order 6

          def example
            Alert(:info, :soft) { span { "12 unread messages. Tap to see." } }
            Alert(:success, :soft) { span { "Your purchase has been confirmed!" } }
            Alert(:warning, :soft) { span { "Warning: Invalid email address!" } }
            Alert(:error, :soft) { span { "Error! Task failed successfully." } }
          end
        end
      end
    end
  end
end
