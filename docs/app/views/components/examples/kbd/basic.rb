# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Kbd
        class Basic < Views::Components::Example
          include DaisyUI

          title "Kbd"
          order 1

          def example
            Kbd { "K" }
          end
        end
      end
    end
  end
end
