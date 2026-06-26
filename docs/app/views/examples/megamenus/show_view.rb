# frozen_string_literal: true

module Examples
  module Megamenus
    class ShowView < BaseView
      def view_template
        title do
          "Megamenu"
        end

        render_examples [
          BasicComponent,
          SizesComponent,
        ]
      end
    end
  end
end
