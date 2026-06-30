# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Validator
        class Required < Views::Components::Example
          include DaisyUI

          title "Required input"
          order 2

          def example
            Validator(
              as: :input,
              type: :text,
              required: true,
              placeholder: "Username",
              minlength: "3",
              maxlength: "30",
              pattern: "[A-Za-z][A-Za-z0-9\\-]*",
              title: "Only letters, numbers or dash"
            ) do |v|
              v.hint { "Must be 3 to 30 characters" }
            end
          end
        end
      end
    end
  end
end
