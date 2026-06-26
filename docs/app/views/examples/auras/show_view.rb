# frozen_string_literal: true

module Examples
  module Auras
    class ShowView < BaseView
      def view_template
        title do
          "Aura"
        end

        render_examples [
          BasicComponent,
          AroundButtonComponent,
          RainbowComponent,
          StylesComponent,
          SizesComponent,
        ]
      end
    end
  end
end
