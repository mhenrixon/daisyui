# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Pagination
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Pagination sizes"
          order 2

          def example
            [:xs, :sm, :md, :lg, :xl].each do |size|
              Pagination do |p|
                p.item { Button(size) { "1" } }
                p.item { Button(size, :active) { "2" } }
                p.item { Button(size) { "3" } }
                p.item { Button(size) { "4" } }
              end
            end
          end
        end
      end
    end
  end
end
