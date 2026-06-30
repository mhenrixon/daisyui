# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Breadcrumbs
        class Basic < Views::Components::Example
          include DaisyUI

          title "Breadcrumbs"
          order 1

          def example
            Breadcrumbs(class: "text-sm") do |b|
              b.crumb { a { "Home" } }
              b.crumb { a { "Documents" } }
              b.crumb { "Add Document" }
            end
          end
        end
      end
    end
  end
end
