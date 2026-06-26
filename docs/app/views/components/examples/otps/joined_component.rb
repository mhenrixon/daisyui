# frozen_string_literal: true

module Examples
  module Otps
    class JoinedComponent < Base
      def title
        "OTP joined"
      end

      def example
        Otp(:joined)
      end
    end
  end
end
