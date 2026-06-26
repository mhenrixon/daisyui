# frozen_string_literal: true

module Examples
  module Ranges
    class ShowView < BaseView
      def view_template
        title do
          "Range"
        end

        render_examples [
          BasicComponent,
          WithColorsComponent,
          SizesComponent,
          WithStepsComponent,
          WithLabelComponent,
          VerticalComponent,
        ]
      end
    end
  end
end
