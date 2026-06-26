# frozen_string_literal: true

module Examples
  module Otps
    class SizesComponent < Base
      def title
        "OTP sizes"
      end

      def example
        div class: "flex flex-col gap-4" do
          Otp(:xs)
          Otp(:sm)
          Otp(:md)
          Otp(:lg)
          Otp(:xl)
        end
      end
    end
  end
end
