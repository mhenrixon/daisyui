# frozen_string_literal: true

module Examples
  module Otps
    class WithColorsComponent < Base
      def title
        "OTP with colors"
      end

      def example
        div class: "flex flex-col gap-4" do
          Otp :neutral
          Otp :primary
          Otp :secondary
          Otp :accent
          Otp :info
          Otp :success
          Otp :warning
          Otp :error
        end
      end
    end
  end
end
