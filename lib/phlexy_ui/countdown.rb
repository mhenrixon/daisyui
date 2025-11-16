# frozen_string_literal: true

module PhlexyUI
  # @component html class="countdown"
  class Countdown < Base
    def initialize(*, as: :span, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end
  end
end
