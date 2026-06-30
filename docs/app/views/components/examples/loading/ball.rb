# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Loading
        class Ball < Views::Components::Example
          include DaisyUI

          title "Loading ball"
          order 4

          def example
            Loading(:ball, :xs)
            Loading(:ball, :sm)
            Loading(:ball, :md)
            Loading(:ball, :lg)
            Loading(:ball, :xl)
          end
        end
      end
    end
  end
end
