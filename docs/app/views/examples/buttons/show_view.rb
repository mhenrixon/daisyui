# frozen_string_literal: true

module Examples
  module Buttons
    class ShowView < BaseView
      def view_template
        title do
          "Button"
        end

        render_examples [
          BasicComponent,
          WithBrandColorsComponent,
          ActiveComponent,
          WithStateColorsComponent,
          OutlineComponent,
          OutlineWithStateColorsComponent,
          SizesComponent,
          ResponsiveComponent,
          WideComponent,
          WithDifferentHtmlTagsComponent,
          DisabledComponent,
          SquareComponent,
          CircleComponent,
          IconAtStartComponent,
          IconAtEndComponent,
          BlockComponent,
          WithLoadingSpinnerComponent,
          WithLoadingSpinnerAndTextComponent,
        ]
      end
    end
  end
end
