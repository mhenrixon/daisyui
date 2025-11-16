# frozen_string_literal: true

module PhlexyUI
  class Label < Base
    self.component_class = :label

    def view_template(&)
      label(class: classes, **attributes, &)
    end

    def text(as: :span, **options, &)
      public_send(as, class: component_classes("label-text", options: options), **options, &)
    end
  end
end
