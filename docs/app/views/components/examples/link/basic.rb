# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Link
        class Basic < Views::Components::Example
          include DaisyUI

          title "Link"
          order 1

          def example
            p do
              plain "Tailwind CSS resets the style of links by default. Add the "
              Link(as: :a, href: "#") { "link" }
              plain " class to make it look like a normal link again."
            end
          end
        end
      end
    end
  end
end
