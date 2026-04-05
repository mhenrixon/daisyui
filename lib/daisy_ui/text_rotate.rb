# frozen_string_literal: true

module DaisyUI
  class TextRotate < Base
    self.component_class = "text-rotate"

    def initialize(*, as: :span, **)
      super
    end

    def view_template(&)
      public_send(as, class: classes, **attributes) do
        span(&)
      end
    end
  end
end
