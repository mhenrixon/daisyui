# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Loading
        class Bars < Views::Components::Example
          include DaisyUI

          title "Loading bars"
          order 5

          def example
            Loading(:bars, :xs)
            Loading(:bars, :sm)
            Loading(:bars, :md)
            Loading(:bars, :lg)
            Loading(:bars, :xl)
          end
        end
      end
    end
  end
end
