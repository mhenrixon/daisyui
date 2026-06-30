# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Pagination
        class WithDisabledButton < Views::Components::Example
          include DaisyUI

          title "Pagination with a disabled button"
          order 3

          def example
            Pagination do |p|
              p.item { Button { "1" } }
              p.item { Button { "2" } }
              p.item { Button(:disabled) { "..." } }
              p.item { Button { "99" } }
              p.item { Button { "100" } }
            end
          end
        end
      end
    end
  end
end
