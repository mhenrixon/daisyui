# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Validator
        class Number < Views::Components::Example
          include DaisyUI

          title "Number input"
          order 3

          def example
            Validator(
              as: :input,
              type: :number,
              required: true,
              placeholder: "Type a number between 1 to 10",
              min: "1",
              max: "10",
              title: "Must be between be 1 to 10"
            ) do |v|
              v.hint { "Must be between be 1 to 10" }
            end
          end
        end
      end
    end
  end
end
