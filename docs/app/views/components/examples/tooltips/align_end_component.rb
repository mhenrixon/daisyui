# frozen_string_literal: true

module Examples
  module Tooltips
    class AlignEndComponent < Base
      def title
        "Align end"
      end

      def example
        Tooltip :open, :top, :end, tip: "hello" do
          Button do
            "End"
          end
        end
      end
    end
  end
end
