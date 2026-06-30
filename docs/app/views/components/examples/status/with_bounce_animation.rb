# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Status
        class WithBounceAnimation < Views::Components::Example
          include DaisyUI

          title "With bounce animation"
          order 5

          def example
            Status(:info, class: "animate-bounce")
            plain " Unread messages"
          end
        end
      end
    end
  end
end
