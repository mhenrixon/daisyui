# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Link
        class Colors < Views::Components::Example
          include DaisyUI

          title "Link colors"
          order 2

          def example
            div(class: "flex flex-col gap-2") do
              Link(:neutral, as: :a, href: "#") { "Neutral" }
              Link(:primary, as: :a, href: "#") { "Primary" }
              Link(:secondary, as: :a, href: "#") { "Secondary" }
              Link(:accent, as: :a, href: "#") { "Accent" }
              Link(:info, as: :a, href: "#") { "Info" }
              Link(:success, as: :a, href: "#") { "Success" }
              Link(:warning, as: :a, href: "#") { "Warning" }
              Link(:error, as: :a, href: "#") { "Error" }
            end
          end
        end
      end
    end
  end
end
