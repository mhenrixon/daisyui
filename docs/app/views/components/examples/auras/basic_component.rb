# frozen_string_literal: true

module Examples
  module Auras
    class BasicComponent < Base
      def title
        "Aura"
      end

      def example
        Aura do
          Card :base_100 do |card|
            card.body do
              plain "This card has aura"
            end
          end
        end
      end
    end
  end
end
