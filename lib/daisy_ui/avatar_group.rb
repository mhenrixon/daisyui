# frozen_string_literal: true

module DaisyUI
  class AvatarGroup < Base
    self.component_class = "avatar-group"

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def avatar(...)
      render DaisyUI::Avatar.new(...)
    end
  end
end
