# frozen_string_literal: true

module Examples
  module Tooltips
    class AlignStartComponent < Base
      def title
        "Align start"
      end

      def example
        Tooltip :open, :top, :start, tip: "hello" do
          Button do
            "Start"
          end
        end
      end
    end
  end
end
