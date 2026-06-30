# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Fieldset
        class Basic < Views::Components::Example
          include DaisyUI

          title "Fieldset"
          order 1

          def example
            Fieldset(class: "bg-base-200 border-base-300 rounded-box w-xs border p-4") do |fs|
              fs.legend { "Page title" }
              Input(type: "text", class: "w-full", placeholder: "My awesome page")
              p(class: "label") { "You can edit page title later on from settings" }
            end
          end
        end
      end
    end
  end
end
