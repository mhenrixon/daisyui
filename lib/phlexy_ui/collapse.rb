# frozen_string_literal: true

module PhlexyUI
  # @component html class="collapse"
  class Collapse < Base
    def initialize(*, as: :div, **)
      super
    end

    def view_template(&)
      public_send(as, class: classes, **attributes, &)
    end

    def title(**opts, &)
      div(class: component_classes("collapse-title", options: opts), **opts, &)
    end

    def content(**opts, &)
      div(class: component_classes("collapse-content", options: opts), **opts, &)
    end

    register_modifiers(
      # "sm:collapse-arrow"
      # "@sm:collapse-arrow"
      # "md:collapse-arrow"
      # "@md:collapse-arrow"
      # "lg:collapse-arrow"
      # "@lg:collapse-arrow"
      arrow: "collapse-arrow",
      # "sm:collapse-plus"
      # "@sm:collapse-plus"
      # "md:collapse-plus"
      # "@md:collapse-plus"
      # "lg:collapse-plus"
      # "@lg:collapse-plus"
      plus: "collapse-plus",
      # "sm:collapse-open"
      # "@sm:collapse-open"
      # "md:collapse-open"
      # "@md:collapse-open"
      # "lg:collapse-open"
      # "@lg:collapse-open"
      open: "collapse-open",
      # "sm:collapse-close"
      # "@sm:collapse-close"
      # "md:collapse-close"
      # "@md:collapse-close"
      # "lg:collapse-close"
      # "@lg:collapse-close"
      close: "collapse-close"
    )
  end
end
