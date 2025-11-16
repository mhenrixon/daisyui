# frozen_string_literal: true

module PhlexyUI
  class Skeleton < Base
    self.component_class = :skeleton

    def initialize(*, as: :div, **)
      super
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    private

    register_modifiers({})
  end
end
