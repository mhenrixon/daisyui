# frozen_string_literal: true

module PhlexyUI
  class AvatarGroup < Base
    self.component_class = "avatar-group"

    def initialize(*, as: :div, **)
      super
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def avatar(*, **, &)
      render PhlexyUI::Avatar.new(*, **, &)
    end
  end
end
