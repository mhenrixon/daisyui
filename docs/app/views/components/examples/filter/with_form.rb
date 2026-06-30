# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Filter
        class WithForm < Views::Components::Example
          include DaisyUI

          title "Filter using an HTML form"
          order 1

          def example
            Filter(as: :form) do
              input(type: :reset, value: "×", class: "btn btn-square")
              input(type: :radio, name: "frameworks", class: "btn", aria: { label: "Svelte" })
              input(type: :radio, name: "frameworks", class: "btn", aria: { label: "Vue" })
              input(type: :radio, name: "frameworks", class: "btn", aria: { label: "React" })
            end
          end
        end
      end
    end
  end
end
