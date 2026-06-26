# frozen_string_literal: true

module Examples
  module Ranges
    class VerticalComponent < Base
      def title
        "Vertical range"
      end

      def example
        div class: "h-48" do
          Range :vertical, :primary, class: "h-full", min: 0, max: 100, value: 40
        end
      end
    end
  end
end
