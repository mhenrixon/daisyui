# frozen_string_literal: true

module PhlexyUI
  # @component html class="hero"
  class Hero < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def content(**opts, &)
      div(class: component_classes("hero-content", from: opts), **opts, &)
    end

    def overlay(**opts, &)
      div(class: component_classes("hero-overlay", from: opts), **opts, &)
    end
  end
end
