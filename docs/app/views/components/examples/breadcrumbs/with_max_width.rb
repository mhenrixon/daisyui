# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Breadcrumbs
        class WithMaxWidth < Views::Components::Example
          include DaisyUI

          title "Breadcrumbs with max-width"
          order 3

          def example
            Breadcrumbs(class: "max-w-xs text-sm") do |b|
              b.crumb { "Long text 1" }
              b.crumb { "Long text 2" }
              b.crumb { "Long text 3" }
              b.crumb { "Long text 4" }
              b.crumb { "Long text 5" }
            end
          end
        end
      end
    end
  end
end
