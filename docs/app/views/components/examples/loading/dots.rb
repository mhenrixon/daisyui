# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Loading
        class Dots < Views::Components::Example
          include DaisyUI

          title "Loading dots"
          order 2

          def example
            Loading(:dots, :xs)
            Loading(:dots, :sm)
            Loading(:dots, :md)
            Loading(:dots, :lg)
            Loading(:dots, :xl)
          end
        end
      end
    end
  end
end
