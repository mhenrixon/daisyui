# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Fieldset
        class MultipleInputs < Views::Components::Example
          include DaisyUI

          title "With multiple inputs"
          order 2

          def example
            Fieldset(class: "bg-base-200 border-base-300 rounded-box w-xs border p-4") do |fs|
              fs.legend { "Page details" }

              label(class: "label") { "Title" }
              Input(type: "text", class: "w-full", placeholder: "My awesome page")

              label(class: "label") { "Slug" }
              Input(type: "text", class: "w-full", placeholder: "my-awesome-page")

              label(class: "label") { "Author" }
              Input(type: "text", class: "w-full", placeholder: "Name")
            end
          end
        end
      end
    end
  end
end
