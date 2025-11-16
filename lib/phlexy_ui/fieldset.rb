# frozen_string_literal: true

module PhlexyUI
  # @component html class="fieldset"
  class Fieldset < Base
    def initialize(*, as: :fieldset, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def legend(**opts, &)
      super(class: component_classes("fieldset-legend", from: opts), **opts, &)
    end
  end
end
