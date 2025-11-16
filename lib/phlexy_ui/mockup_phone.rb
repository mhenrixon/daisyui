# frozen_string_literal: true

module PhlexyUI
  # @component html class="mockup-phone"
  class MockupPhone < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def camera(**opts, &)
      div(class: component_classes("mockup-phone-camera", from: opts), **opts, &)
    end

    def display(**opts, &)
      div(class: component_classes("mockup-phone-display", from: opts), **opts, &)
    end
  end
end
