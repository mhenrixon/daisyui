# frozen_string_literal: true

module Examples
  module Otps
    class ShowView < BaseView
      def view_template
        title do
          "OTP"
        end

        render_examples [
          BasicComponent,
          JoinedComponent,
          SixDigitsComponent,
          WithColorsComponent,
          SizesComponent,
        ]
      end
    end
  end
end
