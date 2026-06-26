# frozen_string_literal: true

module Examples
  module Auras
    class RainbowComponent < Base
      def title
        "Aura rainbow"
      end

      def example
        Aura :rainbow do
          Button do
            "Rainbow aura"
          end
        end
      end
    end
  end
end
