# frozen_string_literal: true

module Examples
  module Tooltips
    class WithContentComponent < Base
      def title
        "Rich content tooltip"
      end

      def example
        Tooltip :open, :primary do |tooltip|
          tooltip.content do
            div class: "text-orange-400 -rotate-10 text-2xl font-black" do
              "Wow!"
            end
          end
          Button do
            "Hover me"
          end
        end
      end
    end
  end
end
