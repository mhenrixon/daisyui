# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Fieldset
        class LoginForm < Views::Components::Example
          include DaisyUI

          title "Login form"
          order 3

          def example
            Fieldset(class: "bg-base-200 border-base-300 rounded-box w-xs border p-4") do |fs|
              fs.legend { "Login" }

              label(class: "label") { "Email" }
              Input(type: "email", class: "w-full", placeholder: "Email")

              label(class: "label") { "Password" }
              Input(type: "password", class: "w-full", placeholder: "Password")

              Button(:neutral, :primary, class: "mt-4") { "Login" }
            end
          end
        end
      end
    end
  end
end
