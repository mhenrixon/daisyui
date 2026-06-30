# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Aura
        class Sizes < Views::Components::Example
          include DaisyUI

          title "Aura sizes"
          order 4

          def example
            Aura(:xs) { Button { "XS" } }
            Aura(:sm) { Button { "SM" } }
            Aura { Button { "MD" } }
            Aura(:lg) { Button { "LG" } }
            Aura(:xl) { Button { "XL" } }
          end
        end
      end
    end
  end
end
