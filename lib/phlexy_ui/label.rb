# frozen_string_literal: true

module PhlexyUI
  class Label < Base
    def view_template(&)
      label(class: classes, **attributes, &)
    end

    def text(as: :span, **options, &)
      public_send(as, class: component_classes("label-text", from: options), **options, &)
    end
  end
end
