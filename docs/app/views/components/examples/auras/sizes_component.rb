# frozen_string_literal: true

module Examples
  module Auras
    class SizesComponent < Base
      def title
        "Aura sizes"
      end

      def example
        div class: "flex flex-wrap gap-4 items-center" do
          Aura :xs do
            Button do
              "XS"
            end
          end

          Aura :sm do
            Button do
              "SM"
            end
          end

          Aura do
            Button do
              "MD"
            end
          end

          Aura :lg do
            Button do
              "LG"
            end
          end

          Aura :xl do
            Button do
              "XL"
            end
          end
        end
      end
    end
  end
end
