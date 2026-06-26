# frozen_string_literal: true

module Examples
  module Otps
    class SixDigitsComponent < Base
      def title
        "OTP with 6 digits"
      end

      def example
        Otp(digits: 6)
      end
    end
  end
end
