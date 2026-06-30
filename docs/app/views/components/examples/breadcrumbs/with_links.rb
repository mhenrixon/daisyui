# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Breadcrumbs
        class WithLinks < Views::Components::Example
          include DaisyUI

          title "Breadcrumbs with links"
          order 2

          def example
            Breadcrumbs(class: "text-sm") do |b|
              b.crumb(href: "/") { "Home" }
              b.crumb(href: "/docs") { "Documents" }
              b.crumb { "Add Document" }
            end
          end
        end
      end
    end
  end
end
