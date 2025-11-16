# frozen_string_literal: true

module PhlexyUI
  class FormControl < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end
  end
end
