# frozen_string_literal: true

module PhlexyUI
  # @component html class="mockup-code"
  class MockupCode < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end
  end
end
