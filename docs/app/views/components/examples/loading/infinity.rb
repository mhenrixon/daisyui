# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Loading
        class Infinity < Views::Components::Example
          include DaisyUI

          title "Loading infinity"
          order 6

          def example
            Loading(:infinity, :xs)
            Loading(:infinity, :sm)
            Loading(:infinity, :md)
            Loading(:infinity, :lg)
            Loading(:infinity, :xl)
          end
        end
      end
    end
  end
end
