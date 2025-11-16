# frozen_string_literal: true

module PhlexyUI
  class AvatarGroup < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def avatar(*, **, &)
      render PhlexyUI::Avatar.new(*, **, &)
    end
  end
end
