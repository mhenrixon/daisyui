# frozen_string_literal: true

module Views
  module Components
    module Examples
      # Reference example for the daisyUI Button component. The #example body is
      # the live render shown in the "Preview" tab and the source shown in the
      # "Source" tab — write it exactly as a host app would.
      class Button < Views::Components::Example
        include DaisyUI

        def title = "Button"

        def example
          Button { "Default" }
          Button(:primary) { "Primary" }
          Button(:secondary) { "Secondary" }
          Button(:accent) { "Accent" }
          Button(:ghost) { "Ghost" }
          Button(:link) { "Link" }
          Button(:primary, :outline) { "Outline" }
          Button(:primary, :sm) { "Small" }
          Button(:primary, :lg) { "Large" }
        end
      end
    end
  end
end
