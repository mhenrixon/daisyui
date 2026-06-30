# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Link
        class Hover < Views::Components::Example
          include DaisyUI

          title "Show underline only on hover"
          order 3

          def example
            Link(:hover, as: :a, href: "#") { "Click me" }
          end
        end
      end
    end
  end
end
