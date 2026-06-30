# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Footer
        class Copyright < Views::Components::Example
          include DaisyUI

          title "Footer with copyright text"
          order 2

          def example
            Footer(:center, class: "sm:footer-horizontal bg-base-300 text-base-content p-4") do
              aside do
                p { "Copyright © 2026 - All right reserved by ACME Industries Ltd" }
              end
            end
          end
        end
      end
    end
  end
end
