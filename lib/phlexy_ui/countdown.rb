# frozen_string_literal: true

module PhlexyUI
  # @component html class="countdown"
  class Countdown < Base
    self.component_class = :countdown

    def initialize(*, as: :span, **)
      super
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end
  end
end
