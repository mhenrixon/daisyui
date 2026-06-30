# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Loading
        class Ring < Views::Components::Example
          include DaisyUI

          title "Loading ring"
          order 3

          def example
            Loading(:ring, :xs)
            Loading(:ring, :sm)
            Loading(:ring, :md)
            Loading(:ring, :lg)
            Loading(:ring, :xl)
          end
        end
      end
    end
  end
end
