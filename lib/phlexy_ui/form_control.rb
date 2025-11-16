# frozen_string_literal: true

module PhlexyUI
  class FormControl < Base
    self.component_class = "form-control"

    def initialize(*, as: :div, **)
      super
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end
  end
end
