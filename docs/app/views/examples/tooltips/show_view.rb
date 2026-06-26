# frozen_string_literal: true

module Examples
  module Tooltips
    class ShowView < BaseView
      def view_template
        title do
          "Tooltip"
        end

        render_examples [
          BasicComponent,
          ForceOpenComponent,
          TopComponent,
          BottomComponent,
          LeftComponent,
          RightComponent,
          AlignStartComponent,
          AlignCenterComponent,
          AlignEndComponent,
          PrimaryComponent,
          SecondaryComponent,
          AccentComponent,
          InfoComponent,
          SuccessComponent,
          WarningComponent,
          ErrorComponent,
          WithContentComponent,
          ResponsiveComponent,
        ]
      end
    end
  end
end
