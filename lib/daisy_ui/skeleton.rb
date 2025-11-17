# frozen_string_literal: true

module DaisyUI
  class Skeleton < Base
    self.component_class = :skeleton

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    register_modifiers({})
  end
end
