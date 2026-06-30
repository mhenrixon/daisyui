# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Loading
        class Spinner < Views::Components::Example
          include DaisyUI

          title "Loading spinner"
          order 1

          def example
            Loading(:spinner, :xs)
            Loading(:spinner, :sm)
            Loading(:spinner, :md)
            Loading(:spinner, :lg)
            Loading(:spinner, :xl)
          end
        end
      end
    end
  end
end
