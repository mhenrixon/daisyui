# frozen_string_literal: true

module Examples
  module Auras
    class AroundButtonComponent < Base
      def title
        "Aura around a button"
      end

      def example
        Aura do
          Button do
            "Button"
          end
        end
      end
    end
  end
end
