# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Pagination
        class WithActiveButton < Views::Components::Example
          include DaisyUI

          title "Pagination with an active button"
          order 1

          def example
            Pagination do |p|
              p.item { Button { "1" } }
              p.item { Button(:active) { "2" } }
              p.item { Button { "3" } }
              p.item { Button { "4" } }
            end
          end
        end
      end
    end
  end
end
