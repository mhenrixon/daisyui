# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Validator
        class Basic < Views::Components::Example
          include DaisyUI

          title "Validator with hint"
          order 1

          def example
            Validator(as: :input, type: :email, required: true, placeholder: "mail@site.com") do |v|
              v.hint { "Enter valid email address" }
            end
          end
        end
      end
    end
  end
end
