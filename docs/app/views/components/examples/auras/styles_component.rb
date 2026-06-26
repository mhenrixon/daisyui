# frozen_string_literal: true

module Examples
  module Auras
    class StylesComponent < Base
      def title
        "Aura styles"
      end

      def example
        div class: "flex flex-wrap gap-4 items-center" do
          Aura :dual do
            Button do
              "Dual"
            end
          end

          Aura :holo do
            Button do
              "Holo"
            end
          end

          Aura :gold do
            Button do
              "Gold"
            end
          end

          Aura :silver do
            Button do
              "Silver"
            end
          end

          Aura :glow do
            Button do
              "Glow"
            end
          end
        end
      end
    end
  end
end
