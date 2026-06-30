# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Pagination
        class PrevNext < Views::Components::Example
          include DaisyUI

          title "Prev/Next outline buttons with equal width"
          order 4

          def example
            Pagination(class: "grid grid-cols-2") do |p|
              p.item { Button(:outline) { "Previous page" } }
              p.item { Button(:outline) { "Next" } }
            end
          end
        end
      end
    end
  end
end
