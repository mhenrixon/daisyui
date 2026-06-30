# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Filter
        class WithoutForm < Views::Components::Example
          include DaisyUI

          title "Filter without an HTML form"
          order 2

          def example
            Filter do |f|
              f.reset(name: "metaframeworks", class: "btn", aria: { label: "All" })
              input(type: :radio, name: "metaframeworks", class: "btn", aria: { label: "Sveltekit" })
              input(type: :radio, name: "metaframeworks", class: "btn", aria: { label: "Nuxt" })
              input(type: :radio, name: "metaframeworks", class: "btn", aria: { label: "Next.js" })
            end
          end
        end
      end
    end
  end
end
