# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Aura
        class Styles < Views::Components::Example
          include DaisyUI

          title "Aura styles"
          order 3

          def example
            Aura(:dual) { Button { "Dual" } }
            Aura(:holo) { Button { "Holo" } }
            Aura(:gold) { Button { "Gold" } }
            Aura(:silver) { Button { "Silver" } }
            Aura(:glow) { Button { "Glow" } }
            Aura(:rainbow) { Button { "Rainbow" } }
          end
        end
      end
    end
  end
end
