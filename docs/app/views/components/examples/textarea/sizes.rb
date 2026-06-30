# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Textarea
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Sizes"
          order 3

          def example
            Textarea(:xs, placeholder: "Bio")
            Textarea(:sm, placeholder: "Bio")
            Textarea(:md, placeholder: "Bio")
            Textarea(:lg, placeholder: "Bio")
            Textarea(:xl, placeholder: "Bio")
          end
        end
      end
    end
  end
end
