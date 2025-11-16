# frozen_string_literal: true

module PhlexyUI
  # @component html class="hero"
  class Hero < Base
    self.component_class = :hero

    def initialize(*, as: :div, **)
      super
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def content(**opts, &)
      div(class: component_classes("hero-content", options: opts), **opts, &)
    end

    def overlay(**opts, &)
      div(class: component_classes("hero-overlay", options: opts), **opts, &)
    end
  end
end
