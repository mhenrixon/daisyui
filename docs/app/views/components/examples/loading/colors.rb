# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Loading
        class Colors < Views::Components::Example
          include DaisyUI

          title "Loading with colors"
          order 7

          def example
            Loading(:spinner, :primary)
            Loading(:spinner, :secondary)
            Loading(:spinner, :accent)
            Loading(:spinner, :neutral)
            Loading(:spinner, :info)
            Loading(:spinner, :success)
            Loading(:spinner, :warning)
            Loading(:spinner, :error)
          end
        end
      end
    end
  end
end
