# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Alert
        class Outline < Views::Components::Example
          include DaisyUI

          title "Outline style"
          order 7

          def example
            Alert(:info, :outline) { span { "12 unread messages. Tap to see." } }
            Alert(:success, :outline) { span { "Your purchase has been confirmed!" } }
            Alert(:warning, :outline) { span { "Warning: Invalid email address!" } }
            Alert(:error, :outline) { span { "Error! Task failed successfully." } }
          end
        end
      end
    end
  end
end
