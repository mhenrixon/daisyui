# frozen_string_literal: true

module Views
  module Components
    module Examples
      module Skeleton
        class Text < Views::Components::Example
          include DaisyUI

          title "Skeleton text"
          order 2

          def example
            Skeleton(:text, as: :span) { "Loading data..." }
          end
        end
      end
    end
  end
end
