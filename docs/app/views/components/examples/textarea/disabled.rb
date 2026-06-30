# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Textarea
        class Disabled < Views::Components::Example
          include DaisyUI

          title "Disabled"
          order 5

          def example
            Textarea(placeholder: "Bio", disabled: true)
          end
        end
      end
    end
  end
end
