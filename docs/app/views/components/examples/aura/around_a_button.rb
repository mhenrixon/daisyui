# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Aura
        class AroundAButton < Views::Components::Example
          include DaisyUI

          title "Aura around a button"
          order 2

          def example
            Aura(:rainbow) do
              Button(:primary) { "Aura" }
            end
          end
        end
      end
    end
  end
end
