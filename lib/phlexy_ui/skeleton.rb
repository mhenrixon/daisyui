# frozen_string_literal: true

module PhlexyUI
  class Skeleton < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    private

    register_modifiers({})
  end
end
