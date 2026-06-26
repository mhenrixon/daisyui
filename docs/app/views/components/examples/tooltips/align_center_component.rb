# frozen_string_literal: true

module Examples
  module Tooltips
    class AlignCenterComponent < Base
      def title
        "Align center"
      end

      def example
        Tooltip :open, :top, :center, tip: "hello" do
          Button do
            "Center"
          end
        end
      end
    end
  end
end
