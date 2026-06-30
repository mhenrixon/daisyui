# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Textarea
        class Ghost < Views::Components::Example
          include DaisyUI

          title "Ghost (no background)"
          order 4

          def example
            Textarea(:ghost, placeholder: "Bio")
          end
        end
      end
    end
  end
end
