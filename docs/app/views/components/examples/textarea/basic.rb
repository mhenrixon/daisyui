# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Textarea
        class Basic < Views::Components::Example
          include DaisyUI

          title "Textarea"
          order 1

          def example
            Textarea(placeholder: "Bio")
          end
        end
      end
    end
  end
end
