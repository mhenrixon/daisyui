# frozen_string_literal: true

module PhlexyUI
  # @component html class="mockup-code"
  class MockupCode < Base
    self.component_class = "mockup-code"

    def initialize(*, as: :div, **)
      super
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end
  end
end
